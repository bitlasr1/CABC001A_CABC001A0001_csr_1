
*Program to create a listing output;

libname analysis "/mnt/data/analysis_data";

data adsl;
set analysis.adsl;
length SEXL $10.;
if SEX="M" then SEXL="Male";
else if SEX="F" then SEXL="Female";
run;

ods rtf file="/mnt/artifacts/results/l_01.rtf";
proc report data =adsl;
Column USUBJID AGE SEXL trt01a ;
define USUBJID /"Subject";
define age / "Age";
define sexl / "Sex";
define trt01a / "Treatment";
run;
ods rtf close;