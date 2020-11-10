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
上海市 310000
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
