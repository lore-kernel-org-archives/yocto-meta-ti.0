Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8716CF9C74
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 15:07:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39036.1727104063446415027
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Sep 2024 08:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QTvcLwAc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48NF7gfE038072;
	Mon, 23 Sep 2024 10:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727104062;
	bh=pRA3gTx8/NPai98pEjw1Y15csldYmEJy/5M5PapW0C4=;
	h=From:To:CC:Subject:Date;
	b=QTvcLwAcRrfAbRaDlDaH8rg/7wAmUkpco9eiyVMBh5IaYZ3CSaJ6PUEL6PZHMJMn2
	 WxNihHTjEHNrQNQrvLozA+rb32D5j9BNAXXLmJdEpYgQqTm75NlYaeWbrySzmMowXj
	 PJVx+jF/bvDWgci8Cv05Lu7JaOkZzcT5DWK26Y44=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48NF7gZD126016;
	Mon, 23 Sep 2024 10:07:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Sep 2024 10:07:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Sep 2024 10:07:41 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48NF7f3E113717;
	Mon, 23 Sep 2024 10:07:41 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/2] meta-ti-extras: dspdce-fw: Remove unused firmware
Date: Mon, 23 Sep 2024 10:07:39 -0500
Message-ID: <20240923150740.78316-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Sep 2024 15:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17969

This was an attempt to run the DCE server firmware on the DSP instead
of on the IPU M4 cores. Not widely used and not used at all anymore,
remove the firmware for this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/dspdce-fw/dspdce-fw_git.bb    | 65 -------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb

diff --git a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
deleted file mode 100644
index 491ee0f3..00000000
--- a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "Firmware for DSP for an example application called copycodectest"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
-
-SRC_URI = "git://git.ti.com/git/glsdk/dspdce.git;protocol=https;branch=master"
-
-SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
-
-PV = "1.00.00.07"
-
-S = "${WORKDIR}/git"
-
-require recipes-ti/includes/ti-paths.inc
-
-PR = "r4"
-inherit update-alternatives
-
-DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
-
-export HWVERSION = "ES10"
-export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
-
-export XDCVERSION = "ti-xdctools-tree"
-export BIOSVERSION = "ti-sysbios-tree"
-export IPCVERSION = "ti-ipc-tree"
-export CEVERSION = "ti-codec-engine-tree"
-export FCVERSION = "ti-framework-components-tree"
-export XDAISVERSION = "ti-xdais-tree"
-export OSALVERSION = "ti-osal-tree"
-
-export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
-export C66XCGTOOLSPATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-
-do_configure() {
-    cd ${S}
-    make unconfig
-    make vayu_config
-}
-
-do_compile() {
-    cd ${S}
-    make dspbin
-}
-
-TARGET = "dra7-dsp1-fw.xe66"
-
-do_install() {
-    install -d ${D}${nonarch_base_libdir}/firmware
-    install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${nonarch_base_libdir}/firmware/${TARGET}.${BPN}
-}
-
-ALTERNATIVE:${PN} = "dra7-dsp1-fw.xe66"
-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/${TARGET}"
-ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/${TARGET}.${BPN}"
-ALTERNATIVE_PRIORITY = "10"
-
-INSANE_SKIP:${PN} = "arch"
-
-FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
-- 
2.39.2


