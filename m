Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86F4C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 21:41:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5306.1741988509896205124
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 14:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C92E940CA8;
	Fri, 14 Mar 2025 21:41:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pS2_RF6nokB; Fri, 14 Mar 2025 21:41:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9ABFD406B5;
	Fri, 14 Mar 2025 21:41:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07677164372; Fri, 14 Mar 2025 17:41:45 -0400 (EDT)
Date: Fri, 14 Mar 2025 17:41:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: matthias.schiffer@ew.tq-group.com, Randolph Sapp <rs@ti.com>
Cc: meta-ti@lists.yoctoproject.org, oss@ew.tq-group.com
Subject: Re: [meta-ti] [scarthgap/master][PATCH] ti-sgx-ddk-km: work around
 incorrect target name selection
Message-ID: <20250314214144.GG23729@denix.org>
References: <20250306141217.346689-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306141217.346689-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Mar 2025 21:41:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18384

+ Randolph Sapp as a domain expert here


On Thu, Mar 06, 2025 at 03:12:17PM +0100, Matthias Schiffer via lists.yoctoproject.org wrote:
> The omap5-sgx-ddk-linux Makefiles contain a list of target triple
> patterns that are detected as "Yocto" to deal with arm vs. armhf target
> selection. This breaks for Yocto distros that override TARGET_VENDOR,
> requiring patches like [1]; similar patches can also be found in other
> vendors' machine layers.
> 
> Work around the incorrect target selection by passing TARGET_PRIMARY_ARCH
> via EXTRA_OEMAKE.
> 
> [1] https://github.com/tq-systems/meta-tq/blob/scarthgap.TQ.ARM.BSP.0003/meta-tq/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/linux-5.10/0001-ti-sgx-ddk-km-properly-handle-more-OE-YP-compiler-pr.patch
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> Tested with meta-tq + meta-ti scarthgap for am335x.
> 
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb     | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 49376221..aaeee1d2 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -28,8 +28,11 @@ TARGET_PRODUCT:am65xx = "ti654x_linux"
>  PVR_BUILD = "release"
>  PVR_WS = "lws-generic"
>  
> +TARGET_PRIMARY_ARCH = "target_armhf"
> +TARGET_PRIMARY_ARCH:aarch64 = "target_aarch64"
> +
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} \
> -WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT}'
> +WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT} TARGET_PRIMARY_ARCH=${TARGET_PRIMARY_ARCH}'
>  
>  # There are useful flags here that are interpreted by the final kbuild pass
>  # These variables are not necessary when compiling outside of Yocto
> @@ -40,11 +43,7 @@ export KERNEL_OBJCOPY
>  export KERNEL_STRIP
>  
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> -}
> -
> -do_install:am65xx() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/${TARGET_PRIMARY_ARCH}/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
>  
>  RRECOMMENDS:${PN} += "ti-sgx-ddk-um"

