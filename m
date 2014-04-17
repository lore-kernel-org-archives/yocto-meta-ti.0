Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 213F5E00BA3
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 06:36:57 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3HDasPj006662;
	Thu, 17 Apr 2014 08:36:55 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3HDaqk1022977;
	Thu, 17 Apr 2014 19:06:53 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Thu, 17 Apr 2014 19:06:52 +0530
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>, meta-ti mailing list
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] AM3359 with OpenVG libraries
Thread-Index: AQHPWiwFCACfxhYR602Tw231tLPjZJsVzCww
Date: Thu, 17 Apr 2014 13:36:51 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
In-Reply-To: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: AM3359 with OpenVG libraries
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
X-List-Received-Date: Thu, 17 Apr 2014 13:36:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473ED03D2EDBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473ED03D2EDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You should really be looking at OpenGLES2 for Qt4 (and Qt5) 2D Hardware acc=
eleration from an acceleration roadmap perspective - Ex this http://qt-proj=
ect.org/doc/qt-4.8/qt-embeddedlinux-opengl.html.

Qt5 and other frameworks do not support VG backend as the scene-graph is co=
mpletely based on OpenGLES2.0.

regards,
Prabu
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Diego Sueiro
Sent: Thursday, April 17, 2014 5:58 AM
To: meta-ti mailing list
Subject: [meta-ti] AM3359 with OpenVG libraries

Folks,

Looking at this commit:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recipes-graphics/l=
ibgles?id=3D91b307e78a98033f49a77a9664d89462e33030a3

It says that OpenVG is no longer supported by SGX Graphics SDK.
What is the reason for that?
What is the latest SGX SDK version in which supports OpenVG?

I want to use Qt embedded with 2D hardware graphics acceleration and accord=
ing to Qt embedded documentation<http://qt-project.org/doc/qt-4.8/qt-embedd=
edlinux-openvg.html> just need to use QPaintEngine to get regular widgets a=
ccelerated by the hardware.



Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

--_000_321768C95D21724485BCE784F1BE98473ED03D2EDBDE04entticom_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">You should really be look=
ing at OpenGLES2 for Qt4 (and Qt5) 2D Hardware acceleration from an acceler=
ation roadmap perspective &#8211; Ex this
<a href=3D"http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html">h=
ttp://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html</a>.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Qt5 and other frameworks =
do not support VG backend as the scene-graph is completely based on OpenGLE=
S2.0.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Prabu<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Diego Sueiro<br>
<b>Sent:</b> Thursday, April 17, 2014 5:58 AM<br>
<b>To:</b> meta-ti mailing list<br>
<b>Subject:</b> [meta-ti] AM3359 with OpenVG libraries<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Folks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Looking at this commit:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi=
/meta-ti/commit/recipes-graphics/libgles?id=3D91b307e78a98033f49a77a9664d89=
462e33030a3">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recip=
es-graphics/libgles?id=3D91b307e78a98033f49a77a9664d89462e33030a3</a><o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">It says that OpenVG is no longer supported by SGX Gr=
aphics SDK.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">What is the reason for that?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">What is the latest SGX SDK version in which supports=
 OpenVG?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I want to use Qt embedded with 2D hardware graphics =
acceleration and according to Qt embedded
<a href=3D"http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-openvg.html">d=
ocumentation</a>&nbsp;just need to use QPaintEngine to get regular widgets =
accelerated by the hardware.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<o:p></o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">--<br>
*dS<br>
Diego Sueiro<br>
<br>
Administrador do Embarcados<br>
<a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;=
utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=
=3D"_blank">www.embarcados.com.br</a><br>
<br>
/*long live rock 'n roll*/<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473ED03D2EDBDE04entticom_--
