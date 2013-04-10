Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61ACAE01473
	for <meta-ti@yoctoproject.org>; Wed, 10 Apr 2013 14:11:28 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ML20027D5IFK0N0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 10 Apr 2013 16:11:03 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 10FFE2004B; Wed,
	10 Apr 2013 17:11:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 10 Apr 2013 17:11:00 -0400
Message-id: <1365628260-6332-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH][danny] tune-cortexa{7, 8, 9, 15}: update tunes from oe-core/master with fixes
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
X-List-Received-Date: Wed, 10 Apr 2013 21:11:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Specifically interested in hardfp+thumb+neon

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/tune-cortexa15.inc |  4 ++--
 conf/machine/include/tune-cortexa7.inc  |  4 ++--
 conf/machine/include/tune-cortexa8.inc  | 36 +++++++++++++++++++++++++++++++++
 conf/machine/include/tune-cortexa9.inc  | 36 +++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/include/tune-cortexa8.inc
 create mode 100644 conf/machine/include/tune-cortexa9.inc

diff --git a/conf/machine/include/tune-cortexa15.inc b/conf/machine/include/tune-cortexa15.inc
index a9a8d0d..282c54e 100644
--- a/conf/machine/include/tune-cortexa15.inc
+++ b/conf/machine/include/tune-cortexa15.inc
@@ -29,8 +29,8 @@ ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
 TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
 TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
 TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2-vfp cortexa15t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
diff --git a/conf/machine/include/tune-cortexa7.inc b/conf/machine/include/tune-cortexa7.inc
index d04aed3..9898e8e 100644
--- a/conf/machine/include/tune-cortexa7.inc
+++ b/conf/machine/include/tune-cortexa7.inc
@@ -29,8 +29,8 @@ ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
 TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
 TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
 TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2-vfp cortexa7t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
diff --git a/conf/machine/include/tune-cortexa8.inc b/conf/machine/include/tune-cortexa8.inc
new file mode 100644
index 0000000..36894e4
--- /dev/null
+++ b/conf/machine/include/tune-cortexa8.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
+ARMPKGARCH_tune-cortexa8 = "cortexa8"
+ARMPKGARCH_tune-cortexa8t = "cortexa8"
+ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
+ARMPKGARCH_tune-cortexa8t-neon = "cortexa8"
+TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
+TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
+TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
+ARMPKGARCH_tune-cortexa8hf = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf = "cortexa8"
+ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf-neon = "cortexa8"
+TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
diff --git a/conf/machine/include/tune-cortexa9.inc b/conf/machine/include/tune-cortexa9.inc
new file mode 100644
index 0000000..bac8718
--- /dev/null
+++ b/conf/machine/include/tune-cortexa9.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
+ARMPKGARCH_tune-cortexa9 = "cortexa9"
+ARMPKGARCH_tune-cortexa9t = "cortexa9"
+ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-neon = "cortexa9"
+TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
+TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
+TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
+ARMPKGARCH_tune-cortexa9hf = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-neon = "cortexa9"
+TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
-- 
1.8.1.5


