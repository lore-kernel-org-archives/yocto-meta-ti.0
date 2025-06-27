Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45B6C83026
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:24:41 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.452.1751055879890260921
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QESiWlRn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKOcmS2836200;
	Fri, 27 Jun 2025 15:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751055878;
	bh=whEgCPD18u+t5tirh4O3bC0KuErIL8xahah9C8F0gbs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QESiWlRnAT8u8z2DG8hqOxZOGWNK0HMNVcRBIqu4rKklmSouS/S06cDAEgeIykYCm
	 XuTNBdGRZYd0m42VgljfQyyLBKoLjZ2Jz1/hEDKcyvMhJBcvqnkiEnuG0uq84AhX8v
	 HHI+cRqISr8VteFmOe3DuLQZ4HJZjGrgHWwhqaio=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKOcWB695300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:24:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:24:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:24:38 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKOboX3659840;
	Fri, 27 Jun 2025 15:24:37 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/3] ti-linux-fw: Remove default SUMMARY line
Date: Fri, 27 Jun 2025 15:24:35 -0500
Message-ID: <20250627202436.582570-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627202436.582570-1-afd@ti.com>
References: <20250627202436.582570-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:24:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18716

All firmware that includes this helper should set their own SUMMARY line.
Currently all do, but they often include this file after setting their
own SUMMARY, so this one overwrites it. Remove this default SUMMARY.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
index 67150968..378e3a12 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
@@ -1,5 +1,3 @@
-SUMMARY = "TI EdgeAI prebuilt binary firmware images"
-
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
 
-- 
2.39.2


