Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20BCC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:06:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.43448.1754899592731873558
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 01:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v4dHbYbu;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57B86VYZ1565872;
	Mon, 11 Aug 2025 03:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754899591; i=@ti.com;
	bh=AWidqLEKDI/2ZdPWtv+UbxhhAQqzYUk1+i6L4LBwtJA=;
	h=From:To:Subject:Date;
	b=v4dHbYbu+k8mAuzQU3Sr/a6MUCkD4he1QLSToOuvI2A8AueqpAeMPYXDr/c28nIDo
	 QuDY8RXiJ/ub4GFSqpLBBtRzOvQQC2AlJFUFQo/HvSFghHx/Esx60bltQ4divBl9lX
	 cS/aSWHpbemOxw5pXPmdd376zkxDqcOajMUW50Lg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57B86VU03569409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 03:06:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 03:06:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 03:06:31 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57B86V6J2534138;
	Mon, 11 Aug 2025 03:06:31 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 15397E8044; Mon, 11 Aug 2025 03:06:31 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508110100
Date: Mon, 11 Aug 2025 03:06:31 -0500
Message-ID: <20250811080631.3425949-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Aug 2025 08:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18924

Updated the value(s) for:
  k3conf: SRCREV

Changelogs:
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=b35ec6f6c6e11471c5d06f8c24ac396077f893be..4e8df1a41a1437b61562836e9478e8069d1a071c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index b22d6fcb..35516600 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "b35ec6f6c6e11471c5d06f8c24ac396077f893be"
+SRCREV = "4e8df1a41a1437b61562836e9478e8069d1a071c"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
-- 
2.43.5


