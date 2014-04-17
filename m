Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 775BCE00C1B
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 11:01:55 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3HI1o4E003575;
	Thu, 17 Apr 2014 13:01:51 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3HI1lrp004720;
	Thu, 17 Apr 2014 23:31:49 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0174.001; Thu, 17 Apr 2014 23:31:47 +0530
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Thread-Topic: [meta-ti] AM3359 with OpenVG libraries
Thread-Index: AQHPWiwFCACfxhYR602Tw231tLPjZJsVzCww//+s+gCAAGP0AP//1n6AgABcmWD//6lNAAALoKDg
Date: Thu, 17 Apr 2014 18:01:46 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473ED0403D@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
	<CAMCfZKF-nRvJm_Yjn5yGisEcySShKQ-D8mRb2ofYZ41S_J3Hkw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03DD6@DBDE04.ent.ti.com>
	<CAMCfZKFz7Twh7o-3zCfbF9dQyJum7LfL+YY-K+3A4F5AwjuTSA@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03FDE@DBDE04.ent.ti.com>
	<CAMCfZKHhQbH1_a=gWQ=8OSgaxssopQVO6mzKOtjGktjE-R8jiA@mail.gmail.com>
In-Reply-To: <CAMCfZKHhQbH1_a=gWQ=8OSgaxssopQVO6mzKOtjGktjE-R8jiA@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 18:01:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473ED0403DDBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473ED0403DDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Diego,

The paint engine finds it easier to translate Qt (2D) draw calls to equival=
ent VG calls. In real-world HW implementations,  this does not translate to=
 better performance. Also, I recall this backend was supported only in Symb=
ian or similar, and not Linux.

regards,
Prabu

From: Diego Sueiro [mailto:diego.sueiro@gmail.com]
Sent: Thursday, April 17, 2014 12:47 PM
To: Sundareson, Prabindh
Cc: meta-ti mailing list
Subject: Re: [meta-ti] AM3359 with OpenVG libraries

Prabu,

On Thu, Apr 17, 2014 at 2:34 PM, Sundareson, Prabindh <prabu@ti.com<mailto:=
prabu@ti.com>> wrote:
Do you have some pointers to why regular Qt widgets are only accelerated by=
 VG and not with GL ?

At http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html:
Using OpenGL ES with Qt
To use OpenGL-enabled widgets in a Qt for Embedded application, all that is=
 required is to subclass QGLWidget and draw into instances of the subclass =
with standard OpenGL functions. The current implementation only supports Op=
enGL ES and 2D painting within a QGLWidget. Using OpenGL ES to accelerate r=
egular widgets as well as compositing top-level windows with OpenGL ES are =
not currently supported. These issues will be addressed in future versions =
of Qt.
Note: The OpenGL paint engine is not currently supported in regular widgets=
. However, any application that uses QGraphicsView can set a QGLWidget as t=
he viewport and obtain access to the OpenGL paint engine that way:


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

--_000_321768C95D21724485BCE784F1BE98473ED0403DDBDE04entticom_
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello Diego,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">The paint engine finds it=
 easier to translate Qt (2D) draw calls to equivalent VG calls. In real-wor=
ld HW implementations, &nbsp;this does not translate to better
 performance. Also, I recall this backend was supported only in Symbian or =
similar, and not Linux.<o:p></o:p></span></p>
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
<b>Sent:</b> Thursday, April 17, 2014 12:47 PM<br>
<b>To:</b> Sundareson, Prabindh<br>
<b>Cc:</b> meta-ti mailing list<br>
<b>Subject:</b> Re: [meta-ti] AM3359 with OpenVG libraries<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Prabu,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Thu, Apr 17, 2014 at 2:34 PM, Sundareson, Prabind=
h &lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt=
; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">Do you have some pointers to why regular Qt widgets =
are only accelerated by VG and not with GL ?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">At&nbsp;<a href=3D"http://qt-project.org/doc/qt-4.8/=
qt-embeddedlinux-opengl.html">http://qt-project.org/doc/qt-4.8/qt-embeddedl=
inux-opengl.html</a>:<o:p></o:p></p>
</div>
<div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Using OpenGL ES with Qt<br>
To use OpenGL-enabled widgets in a Qt for Embedded application, all that is=
 required is to subclass QGLWidget and draw into instances of the subclass =
with standard OpenGL functions. The current implementation only supports Op=
enGL ES and 2D painting within a
 QGLWidget. Using OpenGL ES to accelerate regular widgets as well as compos=
iting top-level windows with OpenGL ES are not currently supported. These i=
ssues will be addressed in future versions of Qt.<br>
Note: The OpenGL paint engine is not currently supported in regular widgets=
. However, any application that uses QGraphicsView can set a QGLWidget as t=
he viewport and obtain access to the OpenGL paint engine that way:<o:p></o:=
p></p>
</blockquote>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
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
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473ED0403DDBDE04entticom_--
