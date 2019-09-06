Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B918E00E0D; Thu,  5 Sep 2019 22:03:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C701E00C4F
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 22:03:41 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8653ean012719
	for <meta-ti@yoctoproject.org>; Fri, 6 Sep 2019 00:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567746220;
	bh=VP5P+wvrrwlnVoH3Xaq2AMe89a3dDTGu0dP6nkvjwGM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EMza0DScN+QZkYG4wNNC0CzfnugdXi9O4Idtmk9yk3H5dWUnEtzD2teUZE6uupwd+
	Tcrp6pjLuXDoAEd4ndOrV39/c3lh4NFWNh1ru7YiZlnvPmx5iCrtI8jvSlHOuhRK4h
	TizNjXXXaOqM8pA6Yx6yzYZ4Eyol5wRSzZi8/exw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8653eG6098598
	for <meta-ti@yoctoproject.org>; Fri, 6 Sep 2019 00:03:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 00:03:40 -0500
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
	DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
	15.01.1713.004; Fri, 6 Sep 2019 00:03:40 -0500
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Davis, Andrew" <afd@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"Tammana, Gowtham" <g-tammana@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>
Thread-Topic: [meta-ti][thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop
	omap5-sgx-ddk-um-linux package
Thread-Index: AQHVZAhpQX471YMxv0GGm+ncZzaciaceGF6W
Date: Fri, 6 Sep 2019 05:03:40 +0000
Message-ID: <3636ba12ce614b7aaa514b36abd1de30@ti.com>
References: <20190905163847.18928-1-afd@ti.com>,
	<20190905163847.18928-4-afd@ti.com>
In-Reply-To: <20190905163847.18928-4-afd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.41]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop omap5-sgx-ddk-um-linux package
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
X-List-Received-Date: Fri, 06 Sep 2019 05:03:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3636ba12ce614b7aaa514b36abd1de30ticom_"

--_000_3636ba12ce614b7aaa514b36abd1de30ticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Andrew,


I remember some of the other recipes (eg kmscube, omapdrmtest) in meta-ti /=
 meta-arago that depended on omap5-sgx-ddk-um-linux.


We cleaned up some of those dependencies while adding J7. Not sure if all o=
f them have been covered. Have you confirmed?


Regards,

Anand

________________________________
From: Davis, Andrew
Sent: Thursday, September 5, 2019 10:08:46 PM
To: Dmytriyenko, Denys; Tammana, Gowtham; Balagopalakrishnan, Anand; Ruei, =
Eric
Cc: meta-ti@yoctoproject.org; Davis, Andrew
Subject: [meta-ti][thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop omap5-sgx-dd=
k-um-linux package

No one in-tree depends on this anymore. This used to be the name of the
package so this was kept here for several years for backwards
compatibility. Remove this from PROVIDES.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recip=
es-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 0695ca0a..53d2829e 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -23,22 +23,22 @@ INITSCRIPT_PARAMS =3D "defaults 8"

 inherit update-rc.d

-PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgb=
m omap5-sgx-ddk-um-linux"
+PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgb=
m"

 DEPENDS +=3D "libdrm udev wayland wayland-protocols libffi expat"
 RDEPENDS_${PN} +=3D "libdrm libdrm-omap udev wayland wayland-protocols lib=
ffi expat"

-RPROVIDES_${PN} =3D "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linu=
x"
-RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev o=
map5-sgx-ddk-um-linux-dev"
-RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg o=
map5-sgx-ddk-um-linux-dbg"
+RPROVIDES_${PN} =3D "libegl libgles1 libgles2 libgbm"
+RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RPROVIDES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

-RREPLACES_${PN} =3D "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linu=
x"
-RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev o=
map5-sgx-ddk-um-linux-dev"
-RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg o=
map5-sgx-ddk-um-linux-dbg"
+RREPLACES_${PN} =3D "libegl libgles1 libgles2 libgbm"
+RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RREPLACES_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

-RCONFLICTS_${PN} =3D "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-lin=
ux"
-RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev =
omap5-sgx-ddk-um-linux-dev"
-RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg =
omap5-sgx-ddk-um-linux-dbg"
+RCONFLICTS_${PN} =3D "libegl libgles1 libgles2 libgbm"
+RCONFLICTS_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RCONFLICTS_${PN}-dbg =3D "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"

 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROV=
IDES for .so.1 here
 RPROVIDES_${PN} +=3D "libGLESv2.so.1"
--
2.17.1


--_000_3636ba12ce614b7aaa514b36abd1de30ticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Andrew,</p>
<p><br>
</p>
<p>I remember some of the other recipes (eg kmscube, omapdrmtest)&nbsp;in m=
eta-ti / meta-arago that depended on omap5-sgx-ddk-um-linux.</p>
<p><br>
</p>
<p>We cleaned up some of those dependencies while adding J7. Not sure if al=
l of them have been covered. Have you confirmed?</p>
<p><br>
</p>
<p>Regards,</p>
<p>Anand</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Davis, Andrew<br>
<b>Sent:</b> Thursday, September 5, 2019 10:08:46 PM<br>
<b>To:</b> Dmytriyenko, Denys; Tammana, Gowtham; Balagopalakrishnan, Anand;=
 Ruei, Eric<br>
<b>Cc:</b> meta-ti@yoctoproject.org; Davis, Andrew<br>
<b>Subject:</b> [meta-ti][thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop omap5=
-sgx-ddk-um-linux package</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">No one in-tree depends on this anymore. This used =
to be the name of the<br>
package so this was kept here for several years for backwards<br>
compatibility. Remove this from PROVIDES.<br>
<br>
Signed-off-by: Andrew F. Davis &lt;afd@ti.com&gt;<br>
---<br>
&nbsp;.../libgles/ti-sgx-ddk-um_1.17.4948957.bb&nbsp;&nbsp;&nbsp;&nbsp; | 2=
0 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------<br>
&nbsp;1 file changed, 10 insertions(&#43;), 10 deletions(-)<br>
<br>
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recip=
es-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br>
index 0695ca0a..53d2829e 100644<br>
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br>
&#43;&#43;&#43; b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb<br=
>
@@ -23,22 &#43;23,22 @@ INITSCRIPT_PARAMS =3D &quot;defaults 8&quot;<br>
&nbsp;<br>
&nbsp;inherit update-rc.d<br>
&nbsp;<br>
-PROVIDES &#43;=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 virt=
ual/libgbm omap5-sgx-ddk-um-linux&quot;<br>
&#43;PROVIDES &#43;=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 =
virtual/libgbm&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS &#43;=3D &quot;libdrm udev wayland wayland-protocols libffi e=
xpat&quot;<br>
&nbsp;RDEPENDS_${PN} &#43;=3D &quot;libdrm libdrm-omap udev wayland wayland=
-protocols libffi expat&quot;<br>
&nbsp;<br>
-RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um=
-linux&quot;<br>
-RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev omap5-sgx-ddk-um-linux-dev&quot;<br>
-RPROVIDES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg omap5-sgx-ddk-um-linux-dbg&quot;<br>
&#43;RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RPROVIDES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg lib=
gbm-dbg&quot;<br>
&nbsp;<br>
-RREPLACES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um=
-linux&quot;<br>
-RREPLACES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm-=
dev omap5-sgx-ddk-um-linux-dev&quot;<br>
-RREPLACES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm-=
dbg omap5-sgx-ddk-um-linux-dbg&quot;<br>
&#43;RREPLACES_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RREPLACES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev lib=
gbm-dev&quot;<br>
&#43;RREPLACES_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg lib=
gbm-dbg&quot;<br>
&nbsp;<br>
-RCONFLICTS_${PN} =3D &quot;libegl libgles1 libgles2 libgbm omap5-sgx-ddk-u=
m-linux&quot;<br>
-RCONFLICTS_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev libgbm=
-dev omap5-sgx-ddk-um-linux-dev&quot;<br>
-RCONFLICTS_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg libgbm=
-dbg omap5-sgx-ddk-um-linux-dbg&quot;<br>
&#43;RCONFLICTS_${PN} =3D &quot;libegl libgles1 libgles2 libgbm&quot;<br>
&#43;RCONFLICTS_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-dev li=
bgbm-dev&quot;<br>
&#43;RCONFLICTS_${PN}-dbg =3D &quot;libegl-dbg libgles1-dbg libgles2-dbg li=
bgbm-dbg&quot;<br>
&nbsp;<br>
&nbsp;# The actual SONAME is libGLESv2.so.2, so need to explicitly specify =
RPROVIDES for .so.1 here<br>
&nbsp;RPROVIDES_${PN} &#43;=3D &quot;libGLESv2.so.1&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_3636ba12ce614b7aaa514b36abd1de30ticom_--
