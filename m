Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E44EC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 22:22:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.27993.1698445334609055924
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wVgKYZMy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMCDq071995;
	Fri, 27 Oct 2023 17:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698445332;
	bh=dB/nDZYDJuY3c5k1ArfTrI0Lmthc7XgSDvki5vx2H98=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wVgKYZMyDpYpciofhmX0WgjsXQH4BGTNNYwgLhwCU+i/CrmHVAs2xltk3Kxo3rQOh
	 ySq5Slq0b+yrDSLLOoKYJ+WzvudTEZkbfT/NCH11nEaFAo4BcJ7cc+XV3Cu2o1QHn7
	 RECQCnW9YtA5T+8uLfizyyyT6B2VKdYzFYZGEDPY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RMMCvO110712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 17:22:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 17:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 17:22:12 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMBQQ014476;
	Fri, 27 Oct 2023 17:22:12 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 3/4] ti-img-rogue-*: add am62p support
Date: Fri, 27 Oct 2023 17:21:59 -0500
Message-ID: <20231027222200.3659634-4-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027222200.3659634-1-rs@ti.com>
References: <20231027222200.3659634-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 22:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17217

From: Randolph Sapp <rs@ti.com>

Add the configuration options for am62pxx-evm.

This also adds support for new devicetree properties to override the
clock value of the device. See the kernel module modifications [1] and
dt bindings for more information.

[1] https://git.ti.com/cgit/graphics/ti-img-rogue-driver/log/?h=linuxws/kirkstone/k6.1/23.2.6460340

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb        | 3 ++-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index d46699ca..a74cc7b8 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
 
 DEPENDS = "virtual/kernel"
 
@@ -28,6 +28,7 @@ TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
+TARGET_PRODUCT:am62pxx = "am62p_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 121c4cc5..447812d3 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
 inherit bin_package
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
 
 PR = "r2"
 
@@ -19,6 +19,7 @@ TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
+TARGET_PRODUCT:am62pxx = "am62p_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-- 
2.42.0


