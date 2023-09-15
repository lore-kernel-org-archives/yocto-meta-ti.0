Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDA1EE645A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 11:15:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.18084.1694776536045200101
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 04:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JX96cwUP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38FBFVIZ037517;
	Fri, 15 Sep 2023 06:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694776531;
	bh=ZZVAAjL+UYSaDrahiYqim45l1Gye0KCQODkE7I0pOoI=;
	h=From:To:CC:Subject:Date;
	b=JX96cwUP7KNKFFoeXVSPL6bftrEceqL99vvk386oEi5VOkMFgNfFgP4Zl53Jm/iqy
	 Kwu+43FVZW7h4yuXomVp6UuWIT6Sg/VJXi9ten+rc+l19GBIQZL3EamIp2b7BzpAMH
	 AG01UEowDHFBoG6FDk/Rw+ddPer+1H7Ba/aKSy3s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38FBFVCN068970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Sep 2023 06:15:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Sep 2023 06:15:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Sep 2023 06:15:30 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38FBFT0S036169;
	Fri, 15 Sep 2023 06:15:30 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v4 1/2] recipes-bsp: u-boot: Add u-boot-mergeconfig.inc to handle fragment u-boot config
Date: Fri, 15 Sep 2023 16:45:22 +0530
Message-ID: <20230915111523.2274146-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 11:15:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16984

- U-boot recipe in OE-Core supports out-of-tree config fragments that are passed via 
SRC_URI and automatically merges all *.cfg files as fragments. This makes specifying
config fragments in the machine configuration a bit difficult. Hence, add a logic which
will ensure we handle u-boot config fragments using a new variable UBOOT_CONFIG_FRAGMENTS.

- The u-boot-mergeconfig.inc will allow us to build u-boot with list of config fragments
specified in UBOOT_CONFIG_FRAGMENTS along with the base defconfig mentioned in UBOOT_MACHINE.

- Include u-boot-mergeconfig.inc in u-boot-ti.inc

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v4: 
  - Added an extra check for UBOOT_MACHINE being set
  - Commit Message Formatting
v3:
  - s/UBOOT_CONFIG_FRAGMENT/UBOOT_CONFIG_FRAGMENTS
  - Use do_configure:append instead of do_compile:append
v2:
  - Split a single patch into 2 seperate patches
  - Add detail commit message

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
new file mode 100644
index 00000000..c7ce5047
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
@@ -0,0 +1,7 @@
+do_configure:append () {
+   if [ -n "${UBOOT_CONFIG_FRAGMENTS}" ] && [ -n "${UBOOT_MACHINE}" ]
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


