Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C1EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:43:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.867.1687797826129105511
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 09:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wQ5Yfmb8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QGhfq0095747;
	Mon, 26 Jun 2023 11:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687797821;
	bh=38AP7nKZPIWeSOK4kmwLt3jzBpHljfPBE+V5Kyr0X3w=;
	h=From:To:CC:Subject:Date;
	b=wQ5Yfmb8xC326+frkb4uddoQotz8hTud+vwden60nkrVrmPjc/fBFyFBrJ4AYi+Kk
	 2E3ra60KB9O4nxmBXbPMXmT2OMz6LIK4sPfky5VSh1Ncy4ujyjay6OG10MNUdtYfK6
	 w9AdIzs7gaXfO8nMCR8GeFE7DplCQ62aRw6O7eTA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QGhfni026821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jun 2023 11:43:41 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 11:43:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 11:43:40 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QGheQ6015921;
	Mon, 26 Jun 2023 11:43:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <khasim@ti.com>, <s-adivi@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: update to catch more compilers
Date: Mon, 26 Jun 2023 11:43:35 -0500
Message-ID: <20230626164335.3430088-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Jun 2023 16:43:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16791

From: Randolph Sapp <rs@ti.com>

Upstream changed to not be so picky about compilers. Bump SRCREV so the
odd things using our recipes are happy again.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index 1a08a441..2342462e 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "ebddb087ef140ca83e4c30d66580b0bb33b003fd"
+SRCREV = "815f7bc56567220af5af93e9ec8772ea4a866fe7"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.41.0


