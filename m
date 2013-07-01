Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1E47E014A1
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:27:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61DR8Sr015854
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:27:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61DR8tO018787
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:27:08 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 08:27:08 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Hingolikar,
	Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHOdlb+mZ5kLazkF0e1zfpK0kGDpplP0LDo
Date: Mon, 1 Jul 2013 13:27:08 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E828F48@DLEE08.ent.ti.com>
References: <20130701123155.GA16127@ti.com>
In-Reply-To: <20130701123155.GA16127@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Mon, 01 Jul 2013 13:27:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E828F48DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E828F48DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any chance to unify on a recipe name?


Denys


-----Original Message-----
From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
Received: Monday, 01 Jul 2013, 8:32
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace libraries =
for graphics acceleration

* These libraries are not distributable in source and hence
  are available only as binary. They implement OpenGLES 1.x and
  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
  class of devices.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24 ++++++++++++++++=
++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.1=
0.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/=
recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..d3a847d
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "Userspace libraries for sgx"
+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE =3D "TI"
+DEPENDS =3D ""
+
+SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcont=
ent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-${PV}.tar.gz;pr=
otocol=3Dhttp"
+
+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3Dd280df8e94bb2e7b9251c8526078eeb8"
+
+PR =3D "r1"
+
+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
+
+S =3D "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=3D${D}
+}
+
+PACKAGES =3D+ "${PN}-${PV}"
+
+FILES_${PN} =3D  "${bindir}/*"
+FILES_${PN} +=3D " ${libdir}/*"
+FILES_${PN} +=3D  "${includedir}/*"
--
1.7.0.4

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E828F48DLEE08entticom_
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
pt; color:black">Any chance to unify on a recipe name?<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Hingolikar, Mrinmayee [mrinmayee@ti.com]<br>
<b>Received:</b> Monday, 01 Jul 2013, 8:32<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace lib=
raries for graphics acceleration<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">* These libraries are not distributable in source =
and hence<br>
&nbsp; are available only as binary. They implement OpenGLES 1.x and<br>
&nbsp; OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5<br>
&nbsp; class of devices.<br>
<br>
Signed-off-by: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;<br>
Signed-off-by: Siddharth Heroor &lt;heroor@ti.com&gt;<br>
---<br>
&nbsp;.../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 24 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 files changed, 24 insertions(&#43;), 0 deletions(-)<br>
&nbsp;create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.=
9.0.10.bb<br>
<br>
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/=
recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb<br>
new file mode 100644<br>
index 0000000..d3a847d<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.=
bb<br>
@@ -0,0 &#43;1,24 @@<br>
&#43;DESCRIPTION =3D &quot;Userspace libraries for sgx&quot;<br>
&#43;HOMEPAGE =3D &quot;<a href=3D"http://downloads.ti.com/dsps/dsps_public=
_sw/gfxsdk">http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk</a>&quot;<br=
>
&#43;LICENSE =3D &quot;TI&quot;<br>
&#43;DEPENDS =3D &quot;&quot;<br>
&#43;<br>
&#43;SRC_URI =3D &quot;<a href=3D"http://downloads.ti.com/dsps/dsps_public_=
sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-l=
inux-${PV}.tar.gz;protocol=3Dhttp">http://downloads.ti.com/dsps/dsps_public=
_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-=
linux-${PV}.tar.gz;protocol=3Dhttp</a>&quot;<br>
&#43;<br>
&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://OMAP5-Linux-Graphics-DDK-=
UM-Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8">file://OMAP5-Linux-=
Graphics-DDK-UM-Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8</a>&quo=
t;<br>
&#43;<br>
&#43;PR =3D &quot;r1&quot; <br>
&#43;<br>
&#43;SRC_URI[md5sum] =3D &quot;3cfb875de031098a4c1eeeaf4e442367&quot;<br>
&#43;<br>
&#43;S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br>
&#43;<br>
&#43;do_install () {<br>
&#43;&nbsp;&nbsp;&nbsp; oe_runmake install DESTDIR=3D${D}<br>
&#43;}<br>
&#43;<br>
&#43;PACKAGES =3D&#43; &quot;${PN}-${PV}&quot;<br>
&#43;<br>
&#43;FILES_${PN} =3D&nbsp; &quot;${bindir}/*&quot;<br>
&#43;FILES_${PN} &#43;=3D &quot; ${libdir}/*&quot;<br>
&#43;FILES_${PN} &#43;=3D&nbsp; &quot;${includedir}/*&quot;<br>
-- <br>
1.7.0.4<br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E828F48DLEE08entticom_--
