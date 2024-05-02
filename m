Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89B5C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:54:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.7589.1714661660746838102
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bhu5si3D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442EsJ0d111206;
	Thu, 2 May 2024 09:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714661659;
	bh=U68rV+FRponAf0ENwfMGLQFavSKcSMhsMtML5Ou2Xxw=;
	h=From:To:Subject:Date;
	b=bhu5si3Df7FgAE6/5OM13h0bF3+fb6B9vyhriZkG+ibCI3UAyu0JbCwyfuZjqY/Ig
	 GK3b+6yGRDtl4B1itNtWULPjZFD3GF/KQVaT4k/iikb47boH4RD7CDrez59oWkuORr
	 t0poY5MWzY9CTA15G3/ctdemeOwJToelwlPOTp9E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442EsJU4001598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 09:54:19 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 09:54:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 09:54:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442EsICN077473;
	Thu, 2 May 2024 09:54:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s2XpC-00076K-SH; Thu, 02 May 2024 09:54:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] README: update meta-arm with scarthgap specific info
Date: Thu, 2 May 2024 09:54:18 -0500
Message-ID: <20240502145418.27256-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 14:54:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17629

meta-arm has created the scarthgap branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/README    | 2 +-
 meta-ti-extras/README | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index 4c86c8fb..70c40d4e 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -12,7 +12,7 @@ branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: scarthgap
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
diff --git a/meta-ti-extras/README b/meta-ti-extras/README
index 764ae0f7..c6c058e0 100644
--- a/meta-ti-extras/README
+++ b/meta-ti-extras/README
@@ -12,7 +12,7 @@ branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-ti
 branch: scarthgap
-- 
2.17.1


