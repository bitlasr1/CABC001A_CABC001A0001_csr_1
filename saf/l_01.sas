
*Program to create a listing output;

libname analysis "/mnt/data/analysis_data";

data adsl;
set analysis.adsl;
run;

ods rtf file="/mnt/artifacts/reports/saf/l_01.rtf";
Title "Listing 01";
proc report data =adsl;
Column USUBJID AGE SEXL trt01a ;
define USUBJID /"Subject";
define age / "Age";
define sexl / "Sex";
define trt01a / "Treatment";
run;
ods rtf close;
