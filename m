Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055C1C7EE21
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:08:04 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4093.1682629675950602683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hAWAhZmY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7r8d069990;
	Thu, 27 Apr 2023 16:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682629673;
	bh=t5CCJfILn64rVgmcrLibwe5k2FFR6dodGtu0gI3WCr8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hAWAhZmY5KGhsIQ21umLJmx5qruyd8MwBYQT3mrt/lgFqFSKPuMJRMnsdh3lIJja9
	 Jjtl0s333ecxVgZT/9NTs2YCj43rCG7yA6HFWDvGKOmC9XGT/xA8951Z6EnK7gKGgQ
	 nEslLNhcFwQd0ZxcfBWMYJKsmKvNB8V7LeDW9u4M=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RL7r2q005175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:07:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:07:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:07:52 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7k8Y002940;
	Thu, 27 Apr 2023 16:07:52 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 1/4] ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
Date: Thu, 27 Apr 2023 16:07:43 -0500
Message-ID: <20230427210746.1915362-2-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427210746.1915362-1-rs@ti.com>
References: <20230427210746.1915362-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:08:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16447

From: Randolph Sapp <rs@ti.com>

Update the source revision for the following upstream changes:
	- Drop the included ICD loader. Use the Mesa/Khronos one
	  instead.
	- Enable all vulkan window system extensions

Separate the vulkan libs into their own package so people can choose to
ignore them if they want, considering the new runtime deps.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
index 3ad0cce6..9068d341 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "49958a8e820a321d22ac3c635bd21d4a3118c006"
+SRCREV = "452b0f50d2984171c81d5a0d3b22198177d919ad"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
@@ -30,14 +30,29 @@ do_install:append() {
         rmdir ${D}/lib
     fi
     rm -rf "${D}/etc/init.d"
-    rm -rf "${D}/usr/lib/libvulkan.so"
-    rm -rf "${D}/usr/lib/libvulkan.so.0"
-    rm -rf "${D}/usr/lib/libvulkan.so.1"
 }
 
-PACKAGES = "${PN}-tools ${PN}"
+PACKAGES = "${PN}-vulkan ${PN}-tools ${PN}"
+
+FILES:${PN}-vulkan = " \
+    ${datadir}/vulkan \
+    ${libdir}/libVK_IMG.so* \
+"
+RDEPENDS:${PN}-vulkan += " \
+    mesa-vulkan-drivers \
+    libdrm \
+    ti-img-rogue-driver \
+    libx11-xcb \
+    wayland \
+"
+INSANE_SKIP:${PN}-vulkan += " \
+    already-stripped \
+    dev-so \
+"
+
 FILES:${PN}-tools = "${bindir}/"
 RDEPENDS:${PN}-tools = "python3-core"
-RRECOMMENDS:${PN} += "${PN}-tools"
+
+RRECOMMENDS:${PN} += "${PN}-vulkan ${PN}-tools"
 
 INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"
-- 
2.40.0


