Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0772E0044A
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 21:33:23 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 16FD752A6F; Fri, 11 May 2012 04:33:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511043323.16FD752A6F@arago-project.org>
Date: Fri, 11 May 2012 04:33:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : omap3-sgx-modules, ti-staging.inc, ti-linuxutils: change PACKAGE_STRIP = "no" to the proper INHIBIT_PACKAGE_STRIP = "1"
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2012 04:33:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fa87ca0b1a1890d262a591aee50f082194f45317
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fa87ca0b1a1890d262a591aee50f082194f45317

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu May 10 15:45:24 2012 +0200

omap3-sgx-modules, ti-staging.inc, ti-linuxutils: change PACKAGE_STRIP = "no" to the proper INHIBIT_PACKAGE_STRIP = "1"

PACKAGE_STRIP doesn't exit in oe-core (anymore)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_1.6.16.3977.bb               |    2 +-
 .../omap3-sgx-modules_4.05.00.03.bb                |    2 +-
 recipes-ti/includes/ti-staging.inc                 |    2 +-
 recipes-ti/linuxutils/ti-linuxutils.inc            |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
index f37299d..0affee1 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
 
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti816x = "ti81xx"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 42a2e9a..31c7d4e 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
 
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti814x = "ti81xx"
diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
index 48ee061..b588805 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,4 +1,4 @@
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
index 06b254d..dba485b 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -90,4 +90,4 @@ FILES_ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko
 FILES_ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
 
 INSANE_SKIP_ti-linuxutils-app = "True"
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"


