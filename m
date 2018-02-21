Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91FD7E00E4C; Wed, 21 Feb 2018 13:53:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FB57E00E42
	for <meta-ti@yoctoproject.org>; Wed, 21 Feb 2018 13:53:20 -0800 (PST)
Received: by mail-it0-f43.google.com with SMTP id d10so4065790itj.2
	for <meta-ti@yoctoproject.org>; Wed, 21 Feb 2018 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9OciHSFi9Ir5b9Zv8FIblr3ffqq2piUDBGJ8dHrUJBk=;
	b=WD1Hm1g3RV1GOhn0A3Sxmo1/GSkzGFuANkz+YfMKU3vh+nLOEsyGDwj7BeIZ8eR0dQ
	EKT76vXKqByDUKcreV0ZHivuucr7it5cbjBWrEkLHyzCiWwH/w3VbnA8b81THFo8UVEJ
	Bb0K46KMzmCdTyTDXbma/sJPHeNriOx88HIb7IYaPUgStipgrXT5lUNsBFZKVDmZIn40
	MC3395HvbQ3CxS31Kt3fBvDDLmI8WWz3RouO8y2b8UmJMNCkBSaM23rXBUP4bpTi/4yT
	P29oRRYuKwyvG4id3NlzHmzJQ8a3zlQG6K+xE4PbLQUxLLYOlMNNAnDTaNU11LZWof+W
	M7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9OciHSFi9Ir5b9Zv8FIblr3ffqq2piUDBGJ8dHrUJBk=;
	b=nUx9RRRp8oUKwJdgVXME7/2eSNx+2kVzMpb6MqD5XQVSCt5OzR+p9kMHZ32lUXMqxq
	CiBUqfRsHdBLNJKIcBOIqgmTIat4Jl8ADhIgyC+pqlR66rBTWhxMaXjRCBlpsjEn5u3u
	WFgwM4+aCQ0yIT5U5kb98a3G7LKsABkoVn1O5xrHnPleHRDF/cuUSpxhHz/KH9vU6/k6
	/F4k/XlGVWyaeyWPd3SsoT51HKKbKmbryjnC/EkjbeqD5o18wNkl5VPbId5kuXoR2Wpo
	+7gRZjriZCCHmWusGnumBCSoUNNQKRzck85KZhtq8+XQiMSxfAfy5WZ0PxaAbhu0dFsH
	59jA==
X-Gm-Message-State: APf1xPDbZRmydnZfFjDKxHnIaVCbwrirAUAelXXeRXTiDmkB6uWcuqk5
	fxVDR629IkjVaLvNcXxAS+1OmmrR
X-Google-Smtp-Source: AH8x2251jDn/nube+PicYZTxWg3YxbPo/CQ6ox1LKSQZ0end5Swm6i0Px9IqrHfBkqtoo7C50Z9gvw==
X-Received: by 10.36.218.5 with SMTP id z5mr5422048itg.30.1519249999427;
	Wed, 21 Feb 2018 13:53:19 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y81sm9379273ioy.29.2018.02.21.13.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 13:53:18 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 21 Feb 2018 15:53:05 -0600
Message-Id: <20180221215305.19734-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [morty/rocko/master][PATCH] ti-pdk: Allow Doxygen generation to be optional
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
X-List-Received-Date: Wed, 21 Feb 2018 21:53:21 -0000

Users can choose to completely disable doxygen generation in pdk recipes
by setting TI_PDK_DOXYGEN_SUPPORT = "0" in local.conf

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/ti-pdk.bbclass                             |  7 +++
 ...mk-Allow-doxygen-support-to-be-overridden.patch | 50 ++++++++++++++++++++++
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |  5 ++-
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index ab730a90..540a665c 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -59,17 +59,24 @@ TI_PDK_LIMIT_SOCS ?= ""
 TI_PDK_LIMIT_BOARDS ?= ""
 TI_PDK_MAKE_TARGET ?= "release"
 TI_PDK_EXTRA_MAKE ?= ""
+TI_PDK_DOXYGEN_SUPPORT ?= "1"
 
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
 PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
 PARALLEL_MAKE = ""
 
+def get_doxygen_support(d):
+    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) == '1':
+        return ''
+    return 'DOXYGEN_SUPPORT=no'
+
 EXTRA_OEMAKE = " \
     LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
     LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
     LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
     ${TI_PDK_EXTRA_MAKE} \
+    ${@get_doxygen_support(d)} \
 "
 
 do_configure() {
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
new file mode 100644
index 00000000..2a10d37e
--- /dev/null
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
@@ -0,0 +1,50 @@
+From e5dfce58161aaee80ca45c3e992a059efac459d7 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Wed, 21 Feb 2018 13:38:35 -0600
+Subject: [PATCH] comp_mk: Allow doxygen support to be overridden
+
+Support for Doxygen can be globally disabled by setting the
+DOXYGEN_SUPPORT environment variable to "no"
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ comp_top.mk | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/comp_top.mk b/comp_top.mk
+index 28700ba..e331132 100644
+--- a/comp_top.mk
++++ b/comp_top.mk
+@@ -114,6 +114,11 @@ comp_FIRM_LIST_CLEAN = $(addsuffix _clean, $($(COMP)_FIRM_LIST))
+ comp_PKG_LIST_ALL_CLEAN = $(addsuffix _clean, $(comp_PKG_LIST_ALL))
+ comp_PKG_LIST_PACKAGE = $(addsuffix _package, $(comp_PKG_LIST_ALL))
+ 
++# If the component enables doxygen, this will evaluate to "yesyes" and doxygen
++# will be built. If this value is overridden by the user to any other value, or
++# $(COMP)_DOXYGEN_SUPPORT is not "yes", doxygen is not built.
++DOXYGEN_SUPPORT ?= yes$($(COMP)_DOXYGEN_SUPPORT)
++
+ .PHONY : apps appcores app_clean clean_appcores \
+          lib libcores lib_allendians lib_clean clean_libcores clean_lib_allendians  \
+          all comp_libs comp_libs_clean examples examples_clean clean package $(comp_PKG_LIST_ALL) \
+@@ -230,7 +235,7 @@ xdc_meta_clean:
+ 	$(XDC) clean XDCBUILDCFG=config_mk.bld
+ 
+ doxygen:
+-ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
++ifeq ($(DOXYGEN_SUPPORT),yesyes)
+ 	$(ECHO) Creating Doxygen API guide ...
+ 	@doxygen docs/Doxyfile
+ else
+@@ -238,7 +243,7 @@ else
+ endif
+ 
+ clean_doxygen:
+-ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
++ifeq ($(DOXYGEN_SUPPORT),yesyes)
+ 	$(ECHO) cleaned Doxygen API guide ...
+ 	$(RM) -rf docs/doxygen
+ else
+-- 
+2.14.3
+
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 0999b5c5..fbb82ace 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -15,7 +15,10 @@ PDK_BUILD_GIT_BRANCH = "master"
 PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
-SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
+SRC_URI = "\
+    ${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH} \
+    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch \
+    "
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-- 
2.14.3


