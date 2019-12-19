Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.6720.1576737371170297512
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2019 22:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DX6pOxTU;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id j11so2026702pjs.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2019 22:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2YUP41JrAcLEpshzhgnOBzgtM4d0lb3AdFCe2XosOA=;
        b=DX6pOxTU3K8Z+6eZlvXMKzoj3Heu77+XlrFR7tqQ4bjZC/1Dbfwf1fec2KTFF/rIt3
         n6VKmGjvXatQdhhRX+0j5DDqZ3Pvyha5UWInN6yhUP52FKOajBr6vtqlyQ0LwObTDx3t
         O8Up7d1QdjCuJ0ivDnH6D4KKAzQ84eVECk75D6ngRtWjzQyyIxVvNYfuSsmDkKZUnA5Z
         kQPmETjqTuPkMGRadPuoU+t+RstwVYi0Lo34c7y8lGxoCIuNWob43hnR3poQsB1CxXT+
         yLi/8zYqd2cYdZ3LYCDEHni7n7oKXFjfIZkjkY785D8L2oGh12Egd3MJuvCFbsC+4f/7
         iG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2YUP41JrAcLEpshzhgnOBzgtM4d0lb3AdFCe2XosOA=;
        b=aSaVjV0+sjIToYjYtnd3kFapgBQYwkPV7uuXEa0nqzMHcSObRf1Wz3K2XJ4LejTrdJ
         poV404lKFqW7wVQRRuq5Og5H/G2gvzmEdghyPri9Dxtk2xt1+azhkZSD7Tp8AtU3zQDY
         hLPVI2eym9ox5pQb9+BZr15O98M4Ho6zeKc8TN3d9LPa0VelMXVBNkixBPWjcnDOHfc7
         7jA7inJm4uPzNAG9MM2WzcQCl9AIdv9tr3XbSJq1MIb21W9zf+29VT39QYDUiv7DpqYT
         tpeuHYlaLx/LqSPmKlaO6H3UAuxKg0IJSUORV3HS7/oaYzzuqrArS3y+ua9UOqwudzXo
         jOpg==
X-Gm-Message-State: APjAAAW70CdssRoIBDSKipF/K742IMJ1PJGApNKr5c6+fXbZsLsuDV/g
	zM838SEo9wxVzj0LJoE40Dxdbc2XDIQ=
X-Google-Smtp-Source: APXvYqxpCnahCynRHECzpGZq93QqYJwrKK81o7DpvhVXdWwi15xoMrJu9GqZu8SLF1YTsV3XMocOjQ==
X-Received: by 2002:a17:90a:a00c:: with SMTP id q12mr7884654pjp.102.1576737369972;
        Wed, 18 Dec 2019 22:36:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
        by smtp.gmail.com with ESMTPSA id r62sm6377321pfc.89.2019.12.18.22.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 22:36:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libion: Fix build for multilibbed environment
Date: Wed, 18 Dec 2019 22:36:02 -0800
Message-Id: <20191219063602.3295137-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tallDirs-module-to-detect-install-pa.patch | 48 +++++++++++++++++++
 recipes-devtools/ion/libion_git.bb            |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch

diff --git a/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch b/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch
new file mode 100644
index 00000000..bf63ed32
--- /dev/null
+++ b/recipes-devtools/ion/libion/0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch
@@ -0,0 +1,48 @@
+From 51eece2c291e121f9ae67c9b812617b885e76a64 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2019 20:31:52 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs module to detect install paths
+
+This helps it to calculate directories as per platform instead of
+hardcoding them, helps compile it for arches which use /lib64 and
+/usr/lib64 for libpaths
+
+Upstream-Status: Submitted [https://github.com/glneo/libion/pull/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6e5928c..5b7c0de 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,6 +3,8 @@ PROJECT(ion)
+ set(PROJECT_DESCRIPTION "ION Userspace Memory Allocator Library")
+ set(PROJECT_VERSION 1.0.0)
+ 
++INCLUDE(GNUInstallDirs)
++
+ add_library(ion
+ 	SHARED
+ 		src/libion.c
+@@ -23,12 +25,12 @@ target_include_directories(ion
+ configure_file(libion.pc.in libion.pc @ONLY)
+ 
+ install(TARGETS ion
+-	LIBRARY DESTINATION lib
+-	PUBLIC_HEADER DESTINATION include/ion)
++	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ion)
+ 
+ install(DIRECTORY include/kernel-headers/4.19/
+-	DESTINATION include
++	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+ 	FILES_MATCHING PATTERN "*.h")
+ 
+ install(FILES ${CMAKE_BINARY_DIR}/libion.pc
+-	DESTINATION lib/pkgconfig)
++	DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+-- 
+2.24.1
+
diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
index 8bfe19eb..4cf03afa 100644
--- a/recipes-devtools/ion/libion_git.bb
+++ b/recipes-devtools/ion/libion_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PV = "1.0.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH} \
+           file://0001-cmake-Use-GNUInstallDirs-module-to-detect-install-pa.patch \
+          "
 SRCREV = "813bd63e2f2118e17cb1c5d38505a1e572a2381c"
 
 S = "${WORKDIR}/git"
-- 
2.24.1

