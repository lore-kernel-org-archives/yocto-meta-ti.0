Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5187.1638489566959211129
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Dec 2021 15:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 729A140C50;
	Thu,  2 Dec 2021 23:59:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJqXpBot4_IS; Thu,  2 Dec 2021 23:59:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 71AD940B05;
	Thu,  2 Dec 2021 23:59:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BEA4C174701; Thu,  2 Dec 2021 18:59:17 -0500 (EST)
Date: Thu, 2 Dec 2021 18:59:17 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: sidraya.bj@pathpartnertech.com
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org, yogeshs@ti.com,
	d-huang@ti.com, prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com
Subject: Re: [meta-ti] [dunfell/master][PATCH] linux-ti-staging-5.10: Fix build failure in parallel build Env.
Message-ID: <20211202235917.GM18191@denix.org>
References: <20211130120854.25813-1-sidraya.bj@pathpartnertech.com>
 <20211130131547.GG18191@denix.org>
 <bb6f4f02-8ef7-7747-23ba-a3f7772e5118@ti.com>
 <20211130155013.byiyucwlauj6o5sw@sidraya-laptopU>
MIME-Version: 1.0
In-Reply-To: <20211130155013.byiyucwlauj6o5sw@sidraya-laptopU>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2021 at 09:20:15PM +0530, Sidraya Jayagond via lists.yoctoproject.org wrote:
> On Tue, Nov 30, 2021 at 09:31:11AM -0600, praneeth via lists.yoctoproject.org wrote:
> > Sidraya,
> > 
> > On 11/30/2021 7:15 AM, Denys Dmytriyenko wrote:
> > > On Tue, Nov 30, 2021 at 05:38:54PM +0530, sidraya.bj via lists.yoctoproject.org wrote:
> > > > From: Sidraya <sidraya.bj@pathpartnertech.com>
> > > > 
> > > > Fix build failure in parallel build Env.
> > > > Prevent building source code under vxe-vxd/common directory
> > > > twice which leads to overall build to fail.
> > > > 
> > > > Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> > > > ---
> > > >   ...akefile-Fix-build-failure-in-paralle.patch | 261 ++++++++++++++++++
> > > >   recipes-kernel/linux/linux-ti-staging_5.10.bb |   3 +-
> > 
> > Please post the patch against integrated kernel but not as meta-ti carried
> > patch .
> > against https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-linux-5.10.y
> > (same place as where you posted the rest of the driver)
> > 
> > 
> Thanks for the update, I will post to integrated kernel mailing address.

Hi, was this sent and merged to the kernel yet? Can we get the corresponding 
SRCREV update in the recipe? It breaks builds once in a while due to this 
issue...


> > > >   2 files changed, 263 insertions(+), 1 deletion(-)
> > > >   create mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch
> > > > 
> > > > diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch b/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch
> > > > new file mode 100644
> > > > index 00000000..8b683c12
> > > > --- /dev/null
> > > > +++ b/recipes-kernel/linux/linux-ti-staging-5.10/0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch
> > > > @@ -0,0 +1,261 @@
> > > > +From 91ef6053f9a4c884c05857bdc39a496691bbc30f Mon Sep 17 00:00:00 2001
> > > > +From: Sidraya <sidraya.bj@pathpartnertech.com>
> > > > +Date: Fri, 26 Nov 2021 18:28:49 +0530
> > > > +Subject: [PATCH] media: platform: Makefile: Fix build failure in parallel
> > > > + build Env.
> > > > +
> > > > +Fix build failure in parallel build Env.
> > > > +prevent building source code under common directory
> > > > +twice which leads to build fail.
> > > 
> > > Upstream-Status?
> > > 
> > > 
> > > > +Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> > > > +---
> > > > + drivers/media/platform/Makefile               |   4 +-
> > > > + .../platform/vxe-vxd/{decoder => }/Makefile   | 138 +++++++++++-------
> > > > + .../media/platform/vxe-vxd/encoder/Makefile   |  56 -------
> > > > + 3 files changed, 88 insertions(+), 110 deletions(-)
> > > > + rename drivers/media/platform/vxe-vxd/{decoder => }/Makefile (50%)
> > > > + delete mode 100644 drivers/media/platform/vxe-vxd/encoder/Makefile
> > > > +
> > > > +diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > > > +index 9780108f0..d42593fcc 100644
> > > > +--- a/drivers/media/platform/Makefile
> > > > ++++ b/drivers/media/platform/Makefile
> > > > +@@ -81,5 +81,5 @@ obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
> > > > +
> > > > + obj-y					+= sunxi/
> > > > +
> > > > +-obj-$(CONFIG_VIDEO_IMG_VXD_DEC)         += vxe-vxd/decoder/
> > > > +-obj-$(CONFIG_VIDEO_IMG_VXE_ENC)         += vxe-vxd/encoder/
> > > > ++obj-$(CONFIG_VIDEO_IMG_VXD_DEC)         += vxe-vxd/
> > > > ++obj-$(CONFIG_VIDEO_IMG_VXE_ENC)         += vxe-vxd/
> > > > +diff --git a/drivers/media/platform/vxe-vxd/decoder/Makefile b/drivers/media/platform/vxe-vxd/Makefile
> > > > +similarity index 50%
> > > > +rename from drivers/media/platform/vxe-vxd/decoder/Makefile
> > > > +rename to drivers/media/platform/vxe-vxd/Makefile
> > > > +index ac0d4e830..8f159aa0f 100644
> > > > +--- a/drivers/media/platform/vxe-vxd/decoder/Makefile
> > > > ++++ b/drivers/media/platform/vxe-vxd/Makefile
> > > > +@@ -46,67 +46,55 @@ ERROR_RECOVERY_SIMULATION ?=n
> > > > + # If unsure, say Y
> > > > + CAPTURE_CONTIG_ALLOC ?=y
> > > > +
> > > > +-#VXD
> > > > +-vxd-dec-y += vxd_core.o
> > > > +-
> > > > +-#PVDEC
> > > > +-vxd-dec-y += vxd_pvdec.o
> > > > +-
> > > > +-#MEM_MGR
> > > > +-vxd-dec-y += ../common/img_mem_man.o ../common/img_mem_unified.o
> > > > +-vxd-dec-y += ../common/imgmmu.o
> > > > +-
> > > > +-#Utilities
> > > > +-vxd-dec-y += ../common/lst.o ../common/dq.o
> > > > +-vxd-dec-y += ../common/resource.o
> > > > +-vxd-dec-y += dec_resources.o
> > > > +-vxd-dec-y += ../common/rman_api.o
> > > > +-vxd-dec-y += pixel_api.o
> > > > +-vxd-dec-y += vdecdd_utils_buf.o
> > > > +-vxd-dec-y += vdecdd_utils.o
> > > > +-
> > > > +-#MMU
> > > > +-vxd-dec-y += ../common/talmmu_api.o
> > > > +-vxd-dec-y += ../common/pool.o
> > > > +-vxd-dec-y += ../common/hash.o
> > > > +-vxd-dec-y += ../common/ra.o
> > > > +-vxd-dec-y += ../common/addr_alloc.o
> > > > +-vxd-dec-y += ../common/work_queue.o
> > > > +-vxd-dec-y += vdec_mmu_wrapper.o
> > > > +-
> > > > +-#DECODER
> > > > +-vxd-dec-y += ../common/pool_api.o ../common/idgen_api.o
> > > > +-vxd-dec-y += hw_control.o
> > > > +-vxd-dec-y += vxd_int.o
> > > > +-vxd-dec-y += translation_api.o
> > > > +-vxd-dec-y += decoder.o
> > > > +-vxd-dec-y += core.o
> > > > +-
> > > > +-#BSPP
> > > > +-vxd-dec-y += swsr.o
> > > > +-vxd-dec-y += h264_secure_parser.o
> > > > +-vxd-dec-y += bspp.o
> > > > +-
> > > > +-#UM INTERFACE & SYSDEV
> > > > +-vxd-dec-y += vxd_dec.o
> > > > +-
> > > > +-vxd-dec-y += vxd_v4l2.o
> > > > ++vxd-dec-y += common/img_mem_man.o \
> > > > ++	common/img_mem_unified.o \
> > > > ++	common/imgmmu.o \
> > > > ++	common/pool_api.o \
> > > > ++	common/idgen_api.o \
> > > > ++	common/talmmu_api.o \
> > > > ++	common/pool.o \
> > > > ++	common/hash.o \
> > > > ++	common/ra.o \
> > > > ++	common/addr_alloc.o \
> > > > ++	common/work_queue.o \
> > > > ++	common/lst.o \
> > > > ++	common/dq.o \
> > > > ++	common/resource.o \
> > > > ++	common/rman_api.o \
> > > > ++
> > > > ++vxd-dec-y += decoder/vxd_core.o \
> > > > ++	decoder/vxd_pvdec.o \
> > > > ++	decoder/dec_resources.o \
> > > > ++	decoder/pixel_api.o \
> > > > ++	decoder/vdecdd_utils_buf.o \
> > > > ++	decoder/vdecdd_utils.o \
> > > > ++	decoder/vdec_mmu_wrapper.o \
> > > > ++	decoder/hw_control.o \
> > > > ++	decoder/vxd_int.o \
> > > > ++	decoder/translation_api.o \
> > > > ++	decoder/decoder.o \
> > > > ++	decoder/core.o \
> > > > ++	decoder/swsr.o \
> > > > ++	decoder/h264_secure_parser.o \
> > > > ++	decoder/bspp.o \
> > > > ++	decoder/vxd_dec.o \
> > > > ++	decoder/vxd_v4l2.o \
> > > > +
> > > > +-ifeq ($(DEBUG_DECODER_DRIVER), y)
> > > > +-ccflags-y   += -DDEBUG_DECODER_DRIVER
> > > > +-ccflags-y   += -DDEBUG
> > > > +-endif
> > > > +
> > > > + ifeq ($(HAS_HEVC),y)
> > > > + ccflags-y   += -DHAS_HEVC
> > > > +-vxd-dec-y += hevc_secure_parser.o
> > > > ++vxd-dec-y += decoder/hevc_secure_parser.o
> > > > + endif
> > > > +
> > > > + ifeq ($(HAS_JPEG),y)
> > > > + ccflags-y   += -DHAS_JPEG
> > > > +-vxd-dec-y += jpeg_secure_parser.o
> > > > ++vxd-dec-y += decoder/jpeg_secure_parser.o
> > > > + endif
> > > > +
> > > > ++ifeq ($(DEBUG_DECODER_DRIVER), y)
> > > > ++ccflags-y   += -DDEBUG_DECODER_DRIVER
> > > > ++ccflags-y   += -DDEBUG
> > > > ++endif
> > > > +
> > > > + ifeq ($(ERROR_CONCEALMENT),y)
> > > > + ccflags-y   += -DERROR_CONCEALMENT
> > > > +@@ -126,4 +114,50 @@ endif
> > > > +
> > > > + obj-$(CONFIG_VIDEO_IMG_VXD_DEC) += vxd-dec.o
> > > > +
> > > > +-ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common
> > > > ++# (1)
> > > > ++# This config, if enabled, enables all the debug traces in
> > > > ++# encoder driver. Enable it only for debug purpose
> > > > ++# Keep it always disabled for release codebase
> > > > ++DEBUG_ENCODER_DRIVER ?=n
> > > > ++
> > > > ++# (3)
> > > > ++# This config enables encoder performance profiling
> > > > ++# keep it always disabled. Enable it only for profiling in development
> > > > ++# environments.
> > > > ++ENABLE_PROFILING ?=n
> > > > ++
> > > > ++vxe-enc-y += common/img_mem_man.o \
> > > > ++	common/img_mem_unified.o \
> > > > ++	common/talmmu_api.o \
> > > > ++	common/addr_alloc.o \
> > > > ++	common/lst.o \
> > > > ++	common/hash.o \
> > > > ++	common/ra.o \
> > > > ++	common/pool.o \
> > > > ++	common/rman_api.o \
> > > > ++	common/dq.o \
> > > > ++	common/idgen_api.o \
> > > > ++	common/imgmmu.o \
> > > > ++	common/work_queue.o \
> > > > ++
> > > > ++vxe-enc-y += encoder/vxe_v4l2.o \
> > > > ++	encoder/vxe_enc.o \
> > > > ++	encoder/topaz_device.o \
> > > > ++	encoder/topazmmu.o \
> > > > ++	encoder/topaz_api.o \
> > > > ++	encoder/topaz_api_utils.o \
> > > > ++	encoder/header_gen.o \
> > > > ++	encoder/mtx_fwif.o \
> > > > ++
> > > > ++obj-$(CONFIG_VIDEO_IMG_VXE_ENC) += vxe-enc.o
> > > > ++
> > > > ++ifeq ($(DEBUG_ENCODER_DRIVER), y)
> > > > ++ccflags-y   += -DDEBUG_ENCODER_DRIVER
> > > > ++ccflags-y   += -DDEBUG
> > > > ++endif
> > > > ++
> > > > ++ifeq ($(ENABLE_PROFILING),y)
> > > > ++ccflags-y	+= -DENABLE_PROFILING
> > > > ++endif
> > > > ++
> > > > ++ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common/
> > > > +diff --git a/drivers/media/platform/vxe-vxd/encoder/Makefile b/drivers/media/platform/vxe-vxd/encoder/Makefile
> > > > +deleted file mode 100644
> > > > +index e43a03eb4..000000000
> > > > +--- a/drivers/media/platform/vxe-vxd/encoder/Makefile
> > > > ++++ /dev/null
> > > > +@@ -1,56 +0,0 @@
> > > > +-# SPDX-License-Identifier: GPL-2.0
> > > > +-
> > > > +-# (1)
> > > > +-# This config, if enabled, enables all the debug traces in
> > > > +-# encoder driver. Enable it only for debug purpose
> > > > +-# Keep it always disabled for release codebase
> > > > +-DEBUG_ENCODER_DRIVER ?=n
> > > > +-
> > > > +-# (3)
> > > > +-# This config enables encoder performance profiling
> > > > +-# keep it always disabled. Enable it only for profiling in development
> > > > +-# environments.
> > > > +-ENABLE_PROFILING ?=n
> > > > +-
> > > > +-#UM INTERFACE & SYSDEV
> > > > +-vxe-enc-y += vxe_v4l2.o
> > > > +-vxe-enc-y += vxe_enc.o
> > > > +-
> > > > +-#TOPAZ Device
> > > > +-vxe-enc-y += topaz_device.o
> > > > +-
> > > > +-#MEM_MGR
> > > > +-vxe-enc-y += ../common/img_mem_man.o ../common/img_mem_unified.o
> > > > +-vxe-enc-y += ../common/talmmu_api.o
> > > > +-vxe-enc-y += ../common/addr_alloc.o
> > > > +-vxe-enc-y += ../common/lst.o
> > > > +-vxe-enc-y += ../common/hash.o
> > > > +-vxe-enc-y += ../common/ra.o
> > > > +-vxe-enc-y += ../common/pool.o
> > > > +-vxe-enc-y += ../common/rman_api.o
> > > > +-vxe-enc-y += ../common/dq.o
> > > > +-vxe-enc-y += ../common/idgen_api.o
> > > > +-vxe-enc-y += topazmmu.o
> > > > +-vxe-enc-y += ../common/imgmmu.o
> > > > +-vxe-enc-y += ../common/work_queue.o
> > > > +-
> > > > +-#Topaz framework and firmware prep
> > > > +-vxe-enc-y += topaz_api.o
> > > > +-vxe-enc-y += topaz_api_utils.o
> > > > +-vxe-enc-y += header_gen.o
> > > > +-
> > > > +-#FWIF
> > > > +-vxe-enc-y += mtx_fwif.o
> > > > +-
> > > > +-obj-$(CONFIG_VIDEO_IMG_VXE_ENC) += vxe-enc.o
> > > > +-
> > > > +-ifeq ($(DEBUG_ENCODER_DRIVER), y)
> > > > +-ccflags-y   += -DDEBUG_ENCODER_DRIVER
> > > > +-ccflags-y   += -DDEBUG
> > > > +-endif
> > > > +-
> > > > +-ifeq ($(ENABLE_PROFILING),y)
> > > > +-ccflags-y	+= -DENABLE_PROFILING
> > > > +-endif
> > > > +-
> > > > +-ccflags-y += -I$(srctree)/drivers/media/platform/vxe-vxd/common/
> > > > +--
> > > > +2.17.1
> > > > diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > > > index 545ea569..a3ed19ac 100644
> > > > --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > > > +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> > > > @@ -33,7 +33,8 @@ PR = "${MACHINE_KERNEL_PR}"
> > > >   KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> > > >   KERNEL_GIT_PROTOCOL = "git"
> > > >   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> > > > -            file://defconfig"
> > > > +            file://defconfig \
> > > > +            file://0001-media-platform-Makefile-Fix-build-failure-in-paralle.patch"
> > > >   FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> > > > -- 
> > > > 2.17.1
> > > > 
> > > > 
> > > > -- 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > > This
> > > > message contains confidential information and is intended only
> > > > for the
> > > > individual(s) named. If you are not the intended
> > > > recipient, you are
> > > > notified that disclosing, copying, distributing or taking any
> > > > action in
> > > > reliance on the contents of this mail and attached file/s is strictly
> > > > prohibited. Please notify the
> > > > sender immediately and delete this e-mail
> > > > from your system. E-mail transmission
> > > > cannot be guaranteed to be secured or
> > > > error-free as information could be
> > > > intercepted, corrupted, lost, destroyed,
> > > > arrive late or incomplete, or contain
> > > > viruses. The sender therefore does
> > > > not accept liability for any errors or
> > > > omissions in the contents of this
> > > > message, which arise as a result of e-mail
> > > > transmission.
> > > 
> > > > 
> > > > 
> > > > 
> > > 
> > > 
> 
> > 
> > 
> > 
> 
> 
