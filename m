Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 320CDE00AB6; Wed, 19 Apr 2017 03:30:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1C64E00A4C
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 03:30:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3JAUBnv009271
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 05:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492597811;
	bh=3NK4bu2T0Dp8d0Uevs72R/JbCLAB4ZaKieJcvJvISv8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c9rH+i4n+ZckY7X2O7ZmSXA+15ePdGWy6E79jjLJoU6S/m+tA7NKUcNFvKSnFFLsN
	xkWo1XU9TCOq0Gy86PebmLBpFKLfsfFc+D4ztLItUqlvWAQmE6v1FaRET+/VbWHY8u
	kmvLq0sfLZ2VUtYuxAuXoozL+BIFBqWebpCzsyNo=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JAUBku001608
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 05:30:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 05:30:10 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JAU7vL017044;
	Wed, 19 Apr 2017 05:30:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Apr 2017 16:00:02 +0530
Message-ID: <1492597804-77037-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492597804-77037-1-git-send-email-a0393906@ti.com>
References: <1492597804-77037-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty 2/4] Remove CCS dependencies for all components
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
X-List-Received-Date: Wed, 19 Apr 2017 10:30:15 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 classes/ti-pdk.bbclass                      | 2 +-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb        | 2 +-
 recipes-ti/includes/ti-paths.inc            | 1 -
 recipes-ti/ipc/ti-ipc-rtos.inc              | 2 +-
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index fd7c3e7..eca3652 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -5,7 +5,7 @@ inherit perlnative
 
 DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
 
-DEPENDS_append_omap-a15 = " ti-ccsv6-native"
+DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 6a01d0b..ce9ef85 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -4,7 +4,7 @@ require recipes-ti/includes/ti-staging.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 1a5d285..1291e69 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -29,7 +29,7 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
 export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index e7d3e82..c5e25c9 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -46,7 +46,6 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
-export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index b29e984..696a897 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -43,7 +43,7 @@ DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
 DEPENDS_append_omap-a15 = " ti-cgt6x-native \
-                            ti-ccsv6-native \
+                            ti-cgt-arm-native \
                             gcc-arm-none-eabi-native \
 "
 IPC_TARGETS = ""
-- 
1.9.1


