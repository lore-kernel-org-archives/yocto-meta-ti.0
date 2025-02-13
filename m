Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F62CC021AA
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.8734.1739490505281564634
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RgCqs0+S;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOpV838148
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=6NmxJrxLSCmatH/gubmVyNDX2DP1TVNwk/Y1rQfKVWw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RgCqs0+SbFELs7gNJjCLu4jgk36SSMJjEhnudrOaWFZK6vvNQ3YujK0BeWEbFf42k
	 FRgBtRU8DhTxbf/mhWwazsN7T4Shf471To5w6H0O/r2KJ8zzKbxqbJ16hAVz8SCb6c
	 xoZfETccEcwgZ19iKiAFFld/rxYynWcWx6F4IXEo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmO5u087688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcP056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 4/7] ti-img-rogue-umlibs: filter binaries post install
Date: Thu, 13 Feb 2025 17:48:10 -0600
Message-ID: <20250213234813.3618729-5-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18311

From: Randolph Sapp <rs@ti.com>

No reason to do this pre install now that my python function can
evaluate file paths. Also, this may have been causing issues with state
when attempting to switch between opencl enabled/disabled builds.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
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
2.48.1


