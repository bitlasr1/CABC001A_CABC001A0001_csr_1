
*Program to QC ADSL dataset;

libname analysis "/mnt/data/analysis_data";

data adsl_qc;
input USUBJID $21. AGE SEX $ TRT01A $ ARM $ ARMCD $ TRTSDT date9.;
format TRTSDT date9.;
length SEXL $10. agecat $5.;
if SEX="M" then SEXL="Male";
else if SEX="F" then SEXL="Female";
if age>35 then agecat=">35";
else if .<age<=35 then agecat="<=35";
datalines;
CABC001A0001_100_0001 30 M Drug1 Drug1 DRUG1 01Jan2023
CABC001A0001_100_0002 32 F Drug1 Drug1 DRUG1 02Jan2023
CABC001A0001_100_0003 33 F Drug1 Drug1 DRUG1 03Jan2023
CABC001A0001_100_0004 34 F Drug1 Drug1 DRUG1 04Jan2023
CABC001A0001_100_0005 35 M Drug1 Drug1 DRUG1 05Jan2023
CABC001A0001_101_0001 32 M Drug2 Drug2 DRUG2 01Jan2023
CABC001A0001_101_0002 31 F Drug2 Drug2 DRUG2 05Jan2023
CABC001A0001_101_0003 38 M Drug2 Drug2 DRUG2 01Jan2023
CABC001A0001_101_0004 33 F Drug2 Drug2 DRUG2 04Jan2023
CABC001A0001_101_0005 30 M Drug2 Drug2 DRUG2 02Jan2023
;
run;

proc compare base=analysis.adsl c=adsl_qc;
run;


