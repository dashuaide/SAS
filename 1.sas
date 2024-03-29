data a;
input age height weight:
cards;
21 167 51
22 174 56
;
proc print;
run;



data aa;
input id gender$ age;
cards;
1 1 23
1 2 24
;
proc print;
run;


data fh;
input gender$;               
cards;
female
male
;
proc print;
run;


data fh;
input x 4.2;                 
/*变量后的4.2表示变量x的宽度共4位，其中小数点2位*/
cards;
12
2.1
15.6
23.46
;
proc print;
run;

data zb;
input d date7.;
cards;
23jul13
;
proc print;
run;

data zb;
input d yymmdd8.;
informat d yymmdd8.;
format d yymmdd10.;
cards;
60/01/14
;
proc print;
run;

data city;
input city$ code$;
format city $6. code $2.; 
cards;
北京市 110000
天津市 120000
;
proc print;
run;

data wt;
input num cost;
format num 5.2 cost comma12.1;
cards;
50 10205600
45 9580000
;
proc print;
run;

data dat;
input date1 date2 date3;
informat date1 yymmdd8. date2 yymmdd6. date3 yymmdd8.;
format date1 yymmddd10. date2 yymmdds8. date3 yymmddp8.;
cards;
14.06.16 140616 20140616
;
proc print;
run;

data fh;
input id$9. gender$2. city$7.;
cards;
37060153 m beijing
;
proc print;
run;

data fh;
input day1 yymmdd6.+1 day2 yymmdd6.+1 city$; 
format day1 day2 yymmdds10.; cards;
160125 160528 beijing
;
proc print;
run;

data fh;
do count=1 to 6;
input time;
output;
end;
cards;
23
12
12
13
14
89
;
proc print;
run;

data fh;
input id:$20. day:yymmdd10. city:$20.; 
format day yymmddp10.; cards;
370685 980515 shandong
;
proc print;
run;

data fh;
input name&:$50. city&:$50.; 
cards;
Peter Paker  山东省 蓬莱市  
Ross Geller  山东省 青岛市 市南区  
;
proc print;
run;

data fh;
input id day: yymmdd8. city:$20.; 
format day yymmddp10.;  
cards;
37 980515 .
. 120607 shanghai
39 . nanjing
;
proc print;
run;

data a;
do gender=1 to 2;
do smoking=1 to 2;
input f@@;
output;
end;
end;
cards;
100 50
10 140
;
proc print;
run;

data dd;
input id@;
do time=1 to 3;
input score@@;
output;
end;
cards;
1 86 88 90
2 78 79 67
3 56 57 45
4 56 78 45
5 45 35 67
;
proc print;
run;

libname phone "d:\sasfile";    
/*指定SAS逻辑库mydir 与"g:\mysasfile"关联起来*/
data phone.fh;                 
/*data语句指定建立名为fh的数据集，放在mydir文件夹*/
input id day: yymmdd8. city:$20.;    
format day yymmddp10.;  
cards;
370685 980515 shandong
;
run;
libname phone "d:\sasfile";
proc print data=phone.fh;
run;

libname phone "d:\sasfile";
data=phone.sas4;
proc print data=phone.sas4;
run;


data class1;
input id math yu eng sco;
cards;
1	82	83	86	83.7
2	94	86	84	88
3	88	92	84	88
4	89	94	88	90.3
5	87	81	84	84
6	87	89	94	90
7	82	94	88	88
8	87	90	80	85.7
9	87	84	90	87
10	81	83	82	82
;
proc print;
run;
data class2;
input id math yu eng sco;
cards;
1	88	83	87	86
2	90	85	86	87
3	80	95	92	89
4	88	81	87	85.3
5	91	91	84	88.7
6	88	92	93	91
7	84	92	89	88.3
8	95	83	84	87.3
9	84	82	86	84
10	89	93	80	87.3
;
proc print;
run;

data score;
set class1 class2;
proc print;
run;

data score;
set class1(in=a1) class2(in=a2);
by=id;
c1=a1;
c2=a2;
proc print;
run;

data baseline;
input id name$ gender age;
cards;
1	LIXM	1	42
2	ZHMI	1	40
3	FEND	2	38
4	LIMZ	1	40
5	WAXF	2	32
6	DOCX	2	47
7	ZHJI	2	35
8	HUYH	1	47
9	YUSC	2	41
;
proc print;
run;

data outcome;
input id first second;
cards;
1	1	2
2	2	1
3	2	2
4	1	1
5	3	2
6	3	3
8	1	1
9	2	1
;
proc print;
run;

data clinical;
merge baseline outcome;
by id;
proc sort;
by gender;
proc print data=clinical;
by gender;
run;

data clinical1;
set clinnical(drop=name);
proc print;
run;

data data1;
input id gender age;
cards;
1	1	42
2	1	40
3	2	38
4	1	40
5	2	32
6	2	47
7	2	35
8	1	47
9	2	41
10	1	35
;
proc print;
run;

data data2;
input id sex gender time;
cards;
1	1	42	30
2	1	40	34
3	2	38	.
7	2	35	10
8	1	47	30
9	2	41	.
10	1	35	20
;
proc print;
run;

data data3;
input id gender age time;
cards;
1	1	42	.
2	1	40	34
3	2	38	20
4	1	40	.
5	2	32	.
9	2	41	.
10	1	35	20
;
proc print;
run;

data datazong;
merge data1(in=a1) data2(in=a2) data3(in=a3);
if a1=a2=a3;
by id;
proc print;
run;

data base;
input id name$ gender age;
cards;
1	LIXM	1	42
2	ZHMI	1	40
3	FEND	2	38
4	LIMZ	1	40
5	WAXF	2	32
6	DOCX	2	47
7	ZHJI	2	35
8	HUYH	1	48
9	YUSC	2	41
10	ZHCL	2	32
11	CHXG	1	45
12	HOYB	1	35
13	JIZH	2	48
14	CUYO	1	31
15	LIYL	2	47
16	CHLI	1	35
17	ZHXH	1	47
18	WAXF	2	32
19	ZHJI	2	33
20	LIXB	1	32
;
proc print;
run;



proc format;
invalue $age low-<40 ="<40" 40-high =">=40";
value fws 1="男" 2="女";
data base;
input id  name$  gender  age:$age.;
format  gender fws.;
cards;
1	LIXM	1	42
2	ZHMI	1	40
3	FEND	2	38
4	LIMZ	1	40
5	WAXF	2	32
6	DOCX	2	47
7	ZHJI	2	35
8	HUYH	1	48
9	YUSC	2	41
10	ZHCL	2	32
11	CHXG	1	45
12	HOYB	1	35
13	JIZH	2	48
14	CUYO	1	31
15	LIYL	2	47
16	CHLI	1	35
17	ZHXH	1	47
18	WAXF	2	32
19	ZHJI	2	33
20	LIXB	1	49
;
proc print;
run;


data qwqe;
set base;
if gender= 2 and age=">=40";/*gender后为啥不能是"女"*/
proc print;
run;


data aa;
input id gender$ age;
cards;
1 F 21
2 M 15
3 F 34
4 F 25
5 M 42
6 M 50
;
proc print;
run;
data bb;
set aa;
if gender="F" and age>20;
proc print;
run;

data base;
input id name$ gender age; 
length agegroup $6;
if age<30 then agegroup="<30";
if age>40 then agegroup=">40";
else agegroup="30-40";
cards;
1	LIXM	1	42
2	ZHMI	1	40
3	FEND	2	38
4	LIMZ	1	40
5	WAXF	2	32
6	DOCX	2	47
7	ZHJI	2	35
8	HUYH	1	48
9	YUSC	2	41
10	ZHCL	2	32
11	CHXG	1	45
12	HOYB	1	35
13	JIZH	2	48
14	CUYO	1	31
15	LIYL	2	47
16	CHLI	1	35
17	ZHXH	1	47
18	WAXF	2	32
19	ZHJI	2	33
20	LIXB	1	49
;
proc print;
run;

proc format;
invalue $g 1="男" 2="女";
value a low-<40="<40" 40-high=">=40";
data base;
input id name$ gender:$g10. age;
format age a.;
cards;
1 LIXM 1 42
2 ZHMI 1 40
3 ZHJI 2 56
4 LIXB 1 67
;
proc print;
run;

proc format;
invalue $g 1="男" 2="女";
value a low-39="<40"?40-high=">=40";
data base;
input id?name$?gender$?age;
informat gender:$g10.;
format age a.;
cards;
1 LIXM 1 42
2 ZHMI 1 40
3 ZHI 2 33
4 LQXB 1 78
;
proc print;
run; 

/*2020/9/24*/
libname phone"d:\sasfile"
data as;
set aa;
proc sort out=hi;
by center id;
proc print data=hi;
run;

data as;
set aa;
proc sort out=hii nouniquekey;
by id;
run;
proc print data=hii;
run;

data as;
set aa(obs=10);
proc transpose out=ki prefix=id;
proc print;
run;

proc compare base=aa compare=bb nosummary;
by id;
proc print;
run;


proc format;
value gg 1="试验组" 2="对照组";
value ss 1="男" 2="女";
value mm 1="已婚" 2="未婚";
data as;
set bb;
proc tabulate formchar=" ----------" noseps;
class g sex marriage;
table g=""all,sex*marriage/nocellmerge box="组别";
label g="组别" sex="性别" marriage="婚姻";
keylabel n="例数";
format g gg. sex ss. marriage mm.;/*有个细节没处理掉*/
run;


proc format;
value gg 1="试验组" 2="对照组";
value ss 1="男" 2="女" ;
value mm 1="已婚" 2="未婚";       
data aaaaa;
set bb;
format g gg. sex ss. marriage mm.;
proc tabulate;
class g sex marriage;
table g='',sex=''*marriage='';/*为啥单引号就可以了*/
keylabel N="例数" ;
run;

proc format;
value gg 1="试验组" 2="对照组";
value ss 1="男" 2="女";
value mm 1="已婚" 2="未婚";
data as;
set bb;
format g gg. sex ss. marriage mm.;
proc tabulate formchar=" ----------" noseps;
class sex marriage g;
table sex="性别" marriage="婚姻",(g=""all="合计")*(n rowpctn);
label  rts=10 indent=3;
keylabel n="例数" rowpctn="比例";
run;

proc format;
value gg 1="试验组" 2="对照组";
value ss 1="男" 2="女" ;
value mm 1="已婚" 2="未婚";       
data a;
set bb;
format g gg. sex ss. marriage mm.;
proc tabulate;
class  sex marriage g;
table (sex  marriage),(g="" all="合计")*(n rowpctn);
keylabel n="例数" rowpctn="比例";
run;

proc format;
value gg 1="试验组" 2="对照组";
data a;
set bb;
format g gg.;
proc tabulate formchar=" ----------" noseps;
class g;
var TC TG LDL HDL;
table TC*(mean median std qrange) TG*(mean median std qrange) LDL*(mean median std qrange) HDL*(mean median std qrange),g="";
run;



proc format;
value gg 1="试验组" 2="对照组";
data a;
set bb;
format g gg.;
proc tabulate;
class   g;
var TC TG HDL LDL; 
table (TC TG HDL LDL)*(n mean median std qrange),(g="");
keylabel n="例数" mean="均数" std="标准差" median="中位数" qrange="四分位数间距";                         
run;

/*sas-3 的第7题*/

libname phone"d:\sasfile";
data sev1;
set phone.Third;
proc sgplot data=sev1;
vbox TC/category=g;
run;


/*sas-3 的第8题*/
libname phone"d:\sasfile";
data sev1;
set phone.Third;
proc sgplot data=sev1;
histogram tg;
density tg;                     
run;

/*sas-3 的第9题*/
libname phone"d:\sasfile";
data sev1;
set phone.Third;
proc sgplot data=sev1;
scatter x=tc y=tg/group=g;
keylegend/ location=inside position=topright valueattrs=(size=12);    
xaxis valueattrs=(size=12) labelattrs=(size=12) label="tc";
yaxis valueattrs=(size=12) labelattrs=(size=12) label="tg";
run;


/*sas-3 的第10题*/
libname phone"d:\sasfile";
data sev1;
set phone.Third;
proc sql;
select * from sev1/*此处不加分号*/
where center=1 and sex=1;
quit;

/*sas-3 的第11题*/
libname phone"d:\sasfile";
data sev1;
set phone.Third;

/*2020/9/25*/
data char;
input sn:$10. d1:$10. d2:$10.;
cards;
123 20091012 21oct1999
1235 20130325 06apr2009
;
run;
data convert;
set char;
sn2=input(sn,10.);                        /*将sn按长度为10的格式转为数值型 */
date1=input(d1,yymmdd10.);     /*将d1按yymmdd8.的格式转为数值型 */
date2=input(d2,date9.);                  /*将d2按date9.的格式转为数值型 */
format date1 date2 yymmdd10.;   /*设定d1和d2的输出格式为yymmdd10. */
;
proc print;
run;


data code;
input name&:$50. gender:$;         
len1=length(name);
len2=lengthn(gender);
cards;
Shi Zhao  female
Ron Moore  .
;
proc print;
run;

data iden;
input iden $18.;                             /*输入iden，定义其长度为18*/
if length(iden)=18 then birth=substrn(iden,7,8);
else birth=substrn(iden,7,6);       /*根据iden的字符数判断截取的位数*/
birthday=input(birth,yymmdd10.);     /*将birth转换为数值型变量*/
format birthday yymmdd10.;          /*定义birthday的输出格式*/
cards;
36053319720613591x
360533801215791
360533198208254537
360533851009229
;
proc print;
run;

data ht;
input ht$@@;
ht1=input(compress(ht,"cm","i"),9.);      /*去掉ht中的c或m*/
if find(ht,".","i") then ht1=ht1*100;       /*将ht中带有小数点的值乘以100*/
cards;
176Cm 169 195 1.78M 172 1.68m
;
proc print;
run;


data med;
input id dose&:$30.;              /*dose变量包含空格，因此加上&符号*/
dose1=tranwrd(dose,"口服","PO");       /*将“口服”替换为“PO”*/
cards;
1 50MG QD PO
2 30MG TID PO
4 0.5G QD 口服
;
proc print;
run;

data dm;
input start: yymmdd8. end: yymmdd8.; 
life=yrdif(start,end);                     /*计算两个日期之间的实际年数 */
format start end yymmdd10.; cards;
20090613 20111225
20080916 20120106
20100408 20120909
20111031 20120318
;
proc print;
run;


data ht;
input ht$@@;
ht1=input(compress(ht,"Cm","i"),8.);      /*去掉ht中的c或m*/
if find(ht,".","i") then ht1=ht1*100;       /*将ht中带有小数点的值乘以100*/
cards;
176Cm 169 165 1.78M 175 1.68m
;
proc print;
run;

/*2020/9/25*/
/*第一题*/
libname phone"d:\sasfile";
data aa;/*统计描述*/
set four1;
proc transpose out=aa1 prefix=id;
data aa2;
set aa1;
avg=mean(of id1-id10);
biao=std(of id1-id10);
zhong=median(of id1-id10);
qr=iqr(of id1-id10);
p25=pctl(25,of id1-id10);
p75=pctl(75,of id1-id10);
proc print noobs;
run;

/*第二题*/
data bb1;
set four2;
date=mdy(month,day,year);
format date:yymmdds10.;
proc print;
run;
proc contents;
run;

data bb1;
set four2;
year1=put(year,8.);
month1=put(month,8.);
day1=put(day,8.);
date=catx("-",year1,month1,day1);
date1=input(date,yymmdd10.);
format date1 yymmdds10.;
proc print;
run;

/*第三题*/
libname phone"d:\sasfile";
data fm;
set phone.four3;
gender=lowcase(gender);
if gender="female";
mage=missing(age);
mheight=missing(height);
mweight=missing(weight);
proc print;
run;

/*第四题*/
libname phone"d:\sasfile";
data cc;
set phone.four4;
if length(id)=18 then birth=substrn(id,17,1);
else birth=substrn(id,14,1);  
if mod(birth,2)=1 then gender="男";
else gender="女";
proc print;
run;      

/*第五题*/
libname phone"d:\sasfile";
data dd;
set phone.four5;
dd1=compress(telephone,"-",);/*去掉"-"*/
format dd1 20.;
len1=lengthn(dd1);/*字符串的长度*/
len2=substrn(dd1,1,4);/*字符串的前四位*/
if len1=11 then len3=substrn(dd1,5,7);
else len3=substrn(dd1,5,8);/*与上一行均提取后7或8位字符*/
len4=lengthn(len3);/*计算后半部分是7位还是8位*/
if len4=7 then len5=cats("6",len3);
else len5=len3;/*若是7位，连接字符"6",否则不变*/
fincode=cats(len2,len5);/*连接前半部分和后半部分*/
proc print;
run;

libname phone"d:\sasfile";
data dd;
set phone.four5;
tel=compress(telephone,"-");
par1=substrn(tel,1,4);
par2=substrn(tel,5);
if length(par2)=7 then
fir=cats("6",par2);
else fir=par2;
fina=cats(par1,fir);
proc print;
run;


/*第六题*/
libname phone"d:\sasfile";
data ff;
set phone.four6;
ff4=compress(type,,"a");
ff3=compress(type,,"d");
proc print;
run;

/*2020/10/9*/
libname phone"d:\sasfile";
data ss;
set phone.qq;
proc means data=ss maxdec=3 mean std stderr var cv range median Q1 Q3 qrange;
var Hb;
class gender;
run;
data ss;
set phone.qq;
proc sort data=ss;
by gender;
run;
proc univariate data=ss;
var age; 
by gender;
run;
proc sgplot data=ss;
histogram age;
by gender;
run;

vbox age/category=gender;


data aa;
do ill="肺结核","心脏病","肿瘤";
do year="1950","1960","2000";
input zhi@@;
output;
end;
end;
cards;
163.2	24.7	22.2
72.5	83.4	100.4
57.2	156.3	189.2
;
proc print;
run;
proc sgplot data=aa;
vbar ill/response=zhi group=year ;
run;



data aa;
input group$ zhi;
cards;
1	76
1	90
1	62
1	76
1	65
1	65
1	77
1	83
1	83
1	75
2	72
2	78
2	59
2	72
2	85
2	71
2	69
2	70
2	60
2	81
;
proc univariate normal;
class group;
var zhi;
run;
proc ttest;
class group;
var zhi;
run;

data bb;
input before after;
d=before-after;
cards;
78	71
63	44
72	61
89	84
91	74
49	51
68	55
76	60
85	77
55	39
proc univariate normal;
var d;
run;
proc ttest;
paired before*after;
run;




data bb;
input before after;
d=before-after;
cards;
78	71
63	44
72	61
89	84
91	74
49	51
68	55
76	60
85	77
55	39
;
proc univariate;
var d;
run;


/*2020/10/30*方差分析*/
libname phone"d:\sasfile";
/*单因素方差分析*/
data test1;
do g=1 to 3;
do f=1 to 12;
input x @@; 
output;
end; 
end;
cards;
4.78 4.65 3.98 4.04 3.44 3.77 3.65 4.91 4.79 5.31 4.05 5.16
4.65 6.92 4.44 6.16 5.99 6.67 5.29 4.7 5.05 6.01 5.67 4.68
6.8 5.91 7.28 7.51 7.51 7.74 
8.19 7.15 8.18 5.53 7.79 8.03
;
proc print;
run;

proc univariate data=test1 normal ; 
class g;
var x;
proc print;
run;

proc glm data=test1;
class g;
model x=g;
means g/hovtest=bartlett lsd snk dunnett('3') ;
run;
quit;
/*随机区组方差分析*/
data aa;
do block=1 to 6;
do dose=1 to 4;
input weight @@;
Output;end;end;
cards;
82.22 82.30 90.14 112.76 
110.10 83.17 100.78 140.62
100.15	110.30	120.55 120.49
74.20 82.43 100.66 110.31
80.57 97.90 115.76 103.56
102.77 81.20 90.30 138.54
;
proc print;
run;

proc glm data=aa;
class block dose;
model weight=block dose;
lsmeans block dose /tdiff adjust=bon;
run;
/*析因设计*/
Data dat4;
do a = 1 to 2;
do b = 1 to 2;  
do i=1 to 3; 
Input x @@;                             
output; end;   end; end;
cards;
0.416 0.650 0.468      
0.728 0.806 0.598
1.456 1.144 1.092 
1.664 2.028 2.080
;
proc print;
run;
/*资料的正态性检验*/
proc univariate normal;
class a b;
var x;
run;

proc glm;
class a b;
model x=a b a*b;
lsmeans a*b/slice=a;
lsmeans a*b/slice=b;
lsmeans a*b/tdiff adjust=bon;
run;


/*2020/10/30 方差分析习题*/
data aa;
input group number;
cards;
1 229
1 274
1 310
2 210
2 285
2 117
3 279
3 334
3 303
3 338
3 198
;
proc print;
run;

proc univariate data=aa normal;
class group;
var number;
proc print;
run;

proc glm data=aa;
class group;
model number=group;
means group/hovtest=bartlett lsd snk dunnett('3') ;
run;
quit;

/*随机区组方差分析*/
data bb;
do sort=1 to 4;
do dose= 1 to 3;
input weight@@;
output;
end;
end;
cards;
108 112 142
46 64 116
70 96 134
43 65 98
;
proc print;
run;

proc univariate normal;
class sort;
var weight;
proc print;
run;

proc glm data=bb;
class sort dose;
model weight=sort dose;
lsmeans sort dose/tdiff
adjust=bon;
run;

/*析因分析*/
/*3.（析因设计-多因素）为研究甲、乙两种新药降低高胆固醇血症患者胆固醇的疗效，随机抽样20例高胆
固醇血症患者并检测其血胆固醇含量，然后将其随机分配为4组，应用不同疗法治疗，
A组应用常规疗法，B组应用常规疗法加服甲药，C组应用常规疗法加服乙药，D组应
用常规疗法加服甲药及乙药，一个疗程后检测患者血胆固醇含量并计算其血胆固醇
降低值（试验前后的差值，mmol/l），收集数据如下表，请分析两新药疗效有无差
别？最佳给药方案如何建议？*/

/***********************************************************/ 
/* 首先把资料整理成符合析因设计的资料  
                用甲药(a=1)               不用甲药(a=2)
        用乙药（D)  不用乙药（B)    用乙药（C）  不用乙药（A）
         1.7862      1.1365         1.1532       0.8565
         2.0123      1.1025         0.9918       0.7352
         2.3242      1.4213         1.2121       0.9357
         1.9892      1.1876         0.9857       1.2698
         2.0012      1.1564         0.8832       0.9217
/***********************************************************/;
data test2;
do a=1 to 2;
 do b=1 to 2;
  do n=1 to 5;/*添加此变量为了唯一确定四格表中的数据*/
  input x @@;
  output;
  end;
 end;
end;
cards;
1.7862 2.0123 2.3242 1.9892 2.0012
1.1365 1.1025 1.4213 1.1876 1.1564
1.1532 0.9918 1.2121 0.9857 0.8832
0.8565 0.7352 0.9357 1.2698 0.9217
; proc print;
run;
proc univariate normal;/*资料的正态性检验*/
class a b;
var x;
run;

proc glm;
class a b;/*class语句指明有两个分组因素a和b*/
model x=a b a*b; /*model语句指明要分析a b 以及a和b的乘积，即交互项的效应*/
lsmeans a*b/slice=a;/*输出最小二乘均数，a*b交叉组成四组，故输出四组的均数。
                    slice语句表示控制a比较b的差异，即分别给出a=1和a=2时候的b的两组比较结果*/
lsmeans a*b/slice=b;/*slice语句表示控制b比较a的差异，即分别给出b=1和b=2时候的a的两组比较结果*/
lsmeans a*b/tdiff adjust=bon;/*该语句表示对a*b交叉形成的四组采用bonferroni法进行两两比较*/
run;





/*2020/11/6*/
/*卡方检验*/
Data example1;/*输入四格表数据*/
DO hp=1 TO 2;              
DO progression=1 TO 2;
INPUT f@@;                 
OUTPUT;
END;
END;
CARDS; 
1247 164
443 35
;
run;

Proc freq data=example1;
Weight f;     /*四格表数据加权*/
Table hp*progression/chisq expected nopercent norow nocol;/*expected指理论频数 nopercent norow nocol不显示总百分比，行百分比，列百分比*/
Run;
/*课件上的一道题 关于趋势检验的*/
data example6;
input z b f;
datalines;
0.5 1 1 
0.5 2 53
1.5 1 7 
1.5 2 113
2.5 1 25 
2.5 2 230
3.5 1 30 
3.5 2 154
5 1 32 
5 2 137
6.5 1 28 
6.5 2 110
;
run;
Proc freq data=example6;
Weight f;
Tables b*z/trend;
Run;
data example6;
input z b f;
datalines;
1 1 1 
1 2 53
2 1 7 
2 2 113
3 1 25 
3 2 230
4 1 30 
4 2 154
5 1 32 
5 2 137
6 1 28 
6 2 110
;
run;
Proc freq data=example6;
Weight f;
Tables b*z/trend;
Run;


/*卡方检验的例题*/
/* 2*2四格表 1.	某时某地5岁一下儿童结核感染情况如下，试比较两组是否有差异？
	阳性	儿童数
接触组	23	64
对照组	26	150*/
data aa;
 do group=1 to 2;
 do outcome=1 to 2;
 input b@@;
 output;
 end;
end;
cards;
23 41
26 124
;
proc print;
run;
proc freq data=aa;
weight b;
tables group*outcome/chisq;
run;

/*配对四格表资料*/
/*2.	现有198份痰样本，分别用A、B两种培养基培养结核菌，
试问两种培养基的阳性培养率是否相等？
A	B
	+	-
+	48	24
-	20	106*/
data aa;
do a=1 to 2;
do b=1 to 2;
input f@@;
output;
end;
end;
cards;
48 24
20 106
;
proc freq data=aa;
weight f;
table a*b/agree;
run;

/*  R*2组的卡方  */
/*3.	某时某地3岁以下小儿Ⅲ型腺病毒中和抗体阳性率如下，
试比较三个年龄组的阳性率是否有差异，并进一步分析三组率是否有某种趋势？
月龄	阳性	阴性
1~12	7	72
13~24	8	34
25~36	17	10*/
data aa;
input age group outcome;
cards;
6 1 7
6 2 72
18 1 8 
18 2 34
30 1  17
30 2 10
;
proc freq data=aa;
weight outcome;
table age*group/chisq norow nocol nopercent fisher trend;
run;

























/*2020/11/13 非参数检验*/
/*例l某医生为了比较某新药与旧药的疗效．在研究总体中随机抽样300例研究对象并随机分组为新药
组和对照组。主要研究指标——疗效评价指标为有序变量，其等级划分为显效(++)、有效(+)、无
效(一)三个等级，收集到如下数据并整理成统计表(见表1)，试分析新药组与对照组疗效有无差异?
组别	疗效
	显效（++）	有效（+）	无效（-）
新药组	86	42	24
对照组	67	45	36*/

data aa;
do group=1 to 2;
do effect=1 to 3;
input x@@;
output;
end;
end;
cards;
86 42 24
67 45 36
;
proc npar1way wilcoxon;
class group;
var effect;
freq x;
run;

/*例2某医师为探讨多发伤后血清内皮细胞特异分子‐１ （ESM‐１）的变化 ，将12窝小白鼠
（每窝3只）制作成多发伤动物模型 ，再把每窝3只多发伤小白鼠随机分配到3个实验组 ，采静
脉血 ４ml ，分离血清 ，成批检测 ESM‐１（ng／ml）结果见表。 问
多发伤后血清内皮细胞特异分子‐１（ESM‐１）有无差别 ，如果有差别 ，作两两比较 。
区组编号	A	  B	C
1	0.03	0.08	0.16
2	0.06	0.07	0.19
3	2.26	2.98	3.21
4	0.03	0.03	0.74
5	0.02	0.1  	0.24
6	0.03	0.08	0.16
7	3.17	3.58	3.75
8	0.05	0.09	0.28
9	0.02	0.06	0.29
10	0.04	0.06	0.18
11	6.53	7.18	8.09
12	0.05	0.09	0.17*/

data aa;
do dis=1 to 12;
do group=1 to 3;
input x@@;
output;
end;
end;
cards;
0.03	0.08	0.16
0.06	0.07	0.19
2.26	2.98	3.21
0.03	0.03	0.74
0.02	0.1	    0.24
0.03	0.08	0.16
3.17	3.58	3.75
0.05	0.09	0.28
0.02	0.06	0.29
0.04	0.06	0.18
6.53	7.18	8.09
0.05	0.09	0.17
;
proc univariate normal;
class group;
var x;
run;
proc freq ;
table dis*group*x/noprint scores=rank cmh2;
run;
/*Friedman秩和检验的两两比较在SAS中无对应的命令，可以根据两两比较公式Z=R1/√((k(k+1))/6b)手动编程计算，以下是平均秩次计算的程序*/
proc sort data=aa;
by dis;
run;
proc rank;
var x; /*对指标esm编秩*/
ranks rd; /*将esm编秩后的秩次命名为rd*/
by dis;
run;
proc means mean maxdec=2; /*计算平均秩次*/
class group;
var rd;
run;
/*两两比较的Z值计算公式编程如下，另，校正后p=0.05/3=0.0167*/
data compare;
z12=(1.96-1.04)/sqrt(3*(3+1)/(6*12));
p12=2*(1-probnorm(z12));/*根据z值计算双侧的p值，probnorm是一个函数，1-probnorm(z12)表示当u=z12时标准正态曲线下的右侧尾部面积，p12表示双侧尾部面积，即p值*/
z13=(3.00-1.04)/sqrt(3*(3+1)/(6*12));
p13=2*(1-probnorm(z13));
z23=(3.00-1.96)/sqrt(3*(3+1)/(6*12));
p23=2*(1-probnorm(z23));
proc print;
run;


/*例3 某药厂用两种流速生产无水醇，预比较其含醇率，作配对实验，每次取一定量的石灰
原料混匀后分成两份，分别做两种流速试验，如此重复进行10次，结果如下表所示：
对子号                     1     2     3     4     5
甲种流速含醇率（%）       95    97    94    96    92
乙种流速含醇率（%）       98    95    98    99    96
试判断甲乙两种流速的含醇率是否有显著性差异？*/

data aa;
input before after;
d=before-after;
cards;
95 98
97 95
94 98
96 99
92 96
;
proc univariate normal;
var d;
run;

/*2020/11/20  相关分析*/
data bb;
p=(1-cdf("normal",0.0837))*2;
proc print;
run;

/*相关分析*/
/*例1.在某地一项膳食调查中，随机抽取了14名40~60岁的健康妇女，测得每人的基础代谢（kj/d）
与体重（kg）数据，见表。据此数据如何判断这两项指标间有无关联。
编号	基础代谢（kj/d）	体重(kg)
1	4175.6	50.7
2	4435	53.7
3	3460.2	37.1
4	4020.8	51.7
5	3987.4	47.8
6	4970.6	62.8
7	5359.7	67.3
8	3970.6	48.6
9	3983.2	44.6
10	5050.1	58.6
11	5355.5	71
12	4560.6	59.7
13	4874.4	62.1
14	5029.2	61.5
  r=0.96  */

data aa;
input met wei;
cards;
4175.6	50.7
4435	53.7
3460.2	37.1
4020.8	51.7
3987.4	47.8
4970.6	62.8
5359.7	67.3
3970.6	48.6
3983.2	44.6
5050.1	58.6
5355.5	71
4560.6	59.7
4874.4	62.1
5029.2	61.5
;
proc univariate normal;
var met wei;
run;
proc corr;
var met wei;
run;


/*例2.某医院为探讨流行性出血热临床发病情况和治疗原则之间的关系，得到了446例病情转化
资料，试分析早期分度与最后定型之间有无关联。
早期分型	最后定型
	轻型	中型	重危型
轻型	111	21	1
中型	5	163	20
重危型	0	1	124 */

data aa;
do i=1 to 3;
do j=1 to 3;
input f@@;
output;
end;
end;
cards;
111 21 1
5 163 20
0 1 124
;

proc freq;
weight f;
table i*j/nopercent nocol norow chisq agree;
test kappa;
run;


/*例3.某医院在研究胎盘过早剥离者的出血情况时，将妊娠时间分为三个阶段，失血量
分为三个等级，共调查了224例，结果见下表。问失血量的多少与妊娠阶段之间有无关联？
妊娠阶段	失血量	合计
	较少	中等	较多	
早期	23	4	6	33
中期	47	29	23	99
晚期	51	19	22	92
合计	121	52	51	224
*/

data aa;
do i=1 to 3;
do j=1 to 3;
input f@@;
output;
end;
end;
cards;
23 4 6
47 29 23
51 19 22
;
proc corr spearman;
var i j;
freq f;
run;


/*2020/12/18 多重线性回归*/
/*例题1
时间	存活细菌数
2	211
3	197
4	166
5	142
6	106
7	104
8	60
9	56
10	38
11	36
12	32
13	21
14	19
15	15;
 要求：分析时间对存活细菌数的影响			
提示：注意观察残差图			
*/
data aa;
input time num;
a=time*time;
output;
cards;
2	211
3	197
4	166
5	142
6	106
7	104
8	60
9	56
10	38
11	36
12	32
13	21
14	19
15	15
;
proc sgplot;
scatter x=time y=num;
run;

proc univarate normal;
var num;
run;

proc reg;
model num=time a;
run;


/*  例2  
年份	进口量	国内生产量	存储量	国内消费量
49	15.9	149.3	4.2	108.1
50	16.4	161.2	4.1	114.8
51	19	171.5	3.1	123.2
52	19.1	175.5	3.1	126.9
53	18.8	180.8	1.1	132.1
54	20.4	190.7	2.2	137.7
55	22.7	202.1	2.1	146
56	26.5	212.4	5.6	154.1
57	28.1	226.1	5	162.3
58	27.6	231.9	5.1	164.3
59	26.3	239	0.7	167.6
要求：分析国内生产量、存储量、国内消费量对进口量的影响	提示：注意共线性				
*/

data aa;
input year import pro store con;
yu=pro-con;
output;
cards;
49	15.9	149.3	4.2	108.1
50	16.4	161.2	4.1	114.8
51	19	    171.5	3.1	123.2
52	19.1	175.5	3.1	126.9
53	18.8	180.8	1.1	132.1
54	20.4	190.7	2.2	137.7
55	22.7	202.1	2.1	146
56	26.5	212.4	5.6	154.1
57	28.1	226.1	5	162.3
58	27.6	231.9	5.1	164.3
59	26.3	239	    0.7	167.6
;
/*残差正态性检验*/
proc reg data=aa;
model import=pro store con;
output out=res2 r=r;
run;
proc univariate data=res2  normal;
var r;
run; 
/*正态性检验*/
proc univariate normal;
var import pro store con;
run;
/*散点图探索各自变量与因变量的关系*/
proc sgplot;
scatter y=import x=pro;
scatter y=import x=store;
scatter y=import x=con;
run;

/*散点图探索各自变量与因变量的关系*/
proc gplot data=aa;
plot import*pro;
plot import*store;
plot import*con;
run;
/*方差齐性检验*/
proc reg data=aa;
model import=pro store con;
plot student.*p./nomodel nostat;
run;
/*单因素分析*/
proc reg;
model import=pro;
model import=store;
model import=con;
run;
/*共线性，强影响点检验*/
proc reg;
model import=pro store con/collin tol vif;
run;

proc reg;
model import=store con/collin tol vif;
run;

proc reg;
model import=pro store/collin tol vif;
run;
/*剔除共线性变量*/
proc reg;
model import=store yu/collin vif tol;/*可以从总模型中发现Pro变量p值大于0.05*/
run;
/*变量间相关性检验*/
proc corr data=ex2;
var pro store con;
run;
/*剔除共线性变量*/
proc reg data=ex2;
model import=store con;
run;


/*河流	氮浓度	农业面积百分比	森林面积百分比	住宅面积百分比	工商业面积百分比
Olean	26	63	1.2	0.29	1.1
Cassadaga	29	57	0.7	0.09	1.01
Oatka	54	26	1.8	0.58	1.9
Neversink	2	84	1.9	1.98	1
Hackensack	3	27	29.4	3.11	1.99
Wappinger	19	61	3.4	0.56	1.42
Fishkill	16	60	5.6	1.11	2.04
Honeoye 	40	43	1.3	0.24	1.65
Susquehanna	28	62	1.1	0.15	1.01
Chenango	26	60	0.9	0.23	1.21
Tioughnioga	26	53	0.9	0.18	1.33
West Canada	15	75	0.7	0.16	0.75
East Canada	6	84	0.5	0.12	0.73
Saranac	3	81	0.8	0.35	0.8
Ausable	2	89	0.7	0.35	0.76
Black	6	82	0.5	0.15	0.87
Schoharie	22	70	0.9	0.22	0.8
Raquette	4	75	0.4	0.18	0.87
Oswegatchie	21	56	0.5	0.13	0.66
Cohocton	40	49	1.1	0.13	1.25
要求：分析农业、森林、住宅、工商业用地面积对氮浓度的影响					
提示：注意是否有异常点					
*/

data ex3;
input n2 farm forest house business;
cards;
26	63	1.2	0.29	1.1
29	57	0.7	0.09	1.01
54	26	1.8	0.58	1.9
2	84	1.9	1.98	1
3	27	29.4	3.11	1.99
19	61	3.4	0.56	1.42
16	60	5.6	1.11	2.04
40	43	1.3	0.24	1.65
28	62	1.1	0.15	1.01
26	60	0.9	0.23	1.21
26	53	0.9	0.18	1.33
15	75	0.7	0.16	0.75
6	84	0.5	0.12	0.73
3	81	0.8	0.35	0.8
2	89	0.7	0.35	0.76
6	82	0.5	0.15	0.87
22	70	0.9	0.22	0.8
4	75	0.4	0.18	0.87
21	56	0.5	0.13	0.66
40	49	1.1	0.13	1.25
;
/*散点图探索各自变量与因变量的关系*/
proc gplot data=ex3;
plot n2*farm;
plot n2*forest;
plot n2*house;
plot n2*business;
run;
/*方差齐性检验*/
proc reg data=ex3;
model n2=farm forest house business;
plot student.*p./nomodel nostat;
run;
/*单因素分析*/
proc reg;
model n2=farm;
model n2=forest;
model n2=house;
model n2=business;
run;
/*共线性，强影响点检验*/
proc reg;
model n2=farm forest house business/collin tol vif;
run;
quit;

proc reg;
model  n2=farm forest house business/influence r;
run;
proc reg;
model n2=farm forest business/collin tol vif;
run;


/*参考仅第三题*/
/*散点图探索各自变量与因变量的关系*/
proc gplot data=ex3;
plot n2*farm;
proc gplot data=ex3;
plot n2*forest;
proc gplot data=ex3;
plot n2*house;
proc gplot data=ex3;
plot n2*business;
run;
/*残差正态性检验*/
proc reg data=ex3;
model n2=farm forest house business;
output out=res3 r=r;
run;
proc univariate data=res3  normal;
var r;
run; 
/*方差齐性检验*/
proc reg data=ex3;
model n2=farm forest house business;
plot student.*p./nomodel nostat;
run;
/*共线性，异常点、强影响点检验*/
proc reg data=ex3;
model n2=farm forest house business/r influence collin vif tol;
run;
/*稳健回归*/
proc robustreg data=ex3 method=mm;
model n2=farm forest  business/diagnostics leverage;
run;



/*2021-1-5*/
/*possion回归*/
/*例1*/
data sal;
input obs years salamanders;
ln_sal=log(salamanders+0.01);
cards;
1 12 3
2 12 4
3 32 8
4 20 6
5 20 10
6 27 5
7 23 4
8 19 7
9 23 2
10 26 8
11 21 6
12 3 0
13 8 2
14 35 6
15 2 1
16 19 5
17 8 1
18 25 5
19 33 4
20 35 10
;
proc print;
run;


 /* plot the raw data */

proc gplot data=sal;
   title2 'Plot of the raw data';
   plot salamanders*years;
run;

proc sgplot;
scatter  x=years y=salamanders;
run;
/*绘制对数变换后的 散点图*/
proc gplot data=sal;
   title3 'plot of the logarithmic data' ;
   plot ln_sal*years;
run;
/* Fit a Poisson model */
proc genmod data=sal;
model salamanders=years/dist=poisson link=log;
estimate 'years effect' years 1/exp;
output out=fit pred=fitmean l=lowerci u=upperci resraw=r;
run;

proc genmod data=sal;
   model salamanders = years / dist=poisson link=log;
   estimate 'year effect' years 1 /exp;
run;

/*例2*/

data cancer;
input city age group count pop; /* msp=1; dfw=2 */
rate=(count/pop)*100000;
ln=log(pop);
ln_rate=log(rate);
ln_age=log(age);
lnage_lnage=ln_age*ln_age;
cards;
1 20 1   1 172675
1 30 2  16 123065
1 40 3  30 96216
1 50 4  71 92051
1 60 5 102 72159
1 70 6 130 54722
1 80 7 133 32185
1 90 8  40 8328
2 20 1   4 181343
2 30 2  38 146207
2 40 3 119 121374
2 50 4 221 111353
2 60 5 259 83004
2 70 6 310 55932
2 80 7 226 29007
2 90 8  65 7538
;
proc print;
run;

 /* plot the raw data */
data msp;
set cancer;
if city=1;
run;

proc gplot data=msp;
   title2 'Plot of the raw data';
   plot rate*age;
   plot rate*group;
run;

proc plot data=msp;
   title2 'Plot of the raw data';
   plot rate*age=city;
run;

proc plot data=msp;
   plot ln_rate*age=city;
run;

proc genmod data=msp;  /* city=1 */
model count = age / dist=poisson link=log offset=ln;
estimate 'age'  age 1/exp;
output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;

proc genmod data=msp;  /* city=1 */
model count = age / dist=poisson link=log offset=ln;
estimate 'age'  age 10/exp;
output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;

proc genmod data=msp;  /* city=1 */
model count = group / dist=poisson link=log offset=ln;
estimate 'group'  group 1/exp;
output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;

proc genmod data=msp;
   title2 'Poisson Regression';
   model count = ln_age / dist=poisson link=log offset=ln;
      estimate 'log age'  ln_age 1/exp;
   output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;
/*下面三行的作用 是因为上面的那个模型太好了 反过来做散点图验证模型？*/
proc gplot data=fit;
plot rdev*fitmean;/*fit数据集中没有rdev这个变量*/
run;

/* Association of city with skin cancer */
proc genmod data=cancer;
   title2 'Association of city with the risk of skin cancer';
   class city;
   model count = city / dist=poisson link=log offset=ln dscale;
   estimate 'city'  city -1 1/exp;
   output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;

proc genmod data=cancer;
   class city;
   model count = city / dist=nb link=log offset=ln;
   estimate 'city'  city -1 1/exp;
run;

proc genmod data=cancer;
   model count = / dist=poisson link=log offset=ln;
run;

/* Account for overdispersion using Negative Binominal */

proc genmod data=cancer;
   title2 'Association of city with the risk of skin cancer';
   class city;
   model count = city / dist=NB link=log offset=ln;
   estimate 'city'  city 1 -1/exp;
   output out=fit  pred=fitmean l=lowerci u=upperci resraw=r;
run;

/* Account for overdispersion by introducing a dispersion parameter */
proc genmod data=cancer;
   title2 'Association of city with the risk of skin cancer';
   class city;
   model count = city / dist=Poisson link=log offset=ln dscale;
   estimate 'city'  city 1 -1/exp;
   output out=fit  pred=fitmean l=lowerci u=upperci resdev=rdev;
run;

/* Test for interaction ANCOVA model */

proc genmod data=cancer;
   title2 'Association of city with the risk of skin cancer';
   class city;
   model count = city age age*city/ dist=poisson link=log offset=ln;
run;


/*例3*/
data sample;
input subsector month PH FTE TLclaim MEDclaim Duration COMcost MEDcost;
logt=log(FTE);
cards; 
1	1	451680	240	250	102	1853	161427	67758
1	2	796638	424	173	76	1455	141842	34038
1	3	1403463	747	337	100	2045	189247	63260
1	4	913822	486	218	80	1734	164176	62523
1	5	964529	513	174	68	1331	110307	36175
1	6	937092	499	270	94	1776	143622	56722
1	7	756889	403	131	73	1384	123980	32306
1	8	893492	475	336	115	2404	204137	61936
1	9	1341613	714	399	125	3330	358785	160615
1	10	934670	497	101	73	 895	64931	26914
1	11	929361	495	162	81	1294	113236	47874
1	12	851355	453	253	65	1919	194996	69343
1	13	882702	470	227	94	1791	208473	46025
1	14	1072692	571	302	84	2126	187696	66846
1	15	1509328	803	453	105	2848	246719	105536
1	16	1006085	535	212	94	1513	142230	61676
1	17	1017907	542	235	81	1825	144744	68841
1	18	1022248	544	318	90	2375	212029	65386
1	19	786558	419	218	110	1346	113806	50797
1	20	1142127	608	198	95	1479	139398	43310
1	21	965588	514	218	79	1493	141989	55708
1	22	980660	522	272	91	2185	215056	67399
1	23	915420	487	199	92	1673	161594	47739
1	24	1088353	579	269	102	1956	164796	53082
1	25	927763	494	299	107	2091	193892	56008
1	26	1619300	862	261	100	2113	206561	46054
1	27	1070457	570	253	105	2144	192772	44405
1	28	1007604	536	149	62	1241	119544	23173
1	29	914916	487	250	83	2118	186941	35258
1	30	899113	478	193	103	1663	156009	30731
1	31	1587538	845	86	86	720	64773	17775
1	32	717820	382	28	20	217	17088	2780
2	1	72749	39	78	19	666	48748	15848
2	2	70183	37	9	5	55	4148	1047
2	3	127825	68	42	8	311	25451	11148
2	4	74986	40	41	11	254	20791	5744
2	5	73727	39	32	8	286	19374	8268
2	6	113356	60	75	14	514	40445	11530
2	7	160923	86	59	16	410	26653	8069
2	8	65180	35	23	6	222	13157	7321
2	9	103499	55	21	5	144	22453	3760
2	10	154297	82	4	8	24	2348	1518
2	12	225212	120	15	5	76	9105	1741
2	13	141064	75	11	7	49	2861	2022
2	14	128723	68	9	10	88	5927	3914
2	15	243721	130	13	13	93	6902	3343
2	16	157896	84	16	8	147	12144	4170
2	17	225937	120	37	9	258	19196	4520
2	18	161095	86	46	12	296	20125	7790
2	19	75929	40	42	5	283	36297	6262
2	20	243102	129	23	10	154	8370	3087
2	21	154405	82	32	5	239	16958	5104
2	22	68361	36	15	7	134	6773	2920
2	23	83645	45	27	10	115	10705	3690
2	24	177885	95	52	16	330	25221	9909
2	25	150543	80	32	15	254	26881	9834
2	26	284445	151	42	14	383	38532	4826
2	27	168603	90	27	7	266	19098	3690
2	28	88124	47	8	5	67	7707	2572
2	29	235815	125	36	9	348	39004	3558
2	30	158785	84	11	9	78	10289	3407
2	31	119701	64	8	5	74	3276	1164
2	32	68695	37	18	2	210	11929	1452
3	1	68216	36	70	27	627	52832	61448
3	2	156870	83	53	20	369	26758	6427
3	3	200234	107	126	20	1087	87904	32884
3	4	166444	89	84	19	756	57199	23684
3	5	149358	79	141	27	1281	98938	34518
3	6	144939	77	81	23	688	59524	9325
3	7	159832	85	153	26	1288	99081	25618
3	8	155573	83	127	35	989	70936	23004
3	9	226566	121	160	35	1312	115656	30849
3	10	148804	79	59	24	540	41454	14177
3	11	145020	77	113	19	1035	108858	32244
3	12	153318	82	163	25	1390	120385	49826
3	13	176635	94	228	29	1319	125162	42738
3	14	179653	96	109	24	853	62550	25628
3	15	266554	142	51	24	522	42277	13782
3	16	182114	97	175	35	1074	77238	18993
3	17	155218	83	105	22	842	72185	23212
3	18	92397	49	133	29	1082	80055	29838
3	19	177224	94	105	21	724	46079	18291
3	20	240447	128	111	22	621	39806	16283
3	21	159919	85	85	31	757	59795	20641
3	22	168472	90	79	27	568	43544	10969
3	23	171401	91	100	25	791	59849	26192
3	24	173256	92	97	20	979	81386	21804
3	25	157171	84	131	35	1190	114677	29682
3	26	299758	160	74	19	517	45480	10938
3	27	146361	78	66	17	511	47516	6745
3	28	171837	91	113	30	903	77166	17967
3	29	166690	89	92	17	791	63005	9927
3	30	152055	81	47	21	455	38272	6438
3	31	218984	117	46	28	397	28826	4935
3	32	88254	47	21	10	152	10565	166
;
run;

data sector1;
set sample;
if subsector=1;
run;

proc gplot data=sector1;
plot tlclaim*month=subsector;
symbol1 v=plus i=none;
run;

proc genmod data=sample;
  class subsector;
  model tlclaim = subsector / offset=logt link=log dist=poisson;
  estimate 'subsector' subsector 1 0 -1/exp;
  estimate 'subsector' subsector 0 1 -1/exp;
run;
/* Account for Overdispersion */
proc genmod data=sample;
  class subsector;
  model tlclaim = subsector / offset=logt link=log dist=poisson dscale;
  estimate 'subsector' subsector 1 0 -1/exp;
  estimate 'subsector' subsector 0 1 -1/exp;
run;
proc genmod data=sample;  /* Using NB */
  class subsector;
  model tlclaim = subsector / offset=logt link=log dist=NB;
  estimate 'subsector' subsector 1 0 -1/exp;
  estimate 'subsector' subsector 0 1 -1/exp;
run;
proc genmod data=sample;  /* Set k to a fixed value */
  class subsector;
  model tlclaim = subsector / offset=logt link=log dist=NB 
                              noscale scale=0.3411;
  estimate 'subsector' subsector 1 0 -1/exp;
  estimate 'subsector' subsector 0 1 -1/exp;
run;

/* Trend Analysis using Poisson regression model */
data a;
set sample;
if subsector=1;
run;

proc genmod data=a;
  model tlclaim = month / offset=logt link=log dist=poisson;
run;

/* GEE model for count data */   、/*下面两段有问题*/
/*经验协方差矩阵估计*/
proc genmod data=sample; 
   class id; 
   model tlclaim=subsector / d=poisson offset=ltime; 
   repeated subject=id /corrw covb type=exch; 
   run; 

/* Zero-inflated Poisson Regression */

proc genmod data=fish;
model count=child camper /dis=ZIP;
zeromodel persons/link=logit;
run;


/*例4*/
/* 某镍矿工人肺癌职业队列资料[金丕焕等，2003]，在观察总15221.75个
人年中有135名工人死于肺癌。为了解暴露剂量与肺癌死亡的关系，调查了
每个工人的首次雇佣年龄（分成4级）、工作年限（分成5级）和
暴露剂量（分成5级）3个变量，数据如下。试分析肺癌死亡的影响因素。 */

data lung;
input age year exposure death pyrs;
logt=log(pyrs);
datalines;
1 1 1 0 279.6
1 1 2 0 69.06
1 1 3 0 4.48
1 1 4 0 0.04
1 1 5 . .
1 2 1 0 505.16
1 2 2 0 209.36
1 2 3 0 62.69
1 2 4 1 17.61
1 2 5 0 2.77
1 3 1 1 502.44
1 3 2 1 202.06
1 3 3 1 87.88
1 3 4 0 30.00
1 3 5 0 10.00
1 4 1 3 524.06
1 4 2 4 135.76
1 4 3 0 63.60
1 4 4 0 18.73
1 4 5 0 10.00
1 5 1 1 289.39
1 5 2 0 94.5
1 5 3 1 49.94
1 5 4 0 7.22
1 5 5 0 4.00
2 1 1 2 671.09
2 1 2 0 375.75
2 1 3 1 60.17
2 1 4 0 0.44
2 1 5 0 0.41
2 2 1 2 936.97
2 2 2 7 685.79
2 2 3 4 266.71
2 2 4 1 102.39
2 2 5 0 52.36
2 3 1 12 957.80
2 3 2 9 675.55
2 3 3 5 283.55
2 3 4 3 118.33
2 3 5 3 59.67
2 4 1 3 641.48
2 4 2 6 402.31
2 4 3 3 148.02
2 4 4 3 71.91
2 4 5 1 18.06
2 5 1 3 262.14
2 5 2 0 171.56
2 5 3 1 74.00
2 5 4 1 18.69
2 5 5 0 9.71
3 1 1 0 382.02
3 1 2 1 323.43
3 1 3 1 25.52
3 1 4 0 1.75
3 1 5 . .
3 2 1 5 489.95
3 2 2 6 505.45
3 2 3 3 199.18
3 2 4 0 69.97
3 2 5 0 40.28
3 3 1 2 452.09
3 3 2 9 377.28
3 3 3 2 154.38
3 3 4 1 73.26
3 3 5 1 41.64
3 4 1 2 262.27
3 4 2 2 107.71
3 4 3 1 39.07
3 4 4 1 52.67
3 4 5 1 19.65
3 5 1 3 61.92
3 5 2 0 13.64
3 5 3 0 9.44
3 5 4 0 9.92
3 5 5 0 0.36
4 1 1 0 168.96
4 1 2 1 194.22
4 1 3 0 29.29
4 1 4 . .
4 1 5 . .
4 2 1 0 272.53 
4 2 2 2 225.52
4 2 3 1 115.62
4 2 4 1 9.24
4 2 5 . .
4 3 1 2 150.18
4 3 2 2 112.62
4 3 3 1 40.62
4 3 4 . .
4 3 5 . .
4 4 1 1 19.83
4 4 2 0 23.49
4 4 3 0 2.89
4 4 4 . .
4 4 5 . .
4 5 1 . .
4 5 2 . .
4 5 3 . .
4 5 4 . .
4 5 5 . .
;
run;
proc genmod data=lung;
model death=age year exposure/ offset=logt dist=poisson link=log;
estimate 'exp' exposure 1/exp;
run;

proc genmod data=lung;
class age year exposure; 
model death=age year exposure/ offset=logt dist=poisson link=log;
output out=fit  pred=fitmean l=lowerci u=upperci resraw=r; /* Identifying poorly fited observations */

estimate 'age' age -1 1 0 0/exp;
estimate 'age' age -1 0 1 0/exp;
estimate 'age' age -1 1 0 1/exp;

estimate 'year' year -1 1 0 0 0/exp;
estimate 'year' year -1 0 1 0 0/exp;
estimate 'year' year -1 0 0 1 0/exp;
estimate 'year' year -1 0 0 0 1/exp;

estimate 'exposure' exposure -1 1 0 0 0/exp;
estimate 'exposure' exposure -1 0 1 0 0/exp;
estimate 'exposure' exposure -1 0 0 1 0/exp;
estimate 'exposure' exposure -1 0 0 0 1/exp;
run;




/*一致性评价和分析*/
data example1;
input k gc;
cards;
1.22 0
1.10 0
2.50 0
1.66 0
0.42 0
2.14 0
2.24 0
1.20 0
1.12 0
0.96 0
1.60 0
2.54 0
1.12 0
1.16 0
1.70 0
0.86 0
1.72 0
1.24 0
0.86 0
0.30 0
3.28 1
2.34 1
2.28 1
1.22 1
3.84 1
4.94 1
1.86 1
2.10 1
1.90 1
1.26 1
2.04 1
2.74 1
1.34 1
1.06 1
5.10 1
1.84 1
1.72 1
4.32 1
3.48 1
0.84 1
;
ods graphics on;
proc logistic desc plots(only)=roc;
model gc=k/ctable pprob=.5;
roc 'ki'k;
run;
ods graphics off;
