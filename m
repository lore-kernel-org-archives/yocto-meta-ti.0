Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97C8C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:27:11 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.500.1751056023630230041
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j0j5sQ0Z;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKR2sU2836945;
	Fri, 27 Jun 2025 15:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751056022;
	bh=c7Q18zODHUFKgGkIbrtHdqlJ/EvzOdFmtg50FYXXxcc=;
	h=From:To:CC:Subject:Date;
	b=j0j5sQ0ZL+hzqqssX2KOMR0Nz07M7O2OoWCJy0qCy6zSFEODOz9sI8T+hb22Yu4m9
	 +N8zChJ3BcqFnX/aL9azki7ZVuUNaIGQelN0D+eW+M4KPzXX1dypYjJ3PL/W9cukns
	 bFHjb7Gjnzozd+aXbNnfNK1/tP4VVg2BglphTIk8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKR2XH769222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:27:02 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:27:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:27:01 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKR15C3396565;
	Fri, 27 Jun 2025 15:27:01 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: k3r5: Use new tune file for Cortex-R5F
Date: Fri, 27 Jun 2025 15:27:00 -0500
Message-ID: <20250627202700.582822-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18718

There is now a tune available specifically for Cortex-R5F cores, use that
here. Not sure how much difference this makes as we only build one package
for this (U-Boot R5 SPL) but should be no harm either.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index fcd54254..ebd8b0aa 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -3,9 +3,9 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":k3r5"
 
-# The closest of existing tunes for Cortex-R5F
-DEFAULTTUNE = "armv7athf"
-require conf/machine/include/arm/armv7a/tune-cortexa8.inc
+# Tune for Cortex-R5F
+DEFAULTTUNE = "cortexr5hf"
+require conf/machine/include/arm/armv7r/tune-cortexr5.inc
 
 # R5 runs early bootloader and loads SYSFW
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
-- 
2.39.2


