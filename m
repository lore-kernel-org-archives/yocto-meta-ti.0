Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618BFC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:31:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.6269.1748611906649212162
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 May 2025 06:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ogyxmVN2;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54UDVjQf3795701;
	Fri, 30 May 2025 08:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748611905;
	bh=YImS22UoE4Al7fTmKvH6ale1fTXvhl78bQ6TgOrFVU4=;
	h=From:To:Subject:Date;
	b=ogyxmVN2MlY7onzbMvhoCzz67+BRSuk5bG/ka3FJcfCCmPCeIZundnL5HNxKBJYnk
	 P5uZaB79nebQjWB2Dt2/6/ZkfXEuuDKAM58JtW/zakcamP8mPh8Nvlh9ISNiA/JdwZ
	 9cxSr9TnPKh8Zt9kjySIZoQAfbQiMGkFpSI7vqIA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54UDVjnA847828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 08:31:45 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 08:31:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 08:31:45 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54UDVjT43118415;
	Fri, 30 May 2025 08:31:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uKzpp-0005HS-7Y; Fri, 30 May 2025 08:31:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr: fold GL ES 3 packages into GL ES 2 ones
Date: Fri, 30 May 2025 08:31:45 -0500
Message-ID: <20250530133145.20258-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 May 2025 13:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18615

This is a sideport of a patch against mesa in oe-core [1].

OpenGL ES 3 is closely tied to the OpenGL ES 2: there is no separate
library, one can use GL ES 2 headers for GL ES 3 app, etc. Instead of
having separate packages, merge GL ES 3 packages into GL ES 2 ones.

[1] https://git.openembedded.org/openembedded-core/commit/?id=7c0e9c170db93d9af7cc505dcd71c4f3d6c4e9c5

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
index 471475ff..45d5ada3 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
@@ -228,17 +228,10 @@ CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY = ""
 
-# Khronos documentation says that include/GLES2/gl2ext.h can be used for
-# OpenGL ES 3 specification as well as for OpenGL ES 2.
-# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
-# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
-# development package of libgles3.
-RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
-
 # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its implementation.
-RDEPENDS:libgles2-mesa += "libgles3-mesa"
-ALLOW_EMPTY:libgles3-mesa = "1"
+RPROVIDES:libgles2-mesa += "libgles3-mesa"
+RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
 
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
 
@@ -250,7 +243,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
-             libgles3-mesa libgles3-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
@@ -288,8 +280,7 @@ python __anonymous() {
               ("opengl", "libgl", "libgl1"),
               ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
+              ("gles", "libgles2", "libglesv2-2", "libgles3"),
               ("opencl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
@@ -363,8 +354,7 @@ FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/g
 FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libgles3-mesa-dev = "${includedir}/GLES3"
+FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-- 
2.17.1


