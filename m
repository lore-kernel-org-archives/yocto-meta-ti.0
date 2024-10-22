Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09851D2CE08
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 17:01:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.23663.1729616462630241156
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 10:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HXIzO3QE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49MH10We086337;
	Tue, 22 Oct 2024 12:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729616460;
	bh=NazstFe1MrL2S7xrFh7mctX1ctbFTGLBQF2wS/vtgOw=;
	h=From:To:Subject:Date;
	b=HXIzO3QEZGDXyVBzxrra12PnnNNL0rz2zWmaOFcgjsi/6R0SZ49OKJ4v8OUVYDcy2
	 lETi2Bv2ViOklsuDIz3KrrMCoh/osHTPaP/yI90mRmuT6Z0WQ6izhbL18/m5Li71N/
	 hOGDEBBjEHQPzgrn+clBLndAobp3M+HNcvwfHtK0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49MH103Z000993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Oct 2024 12:01:00 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Oct 2024 12:01:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Oct 2024 12:01:00 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49MH10An120890;
	Tue, 22 Oct 2024 12:01:00 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t3IFg-0001c1-1Z; Tue, 22 Oct 2024 12:01:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] uboot-ti-next: Add new recipe to track master-next
Date: Tue, 22 Oct 2024 12:01:00 -0500
Message-ID: <20241022170100.6145-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Oct 2024 17:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18025

Our upstream testing needs to point to both master and master-next and
we need two different recipes to track that.  This recipe mirrors the
linux-ti-next recipe and points to the master-next branch for the latest
bleeding edge changes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix require of the mainline recipe.

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
index 00000000..9bdedfa3
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
@@ -0,0 +1,5 @@
+require u-boot-ti-mainline_git.bb
+
+SUMMARY = "U-Boot master-next for TI devices"
+
+BRANCH = "master-next"
-- 
2.17.1


