Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43C1C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 20:37:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5047.1741293471085045372
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 12:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I04psuwT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-brnich@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526KboUJ3847233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Mar 2025 14:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741293470;
	bh=9cxqohLKJQPdMROknHK/KJ1v0wH3AZoIYp2rYHBqBG8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I04psuwTOg5GMDtcP3mBXLcqaNiVMGrg+hSOhxQI7BmyI6AExK4uHMoc16dStPjVa
	 j+ejivVLyFOR6cav8UPIBsJDRz/tZmWUFhKpit3xG7vrTaI3MDRPIcDyhx4yAtcY+4
	 dT4UgAlgiYrK9DR7zfKKwKr85CWSVaBptufgyaHg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526Kbo1o030881
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Mar 2025 14:37:50 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 14:37:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 14:37:49 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526KbnRL044433;
	Thu, 6 Mar 2025 14:37:49 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>
Subject: [scarthgap][PATCH 2/2] conf: machine: J721e: Add Dependency for IMG Driver
Date: Thu, 6 Mar 2025 14:37:49 -0600
Message-ID: <20250306203749.794759-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306203749.794759-1-b-brnich@ti.com>
References: <20250306203749.794759-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Mar 2025 20:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18360

IMG codec drivers reside only on the J721e SoC. Ensure that the drivers
are being built when building SDK.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-ti-bsp/conf/machine/include/j721e.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 1507234b..6264d5c8 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -36,4 +36,4 @@ TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw ti-vxe-vxd-driver"
-- 
2.34.1


