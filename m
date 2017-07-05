Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF43FE00A38; Wed,  5 Jul 2017 15:16:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	UPPERCASE_50_75 autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E206E0084A
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 15:16:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65MGWQa031937
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499292992;
	bh=UXPnWEgmxROCWxpnIsWCw/gldYdygNptjZzZNUsDmdM=;
	h=From:To:Subject:Date;
	b=euwSIXVuoE/2LSQkhOgc7I8nzBMbaFWjtOR2eRMzrDFMVKnzGfZKMPVspmm7SjPHE
	eV9BCR4Snb4XRRwDSi4o9s1Tq+aemm6QQYPUV/36pslgOBkbi27P0WUitgfunaB5d9
	BQDwIszL/YL6fUv6oUiRMwGpqGhWNaVnRAUHiwlo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65MGWv9014055
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 17:16:32 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v65MGWMX007541	for <meta-ti@yoctoproject.org>;
	Wed, 5 Jul 2017 17:16:32 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Jul 2017 17:16:27 -0500
Message-ID: <1499292992-15234-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/6] ti-paths.inc: added path for multiple RTOS driver and components
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
X-List-Received-Date: Wed, 05 Jul 2017 22:16:38 -0000
Content-Type: text/plain

* This adds installation directory path for NDK, FFTLIB, ctoolslib,
  proc-sdk, rtos-test, LLVM, OpenCL, AER, VOLIB, CGT ARP32,
  CGT6x 7.4.16, DSPLIB C674, MATHLIB C674, SECDEV

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/includes/ti-paths.inc | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a7ea9a7..2fc044a 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -55,7 +55,18 @@ export VLIB_C66_INSTALL_DIR_RECIPE        = "${installdir}/ti-vlib-c66x-tree"
 export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
-
+export FFTLIB_INSTALL_DIR_RECIPE          = "${installdir}/ti-fftlib-tree"
+export CTOOLSLIB_INSTALL_DIR_RECIPE       = "${installdir}/ti-ctoolslib-tree"
+export PROC_SDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-proc-sdk-tree"
+export RTOS_TEST_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtos-test-tree"
+export LLVM_RTOS_INSTALL_DIR_RECIPE       = "${installdir}/llvm-rtos-tree"
+export OCL_RTOS_INSTALL_DIR_RECIPE        = "${installdir}/ti-opencl-rtos-tree"
+export AER_RTOS_INSTALL_DIR_RECIPE        = "${installdir}/aer-rtos-tree"
+export VOLIB_RTOS_INSTALL_DIR_RECIPE      = "${installdir}/volib-rtos-tree"
+export TI_CGT_ARP32_INSTALL_DIR_RECIPE    = "${installdir}/cgt-arp32"
+export TI_CGT6X_7416_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7416"
+export MATHLIB_C674_INSTALL_DIR_RECIPE    = "${installdir}/ti-mathlib-c674x-tree"
+export SECDEV_INSTALL_DIR_RECIPE          = "${installdir}/ti-secdev-tree"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -101,6 +112,20 @@ export VLIB_C66_INSTALL_DIR        = "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DI
 export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
 export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
+export NDK_INSTALL_DIR             = "${STAGING_DIR_TARGET}${NDK_INSTALL_DIR_RECIPE}"
+export FFTLIB_INSTALL_DIR          = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
+export CTOOLSLIB_INSTALL_DIR       = "${STAGING_DIR_TARGET}${CTOOLSLIB_INSTALL_DIR_RECIPE}"
+export PROC_SDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PROC_SDK_INSTALL_DIR_RECIPE}"
+export RTOS_TEST_INSTALL_DIR       = "${STAGING_DIR_TARGET}${RTOS_TEST_INSTALL_DIR_RECIPE}"
+export LLVM_RTOS_INSTALL_DIR       = "${STAGING_DIR_NATIVE}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
+export OCL_RTOS_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
+export AER_RTOS_INSTALL_DIR        = "${STAGING_DIR_TARGET}${AER_RTOS_INSTALL_DIR_RECIPE}"
+export VOLIB_RTOS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${VOLIB_RTOS_INSTALL_DIR_RECIPE}"
+export TI_CGT_ARP32_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${TI_CGT_ARP32_INSTALL_DIR_RECIPE}"
+export TI_CGT6X_7416_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7416_INSTALL_DIR_RECIPE}"
+export DSPLIB_C674_INSTALL_DIR     = "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
+export MATHLIB_C674_INSTALL_DIR    = "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
+export SECDEV_INSTALL_DIR          = "${STAGING_DIR_TARGET}${SECDEV_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
-- 
1.9.1


