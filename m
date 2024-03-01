Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5F4C54798
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 02:48:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13959.1709261330177990220
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 18:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EoLZACJ9;
 spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4212mm9m031190;
	Thu, 29 Feb 2024 20:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709261328; i=@ti.com;
	bh=xB77/sTatqy3ninXUPqK+y44/RKRaWgumGcWLrhN7PI=;
	h=From:To:Subject:Date;
	b=EoLZACJ9nHISqMBCxKX9HDOVMCDLKwtcq66F/KSOY9jF6r+S2BNSOAOLZx/SJCYCg
	 V9wai36ExnUDB89Mc5J5a1k+58SJLAqkKdpY8Vr/iIBD1t37MeGMjDzF4J6rr75C60
	 Cp0o5hmQqhpUnHFpuvwYUXL3RYdcosqTOkzzLmwE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4212mmiP056163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Feb 2024 20:48:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 20:48:47 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 20:48:47 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4212mlrQ020272;
	Thu, 29 Feb 2024 20:48:47 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id CD07510BAD89; Thu, 29 Feb 2024 20:48:47 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402291453
Date: Thu, 29 Feb 2024 20:48:47 -0600
Message-ID: <1709261327-119108-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Mar 2024 02:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17499

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  linux-ti-staging-rt_6.1: SRCREV
  linux-ti-staging_6.1: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 49e8e80..09ab514 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,10 +14,10 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.3"
-TI_DM_FW_VERSION = "09.02.03"
-TI_SYSFW_VERSION = "09.02.01"
+TI_DM_FW_VERSION = "09.02.04"
+TI_SYSFW_VERSION = "09.02.05"
 
-TI_LINUX_FW_SRCREV ?= "ef9fc0897907e7febba7bec70db0f3249b1bc124"
+TI_LINUX_FW_SRCREV ?= "0ac29b7745bfa507b07fd99237b916497113ac9d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 7efe3bd..0c83754 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -6,7 +6,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "8bb1c6ab769ed7f58c8c415fc0b7efa3b32658da"
+SRCREV = "16683766adce1c66579c8071a1db8c70c1ab0758"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 9620f42..6175350 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "457fff614143954bb5d16ef7b425e276b32aeb0c"
+SRCREV ?= "0ccfdb3fe66551031a7a112f6ff668f9683ef725"
 PV = "6.1.69+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


