Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3370.1637378775148367279
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E77A40BEA
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97cnQNxkE1Yo for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 497C340C5F
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1371F1746D5
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 09/26] recipes: update github SRC_URIs
Date: Fri, 19 Nov 2021 22:25:54 -0500
Message-Id: <1637378771-24987-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

https://github.blog/2021-09-01-improving-git-protocol-security-github/

GitHub is deprecating unauthenticated protocols, including git:// so update
SRC_URIs with protocol=https

Explicitly pass branch=master where omitted, as bitbake now requires it.

While at it, update libion to the latest to eliminate upstreamed patch.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...NUInstallDirs-module-to-detect-install-pa.patch | 48 ----------------------
 recipes-devtools/ion/libion_git.bb                 |  6 +--
 .../beagleboard/beaglebone-getting-started.bb      |  2 +-
 3 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch

diff --git a/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch b/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch
deleted file mode 100644
index bf63ed3..0000000
--- a/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 51eece2c291e121f9ae67c9b812617b885e76a64 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Dec 2019 20:31:52 -0800
-Subject: [PATCH] cmake: Use GNUInstallDirs module to detect install paths
-
-This helps it to calculate directories as per platform instead of
-hardcoding them, helps compile it for arches which use /lib64 and
-/usr/lib64 for libpaths
-
-Upstream-Status: Submitted [https://github.com/glneo/libion/pull/2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6e5928c..5b7c0de 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,6 +3,8 @@ PROJECT(ion)
- set(PROJECT_DESCRIPTION "ION Userspace Memory Allocator Library")
- set(PROJECT_VERSION 1.0.0)
- 
-+INCLUDE(GNUInstallDirs)
-+
- add_library(ion
- 	SHARED
- 		src/libion.c
-@@ -23,12 +25,12 @@ target_include_directories(ion
- configure_file(libion.pc.in libion.pc @ONLY)
- 
- install(TARGETS ion
--	LIBRARY DESTINATION lib
--	PUBLIC_HEADER DESTINATION include/ion)
-+	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ion)
- 
- install(DIRECTORY include/kernel-headers/4.19/
--	DESTINATION include
-+	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
- 	FILES_MATCHING PATTERN "*.h")
- 
- install(FILES ${CMAKE_BINARY_DIR}/libion.pc
--	DESTINATION lib/pkgconfig)
-+	DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
--- 
-2.24.1
-
diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
index 4cf03af..f5ca8e8 100644
--- a/recipes-devtools/ion/libion_git.bb
+++ b/recipes-devtools/ion/libion_git.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PV = "1.0.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH} \
-           file://0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch \
-          "
-SRCREV = "813bd63e2f2118e17cb1c5d38505a1e572a2381c"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=https;branch=${BRANCH}"
+SRCREV = "7e138fc31febbb67734792c1a911439bfd6d23eb"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
index 303b9bd..25538ac 100644
--- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -8,7 +8,7 @@ LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6f02761e31334c48f7021fb94c89aaa"
 
 SRCREV = "05bedba192646152b7bc80b0accaea75aef864e5"
-SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
+SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

