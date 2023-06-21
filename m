Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1520EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 18:26:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6273.1687371982074240736
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 11:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eVbPriu8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LIQGKC032332;
	Wed, 21 Jun 2023 13:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687371976;
	bh=cwqOEkddIKKGh6tajQruTZNq8fO0QAm7fLO/3jHisWk=;
	h=From:To:CC:Subject:Date;
	b=eVbPriu8IcU/XYFevH8qSB5g+0TAGfSJ8nWYqmVbqHb9myAlMLOIgRbmSWMRxQHNk
	 nkZ87PUD4DzXLC3kRhYtXgUKn15706ve7ghIcQy2Kao/J97INRpYTiwWOUEk/oN9GX
	 4n1o7MjXhrtRPXlG6PYEfwOOGAu90vch6LhGyIY0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LIQG3N009992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 13:26:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 13:26:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 13:26:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LIQF8L100029;
	Wed, 21 Jun 2023 13:26:15 -0500
From: <rs@ti.com>
To: <d.schultz@phytec.de>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: make all components optional
Date: Wed, 21 Jun 2023 13:26:04 -0500
Message-ID: <20230621182604.276697-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 18:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16764

From: Randolph Sapp <rs@ti.com>

Bumping into the limitations of the binary_package class. This change
allows all rogue components to be optionally packaged without blowing
out the dependency chain.

Add a python function to fetch file paths from the FILE vars for each
component so we don't end up double tracking files. Add variables to
track component packages if things split up more later. Add a package
config string to set runtime dependencies and recommendations. Change
all logic to revolve around the PACKAGECONFIG instead of distro
features.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 58 ++++++++++++++++---
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index b166736c..c012859f 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -28,20 +28,63 @@ RDEPENDS:${PN} = " \
     ${PN}-firmware \
 "
 
+PACKAGECONFIG ?= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan x11 wayland', 'vulkan', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
+"
+
+PACKAGECONFIG[opengl] = ",,,${GLES_LIB_PACKAGES}"
+PACKAGECONFIG[vulkan] = ",,,${VULKAN_LIB_PACKAGES}"
+PACKAGECONFIG[opencl] = ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-tools"
+
+def get_file_list(package_list_var, d):
+    file_list = []
+    package_list = d.getVar(package_list_var)
+    if package_list:
+        for package in package_list.split():
+            package_files = d.getVar(f"FILES:{package}")
+            if package_files:
+                file_list.append(package_files)
+    return " ".join(file_list)
+
 do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
+        for file in ${@get_file_list('GLES_PACKAGES', d)}; do
+            rm -rf ${D}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
+        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
+            rm -rf ${D}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
+        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
+            rm -rf ${D}/${file}
+            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+        done
+    fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
         mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         rmdir ${D}/lib
     fi
 }
 
+GLES_LIB_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
+GLES_PACKAGES = "${GLES_LIB_PACKAGES}"
+
+VULKAN_LIB_PACKAGES = "libvk-rogue"
+VULKAN_PACKAGES = "${VULKAN_LIB_PACKAGES}"
+
+OPENCL_LIB_PACKAGES = "libopencl-rogue"
+OPENCL_PACKAGES = "${OPENCL_LIB_PACKAGES} libopencl-rogue-tools"
+
 PACKAGES = " \
-    libgles1-rogue \
-    libgles2-rogue \
-    libgles3-rogue \
-    libvk-rogue \
-    libopencl-rogue \
-    libopencl-rogue-tools \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKAGES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
     ${PN}-tools \
     ${PN}-firmware \
     ${PN} \
@@ -94,9 +137,6 @@ FILES:${PN}-firmware = "${base_libdir}/firmware/*"
 INSANE_SKIP:${PN}-firmware += "arch"
 
 RRECOMMENDS:${PN} += " \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libgles1-rogue libgles2-rogue", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan x11 wayland", "libvk-rogue", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opencl", "libopencl-rogue", "", d)} \
     ${PN}-tools \
 "
 
-- 
2.41.0


