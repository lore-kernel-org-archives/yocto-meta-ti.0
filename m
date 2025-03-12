Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1019AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 21:38:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.269.1741815507190766390
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 14:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fp1Xkbdr;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CLcOA51142287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 16:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741815504;
	bh=OdIoBaYy/cUXfui64cU0v0ANHQBgFZ16xzLLWlpYbPM=;
	h=From:To:CC:Subject:Date;
	b=fp1XkbdrQVOnjK35+NaAlJMUrNDPRbR6PFZeKGjModc/P6a0jfm8uEyY4BjUGrkTa
	 bi+zQV1VhG6VYyPLUmANY5wUHL4A+bECswOanhZ61u+14GJvF/B6o1ZA5fqsxnyIEW
	 tdduYMWDWaiiCxY6sokWU2lwOduIDwT3iUf5Ddd4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CLcODa080984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 16:38:24 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 16:38:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 16:38:24 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CLcO3d037469;
	Wed, 12 Mar 2025 16:38:24 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-umlibs: ship module blacklist
Date: Wed, 12 Mar 2025 16:38:03 -0500
Message-ID: <20250312213803.1160562-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Mar 2025 21:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18374

From: Randolph Sapp <rs@ti.com>

Well, this is the evil vendor driver. Time to start acting like it.
Blacklist the upstream powervr module if this driver is present.

This patch also does away with the bin_package components. It was cool
and found some interesting bugs, but we might as well start leveraging
that Makefile more now that we're starting to get some more common
files between devices.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_24.2.6643903.bb       | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
index b8153711..565e92eb 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
@@ -3,19 +3,15 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
-inherit bin_package
-
-INHIBIT_DEFAULT_DEPS = ""
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
-S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
+SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
+S = "${WORKDIR}/git"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
@@ -54,7 +50,12 @@ def get_file_list(package_list_var, d):
                     file_list.append(f"{prefix}{package_file}")
     return " ".join(file_list)
 
-do_install:append() {
+EXTRA_OEMAKE += 'BUILD=${PVR_BUILD} TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
         for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
             rm -rf ${file}
@@ -78,6 +79,9 @@ do_install:append() {
 
     # clean up any empty directories
     find "${D}" -empty -type d -delete
+
+    # fix permissions
+    chown -R root:root "${D}"
 }
 
 GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
@@ -141,6 +145,9 @@ INSANE_SKIP:${PN}-tools = "ldflags"
 FILES:${PN}-firmware = "${base_libdir}/firmware/*"
 INSANE_SKIP:${PN}-firmware += "arch"
 
+# common libraries
+FILES:${PN} = "${libdir}"
+
 RRECOMMENDS:${PN} += " \
     ${PN}-tools \
 "
-- 
2.48.1


