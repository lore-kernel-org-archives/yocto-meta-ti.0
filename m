Return-Path: <denys@ti.com>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1950E013D2
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 20:45:36 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF00CIMJRKTX70@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 24 Oct 2012 22:45:21 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C9E85200BA; Wed,
	24 Oct 2012 23:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 24 Oct 2012 23:45:08 -0400
Message-id: <1351136709-1560-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
In-reply-to: <1351136709-1560-1-git-send-email-denys@ti.com>
References: <1351136709-1560-1-git-send-email-denys@ti.com>
Subject: [PATCH 1/2] tune-cortexa15: add tunes for ARM Cortex-A15
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
X-List-Received-Date: Thu, 25 Oct 2012 03:45:36 -0000

http://www.arm.com/products/processors/cortex-a/cortex-a15.php

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa15.inc

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
new file mode 100644
index 0000000..690e934
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa15.inc
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
-- 
1.7.12.4


