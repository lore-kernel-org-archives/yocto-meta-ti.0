Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D273E00DF3; Thu, 26 Sep 2019 09:02:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CA01E00D54
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:02:01 -0700 (PDT)
Received: by mail-pl1-f193.google.com with SMTP id y10so1514900plp.2
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GzVrPkVFV3t/+UdO4emRnsEIcwOm8Naf/ysyhFlX1o=;
	b=psTuOMXhIpVs6Yo+O62zXWEiRidrBiU+0dLWliKN/QKmxJ5/BVWXO/wyn0RpSuf978
	xsbhfq+1vpXuH9k6wqOT5nfYN11K+KFTdL41zoJph4y5jCiXprPzbRlFU/uX8zdAqGNV
	2oqIBXM0jODoeXCxUEnyr/H7IZ4WufuUJmnRP41aVIh5wCG4/JNeors7AWvAqgw/+nT1
	Z1LJmmkf13s+wwUyeHpQcPYTC8UB82WDTEFDHVpwS6O5oaHB41WSRTtYZV+UW2IDjlcR
	IaC0yu5Oj69LJ24ZuH5LAA4OoEoMaf5Ai6ldqlDx07EVdMJ9aECxP1YaaILGCVKvNgXm
	w5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GzVrPkVFV3t/+UdO4emRnsEIcwOm8Naf/ysyhFlX1o=;
	b=BgWCL3LMhyaB25TPDD+48NW9Y0eEVwo2d3SK5dyG3ZKIo9S9ekgBTnMBAaVBu4s+F6
	Hjk50vkBMzMLBj/fPhSwmXNPw6ZoP062uY5uW0R+HAJnMq0+m5UhoMxNfzmpgceNrdEp
	O9fq5cOGbULhg0nL/aGqZAc5FK9UUQXUkf1UI/IeGIOt7Dmj3rexRytJmyBmDrlUVNu4
	6Rz8tDH4L6WS6+bdC09F7J7HgD2r8mDwhueAlOBCZHBpJmndWtXpPb4cyP+CXNSeoduK
	QL3eZEhBoC39lmwLBKRaI0MgN7hZ3OkXPdDToSuCdbmi2HCVFu+XSEMaAmzUd3j2xljv
	oCGg==
X-Gm-Message-State: APjAAAUJMXKSVmYAszr48nynVzUHkQW3NaCgAK2xzO01/zoPurQRtd5l
	lLT0O0yKb9E/AmKAJq1/fCIXSzCmeDA=
X-Google-Smtp-Source: APXvYqyjCXGOGaJ3tYvY8b1sPvs8b5omznSgA/Q2fAiXcc6SKkZJ6FNZwRZoIDNLUaWR9DLDmJAW4A==
X-Received: by 2002:a17:902:a58a:: with SMTP id
	az10mr5017110plb.42.1569513720139; 
	Thu, 26 Sep 2019 09:02:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	q14sm6082862pgf.74.2019.09.26.09.01.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 09:01:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Sep 2019 09:01:50 -0700
Message-Id: <20190926160150.2507778-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 16:02:02 -0000
Content-Transfer-Encoding: 8bit

- New versions uses CMake and extra modules
- Correct detection of nm/ranlib/ar for LTO
- Fix build with clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
 ....h-Include-cerrno-for-errno-definiti.patch | 24 +++++++++++++
 recipes-bsp/rwmem/rwmem_1.1.bb                | 13 -------
 recipes-bsp/rwmem/rwmem_1.2.bb                | 27 +++++++++++++++
 4 files changed, 85 insertions(+), 13 deletions(-)
 create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
 create mode 100644 recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
 delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
 create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb

diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
new file mode 100644
index 00000000..79968f32
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
@@ -0,0 +1,34 @@
+From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Dec 2018 22:48:23 -0800
+Subject: [PATCH] Use CMake provided vars for ar and ranlib
+
+hardcoding them means we may not be able to cross compile the package
+reliably as build host may or may not have gcc-ar and gcc-ranlib
+installed, using the cross tools is the correct thing to do here
+
+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5e7f327..e36fca0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
+ 	if (HAS_LTO_FLAG)
+ 		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
+ 		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
+-		set(CMAKE_AR gcc-ar)
+-		set(CMAKE_RANLIB gcc-ranlib)
++		set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
++		set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
+ 	endif()
+ endif()
+ 
+-- 
+2.19.2
+
diff --git a/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
new file mode 100644
index 00000000..9f33fa5e
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
@@ -0,0 +1,24 @@
+From 9f1d52590336caeab8038cdd015294df2e5d8c1f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 1 Feb 2019 23:47:04 -0800
+Subject: [PATCH] librwmem/helpers.h: Include <cerrno> for errno definitions
+
+this is found with libc++
+
+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librwmem/helpers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librwmem/helpers.h b/librwmem/helpers.h
+index ccc6c9e..686943e 100644
+--- a/librwmem/helpers.h
++++ b/librwmem/helpers.h
+@@ -1,5 +1,6 @@
+ #pragma once
+ 
++#include <cerrno>
+ #include <string>
+ #include <vector>
+ #include <string.h>
diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
deleted file mode 100644
index 2848e1cd..00000000
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A small tool to read/write memory"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
-SRC_URI = "git://github.com/tomba/rwmem.git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 rwmem ${D}${bindir}
-}
diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
new file mode 100644
index 00000000..c4d2bc49
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV .= "+git${SRCPV}"
+
+SRCREV_rwmem = "7e5ca9802c1b8ff1f6407c19dfd0b9415501bb11"
+SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
+SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
+
+SRCREV_FORMAT = "rwmem_inih_pybind11"
+
+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
+           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
+           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
+           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
+           file://0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig python3native
+
+do_install() {
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
+}
-- 
2.23.0


