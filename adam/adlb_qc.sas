*Program to create a dummy data for ADLB dataset;

libname analysis "/mnt/data/analysis_data";

data adlb_qc;
input USUBJID $21. paramcd $ param $ avisit $ aval;
datalines;
CABC001A0001_100_0001 ALBSI Albumin Week4 10
CABC001A0001_100_0001 ALBSI Albumin Week8 20
CABC001A0001_100_0001 ALBSI Albumin Week4 10
CABC001A0001_100_0001 CKSI Creatine Week4 22
CABC001A0001_100_0001 CKSI Creatine Week8 23
CABC001A0001_100_0002 ALBSI Albumin Week4 11
CABC001A0001_100_0002 ALBSI Albumin Week8 21
CABC001A0001_100_0002 ALBSI Albumin Week4 11
CABC001A0001_100_0002 CKSI Creatine Week4 23
CABC001A0001_100_0002 CKSI Creatine Week8 24
;
run;

proc compare base=analysis.adlb compare=adlb_qc listall;
run;
