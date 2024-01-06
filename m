Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6EBC47079
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:05:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.42774.1704513922152701325
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IWkDgF8y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40645LmO057312
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704513921;
	bh=rTiLVMdjNEeDe50z968ITN1nsDxLd7EE66ltiX9efhQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IWkDgF8yywa4SaMIrtQT5VtUfZUqwNMMZXleXuqn5o29dB+8FIqdwi8iC3YEjVjvr
	 0fy+43P7EBdaf5s1ix2SWhwA2nL1PBEkY9sNN0APwT4KAPvtICYJ1jgJSR48KNUzYx
	 94hQhE3QWZnSqYOPm3L1kzTiZqlUzbX4zVmLvI7I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40645LNR055900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:21 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:05:20 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:05:20 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40645HFn064807;
	Fri, 5 Jan 2024 22:05:19 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2 1/3] meta-ti: powervr: Bump srcrev to include j722s support
Date: Sat, 6 Jan 2024 09:35:10 +0530
Message-ID: <20240106040512.2493439-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106040512.2493439-1-a-limaye@ti.com>
References: <20240106040512.2493439-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17388

From: Darren Etheridge <detheridge@ti.com>

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb         | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index a74cc7b8..3b5d51ec 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
+SRCREV = "64d1cac11363888b7a071b62d71b563568d483f1"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 447812d3..58cd6c37 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "d0543929cc6fe53959a64c60285896e2c14ed314"
+SRCREV = "7c853b0c75b7c5c4fa30ded608588850d429f306"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.34.1


