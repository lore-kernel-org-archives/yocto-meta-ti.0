Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9A5EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 22:38:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.24994.1687473478286427552
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 15:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AXSPOJ7A;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MMbsBi018098;
	Thu, 22 Jun 2023 17:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687473474;
	bh=Cw3JfcYwxwH0zWhDEsFBm2ogjBHSHNzVoEm78Em1L3s=;
	h=From:To:CC:Subject:Date;
	b=AXSPOJ7AUHhn9kLYmKUXvumMgTBjP/VqRxeVMYH7QGvrxOPIxZQ/CsH8yL4+btuUP
	 NiHRalfi6+lEDeaDO/0/p7UTE3dTwwgKUOJxwyMdMgEr0zEeRZs/f0zUybHSqN0RDi
	 Rd9/4Ij+GC4x8vYJM9PzGjOhC7r6I/IzPbROypMc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MMbsmF125083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 17:37:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 17:37:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 17:37:54 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MMbsC9051949;
	Thu, 22 Jun 2023 17:37:54 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: use rrecommends for components
Date: Thu, 22 Jun 2023 17:37:49 -0500
Message-ID: <20230622223749.3106570-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 22:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16780

From: Randolph Sapp <rs@ti.com>

Use RRECOMMENDS for components. Apparently I made an resolvable
dependency cycle that Yocto silently clipped. My best guess at the
culprit was: mesa-megadriver (RR) -> rogue-km (RR) -> rogue-um (RD) ->
libgles1-rogue (RD) -> mesa-megadriver

That killed the ti-img-rogue-umlibs recipe during do_rootfs. The rogue
GLES libs do depend on mesa-megadriver at runtime but I guess the UM
components should only really recommend the rogue GLES components be
present at runtime to make the cycle resolvable by opkg.

Fixes:
1705f6d3 (ti-img-rogue-umlibs: make all components optional, 2023-06-21)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb         | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index c012859f..9f129c9d 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -33,9 +33,9 @@ PACKAGECONFIG ?= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
 "
 
-PACKAGECONFIG[opengl] = ",,,${GLES_LIB_PACKAGES}"
-PACKAGECONFIG[vulkan] = ",,,${VULKAN_LIB_PACKAGES}"
-PACKAGECONFIG[opencl] = ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-tools"
+PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
+PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
+PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
 
 def get_file_list(package_list_var, d):
     file_list = []
@@ -72,14 +72,9 @@ do_install:append() {
     fi
 }
 
-GLES_LIB_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
-GLES_PACKAGES = "${GLES_LIB_PACKAGES}"
-
-VULKAN_LIB_PACKAGES = "libvk-rogue"
-VULKAN_PACKAGES = "${VULKAN_LIB_PACKAGES}"
-
-OPENCL_LIB_PACKAGES = "libopencl-rogue"
-OPENCL_PACKAGES = "${OPENCL_LIB_PACKAGES} libopencl-rogue-tools"
+GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
+VULKAN_PACKAGES = "libvk-rogue"
+OPENCL_PACKAGES = "libopencl-rogue libopencl-rogue-tools"
 
 PACKAGES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
-- 
2.41.0


