Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32068C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 16:51:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.80.1684774307352810199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 May 2023 09:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ExjQSUqX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MGpj18019765;
	Mon, 22 May 2023 11:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684774305;
	bh=f/xEDaJ9BaKjv1ma0H9GjEbh5ITGBcfdjLUG373iAS8=;
	h=From:To:CC:Subject:Date;
	b=ExjQSUqXD5Xhr07zhOqKcyVXaysMZpNpBSR/K990AUNOjLANo7g0s0A5f+mMhoTsI
	 8Cm7uVyi1UVXQdpulFoSaDvqaTI4dHx5e3yJMnZoEY+dyUNi0ckkRAabJGSnghneA+
	 YBbrDfZRUpPQcuAPvCXdVuRTWrd19Ra7oYDOXQ6M=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MGpi9h053514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 11:51:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 11:51:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 11:51:44 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MGpiil027526;
	Mon, 22 May 2023 11:51:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] ti-paths: Remove extra paths and alphabetize
Date: Mon, 22 May 2023 11:51:42 -0500
Message-ID: <20230522165143.156123-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 May 2023 16:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16573

This file should be whittled away over time, remove currently unused
paths to help us take inventory of what remains.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/includes/ti-paths.inc          | 150 ++++++------------
 1 file changed, 52 insertions(+), 98 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
index b443d2f0..e8b0f17b 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -1,106 +1,60 @@
 installdir = "${datadir}/ti"
 
 export TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
+
 # This is where do_install will put it
-export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
-export BIOSPSP_INSTALL_DIR_RECIPE    = "${installdir}/ti-biospsp-tree"
-export C6ACCEL_INSTALL_DIR_RECIPE    = "${installdir}/ti-c6accel-tree"
-export C6RUN_INSTALL_DIR_RECIPE      = "${installdir}/ti-c6run-tree"
-export CE_INSTALL_DIR_RECIPE         = "${installdir}/ti-codec-engine-tree"
-export CODEC_INSTALL_DIR_RECIPE      = "${installdir}/ti-codecs-tree"
-export CODEGEN_ARM_INSTALL_DIR_RECIPE= "${installdir}/ti-cgt470-tree"
-export CODEGEN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt6x-tree"
-export DSP_BENCHMARK_INSTALL_DIR_RECIPE = "${installdir}/ti-dsp-benchmark-tree"
-export DSPLIB_C64P_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c64p-tree"
-export DSPLIB_C674_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c674x-tree"
-export DSPLIB_C66_INSTALL_DIR_RECIPE  = "${installdir}/ti-dsplib-c66x-tree"
-export DVSDK_DEMOS_INSTALL_DIR_RECIPE= "${installdir}/ti-dvsdk-demos-tree"
-export DVTB_INSTALL_DIR_RECIPE       = "${installdir}/ti-dvtb-tree"
-export EDMA3_LLD_INSTALL_DIR_RECIPE  = "${installdir}/ti-edma3lld-tree"
-export EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE  = "${installdir}/ti-edma3lld-sysbios-tree"
-export FASTMATHLIB_C674P_INSTALL_DIR_RECIPE = "${installdir}/ti-fastmathlib-c67x-tree"
-export FC3_INSTALL_DIR_RECIPE        = "${installdir}/ti-framework-components3-tree"
-export FC_INSTALL_DIR_RECIPE         = "${installdir}/ti-framework-components-tree"
-export GFX_SDK_INSTALL_DIR_RECIPE    = "${installdir}/ti-gfx-sdk-tree"
-export HDVICP20_INSTALL_DIR_RECIPE   = "${installdir}/ti-hdvicp20-tree"
-export IMGLIB_C64P_INSTALL_DIR_RECIPE= "${installdir}/ti-imglib-tree"
-export IPC_INSTALL_DIR_RECIPE        = "${installdir}/ti-ipc-tree"
-export LINK_INSTALL_DIR_RECIPE       = "${installdir}/ti-dsplink-tree"
-export LPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-local-power-manager-tree"
-export OMX_INSTALL_DIR_RECIPE        = "${installdir}/ti-omx-tree"
-export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
-export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
-export SYSBIOS_INSTALL_DIR_RECIPE    = "${installdir}/ti-sysbios-tree"
-export SYSLINK_INSTALL_DIR_RECIPE    = "${installdir}/ti-syslink-tree"
-export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
-export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
-export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
-export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
-export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
-export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
-export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
-export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
-export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
-export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
-export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
-export MATHLIB_C674_INSTALL_DIR_RECIPE    = "${installdir}/ti-mathlib-c674x-tree"
-export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
-export VLIB_C66_INSTALL_DIR_RECIPE        = "${installdir}/ti-vlib-c66x-tree"
-export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
-export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
-export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
+export CE_INSTALL_DIR_RECIPE           = "${installdir}/ti-codec-engine-tree"
+export CODEC_INSTALL_DIR_RECIPE        = "${installdir}/ti-codecs-tree"
+export CODEGEN_ARM_INSTALL_DIR_RECIPE  = "${installdir}/ti-cgt470-tree"
+export CG_XML_INSTALL_DIR_RECIPE       = "${installdir}/ti-cg-xml-tree"
+export DSPLIB_C66_INSTALL_DIR_RECIPE   = "${installdir}/ti-dsplib-c66x-tree"
+export DSPLIB_C674_INSTALL_DIR_RECIPE  = "${installdir}/ti-dsplib-c674x-tree"
+export DSPLIB_C64P_INSTALL_DIR_RECIPE  = "${installdir}/ti-dsplib-c64p-tree"
+export EDMA3_LLD_INSTALL_DIR_RECIPE    = "${installdir}/ti-edma3lld-tree"
+export FC_INSTALL_DIR_RECIPE           = "${installdir}/ti-framework-components-tree"
+export GCC_ARM_NONE_TOOLCHAIN_RECIPE   = "${installdir}/gcc-arm-none-eabi"
+export IMGLIB_C66_INSTALL_DIR_RECIPE   = "${installdir}/ti-imglib-c66x-tree"
+export IPC_INSTALL_DIR_RECIPE          = "${installdir}/ti-ipc-tree"
+export M4_TOOLCHAIN_INSTALL_DIR_RECIPE = "${installdir}/ti-cgt-arm"
+export MATHLIB_C66_INSTALL_DIR_RECIPE  = "${installdir}/ti-mathlib-c66x-tree"
+export MATHLIB_C674_INSTALL_DIR_RECIPE = "${installdir}/ti-mathlib-c674x-tree"
+export MPM_INSTALL_DIR_RECIPE          = "${installdir}/ti-mpm-tree"
+export OMP_INSTALL_DIR_RECIPE          = "${installdir}/ti-omp-tree"
+export OSAL_INSTALL_DIR_RECIPE         = "${installdir}/ti-osal-tree"
+export PDK_INSTALL_DIR_RECIPE          = "${installdir}/ti-pdk-tree"
+export SYSBIOS_INSTALL_DIR_RECIPE      = "${installdir}/ti-sysbios-tree"
+export SWTOOLS_INSTALL_DIR_RECIPE      = "${installdir}/ti-swtools-tree"
+export TI_CGT_PRU_INSTALL_DIR_RECIPE   = "${installdir}/cgt-pru"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
-export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
-
+export TI_CGT7X_INSTALL_DIR_RECIPE     = "${installdir}/cgt-c7x"
+export VLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-vlib-c66x-tree"
+export XDAIS_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdais-tree"
+export XDC_INSTALL_DIR_RECIPE          = "${installdir}/ti-xdctools-tree"
 
 # This is where the tools will end up in sysroot
-export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
-export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR_TARGET}${BIOSPSP_INSTALL_DIR_RECIPE}"
-export C6ACCEL_INSTALL_DIR    = "${STAGING_DIR_TARGET}${C6ACCEL_INSTALL_DIR_RECIPE}"
-export C6RUN_INSTALL_DIR      = "${STAGING_DIR_TARGET}${C6RUN_INSTALL_DIR_RECIPE}"
-export CE_INSTALL_DIR         = "${STAGING_DIR_TARGET}${CE_INSTALL_DIR_RECIPE}"
-export CMEM_INSTALL_DIR       = "${STAGING_DIR_TARGET}${CMEM_INSTALL_DIR_RECIPE}"
-export CODEC_INSTALL_DIR      = "${STAGING_DIR_TARGET}${CODEC_INSTALL_DIR_RECIPE}"
-export CODEGEN_ARM_INSTALL_DIR= "${STAGING_DIR_TARGET}${CODEGEN_ARM_INSTALL_DIR_RECIPE}"
-export CODEGEN_INSTALL_DIR    = "${STAGING_DIR_TARGET}${CODEGEN_INSTALL_DIR_RECIPE}"
-export DSP_BENCHMARK_INSTALL_DIR = "${STAGING_DIR_TARGET}${DSP_BENCHMARK_INSTALL_DIR_RECIPE}"
-export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR_TARGET}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
-export EDMA3_LLD_SYSBIOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}"
-export FASTMATHLIB_C674P_INSTALL_DIR = "${STAGING_DIR_TARGET}${FASTMATHLIB_C674P_INSTALL_DIR_RECIPE}"
-export FC3_INSTALL_DIR        = "${STAGING_DIR_TARGET}${FC3_INSTALL_DIR_RECIPE}"
-export FC_INSTALL_DIR         = "${STAGING_DIR_TARGET}${FC_INSTALL_DIR_RECIPE}"
-export HDVICP20_INSTALL_DIR   = "${STAGING_DIR_TARGET}${HDVICP20_INSTALL_DIR_RECIPE}"
-export IMGLIB_C64P_INSTALL_DIR= "${STAGING_DIR_TARGET}${IMGLIB_C64P_INSTALL_DIR_RECIPE}"
-export IPC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${IPC_INSTALL_DIR_RECIPE}"
-export LINK_INSTALL_DIR       = "${STAGING_DIR_TARGET}${LINK_INSTALL_DIR_RECIPE}"
-export LPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${LPM_INSTALL_DIR_RECIPE}"
-export OMX_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMX_INSTALL_DIR_RECIPE}"
-export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECIPE}"
-export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
-export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
-export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
-export XDC_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${XDC_INSTALL_DIR_RECIPE}"
-export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
-export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
-export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
-export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
-export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
-export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
-export DSPLIB_C64P_INSTALL_DIR     = "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
-export DSPLIB_C674_INSTALL_DIR     = "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
-export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
-export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
-export MATHLIB_C674_INSTALL_DIR    = "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
-export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
-export VLIB_C66_INSTALL_DIR        = "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}"
-export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
-export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
-export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
+export CE_INSTALL_DIR           = "${STAGING_DIR_TARGET}${CE_INSTALL_DIR_RECIPE}"
+export CODEGEN_ARM_INSTALL_DIR  = "${STAGING_DIR_TARGET}${CODEGEN_ARM_INSTALL_DIR_RECIPE}"
+export CG_XML_INSTALL_DIR       = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
+export DSPLIB_C66_INSTALL_DIR   = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
+export DSPLIB_C674_INSTALL_DIR  = "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
+export DSPLIB_C64P_INSTALL_DIR  = "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
+export EDMA3_LLD_INSTALL_DIR    = "${STAGING_DIR_TARGET}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
+export FC_INSTALL_DIR           = "${STAGING_DIR_TARGET}${FC_INSTALL_DIR_RECIPE}"
+export GCC_ARM_NONE_TOOLCHAIN   = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
+export IMGLIB_C66_INSTALL_DIR   = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
+export IPC_INSTALL_DIR          = "${STAGING_DIR_TARGET}${IPC_INSTALL_DIR_RECIPE}"
+export M4_TOOLCHAIN_INSTALL_DIR = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+export MATHLIB_C66_INSTALL_DIR  = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
+export MATHLIB_C674_INSTALL_DIR = "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
+export MPM_INSTALL_DIR          = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
+export OMP_INSTALL_DIR          = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
+export OSAL_INSTALL_DIR         = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
+export PDK_INSTALL_DIR          = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
+export SWTOOLS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
+export SYSBIOS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECIPE}"
+export TI_CGT_PRU_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
-export GCC_LINARO_BAREMETAL_TOOLCHAIN         =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
-export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
-export TI_CGT7X_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
-
-
-DSPSUFFIX:omapl138 = "x674"
-DSPSUFFIX ?= "x64P"
+export TI_CGT7X_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
+export VLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}"
+export XDAIS_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
+export XDC_INSTALL_DIR          = "${STAGING_DIR_NATIVE}${XDC_INSTALL_DIR_RECIPE}"
-- 
2.39.2


