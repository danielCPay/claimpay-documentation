import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:mysql1/mysql1.dart';
import 'package:mysql_client/mysql_client.dart';
//import 'package:galileo_mysql/galileo_mysql.dart';
//import 'package:dart_mysql/dart_mysql.dart';
import 'package:php_serializer/php_serializer.dart';
import 'package:indent/indent.dart';
//import 'package:yetiforce_readable_db_export/php_unserializer.dart';

Future<MySqlConnection> setupConnection(String installationName) async {
  final dbConfigFile = File('private_config/db_connection_$installationName.json');
  final dbConfigMap = jsonDecode(dbConfigFile.readAsStringSync());

  final connection = await MySqlConnection.connect(ConnectionSettings(
    host: dbConfigMap['host'],
    port: dbConfigMap['port'],
    user: dbConfigMap['user'],
    password: dbConfigMap['password'],
    db: dbConfigMap['db'],
  ));
  return connection;
}

Future<void> exportQueryResults(MySqlConnection conn, File queryFile) async {
  print('exportQueryResults(${queryFile.path})');

  final query = await queryFile.readAsString();
  final results = await conn.query(query);

  final outFileName = '../' + path.basenameWithoutExtension(queryFile.path) + '.csv';
  final outFileStream = File(outFileName).openWrite();

  final String headers =
      results.fields.map((element) => '"' + element.name! + '"').join(';');
  //print('headers=$headers');
  outFileStream.write(headers + '\r\n');

  for (var row in results) {
    final String line =
        row.map((element) => '"' + element.toString() + '"').join(';');
    outFileStream.write(line + '\r\n');
  }

  await outFileStream.flush();
  await outFileStream.close();

  print('...exported ${results.length} rows to $outFileName');
}


Future<void> exportWorkflows(MySqlConnection conn) async {
  print('exportWorkflows()');

  final JsonEncoder jsonPrettyfier = JsonEncoder.withIndent('  ');

  final rolesSql = '''
    SELECT roleid, rolename
    FROM vtiger_role r
    ''';  
  final rolesResults = await conn.query(rolesSql);
  Map<String, String> roles = Map.fromEntries(rolesResults.map((m) => MapEntry<String, String>( m['roleid'], m['rolename'] )));

  print( '  exporting a list of all workflows' );
  final outAllWFsFileName = '../Workflows/all.md';
  final outAllWFsFileStream = (await File(outAllWFsFileName).create(recursive: true)).openWrite();
  outAllWFsFileStream.writeln('# All workflows');
  final allWorkflowsSql = '''
      SELECT *, 
        case 
          when execution_condition = 1 then 'ON_FIRST_SAVE'
          when execution_condition = 2 then 'ONCE'
          when execution_condition = 3 then 'ON_EVERY_SAVE'
          when execution_condition = 4 then 'ON_MODIFY'
          when execution_condition = 5 then 'ON_DELETE'
          when execution_condition = 6 then 'ON_SCHEDULE'
          when execution_condition = 7 then 'MANUAL'
          when execution_condition = 8 then 'TRIGGER'
          when execution_condition = 9 then 'BLOCK_EDIT'
          when execution_condition = 10 then 'ON_RELATED'
          else 'unknown' 
        end AS execution_condition_text
      FROM com_vtiger_workflows w
      ORDER BY workflow_id
    ''';
  final allWorkflowsResults = await conn.query(allWorkflowsSql);
  for (var allWorkflowsRow in allWorkflowsResults ) {
    final int workflowId = allWorkflowsRow['workflow_id'];
    final String moduleName = allWorkflowsRow['module_name'];
    outAllWFsFileStream.writeln('<a id="user-content-wf-$workflowId" href="#wf-$workflowId"></a>');
    outAllWFsFileStream.writeln('- <a href="$moduleName.md#wf-$workflowId">WF $workflowId</a> - $moduleName."${allWorkflowsRow['summary']}" (${allWorkflowsRow['execution_condition_text']})');
  }
  await outAllWFsFileStream.flush();
  await outAllWFsFileStream.close();

  final modulesSql = '''
    SELECT DISTINCT module_name
    FROM com_vtiger_workflows
    ORDER BY 1
    ''';
//     where module_name = 'Claims'
  final modulesResults = await conn.query(modulesSql);
  for (var moduleRow in modulesResults ) {
    String moduleName = moduleRow['module_name'];
    print( '  exporting workflows for module_name: $moduleName' );

    final outFileName = '../Workflows/' + moduleName + '.md';
    final outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln( '# Module: $moduleName' );

    final workflowsSql = '''
      SELECT *, 
        case 
          when execution_condition = 1 then 'ON_FIRST_SAVE'
          when execution_condition = 2 then 'ONCE'
          when execution_condition = 3 then 'ON_EVERY_SAVE'
          when execution_condition = 4 then 'ON_MODIFY'
          when execution_condition = 5 then 'ON_DELETE'
          when execution_condition = 6 then 'ON_SCHEDULE'
          when execution_condition = 7 then 'MANUAL'
          when execution_condition = 8 then 'TRIGGER'
          when execution_condition = 9 then 'BLOCK_EDIT'
          when execution_condition = 10 then 'ON_RELATED'
          else 'unknown' 
        end AS execution_condition_text
      FROM com_vtiger_workflows w
      WHERE module_name = '${moduleRow['module_name']}'
      ORDER BY workflow_id
      ''';
    final workflowsResults = await conn.query(workflowsSql);
    for (var workflowRow in workflowsResults ) {
      //print( '    workflow: $workflowRow' );
      final int workflowId = workflowRow['workflow_id'];

      outFileStream.writeln('<a id="user-content-wf-$workflowId" href="#wf-$workflowId"></a>');
      outFileStream.writeln('## WF $workflowId - "${workflowRow['summary']}" (${workflowRow['execution_condition_text']})');
      //outFileStream.writeln('');
      
      outFileStream.writeln('### Conditions:');
      outFileStream.writeln('- All:');
      final List workflowConditions = jsonDecode(workflowRow['test'].toString());
      //print( workflowConditions );
      for ( Map workflowCondition in workflowConditions ) {
        if ( workflowCondition['fieldname'] == 'current-role' ) {
          workflowCondition['value'] = '${roles[workflowCondition['value']]} (${workflowCondition['value']})';
        }
        if ( workflowCondition['groupid'] == 0 ) {
          outFileStream.writeln('  - **${workflowCondition['fieldname']}** ${workflowCondition['operation']} ' 
              + ( workflowCondition['value'].isNotEmpty ? '_' + workflowCondition['value'] + '_ ' : '' )
              + ( workflowCondition['valuetype'] == 'rawtext' ? '' : '(' + workflowCondition['valuetype'] + ')' ) );
        }
      }
      outFileStream.writeln('- At least one:');
      for ( Map workflowCondition in workflowConditions ) {
        if ( workflowCondition['groupid'] == 1 ) {
          outFileStream.writeln('  - **${workflowCondition['fieldname']}** ${workflowCondition['operation']} ' 
              + ( workflowCondition['value'].isNotEmpty ? '_' + workflowCondition['value'] + '_ ' : '' )
              + ( workflowCondition['valuetype'] == 'rawtext' ? '' : '(' + workflowCondition['valuetype'] + ')' ) );
        }
      }

      outFileStream.writeln('### Tasks:');
      final tasksSql = '''
        SELECT *
        FROM com_vtiger_workflowtasks
        WHERE workflow_id = $workflowId
        ORDER BY task_id
        ''';
      final tasksResults = await conn.query(tasksSql);
      for (var taskRow in tasksResults ) {
        final String taskDetails = taskRow['task'].toString();
        final Map taskDetailsMap = phpDeserialize(taskDetails, fallbackObjectDeserialization: GenerateMapOnMissingDeserializationInformation() );
        final bool taskIsActive = taskDetailsMap['active'];
        final String isActiveSwitch = taskIsActive ? '' : '~';
        outFileStream.writeln( '- $isActiveSwitch${taskRow['summary']}$isActiveSwitch' );
      }
      
      outFileStream.writeln('### Tasks with Details:');
      for (var taskRow in tasksResults ) {
        //print( '      task: $taskRow' );
        //var taskDetails = Php.unserialize((taskRow['task'] as Blob).toString());
        final String taskDetails = taskRow['task'].toString();
        final String taskType = taskDetails.split(':')[2].replaceAll('"', '');
        final Map taskDetailsMap = phpDeserialize(taskDetails, fallbackObjectDeserialization: GenerateMapOnMissingDeserializationInformation() );
        final bool taskIsActive = taskDetailsMap['active'];
        var taskParameters;
        //print( '    taskType=$taskType    active=$taskIsActive');
        taskDetailsMap
          ..remove('workflowId')
          ..remove('summary')
          ..remove('id')
          ;
        if ( taskIsActive == true ) taskDetailsMap.remove( 'active' );
        if ( taskDetailsMap['executeImmediately'] == true ) taskDetailsMap.remove( 'executeImmediately' );
        if ( taskDetailsMap['contents'] == null ) taskDetailsMap.remove( 'contents' );
        if ( taskDetailsMap['trigger'] == null ) taskDetailsMap.remove( 'trigger' );
        switch (taskType) {
          case 'VTUpdateFieldsTask': 
          case 'VTUpdateRelatedFieldTask': 
            List<dynamic> field_value_mapping = json.decode( taskDetailsMap['field_value_mapping'] );
            taskParameters = Map.fromEntries( field_value_mapping.map( 
                (m) => MapEntry<String, String>( m['fieldname'], '' + m['value'] + ' (' + m['valuetype'] + ')'  )
                ) );
            //taskParameters = field_value_mapping.map( 
            //    (m) => '' + m['fieldname'] + ' = "' + m['value'] + '" (' + m['valuetype'] + ')'  
            //    ).toList();
            taskDetailsMap.remove( 'field_value_mapping' );
            //print(  'field_value_mapping=$field_value_mapping' );
            //print(  'taskParameters=$taskParameters' );
            break;
          case 'VTCreateEntityTask': 
            List<dynamic> field_value_mapping = json.decode( taskDetailsMap['field_value_mapping'] );
            taskParameters = Map.from(taskDetailsMap..remove('field_value_mapping'));
            taskParameters['set_fields_in_new_entity'] = Map.fromEntries( field_value_mapping.map( 
                (m) => MapEntry<String, String>( m['fieldname'], '' + m['value'] + ' (' + m['valuetype'] + ')'  )
                ) );
            taskDetailsMap.clear();
            break;
          case 'VTWatchdog': 
            //taskParameters = taskDetailsMap['message'];
            //taskDetailsMap.clear();
            break;
          case 'VTEntityWorkflow': 
            taskParameters = Map.from(taskDetailsMap);
            taskDetailsMap.clear();
            break;
          default: 
        }
        final String isActiveSwitch = taskIsActive ? '' : '~~';
        //print( taskDetailsMap.toString() );
        //print( jsonPrettyfier.convert( taskParameters ) );
        //final taskDetailsClass = phpDeserialize(taskDetails, fallbackObjectDeserialization: GenerateDartClassCodeOnMissingDeserializationInformation() );
        //print( taskDetailsClass.toString() );
        
        outFileStream.writeln( '- $isActiveSwitch${taskRow['summary']}$isActiveSwitch' );
        outFileStream.writeln( ('``` \n'
          'taskType: $taskType, active: $taskIsActive \n'
          + ( taskParameters != null ? 'taskTypeParameters: ${ jsonPrettyfier.convert( taskParameters ) }, \n' : '' )
          + ( taskDetailsMap.isNotEmpty ? 'otherParameters: $taskDetailsMap, \n' : '' )
          + '``` \n').unindent().indentBy(4) );
      }
    }

  await outFileStream.flush();
  await outFileStream.close();
  }
}


Future<void> exportLitigationWorkflows(MySqlConnection conn) async {
  print('exportLitigationWorkflows()');
  
  final fieldsSql = '''
    SELECT fieldname, fieldlabel, blocklabel
    FROM vtiger_field f
      JOIN vtiger_blocks b ON (b.blockid = f.block AND b.tabid = f.tabid)
    WHERE tablename LIKE 'u_yf_cases%' OR tablename = 'vtiger_crmentity'
    ''';  
  final fieldsResults = await conn.query(fieldsSql);
  Map<String, String> fieldLabels = Map.fromEntries(fieldsResults.map((m) => MapEntry<String, String>( m['fieldname'], m['fieldlabel'] )));
  Map<String, String> fieldSections = Map.fromEntries(fieldsResults.map((m) => MapEntry<String, String>( m['fieldname'], m['blocklabel'] )));
  //print(fieldLabels);
  //print(fieldSections);

  final rolesSql = '''
    SELECT roleid, rolename
    FROM vtiger_role r
    ''';  
  final rolesResults = await conn.query(rolesSql);
  Map<String, String> roles = Map.fromEntries(rolesResults.map((m) => MapEntry<String, String>( m['roleid'], m['rolename'] )));

  Map<String, StringBuffer> sectionTOCStreams = {};
  Map<String, StringBuffer> sectionStreams = {};

  final modulesSql = '''
    SELECT DISTINCT module_name
    FROM com_vtiger_workflows
    WHERE module_name = 'Cases'
    ORDER BY 1
    ''';
  final modulesResults = await conn.query(modulesSql);
  for (var moduleRow in modulesResults ) {
    String moduleName = moduleRow['module_name'];
    print( '  exporting litigation workflows for module_name: $moduleName' );

    final workflowsSql = '''
      SELECT *, 
        case 
          when execution_condition = 1 then 'ON_FIRST_SAVE'
          when execution_condition = 2 then 'ONCE'
          when execution_condition = 3 then 'ON_EVERY_SAVE'
          when execution_condition = 4 then 'ON_MODIFY'
          when execution_condition = 5 then 'ON_DELETE'
          when execution_condition = 6 then 'ON_SCHEDULE'
          when execution_condition = 7 then 'MANUAL'
          when execution_condition = 8 then 'TRIGGER'
          when execution_condition = 9 then 'BLOCK_EDIT'
          when execution_condition = 10 then 'ON_RELATED'
          else 'unknown' 
        end AS execution_condition_text
      FROM com_vtiger_workflows w
      WHERE module_name = '${moduleRow['module_name']}'
        AND execution_condition NOT IN (1, 7)
      ORDER BY summary
      ''';
    final workflowsResults = await conn.query(workflowsSql);
    for (var workflowRow in workflowsResults ) {
      //print( '    workflow: $workflowRow' );
      final int workflowId = workflowRow['workflow_id'];
      final List workflowConditions = jsonDecode(workflowRow['test'].toString());

      String section = '';
      if ( workflowRow['execution_condition_text'] == 'TRIGGER' ) {
        section = '.Manual';
      };
      for ( Map workflowCondition in workflowConditions ) {
        if ( section == '-Manual') {
          break;
        }
        if ( workflowCondition['fieldname'] == 'stage' 
            && ( workflowCondition['operation'] == 'is' || workflowCondition['operation'] == 'has changed to' )
            ) {
          section = workflowCondition['value'];
          break;
        }
        if ( workflowCondition['fieldname'].toString().endsWith('_status') 
            || workflowCondition['operation'] == 'has changed to' 
            || workflowCondition['operation'] == 'has changed' 
            || workflowCondition['operation'] == 'days later' 
            || workflowCondition['operation'] == 'days ago' ) {
          // print(workflowCondition);
          section = (section.isEmpty || section == fieldSections[workflowCondition['fieldname']] 
              ? fieldSections[workflowCondition['fieldname']] 
              : '.ERROR_multiple_sections') 
            ?? '.ERROR_technical_field';
        }
      }
      section = section.isEmpty ? '.ERROR_no_section' : section;
      if (sectionStreams[section] == null) {
        sectionTOCStreams[section] = StringBuffer();
        sectionStreams[section] = StringBuffer();
      }
      final StringBuffer sectionTODStream = sectionTOCStreams[section]!;
      final StringBuffer sectionStream = sectionStreams[section]!;

      sectionTODStream.writeln('- <a href="#wf-$workflowId"> "${workflowRow['summary']}"</a>');
      sectionStream.writeln('<a id="wf-$workflowId" href="#wf-$workflowId"></a>');
      sectionStream.writeln('## "${workflowRow['summary']}"');
      
      sectionStream.writeln('### Conditions:');
      sectionStream.writeln('- All:');
      //print( workflowConditions );
      for ( Map workflowCondition in workflowConditions ) {
        if ( workflowCondition['fieldname'] == 'current-role' ) {
          workflowCondition['value'] = '${roles[workflowCondition['value']]} (${workflowCondition['value']})';
        }
        if ( workflowCondition['groupid'] == 0 ) {
          sectionStream.writeln('  - **${fieldLabels[workflowCondition['fieldname']] ?? workflowCondition['fieldname']}** ${workflowCondition['operation']} ' 
              + ( workflowCondition['value'].isNotEmpty ? '_' + workflowCondition['value'] + '_ ' : '' )
              + ( workflowCondition['valuetype'] == 'rawtext' ? '' : '(' + workflowCondition['valuetype'] + ')' ) );
        }
      }
      sectionStream.writeln('- At least one:');
      for ( Map workflowCondition in workflowConditions ) {
        if ( workflowCondition['groupid'] == 1 ) {
          sectionStream.writeln('  - **${fieldLabels[workflowCondition['fieldname']] ?? workflowCondition['fieldname']}** ${workflowCondition['operation']} ' 
              + ( workflowCondition['value'].isNotEmpty ? '_' + workflowCondition['value'] + '_ ' : '' )
              + ( workflowCondition['valuetype'] == 'rawtext' ? '' : '(' + workflowCondition['valuetype'] + ')' ) );
        }
      }

      sectionStream.writeln('### Tasks:');
      final tasksSql = '''
        SELECT *
        FROM com_vtiger_workflowtasks
        WHERE workflow_id = $workflowId
        ORDER BY task_id
        ''';
      final tasksResults = await conn.query(tasksSql);
      for (var taskRow in tasksResults ) {
        final String taskDetails = taskRow['task'].toString();
        final Map taskDetailsMap = phpDeserialize(taskDetails, fallbackObjectDeserialization: GenerateMapOnMissingDeserializationInformation() );
        final bool taskIsActive = taskDetailsMap['active'];
        final String isActiveSwitch = taskIsActive ? '' : '~';
        sectionStream.writeln( '- $isActiveSwitch${taskRow['summary']}$isActiveSwitch' );
      }
      
    }

    print( '  final processing and converting markdown to html' );
    for (var section in sectionStreams.keys) {
        final outSectionFileName = '../Workflows/$moduleName- $section.md';
        final outSectionFileStream = (await File(outSectionFileName).create(recursive: true)).openWrite();
        outSectionFileStream.writeln( '# Module: $moduleName, Section: $section');
        outSectionFileStream.write( sectionTOCStreams[section].toString() );
        outSectionFileStream.writeln( '----------------------' );
        outSectionFileStream.write( sectionStreams[section].toString() );
        await outSectionFileStream.flush();
        await outSectionFileStream.close();
        // install: npm install markdown-to-html -g
        await Process.run('markdown-to-html', 
          ['--source', '$outSectionFileName',  '--output', '${outSectionFileName.replaceAll('.md', '.html')}'],
          runInShell: true
          );
    }

  }
}


dynamic myJsonSerializer(dynamic object) {
  if (object is DateTime) {
    return object.toString();
  }
  else if (object is Blob) {
    String str = object.toString();
    if (str.startsWith('{') || str.startsWith('[')) {
      return jsonDecode(str);
    }
    else {
      return str;
    }
  }
  return object;
}


extension on IResultSet {
  Iterable<Map<String, dynamic>> getTypedRowsMap() {
    return rows.map((e) => e.typedAssoc().map((key, value) {
      if (value is String && value.isNotEmpty && value.codeUnits[0] <= 1 ) {
        return MapEntry(key, value.codeUnits[0]);
      } 
      else if ( value is String && value.isNotEmpty && ( value.startsWith('{') || value.startsWith('[') ) ) {
        return MapEntry(key, jsonDecode(value));
      }
      //else if ( value is String && value.isNotEmpty && DateTime.tryParse(value) != null ) {
      //  DateTime dt = DateTime.tryParse(value).subtract(const Duration(hours: 2));
        //if (key == 'updated_at') {
        //    dt = dt.subtract(const Duration(seconds: 1));
        //}
      //  return MapEntry(key, dt.toString() + 'Z');
      //}
      else {
        return MapEntry(key, value);
      }

    }));
  }
}


dynamic mapIdsToLabels(dynamic json, String fieldName, Map<int, String> map) {
    if (json is Map) {
      json.forEach((key, value) {
        if (key == fieldName) {
          json[fieldName] = map[json[fieldName]] ?? value;
        } else if ( value is List || value is Map ) {
          mapIdsToLabels(value, fieldName, map);
        }
      });
    } else if (json is List) {
      if (json.length >= 2 && json[0] == fieldName && json[1] is int) {
          json[1] = map[json[1]] ?? json[1];
      }
      json.forEach((element) {
        mapIdsToLabels(element, fieldName, map);
      });
    }
    return json;
}
 


Future<void> exportMetabaseDB(String installationName) async {
  print('exportMetabaseDB($installationName)');

  MySqlConnection sqlConnection;
  try {

    final dbConfigFile = File('private_config/db_connection_metabase_$installationName.json');
    final dbConfigMap = jsonDecode(dbConfigFile.readAsStringSync());
    print(dbConfigMap);

    sqlConnection = await MySqlConnection.connect(ConnectionSettings(
        host: dbConfigMap['host'],
        port: dbConfigMap['port'],
        user: 'metabase_export',//dbConfigMap['user'],
        password: dbConfigMap['password'],
        db: dbConfigMap['db'],
      ));

  } on FileSystemException {
    print('Metabase config file does not exist');
    return;
  }

  MySQLConnection mysqlConnection;
  try {

    final dbConfigFile = File('private_config/db_connection_metabase_$installationName.json');
    final dbConfigMap = jsonDecode(dbConfigFile.readAsStringSync());

    mysqlConnection = await MySQLConnection.createConnection(
        host: dbConfigMap['host'],
        port: dbConfigMap['port'],
        userName: dbConfigMap['user'],
        password: dbConfigMap['password'],
        databaseName: dbConfigMap['db'],
      );
    await mysqlConnection.connect();

  } on FileSystemException {
    print('Metabase config file does not exist');
    return;
  }

  final JsonEncoder jsonPrettyfier = JsonEncoder.withIndent('  ', myJsonSerializer);

  final String outDirectoryPath = '../Metabase/';

  final Map<int, String> users = {};
  final Map<int, String> databases = {};
  final Map<int, String> tables = {};
  final Map<int, String> fields = {};
  final Map<int, String> collections = {};

  print( '  exporting a list of users' );

  final outUsersFileName = 'users.md';
  final outUsersFileStream = (await File(outDirectoryPath + outUsersFileName).create(recursive: true)).openWrite();
  outUsersFileStream.writeln('# Users');
  final usersSql = '''
      SELECT * 
      FROM core_user
      ORDER BY id
    ''';
  final usersResults = await mysqlConnection.execute(usersSql);
  for (var usersRow in usersResults.getTypedRowsMap() ) {
    final userId = usersRow['id'];
    final userLabel = '$userId "${usersRow['first_name']} ${usersRow['last_name']}" ${usersRow['email']}';
    users[userId] = userLabel;
    usersRow.remove('last_login');
    usersRow.remove('updated_at');
    outUsersFileStream.writeln('- $userLabel');
    outUsersFileStream.writeln('```JSON');
    outUsersFileStream.writeln( jsonPrettyfier.convert( usersRow ) );
    outUsersFileStream.writeln('```');
  }
  await outUsersFileStream.flush();
  await outUsersFileStream.close();
  
  print( '  exporting a list of databases' );

  final outDatabasesFileName = 'databases.md';
  final outDatabasesFileStream = (await File(outDirectoryPath + outDatabasesFileName).create(recursive: true)).openWrite();
  outDatabasesFileStream.writeln('# Databases');
  final databasesSql = '''
      SELECT * 
      FROM metabase_database
      ORDER BY id
    ''';
  final databasesResults = await mysqlConnection.execute(databasesSql);
  for (var databasesRow in databasesResults.getTypedRowsMap() ) {
    final databaseId = databasesRow['id'];
    final databaseName = databasesRow['name'];
    databases[databaseId] = '$databaseId ($databaseName)';
    outDatabasesFileStream.writeln('- $databaseName (${databasesRow['engine']})');
    outDatabasesFileStream.writeln('```JSON');
    outDatabasesFileStream.writeln( jsonPrettyfier.convert( databasesRow ) );
    outDatabasesFileStream.writeln('```');
    await outDatabasesFileStream.flush();

    print( '  exporting a list of tables in database $databaseName' );

    final outTablesFileName = 'tables_$databaseName.md';
    final outTablesFileStream = (await File(outDirectoryPath + outTablesFileName).create(recursive: true)).openWrite();
    outTablesFileStream.writeln('# Visible Tables');
    final tablesSql = '''
        SELECT * 
        FROM metabase_table
        WHERE db_id = $databaseId
          AND visibility_type IS NULL
        ORDER BY name
      ''';
    final tablesResults = await mysqlConnection.execute(tablesSql);
    for (var tablesRow in tablesResults.getTypedRowsMap() ) {
      final int tableId = tablesRow['id'];
      final String tableName = tablesRow['name'];
      final outFieldsFileName = 'fields_${databaseName}_$tableName.md';
      tables[tableId] = '$tableId ($tableName)';
      outTablesFileStream.writeln('- <a href="$outFieldsFileName">$tableName</a> "${tablesRow['display_name']}"');
      outTablesFileStream.writeln('```JSON');
      outTablesFileStream.writeln( jsonPrettyfier.convert( tablesRow ) );
      outTablesFileStream.writeln('```');
    }
    outTablesFileStream.writeln('# Hidden Tables');
    final hiddenTablesSql = '''
        SELECT * 
        FROM metabase_table
        WHERE db_id = $databaseId
          AND visibility_type IS NOT NULL
        ORDER BY name
      ''';
    final hiddenTablesResults = await mysqlConnection.execute(hiddenTablesSql);
    for (var hiddenTablesRow in hiddenTablesResults.getTypedRowsMap() ) {
      final String hiddenTableName = hiddenTablesRow['name'];
      outTablesFileStream.writeln('- $hiddenTableName (visibility_type=${hiddenTablesRow['visibility_type']} created_at=${hiddenTablesRow['created_at']})');
    }
    await outTablesFileStream.flush();
    await outTablesFileStream.close();

    print( '  exporting a list of fields in database $databaseName' );

    for (var tablesRow in tablesResults.getTypedRowsMap() ) {
      final int tableId = tablesRow['id'];
      final String tableName = tablesRow['name'];
      final outFieldsFileName = 'fields_${databaseName}_$tableName.md';
      final outFieldsFileStream = (await File(outDirectoryPath + outFieldsFileName).create(recursive: true)).openWrite();
      outFieldsFileStream.writeln('# Fields in ${tables[tableId]} in <a href="$outTablesFileName">$databaseName</a>');
      final fieldsSql = '''
          SELECT * 
          FROM metabase_field 
          WHERE table_id = $tableId
            AND active = 1
          ORDER BY position, id 
        ''';
      final fieldsResults = await mysqlConnection.execute(fieldsSql);
      for (var fieldsRow in fieldsResults.getTypedRowsMap() ) {
        fieldsRow.remove('last_analyzed');
        fieldsRow.remove('fingerprint');
        final int fieldId = fieldsRow['id'];
        final String fieldName = fieldsRow['name'];
        fields[fieldId] = '$fieldId ($fieldName)';
        outFieldsFileStream.writeln('- $fieldName "${fieldsRow['display_name']}"');
        outFieldsFileStream.writeln('```JSON');
        outFieldsFileStream.writeln( jsonPrettyfier.convert( fieldsRow ) );
        outFieldsFileStream.writeln('```');
      }
      await outFieldsFileStream.flush();
      await outFieldsFileStream.close();
    }
  }
  await outDatabasesFileStream.close();

  print( '  exporting a list of public collections' );

  final outCollectionsFileName = 'rep_collections.md';
  final outCollectionsFileStream = (await File(outDirectoryPath + outCollectionsFileName).create(recursive: true)).openWrite();
  outCollectionsFileStream.writeln('# Public Collections');
  final collectionsSql = '''
      SELECT * 
      FROM collection 
      WHERE archived = 0
      ORDER BY 
          LENGTH(location) - LENGTH(replace(location, '/', '')), 
          name
    ''';
    //  AND personal_owner_id IS NULL 
  final collectionsResults = await mysqlConnection.execute(collectionsSql);
  for (var collectionsRow in collectionsResults.getTypedRowsMap() ) {
    final collectionId = collectionsRow['id'];
    final collectionName = collectionsRow['name'];
    final String collectionLocation = ((collectionsRow['location'] as String).split('/')..removeWhere((e) => e.isEmpty)).map((e) => collectionsResults.getTypedRowsMap().firstWhere((c) => c['id'].toString() == e)['name']).join('/');
    collections[collectionId] = '$collectionId (/$collectionLocation/$collectionName)';
    outCollectionsFileStream.writeln('- /$collectionLocation/$collectionName');
    final collectionContentsSql = '''
        SELECT id, name, 'dashboard' AS type, '' AS card_display
        FROM report_dashboard 
        WHERE archived = 0
          AND collection_id = $collectionId
        UNION ALL 
        SELECT id, name, 'card' AS type, display AS card_display
        FROM report_card 
        WHERE archived = 0
          AND collection_id = $collectionId
        ORDER BY name
        ''';
    (await mysqlConnection.execute(collectionContentsSql)).getTypedRowsMap().forEach((element) { 
      outCollectionsFileStream.writeln('    - <a href="rep_${element['type']}_${element['id']}.md">${element['name']}</a> (${element['type']} ${element['card_display']})');
    });
    outCollectionsFileStream.writeln('```JSON');
    outCollectionsFileStream.writeln( jsonPrettyfier.convert( collectionsRow ) );
    outCollectionsFileStream.writeln('```');
  }
  await outCollectionsFileStream.flush();
  await outCollectionsFileStream.close();

  print( '  exporting dashboards' );

  final dashboardsSql = '''
      SELECT * 
      FROM report_dashboard 
      ORDER BY id
      ''';
  final dashboardsResults = await mysqlConnection.execute(dashboardsSql);
  for (var dashboardsRow in dashboardsResults.getTypedRowsMap() ) {
    final dashboardId = dashboardsRow['id'];
    final dashboardName = dashboardsRow['name'];
    final outDashboardFileName = 'rep_dashboard_$dashboardId.md';
    final outDashboardFileStream = (await File(outDirectoryPath + outDashboardFileName).create(recursive: true)).openWrite();
    outDashboardFileStream.writeln('# Dashboard "$dashboardName" ($dashboardId)');
    outDashboardFileStream.writeln('```JSON');
    outDashboardFileStream.writeln( jsonPrettyfier.convert( dashboardsRow ) );
    outDashboardFileStream.writeln('```');
    final dashboardCardsSql = '''
        SELECT dc.*, c.name AS card_name
        FROM report_dashboardcard dc
          JOIN report_card c ON ( c.id = dc.card_id )
        WHERE dashboard_id = $dashboardId
        ORDER BY `row`, `col`
        ''';
    outDashboardFileStream.writeln('## Cards');
    for ( var dashboardCardsRow in ( await mysqlConnection.execute(dashboardCardsSql) ).getTypedRowsMap() ) {
      outDashboardFileStream.writeln(
          '- row=${dashboardCardsRow['row']} col=${dashboardCardsRow['col']} sizeX=${dashboardCardsRow['sizeX']} sizeY=${dashboardCardsRow['sizeY']} '
          '<a href="rep_card_${dashboardCardsRow['card_id']}.md">${dashboardCardsRow['card_name']} (${dashboardCardsRow['card_id']})</a>'
          );
    }
    outDashboardFileStream.writeln('## Card Details');
    for ( var dashboardCardsRow in ( await mysqlConnection.execute(dashboardCardsSql) ).getTypedRowsMap() ) {
      outDashboardFileStream.writeln(
          '- row=${dashboardCardsRow['row']} col=${dashboardCardsRow['col']} sizeX=${dashboardCardsRow['sizeX']} sizeY=${dashboardCardsRow['sizeY']} '
          '<a href="rep_card_${dashboardCardsRow['card_id']}.md">${dashboardCardsRow['card_name']} (${dashboardCardsRow['card_id']})</a>'
          );
      outDashboardFileStream.writeln('```JSON');
      outDashboardFileStream.writeln( jsonPrettyfier.convert( dashboardCardsRow ) );
      outDashboardFileStream.writeln('```');
    }
    await outDashboardFileStream.flush();
    await outDashboardFileStream.close();
  }
  
  print( '  exporting cards' );

  final cardsSql = '''
      SELECT * 
      FROM report_card 
      WHERE archived = 0
      ORDER BY id
      ''';
  final cardsResults = await mysqlConnection.execute(cardsSql);
  for (var cardsRow in cardsResults.getTypedRowsMap() ) {
    final cardId = cardsRow['id'];
    final cardName = cardsRow['name'];
    cardsRow.remove('updated_at');
    cardsRow.remove('fingerprint');
    cardsRow['result_metadata'] = List.from((cardsRow['result_metadata'] as List).map((e) => (e is Map) ? (e..remove('fingerprint')) : e ));
    mapIdsToLabels(cardsRow, 'database', databases);
    mapIdsToLabels(cardsRow, 'table_id', tables);
    mapIdsToLabels(cardsRow, 'field', fields);
    mapIdsToLabels(cardsRow, 'source-field', fields);
    mapIdsToLabels(cardsRow, 'fk_field_id', fields);
    mapIdsToLabels(cardsRow, 'collection_id', collections);
    final outCardFileName = 'rep_card_$cardId.md';
    final outCardFileStream = (await File(outDirectoryPath + outCardFileName).create(recursive: true)).openWrite();
    outCardFileStream.writeln('# Card "$cardName" ($cardId)');
    outCardFileStream.writeln('```JSON');
    outCardFileStream.writeln( jsonPrettyfier.convert( cardsRow ) );
    outCardFileStream.writeln('```');
    await outCardFileStream.flush();
    await outCardFileStream.close();
  }

  await sqlConnection.close();
  await mysqlConnection.close();
}


Future<void> exportMetabaseAPI(final String metabaseApiRoot, final String username, final String password) async {
  print('exportMetabaseAPI($metabaseApiRoot, $username, $password)');

  final JsonEncoder jsonPrettyfier = JsonEncoder.withIndent('  ');

  // get Session Token
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    };
  Map<String, dynamic> body = {
    'username': username,
    'password': password,
    };
  final httpClient = http.Client();

  final http.Response response = await httpClient
        .post(
          Uri(fragment: '$metabaseApiRoot/api/session'),
          headers: headers,
          body: jsonEncode(body),
        )
        .timeout(
          Duration(seconds: 30),
          onTimeout: () => http.Response('Timeout', 408),
        );
  if (response.statusCode != 200) {
    print( 'code: ${response.statusCode}  body: ${response.body}' );
  }
  // if (response.code != 200)     // OK
  print( 'code: OK  body: ${response.body}' );

  headers.remove('username');
  headers.remove('password');
  headers['X-Metabase-Session'] = jsonDecode(response.body)['id'];

  // Collections
  {
    final http.Response response = await httpClient
          .get(
            Uri(fragment: '$metabaseApiRoot/api/collection'),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 30),
            onTimeout: () => http.Response('Timeout', 408),
          );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    // if (response.code != 200)     // OK
    //print( 'code: OK  body: ${response.body}' );

    var outFileName = '../Metabase/collections.json';
    var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln('');
    outFileStream.writeln( jsonPrettyfier.convert( jsonDecode(response.body) ) );
    await outFileStream.flush();
    await outFileStream.close();
  }

  // Dashboards
  {
    final http.Response response = await httpClient
        .get(
          Uri(fragment: '$metabaseApiRoot/api/dashboard'),
          headers: headers,
        )
        .timeout(
          Duration(seconds: 30),
          onTimeout: () => http.Response('Timeout', 408),
        );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    // if (response.code != 200)     // OK
    //print( 'code: OK  body: ${response.body}' );

    var outFileName = '../Metabase/dashboards.json';
    var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln('');
    final List<dynamic> dashboards = jsonDecode(response.body);
    dashboards.forEach((element) {
      (element as Map).remove('creator');
    });
    outFileStream.writeln( jsonPrettyfier.convert( dashboards ) );
    await outFileStream.flush();
    await outFileStream.close();
  }
  
  // Cards
  {
    final http.Response response = await httpClient
          .get(
            Uri(fragment: '$metabaseApiRoot/api/card'),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 30),
            onTimeout: () => http.Response('Timeout', 408),
          );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    // if (response.code != 200)     // OK
    //print( 'code: OK  body: ${response.body}' );

    var outFileName = '../Metabase/cards.json';
    var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln('');
    final List<dynamic> cards = jsonDecode(response.body);
    cards.forEach((element) {
      final cardsRow = element as Map;
      cardsRow.remove('creator');
      cardsRow.remove('updated_at');
      cardsRow.remove('fingerprint');
    });
    outFileStream.writeln( jsonPrettyfier.convert( cards ) );
    await outFileStream.flush();
    await outFileStream.close();
  }

  // Databases
  {
    final http.Response response = await httpClient
          .get(
            Uri(fragment: '$metabaseApiRoot/api/database?include=tables'),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 30),
            onTimeout: () => http.Response('Timeout', 408),
          );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    // if (response.code != 200)     // OK
    //print( 'code: OK  body: ${response.body}' );

    var outFileName = '../Metabase/databases.json';
    var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln('');
    outFileStream.writeln( jsonPrettyfier.convert( jsonDecode(response.body) ) );
    await outFileStream.flush();
    await outFileStream.close();
  }

  // Tables
  {
    final http.Response response = await httpClient
          .get(
            Uri(fragment: '$metabaseApiRoot/api/table'),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 30),
            onTimeout: () => http.Response('Timeout', 408),
          );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    // if (response.code != 200)     // OK
    //print( 'code: OK  body: ${response.body}' );

    var outFileName = '../Metabase/tables.json';
    var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
    outFileStream.writeln('');
    outFileStream.writeln( jsonPrettyfier.convert( jsonDecode(response.body) ) );
    await outFileStream.flush();
    await outFileStream.close();
  }

  // Fields
  {
    final http.Response response = await httpClient
          .get(
            Uri(fragment: '$metabaseApiRoot/api/field'),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 30),
            onTimeout: () => http.Response('Timeout', 408),
          );
    if (response.statusCode != 200) {
      print( 'code: ${response.statusCode}  body: ${response.body}' );
    }
    else {    // if (response.code != 200)     // OK
      //print( 'code: OK  body: ${response.body}' );

      var outFileName = '../Metabase/fields.json';
      var outFileStream = (await File(outFileName).create(recursive: true)).openWrite();
      outFileStream.writeln('');
      outFileStream.writeln( jsonPrettyfier.convert( jsonDecode(response.body) ) );
      await outFileStream.flush();
      await outFileStream.close();
    }
  }

}


Future<void> main(List<String> arguments) async {
  if ( arguments.length != 2) {
    print('dart yetiforce_readable_db_export.dart <installationName> <all|raw|workflows|metabase|litigation_workflows>');
    print('e.g.:');
    print('dart yetiforce_readable_db_export.dart dev raw');
    print('dart yetiforce_readable_db_export.dart prod all');
    print('dart yetiforce_readable_db_export.dart dev workflows');
    print('dart yetiforce_readable_db_export.dart armsa_dev metabase');
    print('dart yetiforce_readable_db_export.dart dev litigation_workflows');
  } else {
    MySqlConnection conn = await setupConnection(arguments[0]);

    if ( {'all', 'raw'}.contains(arguments[1]) ) {
      final queryDir = Directory('config');
      final dirList = queryDir.listSync();
      for (final queryFile in dirList) {
        try {
          await exportQueryResults(conn, (queryFile as File));
        } catch (exception) { // mysql1 query is closed if "CALL" is queried
          conn = await setupConnection(arguments[0]);
          await exportQueryResults(conn, (queryFile as File));
        }
      }
    }

    if ( {'all', 'workflows'}.contains(arguments[1])) {
      await exportWorkflows(conn);
    }

    if ( {'all', 'litigation_workflows'}.contains(arguments[1])) {
      await exportLitigationWorkflows(conn);
    }

    if ( {'all', 'metabase'}.contains(arguments[1])) {
      await exportMetabaseDB(arguments[0]);
    }

    //if ( {'all', 'metabase'}.contains(arguments[1])) {
    //  await exportMetabaseAPI('http://orsscrm.westeurope.cloudapp.azure.com:8444', 'dbogumil@dotsystems.pl', 'IrFQq-VicvjHP2');
    //}

  }

  exit(0);
}
