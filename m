Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1274.1636048558651970723
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 10:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F04AA40C6C
	for <meta-ti@lists.yoctoproject.org>; Thu,  4 Nov 2021 17:55:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rN-IS0-HAGIo for <meta-ti@lists.yoctoproject.org>;
	Thu,  4 Nov 2021 17:55:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF98340C06
	for <meta-ti@lists.yoctoproject.org>; Thu,  4 Nov 2021 17:55:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A70CC1746B1; Thu,  4 Nov 2021 13:55:57 -0400 (EDT)
Date: Thu, 4 Nov 2021 13:55:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH 00/22] Sync up with Dunfell
Message-ID: <20211104175557.GX10132@denix.org>
References: <16B383101A550137.21702@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16B383101A550137.21702@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping

On Mon, Nov 01, 2021 at 03:32:50PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Keep master up to date with latest changes in Dunfell, adjust to the new
> override syntax.
> 
> Denys Dmytriyenko (1):
>   powervr-drivers: teach modules_install to respect "usrmerge" distro
>     feature
> 
> Hari Nagalla (2):
>   ipc: ti-rpmsg-char: Update library to 0.3.1
>   ti-rtos-firmware: Update M4F binary for AM64x SoCs
> 
> Nick Saulnier (1):
>   pru-icss_git.bb: add AM64x, update to PSSP v6.0.0
> 
> Sinthu Raja (1):
>   conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
> 
> Tom Rini (2):
>   conf/machine: k3: Enable grub-efi by default in wic images
>   conf: Add extlinux.conf support on some 32bit platforms
> 
> Vignesh Raghavedra (1):
>   prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for
>     AM65x SR2.0
> 
> Yogesh Siraswar (14):
>   linux-ti-staging: Update SRCREV to 5.10.65
>   linux-ti-staging-rt: Update SRCREV to 5.10.65
>   conf: omap-a15: fix the dtb file path for extlinux boot
>   conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
>   conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
>   ti-linux-fw: Support common inc for all firmware
>   ti-linux-fw: AUTOREV support for ti-linux-fw
>   ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
>   linux-ti-staging: Bump linux version to latest
>   linux-ti-staging-rt: Bump linux rt version to latest
>   ti-linux-fw: Bump to 08.01.00.001 release
>   u-boot-ti-staging: Bump to 08.01.00.001 release
>   linux-ti-staging-rt: Bump to 08.01.00.001 release
>   linux-ti-staging: Bump to 08.01.00.001 release
> 
>  conf/machine/am57xx-evm.conf                       |  6 +-
>  conf/machine/dra7xx-evm.conf                       |  8 +++
>  conf/machine/include/k3.inc                        |  6 +-
>  conf/machine/include/omap-a15.inc                  | 13 ++++-
>  conf/machine/include/ti33x.inc                     | 11 +++-
>  conf/machine/include/ti43x.inc                     | 11 +++-
>  conf/machine/j7-evm.conf                           |  2 +-
>  recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 11 ++--
>  recipes-bsp/goodix-fw/goodix-fw_git.bb             | 11 ++--
>  recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         | 12 +---
>  recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb         | 12 +---
>  .../ti-img-rogue-driver_1.13.5776728.bb            |  2 +-
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  4 +-
>  recipes-bsp/pru/pru-icss_git.bb                    | 64 +++++++++++++++++++++-
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 11 +---
>  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 11 +---
>  recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb          | 10 +---
>  recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb         | 10 +---
>  recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb         | 10 +---
>  recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 34 ++++++++++++
>  recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb             | 10 +---
>  recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb       | 11 ++--
>  recipes-bsp/serdes-fw/serdes-fw_git.bb             | 10 ++--
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 43 +++++++++++++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb      |  2 +-
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc                | 32 -----------
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  7 ++-
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb    |  4 +-
>  recipes-kernel/linux/kernel-rdepends.inc           |  2 +-
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb   |  4 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb      |  4 +-
>  recipes-ti/ipc/ti-rpmsg-char.inc                   |  6 +-
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb         |  8 ++-
>  wic/sdimage-2part-efi.wks                          |  7 +++
>  34 files changed, 258 insertions(+), 151 deletions(-)
>  create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>  create mode 100644 recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  delete mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>  create mode 100644 wic/sdimage-2part-efi.wks
> 
> -- 
> 2.7.4
> 
