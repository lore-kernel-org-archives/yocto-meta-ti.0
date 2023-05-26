Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1492C7EE32
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1416.1685125657543345038
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TzXHfS6O;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRZnf081725;
	Fri, 26 May 2023 13:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125655;
	bh=xwJGjh43WuoWinADRKIpWbaDj63SVhAMES3ZxZ2z3qo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TzXHfS6OQZTXhgyz+w3t3elaZy7wlQVhlODbk8HjukVm1ZZpR+EIaan4DarvlGb+j
	 CIsO2B5jEmVZwo6VCshG47oy6EjBANMZtivpCSKziQnIsCrSZXdlEGutsMPOrlE4Nl
	 GGFLhufO4DDEzJzcZdSmqDg1TFBUQpyVF9NztiP0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRZuj109136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:35 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlv013297;
	Fri, 26 May 2023 13:27:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 7/8] conf: machine: am65xx: Also deploy full named tiboot3.bin files
Date: Fri, 26 May 2023 13:27:30 -0500
Message-ID: <20230526182731.284783-7-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16606

The platforms with combined boot image have full names for tiboot3.bin
and to keep things consistent we can do the same here. Deploy these files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 98895c33..4b2c05e7 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -14,10 +14,12 @@ KERNEL_DEVICETREE = " \
 
 IMAGE_BOOT_FILES += "sysfw.itb"
 
-# Default sysfw.itb on AM65x is for GP
+# Default on AM65x is for GP
+IMAGE_BOOT_FILES += "tiboot3-am65x-gp-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-am65x-gp-evm.itb"
 
-# Since default sysfw.itb on AM65x is for GP, add a version for HS-SE
+# Since default on AM65x is for GP, add a version for HS-SE
+IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
 
 TFA_BOARD = "generic"
-- 
2.39.2


