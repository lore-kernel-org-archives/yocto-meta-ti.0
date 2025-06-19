Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E726DC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 21:54:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.814.1750370037796543403
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 14:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FxSsUUuC;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JLruVK697564;
	Thu, 19 Jun 2025 16:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750370036; i=@ti.com;
	bh=T0Et7vZuOb2PfDIrF7w+IlHxWpFFk2T3NBaIPMZL6U0=;
	h=From:To:Subject:Date;
	b=FxSsUUuCV5PsWFYcyoOl9ti31+y4ssIunWkmtREK5yPbkJNxixbB/j09Sahqpq/Pq
	 I4WeSTcZ1WK2v84TkExxyhuuY3va9G84zUGQJvMD5iuCym5WUe1JGcuppXAqoOmPTa
	 lrRAylCKswwrsI4/7kyguflr9N36souVSWlhnSrc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JLruSf1672410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 16:53:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 16:53:26 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 16:53:26 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JLrQQd3587882;
	Thu, 19 Jun 2025 16:53:26 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 4E3242359; Thu, 19 Jun 2025 16:53:26 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202506191239
Date: Thu, 19 Jun 2025 16:53:26 -0500
Message-ID: <20250619215326.1589995-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jun 2025 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18658

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc..e594deb508a322d5681888d48fbb153953b06ca9
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=da601a5231bf1b053a35c94c5d57a5658ce2e4e7..c99a1f082ba4970678c9cb5100d13a986e77817c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=251ed68a96e3f85a5db174c9c39dc334c0f0ba5f..34d0b070130a8cd2cddd9260389ad974e8cb8468

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 08cd0b30..61364c66 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,7 +19,7 @@ TI_SYSFW_VERSION = "11.01.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
+TI_LINUX_FW_SRCREV ?= "e594deb508a322d5681888d48fbb153953b06ca9"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index c1a1ad53..329c2af0 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "da601a5231bf1b053a35c94c5d57a5658ce2e4e7"
+SRCREV = "c99a1f082ba4970678c9cb5100d13a986e77817c"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index be3274dd..f7cb439f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "251ed68a96e3f85a5db174c9c39dc334c0f0ba5f"
+SRCREV ?= "34d0b070130a8cd2cddd9260389ad974e8cb8468"
 PV = "6.12.33+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


