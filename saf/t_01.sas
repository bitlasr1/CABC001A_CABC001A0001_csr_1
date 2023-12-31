
*Program to create a listing output;
proc printto log="/mnt/artifacts/reports/saf/t_01.log" new;
run;
%let myvar=%sysget(adata_path);
%put "It is useing data from snapshot of &myvar";

libname analysis "/mnt/data/&myvar.";

data adsl;
set analysis.adsl;
cat=agecat;
cat1="Age category";
output;
cat=sexl;
cat1="Sex";
output;
run;

proc sql noprint;
create table cat1t as
select distinct cat1, count(usubjid) as tot 
from adsl 
group by cat1
;
create table cat1n as
select distinct cat1, cat, count(usubjid) as ncnt 
from adsl 
group by cat1, cat
;
create table combi as
select a.cat1, a.cat, a.ncnt, b.tot, strip(put(a.ncnt,best.)) || 
" ("||strip(put((a.ncnt/b.tot)*100,8.1))||" )" as npct
from cat1n as a left join
cat1t as b on a.cat1=b.cat1
;
quit;

proc printto print="/mnt/artifacts/reports/saf/t_01.lst" new;
run;

ods rtf file="/mnt/artifacts/reports/saf/t_01.rtf";
Title "Table 01.04:15Nov2023:11:38";
proc report data =combi;
Column cat1 cat npct  ;
define cat1 / "Demographic Variable" group;
define cat / "Category" group;
define npct / "n (%)";
compute after cat1 ;
line " ";
endcomp;
run;
ods rtf close;

proc printto;
run;
