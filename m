Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAD0EE00546; Wed, 22 Aug 2018 18:14:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1660DE00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 18:14:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N1ENIe022127
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 20:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534986863;
	bh=PBnRF9enwBRXFtS9JIKsmUYqZodi7AzepeiKGiYGPS4=;
	h=From:To:CC:Subject:Date;
	b=quaKj5CldkWxePodXVB7zw7db9d874BegcQ5rjZGtFCkuujvLwq9IOZMz5oa9zmOc
	Ise9bSM/VVvBXWgHTfD2Tc43HETOx7d4NNuyHxVZ0F6b6g6F30CKsoe9hnQVaCz4vU
	i80KlKaSmQBa542bWsc4ZtChjQRyualQYPiJKg5w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N1ENiB018808
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 20:14:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 20:14:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 20:14:23 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N1EMAI021479;
	Wed, 22 Aug 2018 20:14:23 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 22 Aug 2018 21:14:21 -0400
Message-ID: <1534986861-46264-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v4 1/4] ti-pdk-build-rtos: Update to new version 1.0.0.10
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
X-List-Received-Date: Thu, 23 Aug 2018 01:14:24 -0000
Content-Type: text/plain

Add support for am65xx-evm
Removes doxygen patch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version
Removed patch file
---

ti-pdk-build-rtos: Remove patch
---
 ...mk-Allow-doxygen-support-to-be-overridden.patch | 50 ----------------------
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   | 10 ++---
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
deleted file mode 100644
index 2a10d37..0000000
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e5dfce58161aaee80ca45c3e992a059efac459d7 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Wed, 21 Feb 2018 13:38:35 -0600
-Subject: [PATCH] comp_mk: Allow doxygen support to be overridden
-
-Support for Doxygen can be globally disabled by setting the
-DOXYGEN_SUPPORT environment variable to "no"
-
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- comp_top.mk | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/comp_top.mk b/comp_top.mk
-index 28700ba..e331132 100644
---- a/comp_top.mk
-+++ b/comp_top.mk
-@@ -114,6 +114,11 @@ comp_FIRM_LIST_CLEAN = $(addsuffix _clean, $($(COMP)_FIRM_LIST))
- comp_PKG_LIST_ALL_CLEAN = $(addsuffix _clean, $(comp_PKG_LIST_ALL))
- comp_PKG_LIST_PACKAGE = $(addsuffix _package, $(comp_PKG_LIST_ALL))
- 
-+# If the component enables doxygen, this will evaluate to "yesyes" and doxygen
-+# will be built. If this value is overridden by the user to any other value, or
-+# $(COMP)_DOXYGEN_SUPPORT is not "yes", doxygen is not built.
-+DOXYGEN_SUPPORT ?= yes$($(COMP)_DOXYGEN_SUPPORT)
-+
- .PHONY : apps appcores app_clean clean_appcores \
-          lib libcores lib_allendians lib_clean clean_libcores clean_lib_allendians  \
-          all comp_libs comp_libs_clean examples examples_clean clean package $(comp_PKG_LIST_ALL) \
-@@ -230,7 +235,7 @@ xdc_meta_clean:
- 	$(XDC) clean XDCBUILDCFG=config_mk.bld
- 
- doxygen:
--ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
-+ifeq ($(DOXYGEN_SUPPORT),yesyes)
- 	$(ECHO) Creating Doxygen API guide ...
- 	@doxygen docs/Doxyfile
- else
-@@ -238,7 +243,7 @@ else
- endif
- 
- clean_doxygen:
--ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
-+ifeq ($(DOXYGEN_SUPPORT),yesyes)
- 	$(ECHO) cleaned Doxygen API guide ...
- 	$(RM) -rf docs/doxygen
- else
--- 
-2.14.3
-
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index c838d71..2ca4bc3 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,25 +4,24 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.09A"
+PV = "01.00.00.10"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.09A"
-PDK_BUILD_SRCREV = "4870d6cfcab92dfedae8ed28054fdc61169e28b1"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.10"
+PDK_BUILD_SRCREV = "f06835474e51a5fd63cf23bab0d2f42b0f73f19d"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "\
     ${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH} \
-    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch \
     "
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
@@ -41,3 +40,4 @@ do_install() {
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
+INSANE_SKIP_${PN} += " file-rdeps"
-- 
1.9.1


