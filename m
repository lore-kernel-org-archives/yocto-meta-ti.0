Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.74946.1638274148657761232
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 04:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=T1mm5Y2o;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.215.182, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pg1-f182.google.com with SMTP id s137so19549937pgs.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 30 Nov 2021 04:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=wLeUBReFHNd083+5Tt5Q9GbOdQ2s2aQSGgOm04Nu4+c=;
        b=T1mm5Y2owsl2TbcbB88TcBwvWQj4NK3wq1DIdtA9S0hO7wYIFDcS7wGvyw1RkljZy+
         c5wsv63jkWTFdkiBbd1TyJy1OzbIu5X85MF7si5tq6hSY1YvUUgXrBHRJFM3mSRQtx6E
         X506OM8od1YAslFND+R4vbethxa6CKudpzxRk+jn/5SNkyBEjY5YCP0cAFbR/ZFYEwy7
         ajtpUnrAa6K2TsPSPA/XHbnIJJcd6EwDlK25XVaM9opMfOQeKAUaPvOB1Czs/Q94MlD+
         3vdQyf+zEpvquO3bXL79YzBNX6qRQ9fv7gZG1XeSmTRQOcNlcLs9/Yk2D/YwOOJyKPba
         VESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wLeUBReFHNd083+5Tt5Q9GbOdQ2s2aQSGgOm04Nu4+c=;
        b=As2FwUpXRmOA67r+Mv2a6oESDSXGIydqTOMBdI8e2ocw5hzvoqaBrg5yk8WdVzDyS0
         ngcP9DMM6A8gqHxEbJMNr1EoirkQ4WCIThQDxmrFQTXkW88WZE0Qx6c2wL589L0cqoRC
         OpG46D3AxNJWlzxbaf2Pcrqmp1wV/5pskpmtv+1wFYYY78cEVKWrCgKJey8CMe81qDSC
         3aQDNOdw6Xo3SU7B6HCx8snwJ7d3CAeYZ4LFQ07l6NJFM6aGq9umMdgtRXRhzgjiEM0R
         sRk94bCM/zEH9J5i0ooJYV2BLzJISpM7BooDcZaMLVL2lNtyfJ4TUZ4kPNDYhfNrLCsL
         RLWg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531Kr8Lg+v3haS7gqGUGLHySawivEBFhUwBBEh7mFg8Erg6GeTMy
	gb7hckcTGGiEeW6SyrgLvJu/LCsM5oSaFm373Zr8Bl7RJjUZjTUa8TK48Rtt2CPHeTzsMAQBM7/
	DSJ9qrrAdnQPJJFg+gsWE53XOcySkVvU=
X-Google-Smtp-Source: ABdhPJwl8OHiPSK/zWYsJBXhCIwowgzAAfbWSQ6/NfxMebuU0pxOYngMI2tuP/kpujnD5z33iwHS/Q==
X-Received: by 2002:a63:834a:: with SMTP id h71mr39731196pge.361.1638274147576;
        Tue, 30 Nov 2021 04:09:07 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([203.201.61.238])
        by smtp.gmail.com with ESMTPSA id c2sm21639865pfv.112.2021.11.30.04.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 04:09:07 -0800 (PST)
From: sidraya.bj@pathpartnertech.com
To: meta-ti@lists.yoctoproject.org
Cc: yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	denys@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [dunfell/master][PATCH] linux-ti-staging-5.10: Fix build failure in parallel build Env.
Date: Tue, 30 Nov 2021 17:38:54 +0530
Message-Id: <20211130120854.25813-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

Fix build failure in parallel build Env.
Prevent building source code under vxe-vxd/common directory
twice which leads to overall build to fail.

Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 ...akefile-Fix-build-failure-in-paralle.patch | 261 ++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_5.10.bb |   3 +-
 2 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch

diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch b/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch
new file mode 100644
index 00000000..8b683c12
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch
@@ -0,0 +1,261 @@
+From 91ef6053f9a4c884c05857bdc39a496691bbc30f Mon Sep 17 00:00:00 2001
+From: Sidraya <sidraya.bj@pathpartnertech.com>
+Date: Fri, 26 Nov 2021 18:28:49 +0530
+Subject: [PATCH] media: platform: Makefile: Fix build failure in parallel
+ build Env.
+
+Fix build failure in parallel build Env.
+prevent building source code under common directory
+twice which leads to build fail.
+
+Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
+---
+ drivers/media/platform/Makefile               |   4 +-
+ .../platform/vxe-vxd/{decoder => }/Makefile   | 138 +++++++++++-------
+ .../media/platform/vxe-vxd/encoder/Makefile   |  56 -------
+ 3 files changed, 88 insertions(+), 110 deletions(-)
+ rename drivers/media/platform/vxe-vxd/{decoder => }/Makefile (50%)
+ delete mode 100644 drivers/media/platform/vxe-vxd/encoder/Makefile
+
+diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
+index 9780108f0..d42593fcc 100644
+--- a/drivers/media/platform/Makefile
++++ b/drivers/media/platform/Makefile
+@@ -81,5 +81,5 @@ obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
+
+ obj-y					+= sunxi/
+
+-obj-$(CONFIG_VIDEO_IMG_VXD_DEC)         += vxe-vxd/decoder/
+-obj-$(CONFIG_VIDEO_IMG_VXE_ENC)         += vxe-vxd/encoder/
++obj-$(CONFIG_VIDEO_IMG_VXD_DEC)         += vxe-vxd/
++obj-$(CONFIG_VIDEO_IMG_VXE_ENC)         += vxe-vxd/
+diff --git a/drivers/media/platform/vxe-vxd/decoder/Makefile b/drivers/media/platform/vxe-vxd/Makefile
+similarity index 50%
+rename from drivers/media/platform/vxe-vxd/decoder/Makefile
+rename to drivers/media/platform/vxe-vxd/Makefile
+index ac0d4e830..8f159aa0f 100644
+--- a/drivers/media/platform/vxe-vxd/decoder/Makefile
++++ b/drivers/media/platform/vxe-vxd/Makefile
+@@ -46,67 +46,55 @@ ERROR_RECOVERY_SIMULATION ?=n
+ # If unsure, say Y
+ CAPTURE_CONTIG_ALLOC ?=y
+
+-#VXD
+-vxd-dec-y += vxd_core.o
+-
+-#PVDEC
+-vxd-dec-y += vxd_pvdec.o
+-
+-#MEM_MGR
+-vxd-dec-y += ../common/img_mem_man.o ../common/img_mem_unified.o
+-vxd-dec-y += ../common/imgmmu.o
+-
+-#Utilities
+-vxd-dec-y += ../common/lst.o ../common/dq.o
+-vxd-dec-y += ../common/resource.o
+-vxd-dec-y += dec_resources.o
+-vxd-dec-y += ../common/rman_api.o
+-vxd-dec-y += pixel_api.o
+-vxd-dec-y += vdecdd_utils_buf.o
+-vxd-dec-y += vdecdd_utils.o
+-
+-#MMU
+-vxd-dec-y += ../common/talmmu_api.o
+-vxd-dec-y += ../common/pool.o
+-vxd-dec-y += ../common/hash.o
+-vxd-dec-y += ../common/ra.o
+-vxd-dec-y += ../common/addr_alloc.o
+-vxd-dec-y += ../common/work_queue.o
+-vxd-dec-y += vdec_mmu_wrapper.o
+-
+-#DECODER
+-vxd-dec-y += ../common/pool_api.o ../common/idgen_api.o
+-vxd-dec-y += hw_control.o
+-vxd-dec-y += vxd_int.o
+-vxd-dec-y += translation_api.o
+-vxd-dec-y += decoder.o
+-vxd-dec-y += core.o
+-
+-#BSPP
+-vxd-dec-y += swsr.o
+-vxd-dec-y += h264_secure_parser.o
+-vxd-dec-y += bspp.o
+-
+-#UM INTERFACE & SYSDEV
+-vxd-dec-y += vxd_dec.o
+-
+-vxd-dec-y += vxd_v4l2.o
++vxd-dec-y += common/img_mem_man.o \
++	common/img_mem_unified.o \
++	common/imgmmu.o \
++	common/pool_api.o \
++	common/idgen_api.o \
++	common/talmmu_api.o \
++	common/pool.o \
++	common/hash.o \
++	common/ra.o \
++	common/addr_alloc.o \
++	common/work_queue.o \
++	common/lst.o \
++	common/dq.o \
++	common/resource.o \
++	common/rman_api.o \
++
++vxd-dec-y += decoder/vxd_core.o \
++	decoder/vxd_pvdec.o \
++	decoder/dec_resources.o \
++	decoder/pixel_api.o \
++	decoder/vdecdd_utils_buf.o \
++	decoder/vdecdd_utils.o \
++	decoder/vdec_mmu_wrapper.o \
++	decoder/hw_control.o \
++	decoder/vxd_int.o \
++	decoder/translation_api.o \
++	decoder/decoder.o \
++	decoder/core.o \
++	decoder/swsr.o \
++	decoder/h264_secure_parser.o \
++	decoder/bspp.o \
++	decoder/vxd_dec.o \
++	decoder/vxd_v4l2.o \
+
+-ifeq ($(DEBUG_DECODER_DRIVER), y)
+-ccflags-y   += -DDEBUG_DECODER_DRIVER
+-ccflags-y   += -DDEBUG
+-endif
+
+ ifeq ($(HAS_HEVC),y)
+ ccflags-y   += -DHAS_HEVC
+-vxd-dec-y += hevc_secure_parser.o
++vxd-dec-y += decoder/hevc_secure_parser.o
+ endif
+
+ ifeq ($(HAS_JPEG),y)
+ ccflags-y   += -DHAS_JPEG
+-vxd-dec-y += jpeg_secure_parser.o
++vxd-dec-y += decoder/jpeg_secure_parser.o
+ endif
+
++ifeq ($(DEBUG_DECODER_DRIVER), y)
++ccflags-y   += -DDEBUG_DECODER_DRIVER
++ccflags-y   += -DDEBUG
++endif
+
+ ifeq ($(ERROR_CONCEALMENT),y)
+ ccflags-y   += -DERROR_CONCEALMENT
+@@ -126,4 +114,50 @@ endif
+
+ obj-$(CONFIG_VIDEO_IMG_VXD_DEC) += vxd-dec.o
+
+-ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common
++# (1)
++# This config, if enabled, enables all the debug traces in
++# encoder driver. Enable it only for debug purpose
++# Keep it always disabled for release codebase
++DEBUG_ENCODER_DRIVER ?=n
++
++# (3)
++# This config enables encoder performance profiling
++# keep it always disabled. Enable it only for profiling in development
++# environments.
++ENABLE_PROFILING ?=n
++
++vxe-enc-y += common/img_mem_man.o \
++	common/img_mem_unified.o \
++	common/talmmu_api.o \
++	common/addr_alloc.o \
++	common/lst.o \
++	common/hash.o \
++	common/ra.o \
++	common/pool.o \
++	common/rman_api.o \
++	common/dq.o \
++	common/idgen_api.o \
++	common/imgmmu.o \
++	common/work_queue.o \
++
++vxe-enc-y += encoder/vxe_v4l2.o \
++	encoder/vxe_enc.o \
++	encoder/topaz_device.o \
++	encoder/topazmmu.o \
++	encoder/topaz_api.o \
++	encoder/topaz_api_utils.o \
++	encoder/header_gen.o \
++	encoder/mtx_fwif.o \
++
++obj-$(CONFIG_VIDEO_IMG_VXE_ENC) += vxe-enc.o
++
++ifeq ($(DEBUG_ENCODER_DRIVER), y)
++ccflags-y   += -DDEBUG_ENCODER_DRIVER
++ccflags-y   += -DDEBUG
++endif
++
++ifeq ($(ENABLE_PROFILING),y)
++ccflags-y	+= -DENABLE_PROFILING
++endif
++
++ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common/
+diff --git a/drivers/media/platform/vxe-vxd/encoder/Makefile b/drivers/media/platform/vxe-vxd/encoder/Makefile
+deleted file mode 100644
+index e43a03eb4..000000000
+--- a/drivers/media/platform/vxe-vxd/encoder/Makefile
++++ /dev/null
+@@ -1,56 +0,0 @@
+-# SPDX-License-Identifier: GPL-2.0
+-
+-# (1)
+-# This config, if enabled, enables all the debug traces in
+-# encoder driver. Enable it only for debug purpose
+-# Keep it always disabled for release codebase
+-DEBUG_ENCODER_DRIVER ?=n
+-
+-# (3)
+-# This config enables encoder performance profiling
+-# keep it always disabled. Enable it only for profiling in development
+-# environments.
+-ENABLE_PROFILING ?=n
+-
+-#UM INTERFACE & SYSDEV
+-vxe-enc-y += vxe_v4l2.o
+-vxe-enc-y += vxe_enc.o
+-
+-#TOPAZ Device
+-vxe-enc-y += topaz_device.o
+-
+-#MEM_MGR
+-vxe-enc-y += ../common/img_mem_man.o ../common/img_mem_unified.o
+-vxe-enc-y += ../common/talmmu_api.o
+-vxe-enc-y += ../common/addr_alloc.o
+-vxe-enc-y += ../common/lst.o
+-vxe-enc-y += ../common/hash.o
+-vxe-enc-y += ../common/ra.o
+-vxe-enc-y += ../common/pool.o
+-vxe-enc-y += ../common/rman_api.o
+-vxe-enc-y += ../common/dq.o
+-vxe-enc-y += ../common/idgen_api.o
+-vxe-enc-y += topazmmu.o
+-vxe-enc-y += ../common/imgmmu.o
+-vxe-enc-y += ../common/work_queue.o
+-
+-#Topaz framework and firmware prep
+-vxe-enc-y += topaz_api.o
+-vxe-enc-y += topaz_api_utils.o
+-vxe-enc-y += header_gen.o
+-
+-#FWIF
+-vxe-enc-y += mtx_fwif.o
+-
+-obj-$(CONFIG_VIDEO_IMG_VXE_ENC) += vxe-enc.o
+-
+-ifeq ($(DEBUG_ENCODER_DRIVER), y)
+-ccflags-y   += -DDEBUG_ENCODER_DRIVER
+-ccflags-y   += -DDEBUG
+-endif
+-
+-ifeq ($(ENABLE_PROFILING),y)
+-ccflags-y	+= -DENABLE_PROFILING
+-endif
+-
+-ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common/
+--
+2.17.1
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 545ea569..a3ed19ac 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -33,7 +33,8 @@ PR = "${MACHINE_KERNEL_PR}"
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
+            file://defconfig \
+            file://0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch"
 
 FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
 
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
