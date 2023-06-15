Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94666EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:19:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.28879.1686860333414225641
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 13:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MEOwyZs+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKIp5H001738;
	Thu, 15 Jun 2023 15:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686860332;
	bh=k9OaD1p/SLdFvII1vPBwbDuRTfvfi/nonhPYIjoXvOs=;
	h=From:To:CC:Subject:Date;
	b=MEOwyZs+b16Nr6CyjPVbT3sG5dckmIcX6/cmBk9pCMAeNzrs55exVHgL9FOH4sfUJ
	 Md4MgJLPSuFiVzWxmF+P/mHyJzSTWNjWNu+UEvI7mBmJoEsXfq0SvrLVuxInnl48Vs
	 VDA8eA2TeBfGeB1pX3McTYFiLuzz9AdT4+o5hV2U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKIpl7038595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:18:51 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:18:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:18:51 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKIpPR074456;
	Thu, 15 Jun 2023 15:18:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-sci-fw: Include the TIFS LPM stub with the rest of SYSFW
Date: Thu, 15 Jun 2023 15:18:49 -0500
Message-ID: <20230615201849.211619-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 20:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16736

This firmware is shipped with the rest of ti-sysfw blobs, it shares
the same versions too and so should be simply bundled with the same.

This stub is also built into U-Boot and not loaded during kernel
runtime anymore, so remove the RDEPENDS in kernel.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 -
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 23 -------------------
 .../recipes-kernel/linux/kernel-rdepends.inc  |  4 ----
 4 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8e1b68c4..a3d43fd1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,7 +14,6 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
-TIFS_LPM_STUB_FW_VERSION = "08.06.04"
 TI_DM_FW_VERSION = "08.06.04"
 TI_SYSFW_VERSION = "08.06.04"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 6a4c03f9..5ad1e688 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -18,6 +18,7 @@ do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-fs-stub-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 }
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
deleted file mode 100644
index 2db761ba..00000000
--- a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "TI Foundational security Low Power Management Stub"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${TIFS_LPM_STUB_FW_VERSION}"
-PR = "${INC_PR}.0"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "am62xx|am62axx"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-
-TARGET = "ti-fs-stub-firmware-am62x-gp-signed.bin"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw/
-	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${nonarch_base_libdir}/firmware/ti-sysfw/${TARGET}
-}
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 69796915..18984e80 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -31,7 +31,3 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
-
-# Add run-time dependency for TIFS Low Power Module stub
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx = " tifs-lpm-stub"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " tifs-lpm-stub"
-- 
2.39.2


