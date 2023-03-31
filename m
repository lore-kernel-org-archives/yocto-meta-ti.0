Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC73C7619A
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 00:20:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43201.1680222032297391230
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 17:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5A9140C5D;
	Fri, 31 Mar 2023 00:20:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYNeDgmHTPVn; Fri, 31 Mar 2023 00:20:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77CC140C24;
	Fri, 31 Mar 2023 00:20:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A07CA1637E5; Thu, 30 Mar 2023 20:19:53 -0400 (EDT)
Date: Thu, 30 Mar 2023 20:19:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v6 2/3] linux-ti-staging:
 Add 6.1 kernel in prep for LTS migration
Message-ID: <20230331001953.GF18050@denix.org>
References: <20230330213347.20656-1-reatmon@ti.com>
 <20230330213347.20656-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330213347.20656-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 00:20:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16274

On Thu, Mar 30, 2023 at 04:33:46PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are preparing to migrate our kernel version to 6.1.  As we are still
> working on the migration, mark the default preference low for this
> version.  We will enable building with this kernel in a meta-arago brand
> in the near future.  Once the migration is complete, we will remove the
> 5.10 kernel and make this the default.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v6: Remove line based on feedback from Denys.
> v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
> v2: Added rt and systest versions of the kernel.
> 
>  .../linux/linux-ti-staging-6.1/defconfig      |  2 +
>  .../linux/linux-ti-staging-6.1/k3/defconfig   |  2 +
>  .../linux-ti-staging-6.1/omapl138/defconfig   |  1 +
>  .../linux/linux-ti-staging-rt-6.1/defconfig   |  2 +
>  .../linux-ti-staging-rt-6.1/k3/defconfig      |  2 +
>  .../omapl138/defconfig                        |  1 +
>  .../linux/linux-ti-staging-rt_6.1.bb          | 12 ++++++
>  .../linux-ti-staging-systest-6.1/defconfig    |  2 +
>  .../linux-ti-staging-systest-6.1/k3/defconfig |  2 +
>  .../omapl138/defconfig                        |  1 +
>  .../linux/linux-ti-staging-systest_6.1.bb     |  7 ++++
>  .../linux/linux-ti-staging_6.1.bb             | 38 +++++++++++++++++++
>  12 files changed, 72 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
> new file mode 100644
> index 00000000..24b53cf7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=multi_v7_defconfig
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
> new file mode 100644
> index 00000000..ef1d3efd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=defconfig
> +config-fragment=kernel/configs/ti_arm64_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
> new file mode 100644
> index 00000000..099493af
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=davinci_all_defconfig
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
> new file mode 100644
> index 00000000..24b53cf7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=multi_v7_defconfig
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> new file mode 100644
> index 00000000..ef1d3efd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=defconfig
> +config-fragment=kernel/configs/ti_arm64_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
> new file mode 100644
> index 00000000..099493af
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=davinci_all_defconfig
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> new file mode 100644
> index 00000000..8b978e09
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> @@ -0,0 +1,12 @@
> +require linux-ti-staging_6.1.bb
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +# Look in the generic major.minor directory for files
> +# This will have priority over generic non-rt path
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
> +
> +BRANCH = "ti-rt-linux-6.1.y"
> +
> +SRCREV = "b7d4fb88264d2b094035871fa676592eb8e83b25"
> +PV = "6.1+git${SRCPV}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
> new file mode 100644
> index 00000000..24b53cf7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=multi_v7_defconfig
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
> new file mode 100644
> index 00000000..ef1d3efd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
> @@ -0,0 +1,2 @@
> +use-kernel-config=defconfig
> +config-fragment=kernel/configs/ti_arm64_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
> new file mode 100644
> index 00000000..099493af
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=davinci_all_defconfig
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
> new file mode 100644
> index 00000000..1c30d27c
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
> @@ -0,0 +1,7 @@
> +require linux-ti-staging_6.1.bb
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +# Look in the generic major.minor directory for files
> +# This will have priority over generic non-rt path
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> new file mode 100644
> index 00000000..131dd1b3
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -0,0 +1,38 @@
> +SECTION = "kernel"
> +SUMMARY = "Linux kernel for TI devices"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> +
> +inherit kernel
> +
> +DEFAULT_PREFERENCE = "-1"
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
> +BRANCH = "ti-linux-6.1.y"
> +
> +SRCREV = "7b7231fbf048963b434d76a3cb866165365b14e0"
> +PV = "6.1+git${SRCPV}"
> +
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR:append = "b"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_PROTOCOL = "https"
> +SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> +            file://defconfig"
> +
> -- 
> 2.17.1

