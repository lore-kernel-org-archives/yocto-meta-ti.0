Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BE9DE003DA
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:55:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C1ABD52A9A; Sat, 17 Nov 2012 03:55:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035508.C1ABD52A9A@arago-project.org>
Date: Sat, 17 Nov 2012 03:55:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : tune-cortexa7: add tunes for ARM Cortex-A7
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
Commit: cd3dc72159224b7197e89e7396c4ea708e16496c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd3dc72159224b7197e89e7396c4ea708e16496c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Oct 18 18:28:06 2012 -0400

tune-cortexa7: add tunes for ARM Cortex-A7

http://www.arm.com/products/processors/cortex-a/cortex-a7.php

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/tune-cortexa7.inc |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/tune-cortexa7.inc b/conf/machine/include/tune-cortexa7.inc
new file mode 100644
index 0000000..8e41139
--- /dev/null
+++ b/conf/machine/include/tune-cortexa7.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "cortexa7-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", "-mtune=cortex-a7", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon"
+TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
+TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
+
+# VFP Tunes
+AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon"
+TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"


