Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E117C282E5
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:15:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.17198.1741191336544492517
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SNIWJPtJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525GFZ3P3996031
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741191335;
	bh=7UAKrHv9X8kxtiof7dpSy6AlMUQDODU/Q4szy4xSypY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SNIWJPtJ5kF7igw1bsPkuQq7xF6zJm2pwJITt/G4hyo/1JVHZxfz3rL0D3hhbp4X3
	 LY3UZKW3VUMYpNfZ/DdHP+XBubDzN4flmU3k7+86ZlxUeuuYhsg032E9HrG9lrRWFb
	 E60H3CsfTNIof7MlnYFe0oQScHfd2Xl8BDYTWiqU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525GFZDi043428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:15:35 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 5 Mar
 2025 10:15:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:15:35 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GFZPI059162
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v2 1/3] recipes-graphics : port gc320 driver to work on kernel 6.12
Date: Wed, 5 Mar 2025 10:15:33 -0600
Message-ID: <20250305161535.351340-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305161535.351340-1-a-christidis@ti.com>
References: <20250305161535.351340-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:15:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18348

From: Antonios Christidis <a-christidis@ti.com>

Changes made on the gc320 kernel mode driver in order to work with kernel
6.12. There is no other change in functionality with this update, and the
driver version remains the same.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 818ed683..a6dc3e25 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -8,9 +8,9 @@ inherit module features_check
 REQUIRED_MACHINE_FEATURES = "gc320"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k5.10"
+BRANCH = "ti-${PV}-k6.12"
 
-SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
+SRCREV = "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
 
-- 
2.34.1


