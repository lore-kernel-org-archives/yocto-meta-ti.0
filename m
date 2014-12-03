Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8101E008DC; Wed,  3 Dec 2014 08:32:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B372E00874
	for <meta-ti@yoctoproject.org>; Wed,  3 Dec 2014 08:32:38 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB3GWbVh013715
	for <meta-ti@yoctoproject.org>; Wed, 3 Dec 2014 10:32:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB3GWbgu002877
	for <meta-ti@yoctoproject.org>; Wed, 3 Dec 2014 10:32:37 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Dec 2014 10:32:37 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: ipumm-fw fetch failures
Thread-Index: AdAPDl5vzZdct28PTPubcHeBX0NQTAAAmV1PAAF8BfA=
Date: Wed, 3 Dec 2014 16:32:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7A5110@DFLE08.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C7A5043@DFLE08.ent.ti.com>
	<24B88602B5904F49971CAF899152529B34B6F756@DBDE04.ent.ti.com>
In-Reply-To: <24B88602B5904F49971CAF899152529B34B6F756@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: ipumm-fw fetch failures
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
X-List-Received-Date: Wed, 03 Dec 2014 16:32:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C7A5110DFLE08entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C7A5110DFLE08entticom_
Content-Type: text/plain; charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

Resolved this offline thanks to Karthik. Proxy issue :)

From: R, Karthik
Sent: Wednesday, December 03, 2014 9:50 AM
To: Cooper Jr., Franklin; meta-ti@yoctoproject.org
Subject: RE: ipumm-fw fetch failures

Franklin,

I just checked the health of the GLSDK nightly builds for the past week and=
 I didn't see any failures. They are fetching from the same location for th=
e Dora config.

One question, is this is your first time in building this or this is a new =
failure? Can you please do "env | grep proxy" and send me the output? Could=
 be a proxy issue as well.

Regards
Karthik
________________________________
From: Cooper Jr., Franklin<mailto:fcooper@ti.com>
Sent: =FD12/=FD3/=FD2014 9:07 PM
To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
Cc: R, Karthik<mailto:karthik.ramanan@ti.com>
Subject: ipumm-fw fetch failures
Karthik,

Has something changed with the download location for ipumm (v3.00.06.00) fo=
r dra7xx-evm?

I am seeing fetch errors when I try to build the recipe. When I use curl to=
 fetch the tarball I instead get a html page that says =93The document has =
moved here=94. That link points to https://www.ti.com/general/docs/licreg/a=
nonymousproddownload.tsp?downloadPage=3Dtrue&location=3Dhttp://downloads.ti=
.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-dra7xx-evm-3.=
00.06.00.tar.gz which curl ends up getting an html file that says =93Couldn=
=92t find the page your looking for=94.

Now if you go to the original file link in the recipe via a browser then I=
=92m able to download the file without a problem. I=92m guessing there are =
a bunch of redirects that the browser understands but curl/bitbake can=92t.

Anyway do you have an updated location that can be used to fix this issue?


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C7A5110DFLE08entticom_
Content-Type: text/html; charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
255">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.emailstyle17
	{mso-style-name:emailstyle17;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.htmlpreformattedchar0
	{mso-style-name:htmlpreformattedchar;
	font-family:"Courier New";}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Resolved this offline =
thanks to Karthik. Proxy issue
</span><span style=3D"font-family:Wingdings;color:#1F497D">J</span><span st=
yle=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> R, Karth=
ik
<br>
<b>Sent:</b> Wednesday, December 03, 2014 9:50 AM<br>
<b>To:</b> Cooper Jr., Franklin; meta-ti@yoctoproject.org<br>
<b>Subject:</b> RE: ipumm-fw fetch failures<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Franklin,<br>
<br>
I just checked the health of the GLSDK nightly builds for the past week and=
 I didn't see any failures. They are fetching from the same location for th=
e Dora config.<br>
<br>
One question, is this is your first time in building this or this is a new =
failure? Can you please do &quot;env | grep proxy&quot; and send me the out=
put? Could be a proxy issue as well.<br>
<br>
Regards<br>
Karthik<o:p></o:p></p>
</div>
</div>
<div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;se=
rif&quot;">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b>From: </b><a href=
=3D"mailto:fcooper@ti.com">Cooper Jr., Franklin</a><span style=3D"font-size=
:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><br>
</span><b>Sent: </b>=FD12/=FD3/=FD2014 9:07 PM<span style=3D"font-size:12.0=
pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><br>
</span><b>To: </b><a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yocto=
project.org</a><span style=3D"font-size:12.0pt;font-family:&quot;Times New =
Roman&quot;,&quot;serif&quot;"><br>
</span><b>Cc: </b><a href=3D"mailto:karthik.ramanan@ti.com">R, Karthik</a><=
span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quo=
t;serif&quot;"><br>
</span><b>Subject: </b>ipumm-fw fetch failures<span style=3D"font-size:12.0=
pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></=
span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Karthik,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Has something changed with the download location for=
 ipumm (v3.00.06.00) for dra7xx-evm?
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I am seeing fetch errors when I try to build the rec=
ipe. When I use curl to fetch the tarball I instead get a html page that sa=
ys =93The document has moved here=94. That link points to
<a href=3D"https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp=
?downloadPage=3Dtrue&amp;location=3Dhttp://downloads.ti.com/dsps/dsps_publi=
c_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-dra7xx-evm-3.00.06.00.tar.gz">
https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp?downloadPa=
ge=3Dtrue&amp;location=3Dhttp://downloads.ti.com/dsps/dsps_public_sw/glsdk/=
ipumm/3_00_06_00/exports/ipumm-dra7xx-evm-3.00.06.00.tar.gz</a> which curl =
ends up getting an html file that says =93Couldn=92t
 find the page your looking for=94.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Now if you go to the original file link in the recip=
e via a browser then I=92m able to download the file without a problem. I=
=92m guessing there are a bunch of redirects that the browser understands b=
ut curl/bitbake can=92t.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Anyway do you have an updated location that can be u=
sed to fix this issue?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C7A5110DFLE08entticom_--
