Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0F9C7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1430.1685125657178182352
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nSy0HM6B;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRaqA072131;
	Fri, 26 May 2023 13:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125656;
	bh=FSuwCKjH73YYTr7yrPyQAAFsNA8vPUD5b5GNVtvom6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nSy0HM6Bz27KNDwabyNLDQO1L0B/7xi1LCXrmbhexPeVUGU/OcJXPurwAWyoKIwwu
	 qks3Jc1T9tL08ylnb6brg6owcOFRpVq/O9ECqm5fkA4cpPa+kdAt/zPIOCV69AqF/7
	 XzASlvFeCiDEqpbmYsVXZ0xoG0H7wZfTZJFnmT9U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRaFb109139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:35 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlw013297;
	Fri, 26 May 2023 13:27:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 8/8] conf: machine: j721e: Also deploy full named tiboot3.bin files
Date: Fri, 26 May 2023 13:27:31 -0500
Message-ID: <20230526182731.284783-8-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16605

The platforms with combined boot image have full names for tiboot3.bin
and to keep things consistent we can do the same here. Deploy these files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j721e.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index f77099a1..ca653770 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -8,13 +8,16 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 IMAGE_BOOT_FILES += "sysfw.itb"
 
-# Default sysfw.itb on J721e is for GP
+# Default on J721e is for GP
+IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
 
-# Since default sysfw.itb on J721e is for GP, add a version for HS-FS
+# Since default on J721e is for GP, add a version for HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
 
-# Since default sysfw.itb on J721e is for GP, add a version for HS-SE
+# Since default on J721e is for GP, add a version for HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
 
 TFA_BOARD = "generic"
-- 
2.39.2


