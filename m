Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942A0C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 10:28:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.17884.1739528888797333021
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 02:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AohkS6Wu;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EAS4DE835670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Feb 2025 04:28:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739528884;
	bh=3n8TyPnp+9DBa1sZQVNFxBDhNv0bmPmKoyXdflC3OYQ=;
	h=From:To:CC:Subject:Date;
	b=AohkS6WusWdgoJt8Q8X9BomEjBDqkKGGaTieoiDIWi5jJ02kPUpi5wWgAQoNT7kWO
	 Hcf+9Ju6RqLjECydi7Gqx1DvcEL6ApQF6ozJhyrmJw2y+Wj5dQPl1IYa8T0StzeBDT
	 v6+2TksvrwCN2u9zIPOr5UOFlZiZ2jwXM4jMWO8k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EAS45v053665;
	Fri, 14 Feb 2025 04:28:04 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 04:28:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 04:28:04 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EAS3as127313;
	Fri, 14 Feb 2025 04:28:03 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH] Update recipes to support jailhouse for am62lxx
Date: Fri, 14 Feb 2025 15:57:22 +0530
Message-ID: <20250214102722.3727379-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Feb 2025 10:28:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18318

Add am62lxx as compatible machine for ti-extras recipes and jailhouse
recipes. This is to to control the kernel and u-boot repos, branches.
So the am62lxx jailhouse build can be done by adding TI_EXTRAS=tie-jailhouse
in local.conf.
Update SRCREV and branch in ti-extras recipes for LTS migration.
Also update jailhouse recipe to build and package jailhouse, cell files,
device tree for inmate etc on am62lx image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf            |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 10 +++++-----
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc    | 10 +++++-----
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 10 +++++-----
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |  4 ++++
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc |  5 +++--
 6 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index fc348c9b..8d1e1fe2 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62L EVM
 
 require conf/machine/include/am62lxx.inc
+require conf/machine/include/ti-extras.inc
 
 IMAGE_FSTYPES += "ubifs ubi"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index 0252e2c3..e334ada0 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,12 +1,12 @@
 
 # This will have priority over generic uboot path
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 
-BRANCH = "ti-u-boot-2024.04"
-BRANCH:tie-jailhouse = "ti-u-boot-2024.04-jailhouse"
+BRANCH = "ti-u-boot-2025.01"
+BRANCH:tie-jailhouse = "ti-u-boot-2025.01-jailhouse"
 
-SRCREV = "b3c10f333acccef49ebaf4abc575616ea7326d50"
-SRCREV:tie-jailhouse = "b3c10f333acccef49ebaf4abc575616ea7326d50"
+SRCREV = "e718bbcec3ebf663c021839753034a224be4cc53"
+SRCREV:tie-jailhouse = "e718bbcec3ebf663c021839753034a224be4cc53"
 
 UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
index df10d594..dba9ef38 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -2,10 +2,10 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 
-BRANCH = "ti-rt-linux-6.6.y"
-BRANCH:tie-jailhouse = "ti-rt-linux-6.6.y-jailhouse"
+BRANCH = "ti-linux-6.12.y"
+BRANCH:tie-jailhouse = "ti-linux-6.12.y-jailhouse"
 
-SRCREV = "fb89cd4d622ce6cc1b7b254ae21298570d437a08"
-SRCREV:tie-jailhouse = "ea592a872ebdb974f26f6f839596e0a79e9d408b"
+SRCREV = "c9e21a1ebd757f2b4487035382bbf65299cf8170"
+SRCREV:tie-jailhouse = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
index 880d5d87..4b7a9f20 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -2,13 +2,13 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 
-BRANCH = "ti-linux-6.6.y"
-BRANCH:tie-jailhouse = "ti-linux-6.6.y-jailhouse"
+BRANCH = "ti-linux-6.12.y"
+BRANCH:tie-jailhouse = "ti-linux-6.12.y-jailhouse"
 
-SRCREV = "e298dab666632b6f62ed61eac35813331341c3aa"
-SRCREV:tie-jailhouse = "b45ba5ae4b724d4a09c0c7125ffb49e9d58c04f7"
+SRCREV = "c9e21a1ebd757f2b4487035382bbf65299cf8170"
+SRCREV:tie-jailhouse = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
 
 KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
 
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 38281615..0113a916 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,11 +10,13 @@ JH_CELL_FILES ?= "*.cell"
 JH_CELL_FILES:k3 ?= "k3-*.cell"
 JH_CELL_FILES:am62xx ?= "k3-am625-*.cell"
 JH_CELL_FILES:am62pxx ?= "k3-am62p5-*.cell"
+JH_CELL_FILES:am62lxx ?= "k3-am62l*.cell"
 
 JH_INMATE_DTB ?= ""
 JH_INMATE_DTB:am62xx ?= "inmate-k3-am625-sk.dtb"
 JH_INMATE_DTB:am65xx ?= "inmate-k3-am654-idk.dtb"
 JH_INMATE_DTB:am62pxx ?= "inmate-k3-am62p5-sk.dtb"
+JH_INMATE_DTB:am62lxx ?= "inmate-k3-am62l3-evm.dtb"
 JH_INMATE_DTB:j7 ?= "inmate-k3-j721e-evm.dtb"
 JH_INMATE_DTB:j7200-evm ?= "inmate-k3-j7200-evm.dtb"
 
@@ -22,6 +24,7 @@ JH_LINUX_DEMO_CELL ?= ""
 JH_LINUX_DEMO_CELL:am62xx ?= "k3-am625-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am65xx ?= "k3-am654-idk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am62pxx ?= "k3-am62p5-sk-linux-demo.cell"
+JH_LINUX_DEMO_CELL:am62lxx ?= "k3-am62l3-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7 ?= "k3-j721e-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
 
@@ -31,6 +34,7 @@ JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 JH_CMDLINE ?= ""
 JH_CMDLINE:am62xx ?= "console=ttyS3,115200n8 earlycon=ns16550a,mmio32,0x02810000"
 JH_CMDLINE:am62pxx ?= "console=ttyS1,115200n8"
+JH_CMDLINE:am62lxx ?= "console=ttyS3,115200n8"
 JH_CMDLINE:am65xx ?= "console=ttyS1,115200n8"
 JH_CMDLINE:j7 ?= "console=ttyS3,115200n8"
 JH_CMDLINE:j7200-evm ?= "console=ttyS3,115200n8"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 2831e560..62a97df6 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 PV = "0.12+git"
-SRCREV = "9b494ddf4bd8845a2c1063352d08a274ef61777b"
+SRCREV = "dc77c05460bc3df8f2ddc9cc3a9990ca31cb9f9d"
 BRANCH = "master"
 SRC_URI = " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
@@ -63,6 +63,7 @@ JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL:am62xx ?= "k3-am625-sk.cell"
 JH_SYSCONFIG_CELL:am65xx ?= "k3-am654-idk.cell"
 JH_SYSCONFIG_CELL:am62pxx ?= "k3-am62p5-sk.cell"
+JH_SYSCONFIG_CELL:am62lxx ?= "k3-am62l3-evm.cell"
 JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
 
-- 
2.34.1


