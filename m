Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2011E0175F
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 05:10:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9OCAVBt019461
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 07:10:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9OCAV9U012570
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 07:10:31 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 24 Oct 2013 07:10:31 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Hingolikar,
	Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-ti] [PATCHv4] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHO0HyQtgbaplfr3USot9pyO5plLZoDwxjk
Date: Thu, 24 Oct 2013 12:10:30 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E90691E@DLEE08.ent.ti.com>
References: <20131024054708.GA8184@ti.com>
In-Reply-To: <20131024054708.GA8184@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCHv4] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Thu, 24 Oct 2013 12:10:33 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E90691EDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E90691EDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

1. Patch changes usually should not go into the main description - separate=
 them with --- sign.
2. Do you need COMPATIBLE_MACHINE here for cortex-a15?


Denys


-----Original Message-----
From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
Received: Thursday, 24 Oct 2013, 6:47
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] [PATCHv4] libgles: Added prebuilt userspace libraries fo=
r graphics acceleration

These libraries are not distributable in source and hence
 are available only as binary. They implement OpenGLES 1.x and
 OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
 class of devices.

v2:

Addressed Chases's comments:
 * Updated the PR
 * Added shasum for the tarball
 * Removed redundant FILES section

v3:
 * Replaced shasum by sha256sum

v4:
 * Corrected license information to "TSPA"

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.1=
0.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/=
recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..5e21bd5
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Userspace libraries for sgx"
+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE =3D "TSPA"
+
+SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcont=
ent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=3Dhttp"
+
+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3Dd280df8e94bb2e7b9251c8526078eeb8"
+
+PR =3D "r0"
+
+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
+SRC_URI[sha256sum] =3D "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c7=
62fbc72f22489a"
+
+S =3D "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=3D${D}
+}
+
+FILES_${PN} +=3D "${libdir}/gbm/"
--
1.7.9.5

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E90691EDLEE08entticom_
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
pt; color:black">1. Patch changes usually should not go into the main descr=
iption - separate them with --- sign.<br>
2. Do you need COMPATIBLE_MACHINE here for cortex-a15?<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Hingolikar, Mrinmayee [mrinmayee@ti.com]<br>
<b>Received:</b> Thursday, 24 Oct 2013, 6:47<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [PATCHv4] libgles: Added prebuilt userspace libra=
ries for graphics acceleration<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">These libraries are not distributable in source an=
d hence<br>
&nbsp;are available only as binary. They implement OpenGLES 1.x and<br>
&nbsp;OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5<br>
&nbsp;class of devices.<br>
<br>
v2:<br>
<br>
Addressed Chases's comments:<br>
&nbsp;* Updated the PR<br>
&nbsp;* Added shasum for the tarball<br>
&nbsp;* Removed redundant FILES section<br>
<br>
v3:<br>
&nbsp;* Replaced shasum by sha256sum<br>
<br>
v4:<br>
&nbsp;* Corrected license information to &quot;TSPA&quot;<br>
<br>
Signed-off-by: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;<br>
---<br>
&nbsp;.../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 20 insertions(&#43;)<br>
&nbsp;create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.=
9.0.10.bb<br>
<br>
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/=
recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb<br>
new file mode 100644<br>
index 0000000..5e21bd5<br>
--- /dev/null<br>
&#43;&#43;&#43; b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.=
bb<br>
@@ -0,0 &#43;1,20 @@<br>
&#43;DESCRIPTION =3D &quot;Userspace libraries for sgx&quot;<br>
&#43;HOMEPAGE =3D &quot;<a href=3D"http://downloads.ti.com/dsps/dsps_public=
_sw/gfxsdk">http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk</a>&quot;<br=
>
&#43;LICENSE =3D &quot;TSPA&quot;<br>
&#43;<br>
&#43;SRC_URI =3D &quot;<a href=3D"http://downloads.ti.com/dsps/dsps_public_=
sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz=
;protocol=3Dhttp">http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=3Dhttp=
</a>&quot;<br>
&#43;<br>
&#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://OMAP5-Linux-Graphics-DDK-=
UM-Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8">file://OMAP5-Linux-=
Graphics-DDK-UM-Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8</a>&quo=
t;<br>
&#43;<br>
&#43;PR =3D &quot;r0&quot; <br>
&#43;<br>
&#43;SRC_URI[md5sum] =3D &quot;3cfb875de031098a4c1eeeaf4e442367&quot;<br>
&#43;SRC_URI[sha256sum] =3D &quot;20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa05=
3cf3488c762fbc72f22489a&quot;<br>
&#43;<br>
&#43;S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br>
&#43;<br>
&#43;do_install () {<br>
&#43;&nbsp;&nbsp;&nbsp; oe_runmake install DESTDIR=3D${D}<br>
&#43;}<br>
&#43;<br>
&#43;FILES_${PN} &#43;=3D &quot;${libdir}/gbm/&quot;<br>
-- <br>
1.7.9.5<br>
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

--_000_B0581B5571079145BA1CD78C126DBDE72E90691EDLEE08entticom_--
