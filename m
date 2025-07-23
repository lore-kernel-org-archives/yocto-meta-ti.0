Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E15C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:16:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1611.1753305375958059191
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 14:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YYa46joH;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NLGExP1350627;
	Wed, 23 Jul 2025 16:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753305374;
	bh=S3UzLKxYMxYXGBI2oWszhSaMPNIKSzTloPYA0jRsfiE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YYa46joH+QiPfif8neYaWvLKLucbhx5sMtTa8KGpInY1+FL1Xif86copJy0JDphBk
	 9muDGd0LdbNGCcS3hyIt8X/rJ86xS7uazg27z7vmmITaP4B/jhrlS5rV6PMnNrN8Ts
	 fUmMv/59ZV/5mjkc7Ub1EPb/TDASv9o23kLzIxOQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NLGEA63081868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 16:16:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 16:16:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NLGEsY3300611;
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uegow-0004DT-1r; Wed, 23 Jul 2025 16:16:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 2/3] gadget-init: Add missing SUMMARY
Date: Wed, 23 Jul 2025 16:16:12 -0500
Message-ID: <20250723211613.16164-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250723211613.16164-1-reatmon@ti.com>
References: <20250723211613.16164-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 21:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18815

Every recipe should have a SUMMARY and that can only be 72 characters at
most.  This recipes had a DESCRIPTION and not SUMMARY.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
index 3ab00ec3..27b2520e 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Units to initialize usb gadgets"
+SUMMARY = "Units to initialize usb gadgets"
 
 PR = "r19"
 
-- 
2.17.1


