Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17E95E01400
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:09:49 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K29kjF007581;
	Wed, 19 Jun 2013 21:09:47 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K29hF6015376;
	Wed, 19 Jun 2013 21:09:44 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Thu, 20 Jun 2013 10:09:43 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] meta-ti + meta-qt5
Thread-Index: AQHObVqT/YaZ9CP6NE+JbReVJZTnfJk92rPA
Date: Thu, 20 Jun 2013 02:09:42 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
In-Reply-To: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 02:09:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473EB52D53DBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473EB52D53DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are you asking about the status in general (ie, outside of the yocto infras=
tructure) ? In general, eglfs,kms has been proven working for more than a y=
ear now.

Within meta-ti, eglfs should work if the display driver is available (fb or=
 drm). The only reason I stopped at "minimal" on Beaglebone was because the=
 "display" driver part was not integrated at that time on Beaglebone (in me=
ta-ti) and hence OpenGL ES driver couldn't be installed.

regards,
Prabindh

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Nicolas Dechesne
Sent: Thursday, June 20, 2013 7:34 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] meta-ti + meta-qt5

hi there,

not sure if this is the right place to ask... but since i am about to ask a=
bout QT5, OE and TI platforms, i am starting here!

so, i read a couple of blog posts about getting Qt5 on beaglebone, however =
it's not clear to me what's the latest status is. has anybody been able to =
use/enable OpenGLes either with KMS, or directfb or eglfs platform driver? =
The only thing i have seen are references to using the 'minimal' platform d=
river.

if so, can i get some pointers?

thanks!

nicolas

--_000_321768C95D21724485BCE784F1BE98473EB52D53DBDE04entticom_
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Are you asking about the =
status in general (ie, outside of the yocto infrastructure) ? In general, e=
glfs,kms has been proven working for more than a year now.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Within meta-ti, eglfs sho=
uld work if the display driver is available (fb or drm). The only reason I =
stopped at &#8220;minimal&#8221; on Beaglebone was because the &#8220;displ=
ay&#8221;
 driver part was not integrated at that time on Beaglebone (in meta-ti) and=
 hence OpenGL ES driver couldn&#8217;t be installed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Prabindh<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Nicolas Dechesne<br>
<b>Sent:</b> Thursday, June 20, 2013 7:34 AM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [meta-ti] meta-ti &#43; meta-qt5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">hi there,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">not sure if this is the right place to ask... but si=
nce i am about to ask about QT5, OE and TI platforms, i am starting here!<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">so, i read a couple of blog posts about getting Qt5 =
on beaglebone, however it's not clear to me what's the latest status is. ha=
s anybody been able to use/enable OpenGLes either with KMS, or directfb or =
eglfs platform driver? The only thing
 i have seen are references to using the 'minimal' platform driver.&nbsp;<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">if so, can i get some pointers?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">thanks!<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">nicolas<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473EB52D53DBDE04entticom_--
