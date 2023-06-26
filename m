Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D4EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:41:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.770.1687797691321805789
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 09:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tERtxlnD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QGfRTD092346;
	Mon, 26 Jun 2023 11:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687797687;
	bh=pUD65kX79jLbEwAGYifuJAoRu6c9MgeArnXB5vbbzng=;
	h=From:To:CC:Subject:Date;
	b=tERtxlnD7k7PYqu04kImlH5G978+gfinmecxaKgf2SnPcJEtg4LJc8AaII7R9dfyy
	 pPXYY6rG/b+9cAaFAQGaaoXWVwRxw49VBK4SQW8faSe35JRQyhLKGI09UbTNAppZRy
	 sG3TAdS2YTtRw/YxRoHDrAxwrjpAQ5snhK9bHBI0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QGfRPV048093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jun 2023 11:41:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 11:41:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 11:41:27 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QGfRXs127563;
	Mon, 26 Jun 2023 11:41:27 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <khasim@ti.com>, <a-limaye@ti.com>, <p-bhagat@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: absolute path for file globs
Date: Mon, 26 Jun 2023 11:41:10 -0500
Message-ID: <20230626164110.3429997-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Jun 2023 16:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16790

From: Randolph Sapp <rs@ti.com>

Edit the file paths so they point at files in the source directory
explicitly. For some reason shell glob were previously only respected by
some machines.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 9f129c9d..12acc695 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -40,36 +40,37 @@ PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
 def get_file_list(package_list_var, d):
     file_list = []
     package_list = d.getVar(package_list_var)
+    prefix = f"{d.getVar('S')}/"
     if package_list:
         for package in package_list.split():
-            package_files = d.getVar(f"FILES:{package}")
-            if package_files:
-                file_list.append(package_files)
+            package_file_string = d.getVar(f"FILES:{package}")
+            if package_file_string:
+                for package_file in package_file_string.split():
+                    file_list.append(f"{prefix}{package_file}")
     return " ".join(file_list)
 
-do_install:append() {
+do_install:prepend() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
-        for file in ${@get_file_list('GLES_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
+            rm -rf ${file}
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
         for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${file}
         done
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
         for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
-            rm -rf ${D}/${file}
-            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
+            rm -rf ${file}
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
-        rmdir ${D}/lib
+        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
     fi
+
+    # clean up any empty directories
+    find "${S}" -empty -type d -delete
 }
 
 GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
-- 
2.41.0


