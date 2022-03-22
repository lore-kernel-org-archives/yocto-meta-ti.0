Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB9C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:25:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12376.1647966331906609851
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 09:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F+40wTt+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPUfi073172;
	Tue, 22 Mar 2022 11:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647966330;
	bh=AhAz0nrwYRxU4fRVKcN+pO0bRNPgP6WGegIyp2696Nw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=F+40wTt+AegXGWUv1IQrG0yWHev+wWihWdsEvsBFXoS5VWIOUW0kOXlpn0Q87Hcfe
	 UxvAy/lIPd4qoULa9M86820UhXVD04k5eW1EdTfiWVN3xN+Er+mvoJLndmcEXiifmY
	 EjYdRrpHPz5yk7Os81UUEDjM/poiX4JpZvotbwLs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MGPUrX089280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 11:25:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 11:25:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 11:25:30 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPUmM013113;
	Tue, 22 Mar 2022 11:25:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWhK6-00040p-CT; Tue, 22 Mar 2022 11:25:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 11/11] recipes-bsp: lpm-demo: Fix build
 errors with clean task
Date: Tue, 22 Mar 2022 11:25:28 -0500
Message-ID: <20220322162528.15298-12-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322162528.15298-1-reatmon@ti.com>
References: <20220322162528.15298-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 16:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14522

From: Nikhil Devshatwar <nikhil.nd@ti.com>

lpm-demo and tifs-lpm-demo packages only install certain files.
The build breaks when rebuilding incrementally.
It fails the do_configure task.

Fix this by adding CLEANBROKEN in those recipes.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/lpm-demo/lpm-demo_1.0.bb           | 2 ++
 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/recipes-bsp/lpm-demo/lpm-demo_1.0.bb b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
index 56b04d56..244d7a55 100644
--- a/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
+++ b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
@@ -8,6 +8,8 @@ COMPATIBLE_MACHINE = "am62xx-evm"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 S = "${WORKDIR}"
 
+CLEANBROKEN = "1"
+
 # We need to have the license file from some source. In this case, there
 # is no source. Hence pointing to the license file only
 SRC_URI = "file://GPL-2"
diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
index bc341035..e3ba67be 100644
--- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -9,6 +9,7 @@ PV = "v2021.09a"
 
 COMPATIBLE_MACHINE = "am62xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+CLEANBROKEN = "1"
 
 S = "${WORKDIR}/git"
 TARGET = "ti-fs-stub-firmware-am62x-gp.signed.bin"
-- 
2.17.1


