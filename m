Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651FCC43217
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 00:23:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4019.1651796627036570552
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 17:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tLOvVBSg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2460NjmW096663;
	Thu, 5 May 2022 19:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651796625;
	bh=OlwD1yngcFvPIzA+zgon5ok5MGR3HeN0qyB67X3GfZU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tLOvVBSgF91+GZniB9EL9NsUqV3dS/ZPiXSztNturEP1ztYU4u7en0QFnvYNvboh4
	 w82SirdyPe6I2p9hyWVHGn6dD6Y5jqpE9KRfqavOEKK1paoQsmf1fP6IsdNvQqgqyV
	 iq1Fg6DJsaJiDZZ2ajitzd81CV5/U0wWMK/Kl93A=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2460NjxZ099286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 May 2022 19:23:45 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 19:23:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 5 May 2022 19:23:45 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2460NjL9030248;
	Thu, 5 May 2022 19:23:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmll3-000125-0Y; Thu, 05 May 2022 19:23:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging: Bump to 08.03.00.003
 release
Date: Thu, 5 May 2022 19:23:43 -0500
Message-ID: <20220506002344.3923-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506002344.3923-1-reatmon@ti.com>
References: <20220506002344.3923-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 May 2022 00:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14714

Updated the linux version for 08.03.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index cb34a7aa..baaa6b83 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "45b6d4fdf6550061582b89d0b794a1cc7c1dc4b2"
+SRCREV = "9cff62efaca103acf18b8478362ec56e11d7f526"
 PV = "5.10.109+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


