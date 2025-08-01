Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E552EC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 13:40:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.88155.1754055600246083697
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a63MYViq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571DdxbC3252672;
	Fri, 1 Aug 2025 08:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754055599;
	bh=89KX3Zv5Zob0WvG8i5v9jx4Hx42OTdh+xaYNlgJZZhI=;
	h=From:To:Subject:Date;
	b=a63MYViqMxu6k8uHM6oTI2ca3FgExJZ+DrG8NOH10XODYrTLYwQncYoZKLS5asNQu
	 NETzqhNfoaQ6AM9Nwq4Ll7pEFejsxQAciB5edvE342vnl3mBzkQZzm11IYa8jWJR+8
	 3rrqdZC9H2Kzewqv0nQz0ANtW9C4Wy9uzdXYmV7k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571DdwcS577222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 08:39:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 08:39:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 08:39:58 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571DdwKm461793;
	Fri, 1 Aug 2025 08:39:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uhpzK-0005ta-GK; Fri, 01 Aug 2025 08:39:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS default
Date: Fri, 1 Aug 2025 08:39:58 -0500
Message-ID: <20250801133958.22623-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 13:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18872

If you are trying to build a TI kernel and not building a TI machine
then KERNEL_BASE_CLASS is not defined and you get a parse error.  Move
the default setting out of ti-soc.inc and into ti-kernel.inc.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-soc.inc               | 3 ---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 3 ++-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 3 ++-
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc            | 2 ++
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 3f11e31d..018e9bfb 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -12,9 +12,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 # TI platforms all use devicetrees with overlays
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
 
-# All machines should start off pointing at the default base kernel class
-KERNEL_BASE_CLASS = "kernel"
-
 # Tell the kernel class to install the DTBs in the same directory structure as
 # the kernel
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 51723fc0..92fb1e6c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -3,10 +3,10 @@ SUMMARY = "Mainline Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit ${KERNEL_BASE_CLASS}
-
 require recipes-kernel/linux/ti-kernel.inc
 
+inherit ${KERNEL_BASE_CLASS}
+
 DEPENDS += "gmp-native libmpc-native"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 51e4b604..d36485fb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
+require recipes-kernel/linux/ti-kernel.inc
+
 inherit ${KERNEL_BASE_CLASS}
 
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 321cdcbb..b6d882d8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
+require recipes-kernel/linux/ti-kernel.inc
+
 inherit ${KERNEL_BASE_CLASS}
 
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index ef4ba4a1..32b6c95d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -4,6 +4,8 @@ KERNEL_GIT_BRANCH ?= "branch=${BRANCH}"
 
 KERNEL_DEFCONFIG ?= "file://defconfig"
 
+KERNEL_BASE_CLASS ?= "kernel"
+
 KERNEL_REPRODUCIBILITY_PATCHES ?= ""
 
 SRC_URI = " \
-- 
2.17.1


