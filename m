Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F2FC02183
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 01:00:59 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2946.1737162052817363360
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 17:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XfuYRP2y;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10gZk274822
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Jan 2025 19:00:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737162042;
	bh=/pKIScUT9KZKgK8ov8PqnamOtPIgpMLbC675g8aBUXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XfuYRP2yvNi4WWF9iUJvj5AHqRfTQTzRrjXl1kRrOB+8EVan8184DTYNeKRjGg4Cd
	 HxCVh4UT0N974E9nShMWfV4uFJt6PgyT+9l6D7BlnKexcAiWLrNVTOb6RZQeP6vAFc
	 AOwle1uFVzHYEM8Jzsk9z6BkZm0OjtS8BKBenHWg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10g8j076055;
	Fri, 17 Jan 2025 19:00:42 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 19:00:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 19:00:42 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10gEX117516;
	Fri, 17 Jan 2025 19:00:42 -0600
From: <rs@ti.com>
To: <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCHv2 4/4] ti-img-rogue-umlibs: filter binaries post install
Date: Fri, 17 Jan 2025 19:00:32 -0600
Message-ID: <20250118010032.4092491-5-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118010032.4092491-1-rs@ti.com>
References: <20250118010032.4092491-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 Jan 2025 01:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18207

From: Randolph Sapp <rs@ti.com>

No reason to do this pre install now that my python function can
evaluate file paths. Also, this may have been causing issues with state
when attempting to switch between opencl enabled/disabled builds.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb | 10 +++++-----
 .../powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index 40835439..675edc14 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
 def get_file_list(package_list_var, d):
     file_list = []
     package_list = d.getVar(package_list_var)
-    prefix = f"{d.getVar('S')}/"
+    prefix = f"{d.getVar('D')}/"
     if package_list:
         for package in package_list.split():
             package_file_string = d.getVar(f"FILES:{package}")
@@ -53,7 +53,7 @@ def get_file_list(package_list_var, d):
                     file_list.append(f"{prefix}{package_file}")
     return " ".join(file_list)
 
-do_install:prepend() {
+do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
         for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
             rm -rf ${file}
@@ -70,13 +70,13 @@ do_install:prepend() {
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        if [ -e ${S}/lib/firmware ]; then
-            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        if [ -e ${D}/lib/firmware ]; then
+            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         fi
     fi
 
     # clean up any empty directories
-    find "${S}" -empty -type d -delete
+    find "${D}" -empty -type d -delete
 }
 
 GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
index 0de66b72..b8153711 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
@@ -45,7 +45,7 @@ PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
 def get_file_list(package_list_var, d):
     file_list = []
     package_list = d.getVar(package_list_var)
-    prefix = f"{d.getVar('S')}/"
+    prefix = f"{d.getVar('D')}/"
     if package_list:
         for package in package_list.split():
             package_file_string = d.getVar(f"FILES:{package}")
@@ -54,7 +54,7 @@ def get_file_list(package_list_var, d):
                     file_list.append(f"{prefix}{package_file}")
     return " ".join(file_list)
 
-do_install:prepend() {
+do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
         for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
             rm -rf ${file}
@@ -71,13 +71,13 @@ do_install:prepend() {
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        if [ -e ${S}/lib/firmware ]; then
-            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        if [ -e ${D}/lib/firmware ]; then
+            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         fi
     fi
 
     # clean up any empty directories
-    find "${S}" -empty -type d -delete
+    find "${D}" -empty -type d -delete
 }
 
 GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
-- 
2.47.1


