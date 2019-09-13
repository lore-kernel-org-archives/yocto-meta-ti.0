Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D891CE00D90; Thu, 12 Sep 2019 20:21:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74A15E003E1
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 20:21:46 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C3CF240C04;
	Fri, 13 Sep 2019 03:21:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZmoiavU-a5-j; Fri, 13 Sep 2019 03:21:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB93940BFA;
	Fri, 13 Sep 2019 03:21:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5E591173BBA;
	Thu, 12 Sep 2019 23:21:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 12 Sep 2019 23:21:44 -0400
Message-Id: <1568344904-32388-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ion: add libion and ion-tests packages for ION support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 03:21:47 -0000

ION Userspace Memory Allocator Library and tests

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-CMakeLists.txt-disable-phys-addr-for-now.patch | 34 ++++++++++++++++++++++
 recipes-devtools/ion/ion-tests_git.bb              | 18 ++++++++++++
 recipes-devtools/ion/libion_git.bb                 | 14 +++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
 create mode 100644 recipes-devtools/ion/ion-tests_git.bb
 create mode 100644 recipes-devtools/ion/libion_git.bb

diff --git a/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
new file mode 100644
index 0000000..7cf5895
--- /dev/null
+++ b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
@@ -0,0 +1,34 @@
+From 85264fc72a261d20107a50ea2fad0258900a132b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sat, 20 Apr 2019 16:54:03 +0000
+Subject: [PATCH] CMakeLists.txt: disable phys-addr for now
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ CMakeLists.txt | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1d60003..eca6ba7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -54,16 +54,3 @@ target_link_libraries(ion-print-heaps
+ target_include_directories(ion-print-heaps PUBLIC ${LIBION_INCLUDE_DIRS})
+ 
+ install(TARGETS ion-print-heaps RUNTIME DESTINATION bin)
+-
+-# phys-addr
+-
+-add_executable(phys-addr
+-	src/phys-addr.c
+-)
+-
+-target_link_libraries(phys-addr
+-	${LIBION_LIBRARIES}
+-)
+-target_include_directories(phys-addr PUBLIC ${LIBION_INCLUDE_DIRS})
+-
+-install(TARGETS phys-addr RUNTIME DESTINATION bin)
+-- 
+2.17.1
+
diff --git a/recipes-devtools/ion/ion-tests_git.bb b/recipes-devtools/ion/ion-tests_git.bb
new file mode 100644
index 0000000..831f5e8
--- /dev/null
+++ b/recipes-devtools/ion/ion-tests_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test cases for ION"
+HOMEPAGE = "https://github.com/glneo/ion-tests"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db900869a4cd31461606e55a3ec5"
+
+PV = "1.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
+	file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
+"
+SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
+
+DEPENDS = "libion gtest"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
new file mode 100644
index 0000000..7c93ed3
--- /dev/null
+++ b/recipes-devtools/ion/libion_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "ION Userspace Memory Allocator Library"
+HOMEPAGE = "https://github.com/glneo/libion"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PV = "1.0.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
+SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
2.7.4


