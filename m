Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4222DE0141B
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:34:10 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K4Y7oW031131;
	Wed, 19 Jun 2013 23:34:08 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K4Y47D002315;
	Wed, 19 Jun 2013 23:34:06 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 20 Jun 2013 12:34:04 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Thread-Topic: [meta-ti] meta-ti + meta-qt5
Thread-Index: AQHObVqT/YaZ9CP6NE+JbReVJZTnfJk92rPA//+C4ACAAIgUgP//kvWAgACKc+A=
Date: Thu, 20 Jun 2013 04:34:03 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
In-Reply-To: <CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 20 Jun 2013 04:34:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473EB53242DBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473EB53242DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The instructions build eglfs as well (without xcb), as in the below patch. =
Just that I cannot test it on platform due to the absence of GLES2 driver. =
 verbose flag in the qt configuration (qt5.inc) would help debug what is go=
ing wrong.

https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85=
d9c56410a

regards,
Prabu
From: Nicolas Dechesne [mailto:nicolas.dechesne@linaro.org]
Sent: Thursday, June 20, 2013 9:45 AM
To: Sundareson, Prabindh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] meta-ti + meta-qt5


On Wed, Jun 19, 2013 at 11:01 PM, Sundareson, Prabindh <prabu@ti.com<mailto=
:prabu@ti.com>> wrote:
Yocto builds:

http://gpupowered.org/node/20

Standalone builds:

http://gpupowered.org/node/21


yes, that's the blog posts, i had read. but that doesn't deal with eglfs.

i was trying to build qt5 with eglfs support using something like this:

+GL_DEPENDS =3D "virtual/libgles2 virtual/egl"
+QT_GLFLAGS =3D "-opengl es2 -eglfs"

since i don't have x11 support in my distro (on purpose), qt5base fails to =
configure properly since the EGL auto detect fails to build for that reason=
:

| EGL auto-detection... ()
| compiling /work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-gnueab=
i/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/egl.cp=
p
| In file included from /work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/=
usr/include/EGL/egl.h:36:0,
|                  from /work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-=
linux-gnueabi/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qp=
a/egl/egl.cpp:42:
| /work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/usr/include/EGL/eglpla=
tform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
| compilation terminated.
| make: *** [egl.o] Error 1
| EGL disabled.


have you started to look into enabling eglfs in the build?

nicolas







--_000_321768C95D21724485BCE784F1BE98473EB53242DBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">The instructions build eg=
lfs as well (without xcb), as in the below patch. Just that I cannot test i=
t on platform due to the absence of GLES2 driver. &nbsp;verbose
 flag in the qt configuration (qt5.inc) would help debug what is going wron=
g.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><a href=3D"https://github=
.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a">htt=
ps://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c=
56410a</a><o:p></o:p></span></p>
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
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Nicolas =
Dechesne [mailto:nicolas.dechesne@linaro.org]
<br>
<b>Sent:</b> Thursday, June 20, 2013 9:45 AM<br>
<b>To:</b> Sundareson, Prabindh<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] meta-ti &#43; meta-qt5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Wed, Jun 19, 2013 at 11:01 PM, Sundareson, Prabin=
dh &lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&g=
t; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Yocto builds:</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><a href=3D"http://gpupowered.org/node/2=
0" target=3D"_blank">http://gpupowered.org/node/20</a></span><o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Standalone builds:</span><o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><a href=3D"http://gpupowered.org/node/2=
1" target=3D"_blank">http://gpupowered.org/node/21</a></span><o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><br>
yes, that's the blog posts, i had read. but that doesn't deal with eglfs.&n=
bsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">i was trying to build qt5 with eglfs support using s=
omething like this:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">&#43;GL_DEPENDS =3D &quot;virtual/libgles2 virtual/e=
gl&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;QT_GLFLAGS =3D &quot;-opengl es2 -eglfs&quot;<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">since i don't have x11 support in my distro (on purp=
ose), qt5base fails to configure properly since the EGL auto detect fails t=
o build for that reason:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">| EGL auto-detection... ()<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| compiling /work/rdk/build-dylan-qemuarm/tmp/work/a=
rmv5te-rdk-linux-gnueabi/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/conf=
ig.tests/qpa/egl/egl.cpp<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| In file included from /work/rdk/build-dylan-qemuar=
m/tmp/sysroots/qemuarm/usr/include/EGL/egl.h:36:0,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;from /work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-g=
nueabi/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/e=
gl.cpp:42:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| /work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm=
/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such fil=
e or directory<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| compilation terminated.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| make: *** [egl.o] Error 1<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">| EGL disabled.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">have you started to look into enabling eglfs in the =
build?&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">nicolas<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473EB53242DBDE04entticom_--
