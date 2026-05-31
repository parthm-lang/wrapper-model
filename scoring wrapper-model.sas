
libname scores clear;
filename scores temp;
proc http
    url = "https://sasviya.demo.sas.com/microanalyticScore/modules/"
    out= scores
    oauth_bearer = sas_services;
    headers
        'Accept'= 'application/vnd.sas.collection+json';
run;
libname scores json;

libname steps clear;
filename steps temp;
proc http
    url = "https://sasviya.demo.sas.com/microanalyticScore/modules/wrappermodel/steps"
    out= steps
    oauth_bearer = sas_services;
    headers
        'Accept'= 'application/vnd.sas.collection+json';
run;
libname steps json;

libname json_in clear;
libname results clear;
filename results temp;
filename json_in temp;

/* properly provide the input values properly. char - within " " 
numeric - without " " */

data _null_;
    file json_in;
    input ;
    put _infile_;
    datalines;
    {"inputs":[
        {"name": "input_data", "value": "abcd"}
    ]}
;
run;


proc http
    url = "https://sasviya.demo.sas.com/microanalyticScore/modules/wrappermodel/steps/score"
    out= results
    method=POST
    in=json_in
    oauth_bearer = sas_services;
    headers
        'Accept'= 'application/json, application/vnd.sas.microanalytic.module.step.output+json, application/vnd.sas.error+json'
        'Content-Type'= 'application/json';
run;
libname results json;
