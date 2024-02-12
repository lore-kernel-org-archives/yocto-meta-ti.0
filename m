Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500CCC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:30:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3733.1707733805545561436
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mFsvDTgw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CAU5L9113766
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707733805;
	bh=Lc1pqTmA8TQO/RpyAa+70k5UaRKQ2iXkb0dTrDtu/yU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mFsvDTgw65lG6TdrH8gB6Mu8e7c18bEiJ5mD0Hp4u82FS4XXC9ohmWLtFfzjPzvNF
	 7D3LJRpunj+QRV78s8rHsHSV7UChEbn+7vWsDkWPArui4+awbUbHBwP1V/k6F2gG8i
	 ssUAbgnTRMjlEmJhKuSgd9RM0WLJiEZUDK6j7UAI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CAU4Eg060819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:30:05 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:30:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:30:04 -0600
Received: from uda0497581.dhcp.ti.com (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CATvBx096933;
	Mon, 12 Feb 2024 04:30:01 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [PATCH 2/2] meta-ti-bsp: trusted-firmware-arm: Update to master
Date: Mon, 12 Feb 2024 15:59:33 +0530
Message-ID: <20240212102933.4157741-2-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212102933.4157741-1-m-chawdhry@ti.com>
References: <20240212102933.4157741-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:30:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17468

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


