Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C458FC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 20:28:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.663.1719433690552315472
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jun 2024 13:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=glsQe1Io;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45QKS63L101561;
	Wed, 26 Jun 2024 15:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719433686; i=@ti.com;
	bh=ead1nO3Kn/3ku7RMZJGFH7ywf2KWa+LckL0RI4dJRcg=;
	h=From:To:Subject:Date;
	b=glsQe1IotRrmWDb4vg9EcrT9UAMCFsvq3CHrxYmW5DHzuDBdywzbDDJq2tezDYzBg
	 hNvHYWzW256Yt/jZ9rjNBu2jNhrKS83leO07WHOi+tZWsavBfdVvU8TLQbksQq9ZsB
	 PuBrni5L7cOpgfUJp3TxQNkE0D7diRZRntoCmJrs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45QKS6jP080917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2024 15:28:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Jun 2024 15:28:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Jun 2024 15:28:06 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.248.130.114])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45QKS6fY073582;
	Wed, 26 Jun 2024 15:28:06 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 17F1510F57BB; Wed, 26 Jun 2024 15:28:06 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406260816
Date: Wed, 26 Jun 2024 15:28:06 -0500
Message-ID: <1719433686-118964-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Jun 2024 20:28:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17808

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2024.04: SRCREV
  linux-ti-staging-rt_6.6: SRCREV
  linux-ti-staging_6.6: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 6ccb93c..dbde9eb 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,9 +15,9 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.4"
 TI_DM_FW_VERSION = "10.00.01"
-TI_SYSFW_VERSION = "09.02.08"
+TI_SYSFW_VERSION = "10.00.02"
 
-TI_LINUX_FW_SRCREV ?= "83d5c6a2349436185fb49922da40d4201fb8d2c3"
+TI_LINUX_FW_SRCREV ?= "4a334045552fa5edf9097a0e968a172e7a2ddc38"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d01e9d6..211056e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "c377e32f1e563280093aa28361a07751a75da792"
+SRCREV = "a966db94265729780911e4e5cc8f70ed21b65029"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index fa53395..eecdb7b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 
 BRANCH = "ti-rt-linux-6.6.y"
 
-SRCREV = "10e40a5ae075f5d07636fd78ec5bffe9d3faa668"
+SRCREV = "1b49ba34b397c3ad7680efdf653e16a135ebd6da"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 178f4f9..9a146b4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-SRCREV ?= "4bd0d44f69cbda913ca7fcb809ae0fa682416b14"
+SRCREV ?= "617ff9770276964869d70593a0eab2145b087d12"
 PV = "6.6.32+git"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.8.3.1


