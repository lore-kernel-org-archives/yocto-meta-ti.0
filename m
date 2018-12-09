Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 044DDE00C31; Sat,  8 Dec 2018 23:59:16 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EFCAE00C12
	for <meta-ti@yoctoproject.org>; Sat,  8 Dec 2018 23:59:14 -0800 (PST)
Received: by mail-pg1-f194.google.com with SMTP id 70so3552859pgh.8
	for <meta-ti@yoctoproject.org>; Sat, 08 Dec 2018 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h8YtYqFNjm8o0LCagcRks6KgBvRjxGfbmO6zK/wZ/DM=;
	b=tS7/TsHva9TEySIxzlJzTGIz7jlEpcf0P3GZ47TNnkYjIOH6FS4CKR2ugs8p3XxD4q
	mzfO/TPJ9opuA/aITGLEViEA0wN6tQAoBV6y6qlsndA5uaxXu+yZkUW1UVdlXuynKwOc
	WKzC5RsDrvbf854iykgfnxyyr1lMGhoUOV1iYKfnDFZjqs6b+7xHnpGQr+ygWjKJ2CtJ
	JkUKQgBRoTvAh9lzUOaxDsjYHP3+ugcgSgn2fJaiW3ZCi+HSjcR1i6PJB+bISSYu+AxT
	NhZA6V++WMqQ7GkEF/ZKTuHzNh7vzbF2MiTGJAL3NH/rBg8yAsadUiYFUk0bekXJ4E9F
	xYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h8YtYqFNjm8o0LCagcRks6KgBvRjxGfbmO6zK/wZ/DM=;
	b=cV60Phxvg6zGCWz/hZYeJnevxbhZ2tpltmIU+gar+ibrLNfjS5D7rRc3P17s2YUaY2
	DZ502vYUjh+ywT8d8TNMQD6zzPVVph+g00ASa69tJwIuTLt2XuQ28vXtK02GBQ4ngI1F
	m88nYhlwFNgvLlQUBYxkRcLyHtbYE1KI8E9d7VWTDBJsmXRktHlEifFvECSnnF/OmxrN
	5EIo5GKXAubY4mJaGq0pyK97P9rlESHapSO7y1f9kdZKxl5AYwsPN7UUj9NV1yFZI9n2
	Ych3fWyRKBD13BYT8Mgt1gPQWHdp3MvRQ5xOqTATL/5jEovEQvuCpFGrTZRadFUQEyOR
	nUIQ==
X-Gm-Message-State: AA+aEWb/G4TO/tWIwBXkqYDW/ud7JkTzD7mHM0IqpDrkz4yWSGFenlrq
	ICA3HtpXId5iWFqGdED5CPGQJ3EWjRI=
X-Google-Smtp-Source: AFSGD/XQDu7a2v1l0YIMZ999ZfADG2ySNvTc67kTl53GMWgVn3BCYbmWd75oxqzAUaU7BrPhGdPoFA==
X-Received: by 2002:a63:4926:: with SMTP id w38mr6839344pga.353.1544342353721; 
	Sat, 08 Dec 2018 23:59:13 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id w3sm10860004pge.8.2018.12.08.23.59.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Dec 2018 23:59:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat,  8 Dec 2018 23:59:01 -0800
Message-Id: <20181209075901.18421-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH V2] rwmem: Update to latest
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
X-List-Received-Date: Sun, 09 Dec 2018 07:59:16 -0000
Content-Transfer-Encoding: 8bit

New versions use CMake
Correct detection of nm/ranlib/ar for LTO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix nm/ar/ranlib detection needed for LTO

 ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
 recipes-bsp/rwmem/rwmem_1.1.bb                | 14 +++++---
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch

diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
new file mode 100644
index 00000000..d72f427d
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
+Upstream-Status: Pending
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
diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
index 2848e1cd..62c33a3b 100644
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -2,12 +2,18 @@ SUMMARY = "A small tool to read/write memory"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
-SRC_URI = "git://github.com/tomba/rwmem.git"
+SRCREV = "ad00619005654f9cde5c2ea2ed2277d1d3ad2f26"
+SRC_URI = "gitsm://github.com/tomba/rwmem.git \
+           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
+          "
 
 S = "${WORKDIR}/git"
 
+inherit cmake pkgconfig
+
+DEPENDS += "python3"
+
 do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 rwmem ${D}${bindir}
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
 }
-- 
2.19.2


