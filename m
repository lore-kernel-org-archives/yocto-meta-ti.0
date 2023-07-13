Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0073C0015E
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 19:37:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.256.1689277023795281964
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 12:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KgEIxq+Y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36DJb2Qi098544
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 14:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689277022;
	bh=DjRrMX6198tvutP5CidMvtNjZO6lrb9shu2NCrkZbhk=;
	h=From:To:CC:Subject:Date;
	b=KgEIxq+YCWjtiiFlRVRQzYrCDkHf/rLTuHgWD4vpAo042j5DwTNFNL/QH/LCISOM/
	 3k/Z+CIPku8RTGE6a4jEBxGo/0uEzk/TT7vUuIGaQlHr9vUhEGFUHgcG8SB++TDd20
	 XG9YhPtYHqFJbGKimUBK3WZvNr4amvsnjMWCAoSo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36DJb2OK006795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 14:37:02 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 14:37:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 14:37:02 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36DJb2bU015609;
	Thu, 13 Jul 2023 14:37:02 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>, Randolph Sapp <rs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [kirkstone PATCH] meta-ti: conf: am62xx-lp-evm: Use common include am62xx.inc
Date: Thu, 13 Jul 2023 14:37:02 -0500
Message-ID: <20230713193702.10578-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 19:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16844

From: Praneeth Bajjuri <praneeth@ti.com>

commit 5f9be228390b ("machine: Add AM62Q HS-SE evm configuration")
has added am62xx-lp.inc which is used by am62xx-lp-evm machine.

The features listed in am62xx.inc are common between machines
am62xx-evm and am62xx-lp-evm. (Ex: MACHINE_FEATURES = "gpu")

Hence updating the necessary include file to have
common features to be enabled between these two platform variants.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Suggested-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf    |  2 +-
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 15 ---------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/am62xx-lp.inc

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 1f1b47ba..5c235c29 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM62XX LP EVM
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
 
-require conf/machine/include/am62xx-lp.inc
+require conf/machine/include/am62xx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
deleted file mode 100644
index f3fe944b..00000000
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-require conf/machine/include/k3.inc
-SOC_FAMILY:append = ":am62xx"
-
-MACHINE_FEATURES += "screen touchscreen"
-
-TFA_K3_SYSTEM_SUSPEND = "1"
-
-# Default tiboot3.bin on AM62x LP is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
-
-# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-
-TFA_BOARD = "lite"
-OPTEEMACHINE = "k3-am62x"
-- 
2.17.1


