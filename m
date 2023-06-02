Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B26C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:29:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8598.1685698194860270684
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 02:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EJGZZsvm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3529TsQG078306
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 04:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685698194;
	bh=EO2rAJTR8cdzm6uv8N/2rgHjuywpRu6Cv8/TjqAK1Uk=;
	h=From:To:CC:Subject:Date;
	b=EJGZZsvmiVnsWSbAoR1VvdTiwiu66b+FDqFwrymjgvbhxupEM1Ha+guB52RUvQvhV
	 VMBBbRrQSSiQc6o/+nVvpFRxqqWk3K2L9YxV2ffs/avo5KNpIVNozQX/wGgFjovLOk
	 Gdx9QH51MxEZZtpKdrkfEcxskDgvPPuGVmPx5lnY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3529TsBo074695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 04:29:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 04:29:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 04:29:53 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3529TrqW067191;
	Fri, 2 Jun 2023 04:29:53 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] meta-ti-bsp: Add recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Date: Fri, 2 Jun 2023 14:59:32 +0530
Message-ID: <20230602092932.2576466-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 09:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16654

Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which contains
patches used for jailhouse. These will be used to build jailhouse image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../u-boot/u-boot-ti-jailhouse_2023.04.bb     | 11 ++++++
 .../linux/linux-ti-jailhouse-6.1/defconfig    |  2 +
 .../linux/linux-ti-jailhouse-6.1/k3/defconfig |  2 +
 .../linux-ti-jailhouse-6.1/omapl138/defconfig |  1 +
 .../linux/linux-ti-jailhouse_6.1.bb           | 37 +++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
new file mode 100644
index 00000000..be374108
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
@@ -0,0 +1,11 @@
+require u-boot-ti.inc
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2023.04-jailhouse"
+
+UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
+
+SRCREV = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
new file mode 100644
index 00000000..24b53cf7
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
new file mode 100644
index 00000000..ef1d3efd
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=defconfig
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
new file mode 100644
index 00000000..099493af
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
@@ -0,0 +1 @@
+use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
new file mode 100644
index 00000000..85eaba25
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
@@ -0,0 +1,37 @@
+SECTION = "kernel"
+SUMMARY = "Linux kernel for jailhouse for TI devices"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+COMPATIBLE_MACHINE = "am62xx-evm"
+
+inherit kernel_vendor_dtb
+
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+
+DEPENDS += "gmp-native libmpc-native"
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-6.1.y-jailhouse"
+
+SRCREV = "0ed0dec2462b805b0188fe080895adc437871549"
+PV = "6.1.26+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR:append = "b"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
+KERNEL_GIT_PROTOCOL = "https"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"
-- 
2.34.1


