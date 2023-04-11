Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBCAC77B77
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:52:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.28682.1681249966633125363
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZT4DguZZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqirb079030;
	Tue, 11 Apr 2023 16:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681249964;
	bh=SIxAtZiCQELsLmnB2CQJFh3/0pbwEFkvjHEjEH73omk=;
	h=From:To:CC:Subject:Date;
	b=ZT4DguZZ+ETD+TEEgggguGSOMHRfC9XPm0G9QzbosLObU/Cx6dgfiJlj0KDJtSwyU
	 QTCPrqwj3u5Mf13OPiegCWLAQTcN3hu9GkUYxXXh48VJfg+wRNdowDWh20mrZ3C2gX
	 eiH+l8+YlmRmvLaXASL8RlEiHSnzgIiSoY/h7oQo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLqirf017309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:52:44 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:52:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:52:44 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqhUe006598;
	Tue, 11 Apr 2023 16:52:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v3 1/6] linux-ti-mainline: Use upstream configs with upstream kernel
Date: Tue, 11 Apr 2023 16:52:38 -0500
Message-ID: <20230411215243.18230-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16363

Mainline should test the mainline kernel as it is, not with out-of-tree
changes like to the default configuration that one would get when using
a stock distro. Use only upstream configuration.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-ti-mainline/defconfig      | 1 -
 .../linux/linux-ti-mainline/dra7xx/defconfig              | 1 -
 .../recipes-kernel/linux/linux-ti-mainline/k3/defconfig   | 1 -
 .../linux/linux-ti-mainline/omapl138/defconfig            | 1 -
 .../linux/linux-ti-mainline/ti33x/defconfig               | 1 -
 .../linux/linux-ti-mainline/ti43x/defconfig               | 1 -
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 +++++---
 7 files changed, 5 insertions(+), 9 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
deleted file mode 100644
index d083d182..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_omap2_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
deleted file mode 100644
index dcb53bab..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_dra7x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
deleted file mode 100644
index b9bc6137..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_arm64_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
deleted file mode 100644
index b3467853..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_omapl138_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
deleted file mode 100644
index 88f80fa9..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am3x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
deleted file mode 100644
index 4b9daaf9..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am4x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index be278d73..7d948a85 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 inherit kernel
 
-DEFCONFIG_BUILDER = "${S}/ti-upstream-tools/config/defconfig_builder.sh"
-require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 
@@ -33,12 +31,16 @@ KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += " \
     ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
     git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
-    file://defconfig \
 "
 
 SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
 SRCREV_FORMAT = "linux"
 
+DEFCONFIG_NAME = "multi_v7_defconfig"
+DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
+DEFCONFIG_NAME:k3 = "defconfig"
+KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
+
 kernel_do_compile:append() {
 	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-- 
2.39.2


