Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D159E006C2
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 07:17:43 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JEHgg9008991
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 09:17:42 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JEHgEa028814
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 09:17:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 09:17:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: Lastest Patches
Thread-Index: Ac4kqLM5prSbVCTZQRm7OlVfP/VQ2QAAWyqwAAAhHfA=
Date: Tue, 19 Mar 2013 14:17:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3EA290@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C3EA216@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594850C5@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594850C5@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Lastest Patches
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
X-List-Received-Date: Tue, 19 Mar 2013 14:17:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C3EA290DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C3EA290DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: Maupin, Chase
Sent: Tuesday, March 19, 2013 9:04 AM
To: Cooper Jr., Franklin; Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: RE: Lastest Patches



From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoproject.=
org> [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Cooper Jr., Fra=
nklin
Sent: Tuesday, March 19, 2013 8:50 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
Subject: [meta-ti] Lastest Patches

I am not in favor for some of these new namespace changes for legacy recipe=
s. There are a lot of history behind those recipes names (arago-classic) in=
cluding the PSP version. Old documentation also refer to that PSP release h=
ttp://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_Release_Note=
s

Ex
u-boot-am180x: modify am180x specific version to use new namespace feature

--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb

+++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb



[CEM] So is your opposition the removal of the PSP version?  Sounds like we=
 need an alignment on "release" recipe names.



FC: Correct. I believe we are aligned for future recipes based on the super=
 long email thread we recently had :). But I don't think those changes shou=
ld apply to these older recipes.

I don't have a problem with adding the machine name to the recipe especiall=
y if COMPATIBLE_MACHINE is set for only one machine.

Also changing the ti33x PREFERRED_PROVIDER to a kernel that is still being =
developed (not released) is another problem.

Ex:

ti33x: switch default preference to ti-staging tree

PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"



[CEM] As Denys pointed out the arago.conf sets this to the old recipe for n=
ow while using an Arago distribution.  Making the default point to the kern=
el being developed makes it easy for people to work with that kernel and pr=
ovide feedback.  Is you issue that they may not set their build to use the =
older kernel (i.e. not using Arago distro) and encounter issues?



FC: So I did notice that Denys didn't make similar changes in meta-arago so=
 for Arago distributions users nothing has changed. While meta-ti users wer=
en't using our official kernel in the first place. So to answer your questi=
on yes. But it doesn't affect me so I was just pointing it out for others.


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C3EA290DFLE09entticom_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Maupin, =
Chase
<br>
<b>Sent:</b> Tuesday, March 19, 2013 9:04 AM<br>
<b>To:</b> Cooper Jr., Franklin; Dmytriyenko, Denys<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> RE: Lastest Patches<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-bounces@yoctopr=
oject.org</a> [<a href=3D"mailto:meta-ti-bounces@yoctoproject.org">mailto:m=
eta-ti-bounces@yoctoproject.org</a>]
<b>On Behalf Of </b>Cooper Jr., Franklin<br>
<b>Sent:</b> Tuesday, March 19, 2013 8:50 AM<br>
<b>To:</b> Dmytriyenko, Denys<br>
<b>Cc:</b> <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject=
.org</a><br>
<b>Subject:</b> [meta-ti] Lastest Patches<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am not in favor for some of these new namespace ch=
anges for legacy recipes. There are a lot of history behind those recipes n=
ames (arago-classic) including the PSP version. Old documentation also refe=
r to that PSP release
<a href=3D"http://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_=
Release_Notes">
http://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_Release_Not=
es</a><o:p></o:p></p>
<p class=3D"MsoNormal"><br>
Ex<o:p></o:p></p>
<p class=3D"MsoNormal">u-boot-am180x: modify am180x specific version to use=
 new namespace feature<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.=
00.04.sdk.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/recipes-bsp/u-boot/u-boot-am180=
x_2010.12.bb<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D">[CEM] So is your op=
position the removal of the PSP version?&nbsp; Sounds like we need an align=
ment on &#8220;release&#8221; recipe names.</span><span style=3D"color:#1F4=
97D"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D">FC: Correct. I beli=
eve we are aligned for future recipes based on the super long email thread =
we recently had
</span><span style=3D"font-family:Wingdings;color:#1F497D">J</span><span st=
yle=3D"color:#1F497D">. But I don&#8217;t think those changes should apply =
to these older recipes.<o:p></o:p></span></p>
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
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D">[CEM] As Denys poin=
ted out the arago.conf sets this to the old recipe for now while using an A=
rago distribution.&nbsp; Making the default point to the kernel being devel=
oped makes it easy for people to work with
 that kernel and provide feedback.&nbsp; Is you issue that they may not set=
 their build to use the older kernel (i.e. not using Arago distro) and enco=
unter issues?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#1F497D">FC: So I did notice=
 that Denys didn&#8217;t make similar changes in meta-arago so for Arago di=
stributions users nothing has changed. While meta-ti users weren&#8217;t us=
ing our official kernel in the first place. So to
 answer your question yes. But it doesn&#8217;t affect me so I was just poi=
nting it out for others.<o:p></o:p></span></p>
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
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C3EA290DFLE09entticom_--
