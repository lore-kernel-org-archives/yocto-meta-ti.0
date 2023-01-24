Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84540C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:14:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8577.1674537271679398679
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 21:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a9V1nuE0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30O5EQBc049359;
	Mon, 23 Jan 2023 23:14:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674537266;
	bh=ztRnk0V52NXT1NmDBSqSuP9zKcSllH0ObmIXlU5pz4o=;
	h=From:To:CC:Subject:Date;
	b=a9V1nuE0gJtkVxi6MNo+AmFUMSfPIXTmOKoRoQGAGewnEu6QAgrrjhGM2oSFSpDqU
	 kO1l7KBgPipXFww5SSG5/TJng1o+liDMJYiZ1IwKkBmZhrbPIElcuIQCD2h2NtxgAz
	 qZk7T/bzy2atH8ZaQb73DynENRQe53rbxjJXj+Q4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30O5EPif032720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 23:14:25 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 23:14:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 23:14:25 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30O5EOXG012726;
	Mon, 23 Jan 2023 23:14:25 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 1/2] conf: machine: am62xx-evm: Add Support for AM62xx HS-SE
Date: Tue, 24 Jan 2023 10:44:18 +0530
Message-ID: <20230124051418.1201453-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 05:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15638

- Add machine conf for AM62xx HS-SE.
- The wic images will boot on AM62x GP devices by default. To boot on AM62x HS-SE, simply switch out the SYSFW image:

$ cd /mnt/sd-card/boot
$ mv tiboot3-am62x-hs-evm.bin tiboot3.bin

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 ...-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} |  3 +++
 conf/machine/am62xx-evm-k3r5-hs-se.conf       | 21 +++++++++++++++++++
 conf/machine/am62xx-evm.conf                  |  4 ++++
 conf/machine/include/am62xx.inc               | 11 ++++++++--
 4 files changed, 37 insertions(+), 2 deletions(-)
 rename conf/machine/{am62xx-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} (67%)
 create mode 100644 conf/machine/am62xx-evm-k3r5-hs-se.conf

diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-evm-k3r5-gp.conf
similarity index 67%
rename from conf/machine/am62xx-evm-k3r5.conf
rename to conf/machine/am62xx-evm-k3r5-gp.conf
index 724a8d4a..d9867bc7 100644
--- a/conf/machine/am62xx-evm-k3r5.conf
+++ b/conf/machine/am62xx-evm-k3r5-gp.conf
@@ -9,3 +9,6 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am62xx-evm-k3r5-hs-se.conf b/conf/machine/am62xx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..913e69fa
--- /dev/null
+++ b/conf/machine/am62xx-evm-k3r5-hs-se.conf
@@ -0,0 +1,21 @@
+#@TYPE: Machine
+#@NAME: AM62xx HS-SE EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F core)
+
+# Booting HS-SE requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-hs-se"
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+SYSFW_TIBOOT3_SYMLINK = ""
+
+UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 3d9e3b90..b4904eca 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -19,3 +19,7 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+
+SPL_BINARY = "tispl.bin_HS"
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index 0231235f..912318e9 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -8,8 +8,15 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+BBMULTICONFIG = "k3r5-gp"
+do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x is for GP, add a version for HS-SE
+BBMULTICONFIG += "k3r5-hs-se"
+IMAGE_BOOT_FILES += " tiboot3-am62x-hs-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
-- 
2.34.1


