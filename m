Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AD29E01471
	for <meta-ti@yoctoproject.org>; Wed, 10 Apr 2013 14:11:13 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ML20065G5I523F0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 10 Apr 2013 16:10:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 340802004B; Wed,
	10 Apr 2013 17:10:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 10 Apr 2013 17:10:51 -0400
Message-id: <1365628251-6295-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH][master] tune-cortexa{15, 7}: remove local tunes, already in oe-core/master
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
X-List-Received-Date: Wed, 10 Apr 2013 21:11:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/tune-cortexa15.inc | 36 ---------------------------------
 conf/machine/include/tune-cortexa7.inc  | 36 ---------------------------------
 2 files changed, 72 deletions(-)
 delete mode 100644 conf/machine/include/tune-cortexa15.inc
 delete mode 100644 conf/machine/include/tune-cortexa7.inc

diff --git a/conf/machine/include/tune-cortexa15.inc b/conf/machine/include/tune-cortexa15.inc
deleted file mode 100644
index a9a8d0d..0000000
--- a/conf/machine/include/tune-cortexa15.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
-ARMPKGARCH_tune-cortexa15 = "cortexa15"
-ARMPKGARCH_tune-cortexa15t = "cortexa15"
-ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
-TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
-
-# VFP Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
-ARMPKGARCH_tune-cortexa15hf = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf = "cortexa15"
-ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2-vfp cortexa15t2hf-vfp-neon"
diff --git a/conf/machine/include/tune-cortexa7.inc b/conf/machine/include/tune-cortexa7.inc
deleted file mode 100644
index d04aed3..0000000
--- a/conf/machine/include/tune-cortexa7.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", "-mtune=cortex-a7", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
-ARMPKGARCH_tune-cortexa7 = "cortexa7"
-ARMPKGARCH_tune-cortexa7t = "cortexa7"
-ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
-TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
-TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
-
-# VFP Tunes
-AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
-ARMPKGARCH_tune-cortexa7hf = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2-vfp cortexa7t2hf-vfp-neon"
-- 
1.8.1.5


