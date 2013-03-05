Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C6A5E004FE
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:07:12 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D04A652A8E; Tue,  5 Mar 2013 22:07:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130305220711.D04A652A8E@arago-project.org>
Date: Tue,  5 Mar 2013 22:07:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : tune-cortexa{15, 7}: update tunes files with recent changes in oe-core
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
X-List-Received-Date: Tue, 05 Mar 2013 22:07:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 7d68b3bd60093b0f85b289a8a8c67495d66c9e4f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7d68b3bd60093b0f85b289a8a8c67495d66c9e4f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  4 14:50:50 2013 -0500

tune-cortexa{15,7}: update tunes files with recent changes in oe-core

* PACKAGE_EXTRA_ARCHS
* appending to TUNE_FEATURES
* TUNE for thumb+neon

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/tune-cortexa15.inc |   30 +++++++++++++++++++++---------
 conf/machine/include/tune-cortexa7.inc  |   30 +++++++++++++++++++++---------
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/conf/machine/include/tune-cortexa15.inc b/conf/machine/include/tune-cortexa15.inc
index 690e934..a9a8d0d 100644
--- a/conf/machine/include/tune-cortexa15.inc
+++ b/conf/machine/include/tune-cortexa15.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "cortexa15-neon"
+DEFAULTTUNE ?= "armv7a-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
@@ -6,19 +6,31 @@ TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon"
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
+ARMPKGARCH_tune-cortexa15 = "cortexa15"
+ARMPKGARCH_tune-cortexa15t = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
 TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
 TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
 TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon"
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
+ARMPKGARCH_tune-cortexa15hf = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
 TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
 TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
 TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
+TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2-vfp cortexa15t2hf-vfp-neon"
diff --git a/conf/machine/include/tune-cortexa7.inc b/conf/machine/include/tune-cortexa7.inc
index 8e41139..d04aed3 100644
--- a/conf/machine/include/tune-cortexa7.inc
+++ b/conf/machine/include/tune-cortexa7.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "cortexa7-neon"
+DEFAULTTUNE ?= "armv7a-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
@@ -6,19 +6,31 @@ TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", "-mtune=cortex-a7", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon"
+AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
+ARMPKGARCH_tune-cortexa7 = "cortexa7"
+ARMPKGARCH_tune-cortexa7t = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
 TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
 TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
 TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon"
+AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
+ARMPKGARCH_tune-cortexa7hf = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
 TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
 TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
 TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
+TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2-vfp cortexa7t2hf-vfp-neon"


