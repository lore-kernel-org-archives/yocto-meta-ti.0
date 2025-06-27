Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF59EC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 04:58:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.6039.1751000280378054014
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 21:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tUy3ilAY;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-chawdhry@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R4vxc42650654
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 23:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751000279;
	bh=/PbOVNz83T0k7kYWQ09VgLJzc/tf+BLPPrYKgXMFFMw=;
	h=From:To:CC:Subject:Date;
	b=tUy3ilAYDMt7X1EREj1KPqXnZLYj0i/riE48aOQ/dZZIjhEDPgLmspAWeJ4WPQD2I
	 UqGRg/uqxRbV7B+5rTbv7RDHEKS4skXVYlKB3aQ/c809+rQQ9vOMJFfKL7ig+Tkfs5
	 HM3LhWa5rKy0sBkOgEoWSq5muWQnRceDtxxiagqY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R4vx2P2909244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 23:57:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 23:57:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 23:57:59 -0500
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.227.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55R4vtgj2213872;
	Thu, 26 Jun 2025 23:57:56 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>, Bryan
 Brattlof <bb@ti.com>,
        Suman Anna <s-anna@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v2] Revert "conf: machine: k3: disable all fit signing for uboot"
Date: Fri, 27 Jun 2025 10:27:48 +0530
Message-ID: <20250627045748.876433-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 04:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18696

FIT signing was disabled in the past as it was interfering with multi DTB
usecase in binman causing build failures. Now that a U-boot fix is
available [0], revert that commit which disabled the FIT signing.

This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.

[0]: https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-95eff1c853a4@ti.com/

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v2: Add more descriptive commit ( Suman )

 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 9b85f867c206..14d7db8a1184 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -25,6 +25,10 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME ?= "custMpk"
+UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
 FIT_HASH_ALG ?= "sha512"
 FIT_SIGN_ALG ?= "rsa4096"
 
-- 
2.34.1


