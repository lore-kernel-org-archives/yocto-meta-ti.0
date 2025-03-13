Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9813C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 00:15:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.3344.1741824938859643665
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 17:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ohuPbb5s;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52D0Fbpb1169639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 19:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741824937;
	bh=Bafbb5Z/vXL+ziftQPGHcu+K/NLL7Fcozb+3xTvg/G4=;
	h=From:To:Subject:Date;
	b=ohuPbb5soPvI6ZZrsDOCXFFMn8WZZL0bFdBmw6GLzeY4nPHnO2+e6rYR4IvGGdrkT
	 PFFx7oKUG1RJo5Zckl56DrNQJLzUtFukKcJa/XQ+NyC0AQ9zwh/bBSe0fSzwYWUXzK
	 /4elDenacIqBVbP1O1CtuZ7g3KgAALJ5QmnblwZE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52D0Fb3C092136;
	Wed, 12 Mar 2025 19:15:37 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 19:15:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 19:15:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52D0Fbe8078834;
	Wed, 12 Mar 2025 19:15:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsWEb-0004nn-16; Wed, 12 Mar 2025 19:15:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char: Change to COMPATIBLE_MACHINE
Date: Wed, 12 Mar 2025 19:15:37 -0500
Message-ID: <20250313001537.18418-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Mar 2025 00:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18379

Rather than using COMPATIBLE_HOST move to using COMPATIBLE_MACHINE to
limit the recipe to being TI specific.  Also, this package is "k3"
specific so further limit it down to just those matching machines and
not all TI SOCs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 22d03d97..be88aade 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -14,5 +14,4 @@ PV = "0.6.7+git"
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
+COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.17.1


