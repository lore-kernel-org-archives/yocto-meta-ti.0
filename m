Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD78BE006CB
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 06:50:25 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JDoP3s009578
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 08:50:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JDoNY5028260
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 08:50:25 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 08:50:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: Lastest Patches
Thread-Index: Ac4kqLM5prSbVCTZQRm7OlVfP/VQ2Q==
Date: Tue, 19 Mar 2013 13:50:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EA216@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Lastest Patches
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
X-List-Received-Date: Tue, 19 Mar 2013 13:50:26 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C3EA216DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C3EA216DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am not in favor for some of these new namespace changes for legacy recipe=
s. There are a lot of history behind those recipes names (arago-classic) in=
cluding the PSP version. Old documentation also refer to that PSP release h=
ttp://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_Release_Note=
s

Ex
u-boot-am180x: modify am180x specific version to use new namespace feature

--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb

+++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb


I don't have a problem with adding the machine name to the recipe especiall=
y if COMPATIBLE_MACHINE is set for only one machine.

Also changing the ti33x PREFERRED_PROVIDER to a kernel that is still being =
developed (not released) is another problem.

Ex:

ti33x: switch default preference to ti-staging tree

PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C3EA216DFLE09entticom_
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
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal">I am not in favor for some of these new namespace ch=
anges for legacy recipes. There are a lot of history behind those recipes n=
ames (arago-classic) including the PSP version. Old documentation also refe=
r to that PSP release http://processors.wiki.ti.com/index.php/DaVinci_PSP_0=
3.21.00.04_Release_Notes<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
Ex<o:p></o:p></p>
<p class=3D"MsoNormal">u-boot-am180x: modify am180x specific version to use=
 new namespace feature<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.=
00.04.sdk.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/recipes-bsp/u-boot/u-boot-am180=
x_2010.12.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I don&#8217;t have a problem with adding the machine=
 name to the recipe especially if COMPATIBLE_MACHINE is set for only one ma=
chine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also changing the ti33x PREFERRED_PROVIDER to a kern=
el that is still being developed (not released) is another problem.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><br>
Ex:<o:p></o:p></p>
<p class=3D"MsoPlainText">ti33x: switch default preference to ti-staging tr=
ee<o:p></o:p></p>
<p class=3D"MsoPlainText">PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux=
-ti-staging&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C3EA216DFLE09entticom_--
