
*Program to create a listing output;

libname analysis "/mnt/data/analysis_data";

data adsl;
set analysis.adsl;
cat=agecat;
output;
cat=sexl;
output;
run;

proc freq data=adsl noprint;
table cat/ out=stats ;
run;

data final;
set stats;
npct=strip(n)||" ("||strip(pctp)||")";
run;

ods rtf file="/mnt/artifacts/results/t_01.rtf";
Title "Table 01";
proc report data =adsl;
Column cat  ;
define USUBJID /"Subject";
define age / "Age";
define sexl / "Sex";
define trt01a / "Treatment";
run;
ods rtf close;