Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76942C4708E
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 23:35:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.723.1672961706276600108
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 15:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02FA740C5D;
	Thu,  5 Jan 2023 23:35:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzwsvJK5pIzB; Thu,  5 Jan 2023 23:35:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B90D240027;
	Thu,  5 Jan 2023 23:35:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 479C51636C1; Thu,  5 Jan 2023 18:34:46 -0500 (EST)
Date: Thu, 5 Jan 2023 18:34:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Add am57xx.inc
 allowing use of SoC name over full EVM name
Message-ID: <20230105233446.GP22689@denix.org>
References: <20230103190011.10208-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103190011.10208-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Jan 2023 23:35:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15531

On Tue, Jan 03, 2023 at 01:00:11PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> In many spots we have to use the full EVM name for each EVM using the
> AM57x SoC leading to missed features on some EVMs. Add the am57xx name
> so we can generically add for AM57x.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/conf/machine/am57xx-evm.conf               | 2 +-
>  meta-ti-bsp/conf/machine/beagle-x15.conf               | 2 +-
>  meta-ti-bsp/conf/machine/include/am57xx.inc            | 5 +++++
>  meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb  | 5 ++---
>  meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb | 5 ++---
>  meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb | 6 ++----
>  meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb     | 5 ++---
>  meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc   | 3 +--
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc           | 2 +-
>  9 files changed, 17 insertions(+), 18 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/include/am57xx.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> index e320477b..9fbff7c6 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> @@ -2,7 +2,7 @@
>  #@NAME: AM57xx EVM
>  #@DESCRIPTION: Machine configuration for the TI AM57xx EVM
>  
> -require conf/machine/include/dra7xx.inc
> +require conf/machine/include/am57xx.inc
>  
>  MACHINE_FEATURES += "touchscreen"
>  
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index beb0d892..00b8c410 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -2,7 +2,7 @@
>  #@NAME: BeagleBoard X15
>  #@DESCRIPTION: Machine configuration for the BeagleBoard X15
>  
> -require conf/machine/include/dra7xx.inc
> +require conf/machine/include/am57xx.inc
>  
>  KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf/machine/include/am57xx.inc
> new file mode 100644
> index 00000000..6c52883b
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
> @@ -0,0 +1,5 @@
> +require conf/machine/include/omap-a15.inc
> +SOC_FAMILY:append = ":dra7xx"
> +SOC_FAMILY:append = ":am57xx"
> +
> +MACHINE_FEATURES += "pci"
> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> index 9ccce938..4f298a2c 100644
> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> @@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -15,8 +15,7 @@ S = "${WORKDIR}/git"
>  TARGET = ""
>  TARGET:ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
>  TARGET:ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
> -TARGET:am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
> -TARGET:am57xx-hs-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
> +TARGET:am57xx = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
>  
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> index 4ffd13aa..69ccb31a 100644
> --- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -16,8 +16,7 @@ S = "${WORKDIR}/git"
>  TARGET = ""
>  TARGET:ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
>  TARGET:ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
> -TARGET:am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> -TARGET:am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> +TARGET:am57xx = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
>  
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> index 23c422dd..f774db58 100644
> --- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> +++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -16,9 +16,7 @@ S = "${WORKDIR}/git"
>  TARGET = ""
>  TARGET:ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
>  TARGET:ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
> -TARGET:am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> -TARGET:am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> -
> +TARGET:am57xx = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
>  
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> index 8d784768..5b38a048 100644
> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> @@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -15,8 +15,7 @@ S = "${WORKDIR}/git"
>  TARGET = ""
>  TARGET:ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
>  TARGET:ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
> -TARGET:am57xx-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
> -TARGET:am57xx-hs-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
> +TARGET:am57xx = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
>  
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 54e6fdc6..808a4766 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -12,8 +12,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
>  
>  # Add run-time dependency for PRU Ethernet firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> index 4962a3ec..ec1e71be 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> @@ -9,4 +9,4 @@ PLATFORM = "UNKNOWN"
>  PLATFORM:dra7xx = "DRA7XX"
>  PLATFORM:omapl138 = "OMAPL138"
>  
> -ALT_PLATFORM:am57xx-evm = "AM572X AM571X"
> +ALT_PLATFORM:am57xx = "AM572X AM571X"
> -- 
> 2.38.1
> 

