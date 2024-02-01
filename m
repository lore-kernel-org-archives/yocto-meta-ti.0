Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D126AC4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:36:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20156.1706805377208704634
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 08:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yD7dqO+d;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411GaFta035409;
	Thu, 1 Feb 2024 10:36:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706805375;
	bh=xEFkcqyiDWzjqlPklLW8kfKuJa1BPYXq6x+XH5PG2lk=;
	h=From:To:CC:Subject:Date;
	b=yD7dqO+d9L4ERDnq2O3gzfDJ9T14vB/sWlVk0gGaagfOONWRi/H54xeh1qha4EaiN
	 P27mW7vG7aVMLSIhIVkX3r/ZQLZuSKZvbh7Yf8aVc1OLP7hM6O2iCtR74aCtDiQyUp
	 +goGUAnE3M/xzE/6hOtN5H0K4ZDXaebUtu/4Ae2E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411GaFe5074181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 10:36:15 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 10:36:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 10:36:15 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411GaFc6062401;
	Thu, 1 Feb 2024 10:36:15 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone/master][PATCH] ti-img-rogue-*: version bump to 23.3.6512818
Date: Thu, 1 Feb 2024 10:36:15 -0600
Message-ID: <20240201163615.3873848-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Feb 2024 16:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17432

From: Randolph Sapp <rs@ti.com>

Migrate to version 23.3.6512818, this includes the stability updates
released in 23.2 as well as some additional modifications to help with
userspace application support, namely Chromium.

We're also dropping the x11 window system extensions from the Vulkan
libraries for now. Ideally, both x11 and wayland extensions will be
provided by mesa's vulkan-wsi-layer in the future, but currently x11
isn't supported and this just added extra complexity to the package in
Yocto.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ..._23.2.6460340.bb => ti-img-rogue-driver_23.3.6512818.bb} | 2 +-
 ..._23.2.6460340.bb => ti-img-rogue-umlibs_23.3.6512818.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.2.6460340.bb => ti-img-rogue-driver_23.3.6512818.bb} (96%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.2.6460340.bb => ti-img-rogue-umlibs_23.3.6512818.bb} (95%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
similarity index 96%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 1b21273a..bc59816a 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "2595524729c5acbabcbdee2185de64e7fcd6b36a"
+SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
similarity index 95%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index bc5a1a47..c84f9d3c 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "c2671c6eaf85ec6a1183c023bbb4d6e9e288fc10"
+SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
@@ -31,7 +31,7 @@ RDEPENDS:${PN} = " \
 "
 
 PACKAGECONFIG ?= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan x11 wayland', 'vulkan', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
 "
 
@@ -119,7 +119,7 @@ RDEPENDS:libgles2-rogue += "mesa-megadriver"
 
 # vulkan specific shared objects and configs
 FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
-RDEPENDS:libvk-rogue += "vulkan-loader libx11-xcb wayland libdrm"
+RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
 
 # opencl specific shared objects and configs
 FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
-- 
2.43.0


