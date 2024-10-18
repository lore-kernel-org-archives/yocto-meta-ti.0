Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8305D3C53E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 00:56:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12517.1729212988360079573
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 17:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yp+SbdTg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49I0uOYQ107422;
	Thu, 17 Oct 2024 19:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729212985;
	bh=aVIwW9ywdgAb4wSTs+4bGo3NmLKR2CYnirw/El++EyU=;
	h=From:To:CC:Subject:Date;
	b=yp+SbdTg2aZHpx7aqik22/yDX4kxAsmHPN2nxtstIS5/La1KZHPHVNe/gfyE8x1jk
	 Wvgyuhwsl2KfXsc/MEcaMl1jIqtUWTalXR9RFqyot25QskgviVXnnGHX8uK/K5k6/s
	 AMAv/lcpFGHpe9/dmRFQZm7M24vQW+NX8vl4zSA4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49I0uONX100579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Oct 2024 19:56:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 19:56:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 19:56:24 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49I0uOiS068000;
	Thu, 17 Oct 2024 19:56:24 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>, <mike@mdb977.de>
Subject: [meta-ti][kirkstone][PATCH] sgx: breaking things to fix other things
Date: Thu, 17 Oct 2024 19:56:02 -0500
Message-ID: <20241018005602.225710-1-rs@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Oct 2024 00:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18018

From: Randolph Sapp <rs@ti.com>

We got a bit more time to do a proper migration this time. A discovery
period to see what actually works and boy, it wasn't much.

This update resolves issues with:

	- Macro redefinition
	- Sparse NPOT texture allocations
	- vec4 reductions
	- Mesa image extensions
	- Buffer allocations under weston
	- Devices with both a RENDER and PRIMARY display node
	- Underprivileged users being unable to allocate buffers
	- Removed call to drm_map_legacy
	- Replace deprecated kernel calls
	- Fix some cache attributes for userspace allocations
	- About 40 other various errors and warnings

This core was never fully GLES2 conformant. In fact, if you try to run
cts on any of the older releases you'll find yourself in a hardware
recovery loop pretty quickly. We've gotten it to about 94.2% conformance
with these patches.

There are still dragons here, but they are at least a little more
manageable.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb            | 2 +-
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index ca28ae76..82b26595 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "2cb2c9609b7740cb2c348e669a96f26e1cc858da"
+SRCREV = "652ae16657cc4acda664e669d0c9b4891252f37f"
 
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:ti33x = "ti335x_linux"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 5abd0793..bad022d6 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
+SRCREV = "c9f0919367589b38f5682183846de9d60eec082d"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index d2565318..98bdec08 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
 SRC_URI = " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
 "
-SRCREV = "70364424dd496833fad5b243c9e6cc8b077f04ac"
+SRCREV = "84a396a4fb379f10931421e489ac8a199d6a9f2c"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.46.0


