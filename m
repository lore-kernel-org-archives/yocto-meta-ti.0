Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A6BC54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:51:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.38034.1700567495095192137
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 03:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vz81z7DN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ALBpYAD125512
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 05:51:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700567494;
	bh=1eogyCuF+Tn8/dSnvC7ROTvq6Nj1wrQBbdwaOuFiU98=;
	h=From:To:CC:Subject:Date;
	b=vz81z7DNT84w9UxAXudVcQZoBsyHQHxZFUa9UCk4W/DeluZqqJANa2u8SqH8UFxtG
	 7icnij+AzvH520hyfDcTXF5EJUrBNVk2QaviUEXvJD5Rs+k+euM1eZeCHjQZ/xlwGK
	 UczmVxuSR5VB3Kw0OdKURSqeIaTwaN2XZVWq0oRs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ALBpYru055685
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 05:51:34 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Nov 2023 05:51:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Nov 2023 05:51:34 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ALBpX64006087;
	Tue, 21 Nov 2023 05:51:33 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] ti-extras: Add support for extra kernel/u-boot features for am62pxx
Date: Tue, 21 Nov 2023 17:21:22 +0530
Message-ID: <20231121115122.3705405-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 11:51:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17319

Add support for ti-extras for am62pxx to control the kernel and u-boot
repos, branches, and srcrevs via the TI_EXTRAS variable in the local.conf
file.

Also add am62pxx as compatible machine in jailhouse recipe. So the am62pxx
jailhouse build can be done by adding TI_EXTRAS=tie-jailhouse in local.conf.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf       | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm.conf            | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 6 +++++-
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 33254bf2..36915381 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62px"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 931de953..d7c9f589 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62PX EVM
 
 require conf/machine/include/am62pxx.inc
+require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62p5 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index e0a94ea6..d32c6529 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,7 +1,7 @@
 
 # This will have priority over generic uboot path
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 BRANCH = "ti-u-boot-2023.04"
 BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
index 076a67db..0b22aca9 100644
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
index a96a7831..ca829986 100644
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
2.34.1


