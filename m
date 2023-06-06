Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1B0C7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:03:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.628.1686085412870364056
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D810840C37;
	Tue,  6 Jun 2023 21:03:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rM5A5lphig_4; Tue,  6 Jun 2023 21:03:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0D8B40AE9;
	Tue,  6 Jun 2023 21:03:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AB94516394E; Tue,  6 Jun 2023 17:02:39 -0400 (EDT)
Date: Tue, 6 Jun 2023 17:02:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: xulin.sun@windriver.com
Cc: reatmon@ti.com, denys@konsulko.com, meta-ti@lists.yoctoproject.org,
	rs@ti.com
Subject: Re: [meta-ti][meta-ti master][PATCH] ti-img-rogue-driver: add
 KERNEL_CC to make
Message-ID: <20230606210239.GS9226@denix.org>
References: <20230606033706.32554-1-xulin.sun@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606033706.32554-1-xulin.sun@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16680

On Tue, Jun 06, 2023 at 11:37:06AM +0800, Xulin Sun via lists.yoctoproject.org wrote:
> Bring in KERNEL_CC variable to avoid below building issue:
> 
> WARNING: ti-img-rogue-driver-23.1.6404501-b do_package_qa: QA Issue:
> File /lib/modules/6.1.31-rt10-yocto-preempt-rt/extra/pvrsrvkm.ko in package
> kernel-module-pvrsrvkm-6.1.31-rt10-yocto-preempt-rt contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> ---
>  ...0001-kbuild-wrap-cc-in-double-quotes.patch | 47 +++++++++++++++++++
>  .../ti-img-rogue-driver_23.1.6404501.bb       |  6 ++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
> new file mode 100644
> index 00000000..6faf6fe2
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
> @@ -0,0 +1,47 @@
> +From 48ac628f0c6e679c165f08fec18818f802b535d1 Mon Sep 17 00:00:00 2001
> +From: Xulin Sun <xulin.sun@windriver.com>
> +Date: Tue, 6 Jun 2023 01:28:31 +0000
> +Subject: [PATCH] kbuild: wrap cc in double quotes
> +
> +Set the CC variable correctly, to avoid below building issue:
> +make[1]: aarch64-wrs-linux-aarch64-wrs-linux-gcc: No such file or directory

Upstream-status?

Anyway, it seems quotation should be applied not just to CC, but to other vars 
like AR, LD, NM and OBJCOPY. And CROSS_COMPILE and EXTRA_CFLAGS are already 
doing it correctly just above...


Randolph,

Can you take these changes to upstream repo so this patch is not needed in 
meta-ti? Thanks.


> +Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +---
> + build/linux/kbuild/kbuild.mk | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/build/linux/kbuild/kbuild.mk b/build/linux/kbuild/kbuild.mk
> +index f65d6a4..2085766 100644
> +--- a/build/linux/kbuild/kbuild.mk
> ++++ b/build/linux/kbuild/kbuild.mk
> +@@ -97,7 +97,7 @@ kbuild: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile bridges
> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
> + 		AR=$(if $(KERNEL_AR),$(KERNEL_AR),$(KERNEL_CROSS_COMPILE)ar) \
> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
> +@@ -133,7 +133,7 @@ kbuild_clean: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
> +@@ -160,7 +160,7 @@ kbuild_modules_install: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
> + 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
> + 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
> + 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
> +-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
> ++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
> + 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
> + 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
> + 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
> +-- 
> +2.35.5
> +
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> index 76e3d801..b3fba3c4 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> @@ -20,6 +20,10 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>  
>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>  
> +SRC_URI += " \
> +	file://0001-kbuild-wrap-cc-in-double-quotes.patch \
> +"
> +
>  S = "${WORKDIR}/git"
>  
>  SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
> @@ -31,7 +35,7 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>  PVR_BUILD = "release"
>  PVR_WS = "lws-generic"
>  
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +EXTRA_OEMAKE += 'KERNEL_CC="${KERNEL_CC}" KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>  
>  do_install() {
>      make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> -- 
> 2.40.1

