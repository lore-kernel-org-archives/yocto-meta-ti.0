Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1939E003D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:55:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E9B8752A86; Sat, 17 Nov 2012 03:55:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035507.E9B8752A86@arago-project.org>
Date: Sat, 17 Nov 2012 03:55:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : tune-cortexa15: add tunes for ARM Cortex-A15
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
X-List-Received-Date: Sat, 17 Nov 2012 03:55:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: fb63adb28aaf48fb0126f3a8a27a90c7458f0650
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fb63adb28aaf48fb0126f3a8a27a90c7458f0650

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Oct 18 18:27:27 2012 -0400

tune-cortexa15: add tunes for ARM Cortex-A15

http://www.arm.com/products/processors/cortex-a/cortex-a15.php

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/tune-cortexa15.inc |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/tune-cortexa15.inc b/conf/machine/include/tune-cortexa15.inc
new file mode 100644
index 0000000..690e934
--- /dev/null
+++ b/conf/machine/include/tune-cortexa15.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "cortexa15-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon"
+TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
+TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+
+# VFP Tunes
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon"
+TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"


