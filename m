Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EFAC7EE33
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1429.1685125656093620471
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iHChtaNt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRZnt081721;
	Fri, 26 May 2023 13:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125655;
	bh=/MKETEE1swpR5wIPktdbimwbd7xkjM3n3IgGdaHQCGQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iHChtaNt9aIIhzD6tX6IDaRdFnQO93uQhBF56wkj/47UeJrMbUga6Nyiv2gRGamQj
	 0nrq7aOjD1eI9yODfr6lHor+weuOcuUawtLu5vo2Qtg3rhkAlTfNKP80m8/sDyR2Ty
	 I5kTSMKPS8zPO0h3IZvXkungy1GNJzQySOnVu69E=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRZqB011706
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:35 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:34 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlt013297;
	Fri, 26 May 2023 13:27:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 5/8] conf: machine: am62xx: Remove old SPL_BINARY and UBOOT_BINARY overrides
Date: Fri, 26 May 2023 13:27:28 -0500
Message-ID: <20230526182731.284783-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526182731.284783-1-afd@ti.com>
References: <20230526182731.284783-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16601

The defaults set in am62xx.inc are correct now and these can be dropped.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 5b86a1f5..c4357be3 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -11,7 +11,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-
-SPL_BINARY = "tispl.bin"
-UBOOT_BINARY = "u-boot.img"
-UBOOT_SYMLINK = "u-boot.img"
-- 
2.39.2


