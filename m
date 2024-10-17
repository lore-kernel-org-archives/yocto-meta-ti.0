Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB0D3C52F
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 19:45:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6972.1729194315337164495
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2ED1C40CE3;
	Thu, 17 Oct 2024 19:45:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYWkYlzlCj1R; Thu, 17 Oct 2024 19:45:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDEFF40CE2;
	Thu, 17 Oct 2024 19:45:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2BA841640B9; Thu, 17 Oct 2024 15:45:10 -0400 (EDT)
Date: Thu, 17 Oct 2024 15:45:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] linux: Rework the
 reproducibility patches
Message-ID: <20241017194510.GB20070@denix.org>
References: <20241017190825.5694-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017190825.5694-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 19:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18014

I don't think you need bsp-overrides anymore...


On Thu, Oct 17, 2024 at 02:08:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> It was suggested to move the reproducibility patches out of
> ti-kernel.inc and into the respective recipes.  Take this time to also
> rename the variable being added to the SRC_URI to
> REPRODUCIBILITY_PATCHES to make it clearer about what the patches are
> that it lists.
> 
> This change will also make it easier for the upstream testing flow to
> update the mainline recipe to the new version and update the needed
> patches at the same time.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../linux/linux-ti-mainline_git.bb             |  4 ++++
>  .../linux/linux-ti-staging_6.12.bb             |  4 ++++
>  .../linux/linux-ti-staging_6.6.bb              |  4 ++++
>  meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 18 ++----------------
>  4 files changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index a9048f16..bd06cc2b 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -19,6 +19,10 @@ PV = "6.11"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=https;branch=master"
>  
> +REPRODUCIBILITY_PATCHES:bsp-mainline = " \
> +    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
> +"
> +
>  DEFCONFIG_NAME = "multi_v7_defconfig"
>  DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>  DEFCONFIG_NAME:k3 = "defconfig"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index f6f8732b..591eb5e3 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -33,6 +33,10 @@ KERNEL_GIT_PROTOCOL = "https"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
>  
> +REPRODUCIBILITY_PATCHES:bsp-ti-6_12 = " \
> +    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
> +"
> +
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index 9a906a0f..baf5f9f1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -31,6 +31,10 @@ KERNEL_GIT_PROTOCOL = "https"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
>  
> +REPRODUCIBILITY_PATCHES:bsp-ti-6_6 = " \
> +    file://0001-vt-conmakehash-improve-reproducibility.patch \
> +"
> +
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> index 09cfdb12..e51b14d7 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -13,19 +13,5 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
>  KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
>  KERNEL_DTBVENDORED = "1"
>  
> -KERNEL_PATCHES = ""
> -
> -KERNEL_PATCHES:bsp-mainline = " \
> -    file://0001-vt-conmakehash-improve-reproducibility-for-v6.10.patch \
> -    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
> -"
> -
> -KERNEL_PATCHES:bsp-ti-6_12 = " \
> -    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
> -"
> -
> -KERNEL_PATCHES:bsp-ti-6_6 = " \
> -    file://0001-vt-conmakehash-improve-reproducibility.patch \
> -"
> -
> -SRC_URI:append = " ${KERNEL_PATCHES} "
> +REPRODUCIBILITY_PATCHES = ""
> +SRC_URI:append = " ${REPRODUCIBILITY_PATCHES}"
> -- 
> 2.17.1

