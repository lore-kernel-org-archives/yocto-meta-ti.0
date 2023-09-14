Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B06EDE9AE
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 11:58:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10162.1694692719258514724
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 04:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qeus6uwS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38EBwYQB054138;
	Thu, 14 Sep 2023 06:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694692714;
	bh=oxf9rFgf10RU3EmvmDyVXP9rGvfhlq+dzYPsUZQiyR8=;
	h=From:To:CC:Subject:Date;
	b=Qeus6uwS0HZIw9ZestL+GrzchifLbpAfLO79lxWllLfDpGBRc9bp0Zk7hqlh824M9
	 RzVLv2yUUCYdFLst1OwMz+WGNtK1rx6ZbwJWryQSNox+JAabiJF0LkF1IAR1DoGcIS
	 Or0fstMXL33idrgjspJoSux0Fbc4t/w1RnlNSuR8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38EBwYnn125332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Sep 2023 06:58:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 06:58:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 06:58:33 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38EBwX4g017377;
	Thu, 14 Sep 2023 06:58:33 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v3 1/2] recipes-bsp: u-boot: Add u-boot-mergeconfig.inc to handle fragment u-boot config
Date: Thu, 14 Sep 2023 17:28:12 +0530
Message-ID: <20230914115813.1104022-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 11:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16965

- U-boot recipe in OE-Core supports out-of-tree config fragments that are passed via SRC_URI and automatically merges all *.cfg files as fragments.
This makes specifying config fragments in the machine configuration a bit difficult. Hence, add a logic which will ensure we handle u-boot config fragments
using a new variable UBOOT_CONFIG_FRAGMENTS.

- The u-boot-mergeconfig.inc will allow us to build u-boot with list of config fragments specified in UBOOT_CONFIG_FRAGMENTS along with the base defconfig mentioned in UBOOT_MACHINE.

- Include u-boot-mergeconfig.inc in u-boot-ti.inc

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
new file mode 100644
index 00000000..e2ae5894
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
@@ -0,0 +1,7 @@
+do_configure:append () {
+   if [ -n "${UBOOT_CONFIG_FRAGMENTS}" ]
+   then
+       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENTS}
+       oe_runmake -C ${S} O=${B} olddefconfig
+   fi
+}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index f3285c23..5292517b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-mergeconfig.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
-- 
2.34.1


