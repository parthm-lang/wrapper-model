package pythonScore / overwrite=yes;
dcl package pymas pm;
dcl package logger logr('App.MM.Python.DS2');
dcl varchar(32767) character set utf8 pypgm;
dcl int resultCode revision;

method score(varchar(100) "input_data",
in_out double resultCode,
in_out varchar(10000) "access_token",
in_out varchar(9999) "score_response_json");

   resultCode = revision = 0;
   if null(pm) then do;
      pm = _new_ pymas();
      resultCode = pm.useModule('model_exec_739830ba-c128-4275-8dfd-d3e6eb2fa40a', 1);
      if resultCode then do;
         resultCode = pm.appendSrcLine('import sys');
         resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/386bd18e-ca5a-4e29-824f-b0d6fc630c53/")');
         resultCode = pm.appendSrcLine('import settings_386bd18e_ca5a_4e29_824f_b0d6fc630c53');
         resultCode = pm.appendSrcLine('settings_386bd18e_ca5a_4e29_824f_b0d6fc630c53.pickle_path = "/models/resources/viya/386bd18e-ca5a-4e29-824f-b0d6fc630c53/"');
         resultCode = pm.appendSrcLine('import score_9f9de83d_ab95_4300_9646_63eec693dc46');
         resultCode = pm.appendSrcLine('def score_model(input_data):');
         resultCode = pm.appendSrcLine('    "Output: access_token, score_response_json"');
         resultCode = pm.appendSrcLine('    return score_9f9de83d_ab95_4300_9646_63eec693dc46.score_model(input_data)');

         revision = pm.publish(pm.getSource(), 'model_exec_739830ba-c128-4275-8dfd-d3e6eb2fa40a');
         if ( revision < 1 ) then do;
            logr.log( 'e', 'py.publish() failed.');
            resultCode = -1;
            return;
         end;
      end;
   end;

   resultCode = pm.useMethod('score_model');
   if resultCode then do;
      logr.log('E', 'useMethod() failed. resultCode=$s', resultCode);
      return;
   end;
   resultCode = pm.setString('input_data', "input_data");
   if resultCode then
      logr.log('E', 'setString for input_data failed.  resultCode=$s', resultCode);
   resultCode = pm.execute();
   if (resultCode) then
      logr.log('E', 'Error: pm.execute failed.  resultCode=$s', resultCode);
   else do;
      "access_token" = pm.getString('access_token');
      "score_response_json" = pm.getString('score_response_json');
   end;
end;

endpackage;
