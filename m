Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C8DC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:22:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11146.1685708546492010708
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 05:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3559340CA7;
	Fri,  2 Jun 2023 12:22:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyBHVeSIWIwj; Fri,  2 Jun 2023 12:22:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D133340C24;
	Fri,  2 Jun 2023 12:22:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A26DC16393F; Fri,  2 Jun 2023 08:21:30 -0400 (EDT)
Date: Fri, 2 Jun 2023 08:21:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
Message-ID: <20230602122130.GN9226@denix.org>
References: <20230602092932.2576466-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602092932.2576466-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 12:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16657

On Fri, Jun 02, 2023 at 02:59:32PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which contains
> patches used for jailhouse. These will be used to build jailhouse image.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../u-boot/u-boot-ti-jailhouse_2023.04.bb     | 11 ++++++
>  .../linux/linux-ti-jailhouse-6.1/defconfig    |  2 +
>  .../linux/linux-ti-jailhouse-6.1/k3/defconfig |  2 +
>  .../linux-ti-jailhouse-6.1/omapl138/defconfig |  1 +
>  .../linux/linux-ti-jailhouse_6.1.bb           | 37 +++++++++++++++++++
>  5 files changed, 53 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> new file mode 100644
> index 00000000..be374108
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> @@ -0,0 +1,11 @@
> +require u-boot-ti.inc
> +
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> +
> +PR = "r0"
> +
> +BRANCH = "ti-u-boot-2023.04-jailhouse"
> +
> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
> +
> +SRCREV = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
> new file mode 100644
> index 00000000..24b53cf7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=multi_v7_defconfig
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
> new file mode 100644
> index 00000000..ef1d3efd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=defconfig
> +config-fragment=kernel/configs/ti_arm64_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
> new file mode 100644
> index 00000000..099493af
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=davinci_all_defconfig
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> new file mode 100644
> index 00000000..85eaba25
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> @@ -0,0 +1,37 @@

Can you do it similarly to linux-ti-staging-rt recipe by not duplicating the 
entire base recipe?


> +SECTION = "kernel"
> +SUMMARY = "Linux kernel for jailhouse for TI devices"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +inherit kernel_vendor_dtb
> +
> +require recipes-kernel/linux/setup-defconfig.inc
> +require recipes-kernel/linux/kernel-rdepends.inc
> +require recipes-kernel/linux/ti-kernel.inc
> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> +
> +DEPENDS += "gmp-native libmpc-native"
> +
> +# Look in the generic major.minor directory for files
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
> +
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> +		      ${EXTRA_DTC_ARGS}"
> +
> +S = "${WORKDIR}/git"
> +
> +BRANCH = "ti-linux-6.1.y-jailhouse"
> +
> +SRCREV = "0ed0dec2462b805b0188fe080895adc437871549"
> +PV = "6.1.26+git${SRCPV}"
> +
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR:append = "b"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
> +KERNEL_GIT_PROTOCOL = "https"
> +SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> +            file://defconfig"
> -- 
> 2.34.1

