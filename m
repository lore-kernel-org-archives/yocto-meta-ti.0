Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CD9C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:21:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.18950.1741195309122919354
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 09:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lIaBzHGP;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525HLmqj3468480
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741195308;
	bh=7UAKrHv9X8kxtiof7dpSy6AlMUQDODU/Q4szy4xSypY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lIaBzHGPXh6ZKtdmTXLL2ylWqgQBzd4Osi0gXpSaWrOwOwRmBHLtWXZr9SnInyv13
	 K3OWWNDNXX1HHlPyCgdrNqT50yqQowlqeaKGJ4Aht1HXJ6HSSRViBVoepN3Gq9IAvo
	 rgfP0fFs6tsM5bChbk8Lx6HgVnj0m1i+BymsGyRc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525HLmoL116247
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 11:21:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 11:21:48 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525HLmVO064406
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v4 1/3] recipes-graphics : port gc320 driver to work on kernel 6.12
Date: Wed, 5 Mar 2025 11:21:46 -0600
Message-ID: <20250305172148.358549-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305172148.358549-1-a-christidis@ti.com>
References: <20250305172148.358549-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 17:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18356

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


