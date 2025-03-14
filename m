Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9947BC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 08:22:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.8987.1741940541568125035
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ipGYtgBY;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E8MKfP2113520
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741940540; i=@ti.com;
	bh=Up1CPjs077RqoS7vMFuIGgHiAfV8sHoIjn7SBiRZfTg=;
	h=From:To:Subject:Date;
	b=ipGYtgBYwmVhAgvcE0bTy+MWs7W+5jZatyrIfhsxM4BMvsinsHVBj65AuSldOP5cw
	 ROkaRR4YOJUkVqPd8qvECsCSBzB0jzsW/bQgur61Icc6/q2g3DI1gVn7+s34rHZ9XE
	 E6EIr/PCPFENCFL+Q+GFqpli7FTcYcrTT9KGiyWI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E8MKUf029942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 03:22:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 03:22:19 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 03:22:19 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E8MJFi037632;
	Fri, 14 Mar 2025 03:22:19 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id A2C7E24E9; Fri, 14 Mar 2025 03:22:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202503140100
Date: Fri, 14 Mar 2025 03:22:19 -0500
Message-ID: <20250314082219.2139376-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Mar 2025 08:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18383

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e089c2f8db0577aa4acd3b3ef3ab229be2e804e1..1faf5974a93eb35ac31ed27e5693739edb08824c
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=baf3aaa8ecfa20b9d9f497621b6c11915223f502..c8badfb165815c648052309418987f302e48aeef
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d..8c8cc002ab65149491f9b75cadfaeb2342150800

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f9773dad..2aad1c03 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,15 +9,15 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.02"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.04"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "11.00.06"
-TI_SYSFW_VERSION = "11.00.06"
+TI_SYSFW_VERSION = "11.00.07"
 
-TI_LINUX_FW_SRCREV ?= "e089c2f8db0577aa4acd3b3ef3ab229be2e804e1"
+TI_LINUX_FW_SRCREV ?= "1faf5974a93eb35ac31ed27e5693739edb08824c"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 8fea6396..f23a9f1d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "baf3aaa8ecfa20b9d9f497621b6c11915223f502"
+SRCREV = "c8badfb165815c648052309418987f302e48aeef"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index fb71a2f0..7bc025fa 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1a22c2fb64485a5dea9a9247eb007ddd4ea8a81d"
+SRCREV ?= "8c8cc002ab65149491f9b75cadfaeb2342150800"
 PV = "6.12.17+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-- 
2.43.5


