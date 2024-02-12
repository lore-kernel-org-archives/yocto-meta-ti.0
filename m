Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAFAC4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:37:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3808.1707734272452371007
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eBO4Xj2U;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbpKa097056
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707734271;
	bh=Lc1pqTmA8TQO/RpyAa+70k5UaRKQ2iXkb0dTrDtu/yU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eBO4Xj2U9IIAvT4J4+L8wc8CO/6n2+6trYI+91tao9aRmt7AitQg/ndS1CygoJUHS
	 1wWMEHDtGjLJUv94T64cBwMQIogwFcqRTjy+K3T0vClxq1WI1rCTxv9Nz0JP+0Oec+
	 MDNJgV2nSWFnZm8D9mBDoHmnovkeiOa/NYTdlWqg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CAbpLr050370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:51 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:37:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:37:51 -0600
Received: from uda0497581.dhcp.ti.com (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbfmq105511;
	Mon, 12 Feb 2024 04:37:48 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/2] meta-ti-bsp: trusted-firmware-arm: Update to master
Date: Mon, 12 Feb 2024 16:07:37 +0530
Message-ID: <20240212103737.4161809-3-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212103737.4161809-1-m-chawdhry@ti.com>
References: <20240212103737.4161809-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17471

The current master has the support for power off functionality, update
to that.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index b27870051a1b..fb161726f8c3 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
-PV:k3 = "2.9+git${SRCPV}"
-SRCREV_tfa:k3 = "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"
+PV:k3 = "2.10+git${SRCPV}"
+SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
-- 
2.43.0


