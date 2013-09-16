Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5831E014EA
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2013 01:30:42 -0700 (PDT)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VLUCg-0005CS-3o from Noor_Ahsan@mentor.com 
	for meta-ti@yoctoproject.org; Mon, 16 Sep 2013 01:30:42 -0700
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 16 Sep 2013 01:30:41 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Mon, 16 Sep 2013 09:30:40 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: build errors for beangleboard
Thread-Index: Ac6ytodc6aFynDzxR42NID7HebQ6Fg==
Date: Mon, 16 Sep 2013 08:30:39 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE507B25@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Sep 2013 08:30:41.0839 (UTC)
	FILETIME=[07B513F0:01CEB2B7]
Subject: build errors for beangleboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 08:30:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_365E1805BC95084CBE82381A0B869994DE507B25EUMBX01mgcmento_"

--_000_365E1805BC95084CBE82381A0B869994DE507B25EUMBX01mgcmento_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I was using meta-ti master branch with master branch of Yocto. While buildi=
ng beagleboard I faced following issue

ERROR: Nothing RPROVIDES 'u-boot-fw-utils' (but /home/noor/SB/master_extern=
al/meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb RDEPENDS on or otherwise re=
quires it)

Do we have its fix available on master?

Noor

Noor Ahsan | Engineering Manager Mentor Embedded Linux & Hypervisor
Mentor Embedded<http://www.mentor.com/embedded>(tm) |5-6-7-8th floors 105  =
B2 Gulberg III, Ali Tower
MM Alam Road, Lahore
P +92 42 36099196 | M +92 300 4448444
Nucleus<http://www.mentor.com/embedded-software/nucleus/>(r) | Linux<http:/=
/www.mentor.com/embedded-software/linux/>(r) | Android<http://www.mentor.co=
m/embedded-software/android/>(tm) | Services<http://www.mentor.com/embedded=
-software/services/> | UI<http://www.mentor.com/embedded-software/inflexion=
/> | Multi-OS<http://www.mentor.com/embedded-software/multicore-multi-os>

Android is a trademark of Google Inc. Use of this trademark is subject to G=
oogle Permissions.
Linux is the registered trademark of Linus Torvalds in the U.S. and other c=
ountries.



--_000_365E1805BC95084CBE82381A0B869994DE507B25EUMBX01mgcmento_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was using meta-ti master branch with master branch=
 of Yocto. While building beagleboard I faced following issue<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: Nothing RPROVIDES 'u-boot-fw-utils' (but /hom=
e/noor/SB/master_external/meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb RDEP=
ENDS on or otherwise requires it)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do we have its fix available on master?<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Noor<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt">Noor Ahsan</span=
></b><span style=3D"font-size:10.0pt">
<span style=3D"color:#595959">| Engineering Manager Mentor Embedded Linux &=
amp; Hypervisor</span><span style=3D"color:#7F7F7F"><o:p></o:p></span></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt"><a href=3D"http://w=
ww.mentor.com/embedded"><span style=3D"color:blue">Mentor Embedded</span></=
a>&#8482;
<span style=3D"color:#595959">|5-6-7-8<sup>th</sup> floors 105&nbsp; B2 Gul=
berg III, Ali Tower<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#595959">MM Al=
am Road, Lahore</span><span style=3D"font-size:10.0pt;color:#7F7F7F"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#595959">P &#4=
3;92 42 36099196 | M &#43;92 300 4448444<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt"><a href=3D"http://w=
ww.mentor.com/embedded-software/nucleus/"><span style=3D"color:blue">Nucleu=
s</span></a>&reg;<span style=3D"color:#76923C"> |
</span><a href=3D"http://www.mentor.com/embedded-software/linux/"><span sty=
le=3D"color:blue">Linux</span></a>&reg;<span style=3D"color:#76923C"> |
</span><a href=3D"http://www.mentor.com/embedded-software/android/"><span s=
tyle=3D"color:blue">Android</span></a>&#8482;<span style=3D"color:#76923C">=
 |
</span><a href=3D"http://www.mentor.com/embedded-software/services/"><span =
style=3D"color:blue">Services</span></a>
<span style=3D"color:#76923C">| </span><a href=3D"http://www.mentor.com/emb=
edded-software/inflexion/"><span style=3D"color:blue">UI</span></a>
<span style=3D"color:#76923C">| </span><a href=3D"http://www.mentor.com/emb=
edded-software/multicore-multi-os"><span style=3D"color:blue">Multi-OS</spa=
n></a><span style=3D"color:#76923C"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#1F497D"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#7F7F7F">Androi=
d is a trademark of Google Inc. Use of this trademark is subject to Google =
Permissions.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#7F7F7F">Linux =
is the registered trademark of Linus Torvalds in the U.S. and other countri=
es.</span><span style=3D"font-size:7.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_365E1805BC95084CBE82381A0B869994DE507B25EUMBX01mgcmento_--
