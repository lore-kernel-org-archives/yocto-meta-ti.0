Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B458AC54ED1
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 21:07:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.34240.1747948036804331939
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 May 2025 14:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qUIWY9yE;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54ML7EAw743738;
	Thu, 22 May 2025 16:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747948034;
	bh=QX0eGU92YGnizwsl7OsvWo/zfMBAoAWOjTosl/DnKZU=;
	h=From:To:CC:Subject:Date;
	b=qUIWY9yEf0gPfBeTRnCx8jv62eV+uzZGQUfad31EjTCeYJVoVaZz0I3eh8MbUEXS6
	 21CMwyvvcrg5og5U5hEeLkudqZdlMUkKwuHgV/ftoHwBwHZv2ar7gfe7mBdLpSk3C7
	 uuGptNN8WqlajIIkwhFCsTFKKGpRopaWWpZD2NCo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54ML7Dfn3780848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 16:07:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 16:07:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 16:07:13 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54ML7DPB001836;
	Thu, 22 May 2025 16:07:13 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] meta-ti-bsp: am62lxx: Do not deploy extra tiboot3.bin copy
Date: Thu, 22 May 2025 16:07:12 -0500
Message-ID: <20250522210712.2106045-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 May 2025 21:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18588

For AM62L there is no GP and both HS sub-types are supported by the
same TIFS. This means we do not need multiple versions of tiboot3.bin.
So no need to deploy an additional version which is identical to the
default tiboot3.bin already deployed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62lxx.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
index d3bc81df..b4f0b8c9 100644
--- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62lxx"
 
 MACHINE_FEATURES += "screen"
 
-# Default tiboot3.bin on AM62L is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62lx-hs-fs-evm.bin"
-
 TFA_BOARD = "am62l"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-- 
2.39.2


