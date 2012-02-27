Return-Path: <prvs=441890c384=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 768C1E0074A
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 00:26:22 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=441890c384=christian.schulenberg@bmw.de>)
	id 1S1vuW-0003Qi-8X
	for meta-ti@yoctoproject.org; Mon, 27 Feb 2012 09:26:20 +0100
Received: from [160.46.252.50] (helo=cmtamx4b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S1vuP-0003P6-4M
	for meta-ti@yoctoproject.org; Mon, 27 Feb 2012 09:26:18 +0100
Received: from cmtabb2a.muc (cmtabb2a.muc [160.50.100.13])
	by cmtamx4a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q1R8Q675004458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 09:26:06 +0100
Received: from SMUCH05A.europe.bmw.corp (smuch05a.muc [160.50.20.10])
	by cmtabb2a.muc (8.13.8/8.13.8) with ESMTP id q1R8Q1aL028293
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 09:26:04 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH05A.europe.bmw.corp ([160.50.20.10]) with mapi; Mon, 27 Feb 2012
	09:26:03 +0100
From: <Christian.Schulenberg@bmw.de>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Feb 2012 09:26:02 +0100
Thread-Topic: Building Yocto for Pandaboard
Thread-Index: Acz1KXDWdQkoPqBCRCqlNeykyp+DAQ==
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-2ebacf
X-purgate-sourceid: 1S1vuP-0003P6-4M
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330331179-00001854-0A261C53/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-2ebacf
Subject: Building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 08:26:23 -0000
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_EF446FF9DAC93B479C74AB9153DE173F0C0D32FFSMUCM08Veuropeb_"

--_000_EF446FF9DAC93B479C74AB9153DE173F0C0D32FFSMUCM08Veuropeb_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm quite new to the Yocto project, but Yocto seems so to solve a lot of my=
 problems. I'm happy to see, that there is also support from TI for the OMA=
P. I already managed to build a Beagleboard version and bring some custom a=
pplications onto it. For the next days, it's important for me to switch ove=
r to Pandaboard (A revisions with OMAP4430) because of it's improved HW and=
 the more powerful OMAP4.

As a starting point, I used the meta-ti layer. Doing so, I already got the =
first question, because there are two machines defined:

pandaboard and omap4430-panda

Which version is the most recent one? For my first steps I decided to go wi=
th the pandaboard configuration. I building core-image-base, because for my=
 tasks, this seems to be the most appropriate one.

I already added to following line to my local.conf:

BBMASK =3D ".*/meta-ti/recipes-misc/"

which helps to bypass the first build problem. The next show stopper is bui=
lding the boot loader (denx version of u-boot):

clocks.c:415:13: internal compiler error: in decode_addr_const, at varasm.c=
:2632

This seems to be a problem with the used version of gcc. I guess there are =
two ways to work around this: Use older version of gcc (4.5) or change comp=
iler optimization from -Os to -O0. Unfortunately, neither can I find the ri=
ght place to switch from gcc 4.6 to 4.5, nor the place to change compiler f=
lags. Could anyone please give me some advice, how to change the flags firs=
t, because this would be the preferred way from my point of view.

I removed the clock initialization from the file, to see how far I can get =
afterwards. In fact, another problem comes up with ofono (problems with fin=
ding python, I guess another versioning problem here). Beside the point, th=
at I don't understand why ofono is part of a base image, I can't find the r=
ight place to remove the ofono package from my image. Please, can someone g=
ive my some hint who to remove ofono? Using the hob is not a solution, beca=
use hob does not support removing packages, or did I miss something?

Please be patient when I'm asking some question, where the answers are obvi=
ous for you, but as I mentioned before, I'm new to Yocto and still learning=
 ;-) Maybe, there is someone on this mailing list, who already managed to b=
uild Yocto successfully for Panda and who can help me out of my problems or=
 give some further advice.

Thanks,
Christian


--_000_EF446FF9DAC93B479C74AB9153DE173F0C0D32FFSMUCM08Veuropeb_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Liberation Serif";}
@font-face
	{font-family:"\@Liberation Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	punctuation-wrap:simple;
	text-autospace:none;
	font-size:12.0pt;
	font-family:"Liberation Serif","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE link=3Dblue vlink=
=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US=
 style=3D'font-family:"Calibri","sans-serif"'>Hi,<o:p></o:p></span></p><p c=
lass=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","sans-se=
rif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US s=
tyle=3D'font-family:"Calibri","sans-serif"'>I'm quite new to the Yocto proj=
ect, but Yocto seems so to solve a lot of my problems. I&#8217;m happy to s=
ee, that there is also support from TI for the OMAP. I already managed to b=
uild a Beagleboard version and bring some custom applications onto it. For =
the next days, it&#8217;s important for me to switch over to Pandaboard (A =
revisions with OMAP4430) because of it's improved HW and the more powerful =
OMAP4. <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=
=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif=
"'>As a starting point, I used the meta-ti layer. Doing so, I already got t=
he first question, because there are two machines defined: <o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri=
","sans-serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US style=3D'font-family:"Calibri","sans-serif"'>pandaboard and omap44=
30-panda<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=
=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif=
"'>Which version is the most recent one? For my first steps I decided to go=
 with the pandaboard configuration. I building core-image-base, because for=
 my tasks, this seems to be the most appropriate one.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","san=
s-serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US style=3D'font-family:"Calibri","sans-serif"'>I already added to followin=
g line to my local.conf:<o:p></o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-US style=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Cali=
bri","sans-serif"'>BBMASK =3D &quot;.*/meta-ti/recipes-misc/&quot;<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"=
Calibri","sans-serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-US style=3D'font-family:"Calibri","sans-serif"'>which helps to=
 bypass the first build problem. The next show stopper is building the boot=
 loader (denx version of u-boot):<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp=
;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-fam=
ily:"Calibri","sans-serif"'>clocks.c:415:13: internal compiler error: in de=
code_addr_const, at varasm.c:2632<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp=
;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-fam=
ily:"Calibri","sans-serif"'>This seems to be a problem with the used versio=
n of gcc. I guess there are two ways to work around this: Use older version=
 of gcc (4.5) or change compiler optimization from -Os to -O0. Unfortunatel=
y, neither can I find the right place to switch from gcc 4.6 to 4.5, nor th=
e place to change compiler flags. Could anyone please give me some advice, =
how to change the flags first, because this would be the preferred way from=
 my point of view.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DE=
N-US style=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","=
sans-serif"'>I removed the clock initialization from the file, to see how f=
ar I can get afterwards. In fact, another problem comes up with ofono (prob=
lems with finding python, I guess another versioning problem here). Beside =
the point, that I don't understand why ofono is part of a base image, I can=
't find the right place to remove the ofono package from my image. Please, =
can someone give my some hint who to remove ofono? Using the hob is not a s=
olution, because hob does not support removing packages, or did I miss some=
thing?<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=
=3D'font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif=
"'>Please be patient when I'm asking some question, where the answers are o=
bvious for you, but as I mentioned before, I&#8217;m new to Yocto and still=
 learning ;-) Maybe, there is someone on this mailing list, who already man=
aged to build Yocto successfully for Panda and who can help me out of my pr=
oblems or give some further advice.<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-US style=3D'font-family:"Calibri","sans-serif"'><o:p>&nb=
sp;</o:p></span></p><p class=3DMsoNormal><span style=3D'font-family:"Calibr=
i","sans-serif"'>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span st=
yle=3D'font-family:"Calibri","sans-serif"'>Christian <o:p></o:p></span></p>=
<p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>=

--_000_EF446FF9DAC93B479C74AB9153DE173F0C0D32FFSMUCM08Veuropeb_--
