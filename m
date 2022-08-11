Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2E6C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:52:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8218.1660233132274379881
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DUO47xHo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BFqAT0036792
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660233130;
	bh=TbpyrvHP+j+RPlZAYHyuWwq9iMDRVYf9gsjuy3wIJqE=;
	h=From:To:CC:Subject:Date;
	b=DUO47xHoGMJLquTRo59+F6k1mxLwVdY1mlSqxCbzKyf5wy813wDsf+VPGsBswJYbC
	 wlIwSVAiQC5K2fzLgPDN8g2YNHS2t0UuO+7i8c6nHgBR9yAkKhfi/qLAMxYB9i6Bmx
	 I91mUhaXMY6LNTifDLRW1sbAXH9bgB5V9XqI6Vz0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BFqA7h064415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:52:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 10:52:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 10:52:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BFqAXJ015431;
	Thu, 11 Aug 2022 10:52:10 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>
Subject: [dunfell/master PATCH] trusted-firmware-a: upgrade to v2.7
Date: Thu, 11 Aug 2022 10:52:10 -0500
Message-ID: <20220811155210.10055-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 15:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14948

upgrade arm-trusted-firmare to v2.7

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc                      | 2 +-
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8aaf1559..a8627c68 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
+K3_IMAGE_GEN_SRCREV ?= "91a75b17c616a5cc41b3345905dccba5c29aca66"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 9645137e..4dd13952 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,6 @@
 PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
+SRCREV_tfa_k3 = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


