Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8CEC369D3
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 10:00:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.23659.1745747999527647134
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Apr 2025 02:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=epai86VQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23964265e9.0
        for <meta-ti@lists.yoctoproject.org>; Sun, 27 Apr 2025 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745747997; x=1746352797; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpWP4e+obUKNpU3eh/NO6zTiAQSOh6hdWpcVV7J6Bm0=;
        b=epai86VQvjH/9m/K48JlBjZG2mAOmnK+6mtN2piOhr+JWgGsO5vENldQk9s2837aAR
         njfv+EVHa7KEn1yxgoy615jun0q5dRCxSagFsn0vveDWHFQQO7nBR46MHpXuXWYm/m8k
         A4js1sCZYmOUgFzReEFQI+9dEUJE2PD/l9E2/+uprytBeg0Ska2u8hqnRFlvjooT1qws
         ihQ4NpOOaxEF9vHMSmoxUTCJCNyX+A7OBGMTPybnx6OxUf+9tpg/KHBxT7Cg15XerIjz
         8rQtCvXzMqRbMyPwv21XjF6BoaQUck/gWAQVaS9msa3InmDIro508ZcB9Q35vV5XUz5U
         nZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745747997; x=1746352797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpWP4e+obUKNpU3eh/NO6zTiAQSOh6hdWpcVV7J6Bm0=;
        b=JZ9W4UKqX4gbAbBt53J5isXJdedE9wMW28v90EBipxcpzpVwV7AzzhslELgVaOujgu
         pgpLfZ/r0y4YeI1HKDmQ6QQviUi6f+66/Ow2mOoIDAw4QeAC3WwGI0CJyoOzX660pwmh
         q81WbbZIEIuqmaxv6YRK+XzK8enpZYjqrVHT5aEyM2CSTvSmsLQyjeYD4rFemgTbnI4R
         iJtZsslzyTqRykc/T5iYn3f6WxbpM/dmAj5pFa2SzGmPmZa8RqGtPrAFgNSwmimNVRE/
         6GaBjI4aqxUJbg134MGarrPkHtZVEfOzQJw6nAbXoJkfUjZsep7slDHyR8PRpw/HouwT
         Rk+w==
X-Gm-Message-State: AOJu0Yzufu2AOUaZivGXyfd+83WEqe0klHr7mGIAdmoXokHPe5LLmixY
	p3azNr1xAAhZ2wepxR6fGFEIcXzGsMfA2nde+smGytRpGglR9ZMboSdUhQ==
X-Gm-Gg: ASbGncsBhFFtiJLS3irKRmPvO0qnmbq98Je9ea6t+byTU6HfdZUs6ggITAjmGnP09n0
	PSFX9GdjcyP+bdggy8VXAEsFJOaEpvoes3JMiJf1iBFAjtTcCgrxTrHSV4+9tmXV4Igcn1trl8T
	eb9gJZlFrNbAxuz95B4oIPR9ysaPa4LBbMxJY2DNBUNtn9t19AMkXK8Cl7IMtwWFm532fNi+bLp
	7wKqOs/j7ghhpuRsjHtc52IauEegUXul4UkwkCYF12tqSP+9iiq+Wo5GmFiiKHV6gNI+sBuLBCj
	wkigdN+5vBVlOHAJ3MrYqecyeXk2zEfztxNOTvTemf1lkAagDRczTMHoVsWNapXnWYXeE7MB0K/
	wIK+vdxBO
X-Google-Smtp-Source: AGHT+IFvfCxpiObJcUZdb8+oSoWfEqIygpBVg0T9PaHm61g9fDr8tP5+XcDbtdXfN7EgNs3ytCSspw==
X-Received: by 2002:a05:600c:3d87:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-440a9390560mr68502705e9.17.1745747997082;
        Sun, 27 Apr 2025 02:59:57 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f9c6sm88020525e9.39.2025.04.27.02.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:59:56 -0700 (PDT)
From: max.oss.09@gmail.com
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-ti][PATCH 2/2] meta-ti-extras recipes: fix whitespace warnings
Date: Sun, 27 Apr 2025 11:59:18 +0200
Message-ID: <20250427095918.3941375-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250427095918.3941375-1-max.oss.09@gmail.com>
References: <20250427095918.3941375-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 27 Apr 2025 10:00:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18515

From: Max Krummenacher <max.krummenacher@toradex.com>

Since OE bitbake commit 24772dd2ae6c ("parse/ConfHandler: Add warning for
deprecated whitespace usage"), the current build generates the following
warning (as example):

| WARNING: ...meta-ti/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb:
|   meta-ti/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb:2
|   has a lack of whitespace around the assignment:
|   'HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"'

Fix all the warnings.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../recipes-bsp/dsptop/libulm_git.bb          |  4 ++--
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 24 +++++++++----------
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc |  4 ++--
 .../recipes-ti/ctoolslib/libaet_git.bb        |  2 +-
 .../recipes-ti/devtools/ti-cg-xml_2.61.00.bb  |  6 ++---
 .../recipes-ti/devtools/ti-cgt470.inc         |  6 ++---
 .../recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb  |  2 +-
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc   | 18 +++++++-------
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc | 16 ++++++-------
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc  |  4 ++--
 10 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index 998d9d830913..a4670b6e795a 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -11,7 +11,7 @@ PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/git/dsptop/ulm"
 
-DEVICE=""
+DEVICE = ""
 DEVICE:dra7xx = "DRA7xx"
 
 EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
@@ -42,7 +42,7 @@ include dsptop.inc
 
 ALLOW_EMPTY:${PN} = "1"
 
-PARALLEL_MAKE= ""
+PARALLEL_MAKE = ""
 
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 87f63750ea14..09926109fb68 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -26,18 +26,18 @@ inherit update-alternatives
 
 DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
-export HWVERSION="ES10"
-export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
-
-export XDCVERSION="ti-xdctools-tree"
-export BIOSVERSION="ti-sysbios-tree"
-export IPCVERSION="ti-ipc-tree"
-export CEVERSION="ti-codec-engine-tree"
-export FCVERSION="ti-framework-components-tree"
-export XDAISVERSION="ti-xdais-tree"
-
-export TMS470CGTOOLPATH="${M4_TOOLCHAIN_INSTALL_DIR}"
-export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+export HWVERSION = "ES10"
+export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
+
+export XDCVERSION = "ti-xdctools-tree"
+export BIOSVERSION = "ti-sysbios-tree"
+export IPCVERSION = "ti-ipc-tree"
+export CEVERSION = "ti-codec-engine-tree"
+export FCVERSION = "ti-framework-components-tree"
+export XDAISVERSION = "ti-xdais-tree"
+
+export TMS470CGTOOLPATH = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
 
 EXTRA_OEMAKE += "XDCDIST_TREE=${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
 
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
index 8cc9e3095d41..3c1861ac2392 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -10,8 +10,8 @@ require ../includes/ti-eula-unpack.inc
 S = "${WORKDIR}/bios_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
-BINFILE="bios_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
+BINFILE = "bios_${PV}.bin"
+TI_BIN_UNPK_CMDS = "Y: q:workdir:Y"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
index 400221f97d2d..f3b03bd66f1a 100644
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
@@ -15,7 +15,7 @@ PR = "r0"
 
 S = "${WORKDIR}/git/aet"
 
-DEVICE=""
+DEVICE = ""
 DEVICE:dra7xx = "DRA7xx"
 
 EXTRA_OEMAKE = "C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index c7608a768c21..a0972602e7a0 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -19,9 +19,9 @@ LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=fc02a39748ba50373f32b2f
 SRC_URI[cgxmlbin_linux.md5sum] = "6ce60caa97bbf15158d806fb062fadff"
 SRC_URI[cgxmlbin_linux.sha256sum] = "da77cb10bd3d5de89e27e4ce8f4408a2e50775c8980225f9a828ddc242bb81f9"
 
-BINFILE="cgxml-${PV}-linux-installer.run"
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS="--prefix ${S} --mode unattended"
+BINFILE = "cgxml-${PV}-linux-installer.run"
+TI_BIN_UNPK_CMDS = ""
+TI_BIN_UNPK_ARGS = "--prefix ${S} --mode unattended"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
index f0992aa7db8e..d905755c0130 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
@@ -13,9 +13,9 @@ S = "${WORKDIR}/cgt470_${PV}"
 
 SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
 
-BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
-TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
-TI_BIN_UNPK_WDEXT="/cgt470_${PV}"
+BINFILE = "ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
+TI_BIN_UNPK_CMDS = "Y:qY:workdir: : "
+TI_BIN_UNPK_WDEXT = "/cgt470_${PV}"
 
 do_install() {
     install -d ${D}${CODEGEN_ARM_INSTALL_DIR_RECIPE}
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
index a7de8e38441b..0cc068e46a61 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
@@ -19,7 +19,7 @@ require recipes-ti/includes/ti-unpack.inc
 BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
 BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
 TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
-TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_CMDS = ""
 
 SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
 
diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
index 3c24f1966c4f..cabd2a9d116f 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -25,19 +25,19 @@ SRCREV = "${DSPLIB_SRCREV}"
 
 LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
 
-export DSPLIB_WORK_DIR="${S}"
-export CGTOOLS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
-export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
-export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
+export DSPLIB_WORK_DIR = "${S}"
+export CGTOOLS_INSTALL_DIR = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
 export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
-export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
-export INCDIR="${MATHLIB_INSTALL_DIR}/"
+export XDCBUILDCFG = "${SWTOOLS_PATH}/config.bld"
+export INCDIR = "${MATHLIB_INSTALL_DIR}/"
 
 PATH:append = ":${XDC_INSTALL_DIR}"
 
-XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
-XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DIR};"
+XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+XDCPATH .= "${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DIR};"
 
 export XDCPATH
 
diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
index 34902ba1ae64..fb9de41df10b 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -25,18 +25,18 @@ SRCREV = "${MATHLIB_SRCREV}"
 
 LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
 
-export MATHLIB_WORK_DIR="${S}"
-export CGTOOLS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
-export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
-export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
+export MATHLIB_WORK_DIR = "${S}"
+export CGTOOLS_INSTALL_DIR = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
 export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
-export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
+export XDCBUILDCFG = "${SWTOOLS_PATH}/config.bld"
 
 PATH:append = ":${XDC_INSTALL_DIR}"
 
-XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
-XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};"
+XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+XDCPATH .= "${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};"
 
 export XDCPATH
 
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
index 6b5e186cf889..518468369b32 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -13,9 +13,9 @@ SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV
 
 S = "${WORKDIR}/vlib_c66x_${PV}"
 
-BINFILE="vlib_c66x_obj_${PV}_Linux.bin"
+BINFILE = "vlib_c66x_obj_${PV}_Linux.bin"
 TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
-TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_CMDS = ""
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-- 
2.42.0


