Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A687C47079
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:33:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19555.1704443613668235100
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klJKdiCc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4058XXxc033862
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704443613;
	bh=lkJn8vmgCRD902pmMpUjTQMo9QI8tbUHepWNGZQMOWo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=klJKdiCcwedNh0SBpZUs6fnMuMP9fEDn78g29aBe+M6KM8iU2DUXNsXze3ryw2d5k
	 EopxIrVdNLjT52R2yN+8GmdybIf/6yQloi3b6Z7cjlZx4wz9lim7TmsqZ6KwFKAMBD
	 Qtd3by1dD67IGlUCm9/I0FJcM5Lpfpp4uVzj3o9Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4058XXsK120160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:33 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:33:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:33:32 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4058XTUV115665;
	Fri, 5 Jan 2024 02:33:31 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][master][PATCH 1/2] meta-ti: powervr: add j722s support
Date: Fri, 5 Jan 2024 14:03:23 +0530
Message-ID: <20240105083324.879907-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105083324.879907-1-a-limaye@ti.com>
References: <20240105083324.879907-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17382

From: Darren Etheridge <detheridge@ti.com>

Bump srcrev to include j722s support for PowerVR components

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb      | 5 +++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb       | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index e47a1175..c87a1fa7 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
@@ -24,13 +24,14 @@ SRC_URI:append = " file://0001-build-kbuild-Makefile.template-use-SECONDARY.patc
 
 S = "${WORKDIR}/git"
 
-SRCREV = "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
+SRCREV = "64d1cac11363888b7a071b62d71b563568d483f1"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 18182590..7301c471 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -8,13 +8,13 @@ inherit bin_package
 INHIBIT_DEFAULT_DEPS = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "d0543929cc6fe53959a64c60285896e2c14ed314"
+SRCREV = "7c853b0c75b7c5c4fa30ded608588850d429f306"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
@@ -22,6 +22,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-- 
2.34.1


