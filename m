Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D81C77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:59:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16090.1681491558182879848
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 09:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AXa+jtD7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EGxHbv103193
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681491557;
	bh=RYfmsjb9AQ4BBjkeLcBL4JfE4U3fTZSPHT+suvQQzMA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AXa+jtD7pFzZ92zBUCQH3cebx1Girw1GFWrSM5lwQfWWJOG1PVgdA2KZdbRsX8Ztx
	 k/ddR7ccfflq2UFc8KIsPN/tirJRLC37KwNDupX8AUMsOn/9L3kdlNXFS82bumRSfG
	 nrJ+kkiMhpAafgXNlfilOSwT0KFQF6JrYRmZrgJY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EGxHuM016547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:59:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 11:59:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 11:59:17 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EGxHhF086732;
	Fri, 14 Apr 2023 11:59:17 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH v3][kirkstone 2/3] mesa: update pvr-mesa for the 22.3.5 version of mesa
Date: Fri, 14 Apr 2023 11:58:58 -0500
Message-ID: <20230414165859.1675824-3-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414165859.1675824-1-rs@ti.com>
References: <20230414165859.1675824-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 16:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16399

Update the pvr-mesa include to use the 22.3.5 patches from
oe-core/master and the branch for DDK version 23.1 on freedesktop.

Also remove the PACKAGECONFIG options elf-tls and xvmc as those
functions were dropped by the oe-core/master version of this package and
mesa package respectively.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
index 96c484a7..d938f41c 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -4,23 +4,22 @@
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
 
-BRANCH = "powervr/kirkstone/22.0"
+BRANCH = "powervr/kirkstone/22.3.5"
 
 SRC_URI = " \
     git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
     file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-    file://0002-meson.build-make-TLS-ELF-optional.patch \
     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
     file://0001-util-format-Check-for-NEON-before-using-it.patch \
-    file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
+    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
 "
 
 S = "${WORKDIR}/git"
 
-SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
+SRCREV = "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
 
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
@@ -33,6 +32,10 @@ PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 
 PACKAGECONFIG:remove = "video-codecs"
 PACKAGECONFIG[video-codecs] = ""
+PACKAGECONFIG:remove = "elf-tls"
+PACKAGECONFIG[elf-tls] = ""
+PACKAGECONFIG:remove = "xvmc"
+PACKAGECONFIG[xvmc] = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PV = "22.0.3+pvr"
-- 
2.40.0


