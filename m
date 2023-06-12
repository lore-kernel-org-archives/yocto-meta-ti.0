Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F716C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 19:43:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.70069.1686599003687880200
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 12:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D34040C62;
	Mon, 12 Jun 2023 19:43:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd4k8Tb0E66E; Mon, 12 Jun 2023 19:43:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 406B840C16;
	Mon, 12 Jun 2023 19:43:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E618A163A47; Mon, 12 Jun 2023 15:42:29 -0400 (EDT)
Date: Mon, 12 Jun 2023 15:42:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][RFC] ti-extras: Add support for
 extra kernel/u-boot features
Message-ID: <20230612194229.GQ9226@denix.org>
References: <20230611195444.6162-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230611195444.6162-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jun 2023 19:43:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16709

Thanks, Ryan, for taking a stab at it after our discussion on Friday - this 
looks very promising!

I have few minor comments/questions:

1. Should COMPATIBLE_MACHINE be a bit broarder and include "am62xx" SoC family 
and not just the EVM? Also, ti-extras only enabled for am62x for now?

2. Was there a specific reason to use a weak ??= in KERNEL_GIT_URI? Doesn't 
seem to be needed for UBOOT_GIT_URI...

3. Naming - TI_EXTRAS vs TI_EXPERIMENTS? Should we check for the proper use 
of "tie-*" namespace before making it a MACHINEOVERRIDES, any safeguards?


On Sun, Jun 11, 2023 at 02:54:44PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Paresh Bhagat <p-bhagat@ti.com>
> 
> There are some features that will either never be accepted into the
> upstream kernel, or are not ready to be accepted.  ti-extras allows for
> controlling the kernel and u-boot repos, breanches, and srcrevs to gain
> access to those features via the TI_EXTRAS variable in the local.conf
> file.
> 
> Initial support for TI_EXTRAS=tie-jailhouse is being added by this
> patch.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> 
> RFC
> 
> This is a pass at reworking the logic for adding support for jailhouse
> behind a more extensible TI_EXTRAS system.  Please comment on it.
> 
> 
> 
> 
>  meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      |  1 +
>  meta-ti-bsp/conf/machine/am62xx-evm.conf           |  1 +
>  meta-ti-bsp/conf/machine/include/ti-extras.inc     |  5 +++++
>  meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc       | 11 +++++++++++
>  .../u-boot/u-boot-ti-staging_2023.04.bb            |  2 ++
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       |  2 +-
>  .../recipes-kernel/linux/linux-ti-staging_6.1.bb   |  7 ++++---
>  meta-ti-bsp/recipes-kernel/linux/ti-extras.inc     | 14 ++++++++++++++
>  .../recipes-ti/jailhouse/jailhouse_git.bb          |  2 ++
>  9 files changed, 41 insertions(+), 4 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/include/ti-extras.inc
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 9889ae38..548369ca 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>  
>  require conf/machine/include/k3r5.inc
> +require conf/machine/include/ti-extras.inc
>  
>  SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index c4357be3..082a1ae7 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -3,6 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
>  
>  require conf/machine/include/am62xx.inc
> +require conf/machine/include/ti-extras.inc
>  
>  KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/ti-extras.inc b/meta-ti-bsp/conf/machine/include/ti-extras.inc
> new file mode 100644
> index 00000000..59eef952
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/ti-extras.inc
> @@ -0,0 +1,5 @@
> +# Add TI_EXTRAS to machine overrides so we get access to e.g. 'jailhouse'
> +
> +TI_EXTRAS ??= ""
> +MACHINEOVERRIDES =. "${@['', '${TI_EXTRAS}:']['${TI_EXTRAS}' != '']}"
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> new file mode 100644
> index 00000000..e5e1cc10
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> @@ -0,0 +1,11 @@
> +
> +# This will have priority over generic uboot path
> +
> +BRANCH = "ti-u-boot-2023.04"
> +BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
> +
> +SRCREV = "010afc1fe7a1412f92363c8af69c848d76a53e42"
> +SRCREV:tie-jailhouse = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
> +
> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index f4c5e88c..4bde0256 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -1,5 +1,7 @@
>  require u-boot-ti.inc
>  
> +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
> +
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
>  
>  PR = "r0"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index f29b089e..f3285c23 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -16,7 +16,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  
>  BRANCH ?= "master"
> -UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
> +UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>  UBOOT_GIT_PROTOCOL = "https"
>  SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 0b36575b..2b84b6b5 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -9,6 +9,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> +include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>  
>  DEPENDS += "gmp-native libmpc-native"
>  
> @@ -20,16 +21,16 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  
>  S = "${WORKDIR}/git"
>  
> -BRANCH = "ti-linux-6.1.y"
> +BRANCH ?= "ti-linux-6.1.y"
>  
> -SRCREV = "7124dee9779a40c52c52331c3ba6ccc84f357380"
> +SRCREV ?= "7124dee9779a40c52c52331c3ba6ccc84f357380"
>  PV = "6.1.26+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI ??= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "https"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> new file mode 100644
> index 00000000..f9fdd57a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> @@ -0,0 +1,14 @@
> +
> +# Use different commit, repo and branch for TI extras build
> +# This will have priority over generic rt path
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +BRANCH = "ti-linux-6.1.y"
> +BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
> +
> +SRCREV = "30bcc25e7cb1b25667db88d61828728f0f0b5f4b"
> +SRCREV:tie-jailhouse = "0ed0dec2462b805b0188fe080895adc437871549"
> +
> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
> +
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> index 05cc21b3..eb4a98f7 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>  "
>  
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  PV = "0.12+git${SRCPV}"
> -- 
> 2.17.1

