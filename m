Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B76C7EE43
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:35:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6491.1686080129597470600
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Swt8tAEN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356JZRJ1060301;
	Tue, 6 Jun 2023 14:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686080127;
	bh=K02+AweeKEfaeBYTVWwxnW9WfIa0ve3cMieszgcSoIU=;
	h=From:To:CC:Subject:Date;
	b=Swt8tAENXCXT91rTgswkqwM5edsJ4Xx3yX7R0lAOMXqrFzusThq3YDgkFIVriLJ3P
	 SXaalM9X+Jzp0aoRkaR1wLy02Fb2DdO4dbI2UVC2+2Qqj9HVt8l1LUtUX7AT6Y1Zo9
	 9zVa6BvCw1DN/igd1tFuYxokA9CxXF4ayeKdqxmU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356JZRbu008204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 14:35:27 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:35:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:35:27 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356JZREN085073;
	Tue, 6 Jun 2023 14:35:27 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: drop the api specific dev packages
Date: Tue, 6 Jun 2023 14:35:25 -0500
Message-ID: <20230606193525.910177-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16679

From: Randolph Sapp <rs@ti.com>

Well, flew a bit too close to the sun on that last patch. Apparently
there are a few hidden runtime dependencies on the API devlinks that
make things like EGL upset when they aren't present.

We may circle back to this at some point but for now we're fine shipping
the devlinks in the base API packages as these links don't step on any
other package.

Fixes: 1899f5ea (ti-img-rogue-umlibs: bump version and explicitly
package, 2023-06-01)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 26090038..b166736c 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -36,11 +36,11 @@ do_install:append() {
 }
 
 PACKAGES = " \
-    libgles1-rogue libgles1-rogue-dev \
-    libgles2-rogue libgles2-rogue-dev \
-    libgles3-rogue libgles3-rogue-dev \
-    libvk-rogue libvk-rogue-dev \
-    libopencl-rogue libopencl-rogue-dev \
+    libgles1-rogue \
+    libgles2-rogue \
+    libgles3-rogue \
+    libvk-rogue \
+    libopencl-rogue \
     libopencl-rogue-tools \
     ${PN}-tools \
     ${PN}-firmware \
@@ -64,34 +64,26 @@ python __anonymous() {
         mlprefix = d.getVar("MLPREFIX")
         pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
         d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
-
-        # For -dev, the first element is both the Debian and original name
-        fullp = mlprefix + p[1] + "-rogue-dev" + suffix
-        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
 }
 
 # gles specific shared objects
-FILES:libgles1-rogue = "${libdir}/libGLESv1*.so.*"
-FILES:libgles1-rogue-dev = "${libdir}/libGLESv1*.so"
-FILES:libgles2-rogue = "${libdir}/libGLESv2*.so.*"
-FILES:libgles2-rogue-dev = "${libdir}/libGLESv2*.so"
+FILES:libgles1-rogue = "${libdir}/libGLESv1*.so*"
+FILES:libgles2-rogue = "${libdir}/libGLESv2*.so*"
 RDEPENDS:libgles1-rogue += "mesa-megadriver"
 RDEPENDS:libgles2-rogue += "mesa-megadriver"
-RDEPENDS:libgles3-rogue-dev += "libgles2-rogue-dev"
 
 # vulkan specific shared objects and configs
-FILES:libvk-rogue = "${libdir}/libVK_IMG.so.* ${datadir}/vulkan"
-FILES:libvk-rogue-dev = "${libdir}/libVK_IMG.so"
+FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
 RDEPENDS:libvk-rogue += "vulkan-loader libx11-xcb wayland libdrm"
 
 # opencl specific shared objects and configs
-FILES:libopencl-rogue = "${libdir}/libPVROCL.so.* ${sysconfdir}/OpenCL"
-FILES:libopencl-rogue-dev = "${libdir}/libPVROCL.so"
+FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
 RDEPENDS:libopencl-rogue += "opencl-icd-loader"
 RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
 FILES:libopencl-rogue-tools += "${bindir}/ocl*"
+DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
 
 # optional tools and tests
 FILES:${PN}-tools = "${bindir}/"
-- 
2.40.1


