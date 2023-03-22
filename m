Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6397C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 19:51:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.54161.1679514679742370904
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 12:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 157C740C5D;
	Wed, 22 Mar 2023 19:51:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKb1DSSzg9Fj; Wed, 22 Mar 2023 19:51:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DACB640C06;
	Wed, 22 Mar 2023 19:51:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E3AAD1637DB; Wed, 22 Mar 2023 15:50:43 -0400 (EDT)
Date: Wed, 22 Mar 2023 15:50:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone/master][PATCH v4 2/3] linux-ti-staging:
 Add 6.1 kernel in prep for LTS migration
Message-ID: <20230322195043.GO18050@denix.org>
References: <20230322143203.20360-1-reatmon@ti.com>
 <20230322143203.20360-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322143203.20360-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 19:51:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16240

On Wed, Mar 22, 2023 at 09:32:02AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are preparing to migrate our kernel version to 6.1.  As we are still
> working on the migration, mark the default preference low for this
> version.  We will enable building with this kernel in a meta-arago brand
> in the near future.  Once the migration is complete, we will remove the
> 5.10 kernel and make this the default.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
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
>  .../linux/linux-ti-staging_6.1.bb             | 39 +++++++++++++++++++
>  12 files changed, 73 insertions(+)
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

<snip>


> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> new file mode 100644
> index 00000000..654951eb
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -0,0 +1,39 @@
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
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"

I don't think this is needed any more - this hasn't been used for quite a 
while.
IIRC, this was used to bundle DTB+DTBOs into a mini FIT image in the early 
DT Overlay days...

-- 
Denys

