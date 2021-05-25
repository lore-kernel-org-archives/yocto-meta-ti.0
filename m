Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.4155.1621907504902736844
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 May 2021 18:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 04FB140C2A;
	Tue, 25 May 2021 01:51:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgmE9ME6mYSo; Tue, 25 May 2021 01:51:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCB9C40BFF;
	Tue, 25 May 2021 01:51:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6633A16C044; Mon, 24 May 2021 21:51:39 -0400 (EDT)
Date: Mon, 24 May 2021 21:51:39 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>, Nishant Menon <nm@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210525015139.GB1528@denix.org>
References: <20210524224036.13526-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210524224036.13526-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> compile dtbs with symbols. This fixes the issue where the dtbs
> are build without symbols causing issue with overlays.
> 
> Enabling overlay support increases the size of the dtb, hence
> it is done at a platform level rather than globally to allow custom
> boards disable it from local.conf to reduce size.
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/am335x-evm.conf                  | 2 ++
>  conf/machine/am335x-hs-evm.conf               | 2 ++
>  conf/machine/am437x-evm.conf                  | 2 ++
>  conf/machine/am437x-hs-evm.conf               | 2 ++
>  conf/machine/am57xx-evm.conf                  | 2 ++
>  conf/machine/am57xx-hs-evm.conf               | 3 +++
>  conf/machine/am65xx-evm.conf                  | 2 ++
>  conf/machine/am65xx-hs-evm.conf               | 2 ++
>  conf/machine/dra7xx-evm.conf                  | 2 ++
>  conf/machine/dra7xx-hs-evm.conf               | 3 +++
>  conf/machine/j7-evm.conf                      | 2 ++
>  conf/machine/j7-hs-evm.conf                   | 2 ++
>  conf/machine/j7200-evm.conf                   | 2 ++
>  conf/machine/k2g-evm.conf                     | 2 ++
>  conf/machine/k2g-hs-evm.conf                  | 2 ++

First question:
If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine 
configs, should it instead be done in SoC include files, like ti33x.inc, 
k3.inc or even ti-soc.inc?


>  recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
>  recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
>  18 files changed, 49 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/ti-kernel.inc

[...]


> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index fc16485d..6770adca 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -8,10 +8,12 @@ inherit kernel
>  DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
> +require recipes-kernel/linux/ti-kernel.inc
>  
>  DEPENDS += "gmp-native"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> +		      ${EXTRA_DTC_ARGS}"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -23,7 +25,7 @@ SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
>  PV = "5.12+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 4ec19af7..0a134f93 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -11,11 +11,13 @@ require recipes-kernel/linux/cmem.inc
>  require recipes-kernel/linux/ti-uio.inc
>  require recipes-kernel/linux/bundle-devicetree.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
> +require recipes-kernel/linux/ti-kernel.inc
>  
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>  
> -KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> +		      ${EXTRA_DTC_ARGS}"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -25,7 +27,7 @@ SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
>  PV = "5.10.30+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> diff --git a/recipes-kernel/linux/ti-kernel.inc b/recipes-kernel/linux/ti-kernel.inc
> new file mode 100644
> index 00000000..a7eb476e
> --- /dev/null
> +++ b/recipes-kernel/linux/ti-kernel.inc
> @@ -0,0 +1,9 @@
> +# Add DTC FLAGS -@ when KERNEL_DTB_OVERLAY_SUPPORT is enabled
> +
> +def get_extra_dtc_args(d):
> +    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
> +        return "DTC_FLAGS=-@"
> +    else:
> +        return ""
> +
> +EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"

Second question:
Are there any specific future plans for EXTRA_DTC_ARGS? As it seems to be 
an unused intermediary variable right now - you can directly append to 
KERNEL_EXTRA_ARGS here...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
