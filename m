Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85910E006C2
	for <meta-ti@yoctoproject.org>; Mon,  3 Jun 2013 11:45:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r53Ij1q4008567
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 13:45:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r53Ij0fi030277
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 13:45:01 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 3 Jun 2013 13:45:00 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Meta-TI patches for OMAPL138
Thread-Index: Ac5bqxRdbDpYN1uMRUe74wCnCjAE9QEcJ6qwAAEH2aAAGmi2EA==
Date: Mon, 3 Jun 2013 18:44:59 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C492418@DFLE08.ent.ti.com>
References: <A4887BF146CD57468F700B415D2F470159EF7A@DBDE04.ent.ti.com>
In-Reply-To: <A4887BF146CD57468F700B415D2F470159EF7A@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Meta-TI patches for OMAPL138
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
X-List-Received-Date: Mon, 03 Jun 2013 18:45:02 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C492418DFLE08entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C492418DFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If you plan on adding support for an omapl138 soc/board then please do not =
make changes to am18x recipes and machine.  A new machine should be created=
 for this new machine.

I would take the conf/machine/am180x-evm.conf and duplicate it for your omp=
al138 board and make the necessary changes there.

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Vishwanathrao Badarkhe, Manish
Sent: Monday, June 03, 2013 1:02 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Meta-TI patches for OMAPL138

Hi
Please find attached patches for OMAPL138 recipe for release 03.22.00.04.
Please review these patches.
These patches are based on http://arago-project.org/git/?p=3Dmeta-ti.git;a=
=3Dsummary repository.

Thanks and Regards
Manish Badarkhe

--_000_8F29D6B095ED194EA1980491A5E029710C492418DFLE08entticom_
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	font-size:10.5pt;
	font-family:Consolas;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">If you plan on adding =
support for an omapl138 soc/board then please do not make changes to am18x =
recipes and machine. &nbsp;A new machine should be created for this new mac=
hine.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I would take the conf/=
machine/am180x-evm.conf and duplicate it for your ompal138 board and make t=
he necessary changes there.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Vishwanathrao Badarkhe, Manish<br>
<b>Sent:</b> Monday, June 03, 2013 1:02 AM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [meta-ti] Meta-TI patches for OMAPL138<o:p></o:p></span></p=
>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please find attached p=
atches for OMAPL138 recipe for release 03.22.00.04.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please review these pa=
tches.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">These patches are base=
d on </span>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dsummary">http:=
//arago-project.org/git/?p=3Dmeta-ti.git;a=3Dsummary</a>
<span style=3D"color:#1F497D">repository.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks and Regards<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Manish Badarkhe<o:p></=
o:p></span></p>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C492418DFLE08entticom_--
