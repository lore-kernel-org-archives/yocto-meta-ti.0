Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24894D17131
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 20:22:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2383.1729542124016726427
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 13:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G0YxOKoK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LKM2fq035673;
	Mon, 21 Oct 2024 15:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729542122;
	bh=WlSscQmn0Yg9UyHqxvK6qiTESKIPRG7NjBH6Tzs5Bss=;
	h=From:To:Subject:Date;
	b=G0YxOKoKWtxR65G6/FaK7WYBol2lLBCFPzhtgaKaF+2WIbbRSC1S4NjHm9I3DiERX
	 S/QdBuvvjwIKvgE7OXLKdswmm+EgzhWyOLrfVYBim2bqxTIYJ66vIp0sSdxxawf4ps
	 7Ovs0pPwPbqWnkAXoIyeCcrKipx3iJDGruC1LVto=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKM2ST125620;
	Mon, 21 Oct 2024 15:22:02 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 15:22:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 15:22:01 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKM1FY003405;
	Mon, 21 Oct 2024 15:22:01 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t2yuf-0001wg-K5; Mon, 21 Oct 2024 15:22:01 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] uboot-ti-next: Add new recipe to track master-next
Date: Mon, 21 Oct 2024 15:22:01 -0500
Message-ID: <20241021202201.7438-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Oct 2024 20:22:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18021

Our upstream testing needs to point to both master and master-next and
we need two different recipes to track that.  This recipe mirrors the
linux-ti-next recipe and points to the master-next branch for the latest
bleeding edge changes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 0c8f657d..2eb3bd19 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -28,7 +28,7 @@ MACHINE_FEATURES:remove:bsp-mainline = "gpu"
 # ==========
 BSP_KERNEL_PROVIDER:bsp-next = "linux-ti-next"
 BSP_KERNEL_VERSION:bsp-next = "%"
-BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-mainline"
+BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
 BSP_BOOTLOADER_VERSION:bsp-next = "%"
 
 # GPU support requires out-of-tree SGX and Rogue drivers not available
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
new file mode 100644
index 00000000..4d5df92a
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
@@ -0,0 +1,5 @@
+require u-boot-ti-mainline.bb
+
+SUMMARY = "U-Boot master-next for TI devices"
+
+BRANCH = "master-next"
-- 
2.17.1


