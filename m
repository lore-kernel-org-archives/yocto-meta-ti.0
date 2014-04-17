Return-Path: <prabu@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8819E00C1B
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 10:34:49 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3HHYk9X024932;
	Thu, 17 Apr 2014 12:34:47 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3HHYhCV003759;
	Thu, 17 Apr 2014 23:04:44 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0174.001; Thu, 17 Apr 2014 23:04:43 +0530
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Thread-Topic: [meta-ti] AM3359 with OpenVG libraries
Thread-Index: AQHPWiwFCACfxhYR602Tw231tLPjZJsVzCww//+s+gCAAGP0AP//1n6AgABcmWA=
Date: Thu, 17 Apr 2014 17:34:42 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473ED03FDE@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
	<CAMCfZKF-nRvJm_Yjn5yGisEcySShKQ-D8mRb2ofYZ41S_J3Hkw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03DD6@DBDE04.ent.ti.com>
	<CAMCfZKFz7Twh7o-3zCfbF9dQyJum7LfL+YY-K+3A4F5AwjuTSA@mail.gmail.com>
In-Reply-To: <CAMCfZKFz7Twh7o-3zCfbF9dQyJum7LfL+YY-K+3A4F5AwjuTSA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 17 Apr 2014 17:34:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473ED03FDEDBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473ED03FDEDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Diego,

Do you have some pointers to why regular Qt widgets are only accelerated by=
 VG and not with GL ?

>> regular widgets is only accelerate with VG.

Implementation of VG and GL have some conflicting requirements running on t=
he same platform, and it was decided to focus on GL.

>> Why OpenVG was removed on newer versions of SGK SDK?

regards,
Prabu

From: Diego Sueiro [mailto:diego.sueiro@gmail.com]
Sent: Thursday, April 17, 2014 12:26 PM
To: Sundareson, Prabindh
Cc: meta-ti mailing list
Subject: Re: [meta-ti] AM3359 with OpenVG libraries

Prabu,
On Thu, Apr 17, 2014 at 11:29 AM, Sundareson, Prabindh <prabu@ti.com<mailto=
:prabu@ti.com>> wrote:
The assumption of VG accelerating widgets better than GL, is questionable i=
n this context.

I did not mentioned that VG was better than GL. I just told that regular wi=
dgets is only accelerate with VG.
As soon as I'm using Qt 4.8 embedded, not Qt 5, I need a solution to get re=
gular widgets accelerated.

On Qt-4.8 embedded documentation it says that OpenVG is supported on embedd=
ed linux:
http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-openvg.html


And the question remains: Why OpenVG was removed on newer versions of SGK S=
DK?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

--_000_321768C95D21724485BCE784F1BE98473ED03FDEDBDE04entticom_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
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
/* List Definitions */
@list l0
	{mso-list-id:593976458;
	mso-list-type:hybrid;
	mso-list-template-ids:-2118492220 -256879412 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:2;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello Diego,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Do you have some pointers=
 to why regular Qt widgets are only accelerated by VG and not with GL ?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">&gt;&gt;
</span>regular widgets is only accelerate with VG.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Implementation of VG and =
GL have some conflicting requirements running on the same platform, and it =
was decided to focus on GL.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">&gt;&gt;
</span>Why OpenVG was removed on newer versions of SGK SDK?<span style=3D"f=
ont-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;colo=
r:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Prabu<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Diego Su=
eiro [mailto:diego.sueiro@gmail.com]
<br>
<b>Sent:</b> Thursday, April 17, 2014 12:26 PM<br>
<b>To:</b> Sundareson, Prabindh<br>
<b>Cc:</b> meta-ti mailing list<br>
<b>Subject:</b> Re: [meta-ti] AM3359 with OpenVG libraries<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Prabu,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">On Thu, Apr 17, 2014 at 11:29 AM, Sundareson, Prabin=
dh &lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&g=
t; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">The assumption of VG accelerating widgets better tha=
n GL, is questionable in this context.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">I did not mentioned that VG was better than GL. I ju=
st told that regular widgets is only accelerate with VG.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">As soon as I'm using Qt 4.8 embedded, not Qt 5, I ne=
ed a solution to get regular widgets accelerated.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">On Qt-4.8 embedded documentation it says that OpenVG=
 is supported on embedded linux:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"http://qt-project.org/doc/qt-4.8/qt-embed=
dedlinux-openvg.html">http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-ope=
nvg.html</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">And the question remains: Why OpenVG was removed on =
newer versions of SGK SDK?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
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
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473ED03FDEDBDE04entticom_--
