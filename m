Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA2C7EE26
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:37:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15232.1683340664557240679
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 19:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A648440A3D
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukW2mfE3dA6x for <meta-ti@lists.yoctoproject.org>;
	Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 936F240C61
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 388D11638C9
	for <meta-ti@lists.yoctoproject.org>; Fri,  5 May 2023 22:37:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 1/4] ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
Date: Sat,  6 May 2023 02:37:40 +0000
Message-Id: <20230506023743.1259692-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506023743.1259692-1-denis@denix.org>
References: <20230506023743.1259692-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16494

From: Randolph Sapp <rs@ti.com>

Update the source revision for the following upstream changes:
	- Drop the included ICD loader. Use the Mesa/Khronos one
	  instead.
	- Enable all vulkan window system extensions

Separate the vulkan libs into their own package so people can choose to
ignore them if they want, considering the new runtime deps.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.=
1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_2=
3.1.6404501.bb
index 3ad0cce6..9068d341 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64045=
01.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.64045=
01.bb
@@ -12,7 +12,7 @@ PR =3D "r2"
=20
 BRANCH =3D "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "49958a8e820a321d22ac3c635bd21d4a3118c006"
+SRCREV =3D "452b0f50d2984171c81d5a0d3b22198177d919ad"
 S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
@@ -30,14 +30,29 @@ do_install:append() {
         rmdir ${D}/lib
     fi
     rm -rf "${D}/etc/init.d"
-    rm -rf "${D}/usr/lib/libvulkan.so"
-    rm -rf "${D}/usr/lib/libvulkan.so.0"
-    rm -rf "${D}/usr/lib/libvulkan.so.1"
 }
=20
-PACKAGES =3D "${PN}-tools ${PN}"
+PACKAGES =3D "${PN}-vulkan ${PN}-tools ${PN}"
+
+FILES:${PN}-vulkan =3D " \
+    ${datadir}/vulkan \
+    ${libdir}/libVK_IMG.so* \
+"
+RDEPENDS:${PN}-vulkan +=3D " \
+    mesa-vulkan-drivers \
+    libdrm \
+    ti-img-rogue-driver \
+    libx11-xcb \
+    wayland \
+"
+INSANE_SKIP:${PN}-vulkan +=3D " \
+    already-stripped \
+    dev-so \
+"
+
 FILES:${PN}-tools =3D "${bindir}/"
 RDEPENDS:${PN}-tools =3D "python3-core"
-RRECOMMENDS:${PN} +=3D "${PN}-tools"
+
+RRECOMMENDS:${PN} +=3D "${PN}-vulkan ${PN}-tools"
=20
 INSANE_SKIP:${PN} +=3D "ldflags arch already-stripped dev-so"
--=20
2.25.1


