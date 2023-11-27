Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88199C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 21:58:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.113354.1701122318449130626
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwaUk089302;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARLwaS6016806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 15:58:36 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 15:58:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 15:58:36 -0600
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARLwaS3060315;
	Mon, 27 Nov 2023 15:58:36 -0600
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id 9E2EA10D08DE; Mon, 27 Nov 2023 15:58:36 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 3/4] ti-extras: Add support for extra kernel/u-boot features for am62pxx
Date: Mon, 27 Nov 2023 15:58:35 -0600
Message-ID: <1701122316-142436-4-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
References: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Nov 2023 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17335

From: Paresh Bhagat <p-bhagat@ti.com>

Add support for ti-extras for am62pxx to control the kernel and u-boot
repos, branches, and srcrevs via the TI_EXTRAS variable in the local.conf
file.

Also add am62pxx as compatble machine in jailhouse recipe. So the am62pxx
jailhouse build can be done by adding TI_EXTRAS=tie-jailhouse in local.conf.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf       | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm.conf            | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 6 +++++-
 6 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 33254bf..3691538 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62px"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 931de95..d7c9f58 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62PX EVM
 
 require conf/machine/include/am62pxx.inc
+require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62p5 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index e0a94ea..d32c652 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,7 +1,7 @@
 
 # This will have priority over generic uboot path
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 BRANCH = "ti-u-boot-2023.04"
 BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
index 1fc4093..530a178 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -2,7 +2,7 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 BRANCH = "ti-rt-linux-6.1.y"
 BRANCH:tie-jailhouse = "ti-rt-linux-6.1.y-jailhouse"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
index 076a67d..0b22aca 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -2,7 +2,7 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 BRANCH = "ti-linux-6.1.y"
 BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index a96a783..ca82998 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -55,18 +55,21 @@ JH_CELL_FILES:k3 ?= "k3-*.cell"
 JH_INMATE_DTB ?= ""
 JH_INMATE_DTB:am62xx ?= "inmate-k3-am625-sk.dtb"
 JH_INMATE_DTB:am65xx ?= "inmate-k3-am654-idk.dtb"
+JH_INMATE_DTB:am62pxx ?= "inmate-k3-am62p5-sk.dtb"
 JH_INMATE_DTB:j7 ?= "inmate-k3-j721e-evm.dtb"
 JH_INMATE_DTB:j7200-evm ?= "inmate-k3-j7200-evm.dtb"
 
 JH_LINUX_DEMO_CELL ?= ""
 JH_LINUX_DEMO_CELL:am62xx ?= "k3-am625-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am65xx ?= "k3-am654-idk-linux-demo.cell"
+JH_LINUX_DEMO_CELL:am62pxx ?= "k3-am62p5-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7 ?= "k3-j721e-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
 
 JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL:am62xx ?= "k3-am625-sk.cell"
 JH_SYSCONFIG_CELL:am65xx ?= "k3-am654-idk.cell"
+JH_SYSCONFIG_CELL:am62pxx ?= "k3-am62p5-sk.cell"
 JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
 
@@ -75,6 +78,7 @@ JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 
 JH_CMDLINE ?= ""
 JH_CMDLINE:am62xx ?= "console=ttyS3,115200n8 earlycon=ns16550a,mmio32,0x02810000"
+JH_CMDLINE:am62pxx ?= "console=ttyS1,115200n8"
 JH_CMDLINE:am65xx ?= "console=ttyS1,115200n8"
 JH_CMDLINE:j7 ?= "console=ttyS3,115200n8"
 JH_CMDLINE:j7200-evm ?= "console=ttyS3,115200n8"
-- 
1.8.3.1


