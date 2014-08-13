Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B5B8E007C2; Tue, 12 Aug 2014 19:38:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 507F7E0079A
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 19:37:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7D2bsVJ008575;
	Tue, 12 Aug 2014 21:37:54 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7D2bs5A025185;
	Tue, 12 Aug 2014 21:37:54 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 12 Aug 2014 21:37:54 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"aymeric.dumaz@gmail.com" <aymeric.dumaz@gmail.com>
Thread-Topic: [meta-ti] [daisy/master][PATCH] recipes-qt: add a .bbappend
	for	qtbase
Thread-Index: AQHPtpIUPJoGMhh6V0+z+SS6W9hR65vN0gY9
Date: Wed, 13 Aug 2014 02:37:54 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7320BC154@DLEE08.ent.ti.com>
References: <1407891625-23383-1-git-send-email-aymeric.dumaz@gmail.com>
In-Reply-To: <1407891625-23383-1-git-send-email-aymeric.dumaz@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [daisy/master][PATCH] recipes-qt: add a .bbappend for	qtbase
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
X-List-Received-Date: Wed, 13 Aug 2014 02:38:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE7320BC154DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE7320BC154DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK. This does not belong in meta-ti. We have most of that already in meta-=
arago though.


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Aymeric Dumaz [aymeric.dumaz@gmail.com]
Received: Tuesday, 12 Aug 2014, 21:01
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] [daisy/master][PATCH] recipes-qt: add a .bbappend for qt=
base

This bbappend is inspired from the meta-fsl-arm one [1].
It is made to build qtbase with ligles-omap3 libraries and integrate more
plugins, like tslib.

It has only been tested on AM335x EVM-SK, hence the _ti33x overrides; the
QMAKE_LIBS flags come from [2] and [3].

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/qt5-layer/r=
ecipes-qt/qt5/
[2] https://github.com/prabindh/sgxconfiguro/tree/master/pkgconfig/5.xx
[3] https://github.com/prabindh/qt-configs/tree/master/qt5_1_1_Sep13

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 recipes-qt/qt5/qtbase_%.bbappend | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase_%.bbappend

diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bba=
ppend
new file mode 100644
index 0000000..eaa4a6b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -0,0 +1,15 @@
+PACKAGECONFIG_GL_ti33x =3D "gles2"
+PACKAGECONFIG_append_ti33x =3D " tslib icu examples"
+
+do_configure_prepend_ti33x() {
+    sed -i 's!load(qt_config)!!' ${S}/mkspecs/linux-oe-g++/qmake.conf
+
+    cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
+
+QMAKE_LIBS_EGL         +=3D -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGe=
gl
+QMAKE_LIBS_OPENGL_ES2  +=3D -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGe=
gl
+
+load(qt_config)
+
+EOF
+}
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE7320BC154DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">NAK. This does not belong in meta-ti. We have most of that=
 already in meta-arago though.<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Aymeric Dumaz [aymeric.dumaz@gmail.com]<br>
<b>Received:</b> Tuesday, 12 Aug 2014, 21:01<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [daisy/master][PATCH] recipes-qt: add a .bbappend=
 for qtbase<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">This bbappend is inspired from the meta-fsl-arm on=
e [1].<br>
It is made to build qtbase with ligles-omap3 libraries and integrate more<b=
r>
plugins, like tslib.<br>
<br>
It has only been tested on AM335x EVM-SK, hence the _ti33x overrides; the<b=
r>
QMAKE_LIBS flags come from [2] and [3].<br>
<br>
[1] <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/=
qt5-layer/recipes-qt/qt5/">
http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/qt5-layer/recip=
es-qt/qt5/</a><br>
[2] <a href=3D"https://github.com/prabindh/sgxconfiguro/tree/master/pkgconf=
ig/5.xx">
https://github.com/prabindh/sgxconfiguro/tree/master/pkgconfig/5.xx</a><br>
[3] <a href=3D"https://github.com/prabindh/qt-configs/tree/master/qt5_1_1_S=
ep13">https://github.com/prabindh/qt-configs/tree/master/qt5_1_1_Sep13</a><=
br>
<br>
Signed-off-by: Aymeric Dumaz &lt;aymeric.dumaz@gmail.com&gt;<br>
---<br>
&nbsp;recipes-qt/qt5/qtbase_%.bbappend | 15 &#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 15 insertions(&#43;)<br>
&nbsp;create mode 100644 recipes-qt/qt5/qtbase_%.bbappend<br>
<br>
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bba=
ppend<br>
new file mode 100644<br>
index 0000000..eaa4a6b<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-qt/qt5/qtbase_%.bbappend<br>
@@ -0,0 &#43;1,15 @@<br>
&#43;PACKAGECONFIG_GL_ti33x =3D &quot;gles2&quot;<br>
&#43;PACKAGECONFIG_append_ti33x =3D &quot; tslib icu examples&quot;<br>
&#43;<br>
&#43;do_configure_prepend_ti33x() {<br>
&#43;&nbsp;&nbsp;&nbsp; sed -i 's!load(qt_config)!!' ${S}/mkspecs/linux-oe-=
g&#43;&#43;/qmake.conf<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; cat &gt;&gt; ${S}/mkspecs/linux-oe-g&#43;&#43;/qmak=
e.conf &lt;&lt;EOF<br>
&#43;<br>
&#43;QMAKE_LIBS_EGL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#43;=
=3D -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl<br>
&#43;QMAKE_LIBS_OPENGL_ES2&nbsp; &#43;=3D -lGLESv2 -lGLES_CM -lsrv_um -lusc=
 -lEGL -lIMGegl<br>
&#43;<br>
&#43;load(qt_config)<br>
&#43;<br>
&#43;EOF<br>
&#43;}<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE7320BC154DLEE08entticom_--
