Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B564C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:29:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11435.1679311756111236987
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F95940C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:29:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfkTazdi4eUK for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:29:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56A3A40301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:29:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2DDA11637C4; Mon, 20 Mar 2023 07:28:43 -0400 (EDT)
Date: Mon, 20 Mar 2023 07:28:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [kirkstone][PATCH 00/54] 2023.03 sync up with Dunfell
Message-ID: <20230320112843.GG18050@denix.org>
References: <174E0552B93049E3.5245@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174E0552B93049E3.5245@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:29:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16215

Sorry for the flood and please ignore the earlier incomplete sets - I hit a 
posting limit on the list and some patches may have not been delivered.

Kirkstone and master are 2 separate sets due to optee recipe differences 
between the branches.


On Mon, Mar 20, 2023 at 04:11:47AM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Latest (as of March 2023) sync up of Dunfell changes to Kirkstone
> 
> Notable changes:
> 
> * AM62Ax platform addition
> * HS-SE and/or HS-FS additions to many J7 and AM6 platforms
> * Version bumps for many system components, including kernel, u-boot,
>   optee, trusted-firmware-a, k3conf and firmware images
> * DTB/DTBOs additions to existing platforms
> * ti-rtos-firmware fixes
> 
> Aradhya Bhatia (2):
>   conf: machine: am62xx: Add missing overlays for AM625 SK
>   conf: machine: am62xx-lp-evm: Add OLDI Panel overlay
> 
> Bhavya Kapoor (4):
>   conf: machine: j7200-evm: Add uarts overlay for J7200
>   conf: machine: j721e-evm: Add uarts overlay for J721E
>   conf: machine: j721s2-evm: Add uarts overlay for J721S2
>   conf: machine: j784s4-evm: Add uarts overlay for J784S4
> 
> Bryan Brattlof (1):
>   k3conf update SRCREV to add am62ax support
> 
> Chirag Shilwant (4):
>   machine: Add AM62Q HS-SE evm configuration
>   machine: Add AM62x HS-SE evm configuration
>   am62xx-evm: Add AM62x HS-FS evm configuration
>   am62xx-lp-evm: Add AM62x LP HS-FS evm configuration
> 
> Dasnavis (1):
>   conf: machine: j784s4-evm: Add support for J784S4 HS-FS
> 
> Dasnavis Sabiya (3):
>   conf: machine: j784s4: Add AM69 SK specific dtb and dtbo to
>     KERNEL_DEVICETREE
>   conf: machine: j784s4: Add FPDLink overlays for AM69 SK
>   conf: machine: j784s4: Add ehrpwm overlay for am69-sk
> 
> Denys Dmytriyenko (6):
>   optee-os-tadevkit: update to match optee-os
>   ti-k3-secdev: update to the latest from Dunfell
>   ti-linux-fw: update to the latest from Dunfell
>   u-boot-ti-staging: update to the latest from Dunfell
>   linux-ti-staging: update to the latest from Dunfell
>   ti-rtos-firmware: numerous fixes and cleanups
> 
> Devarsh Thakkar (1):
>   ipc: ti-rpmsg-char: Update library to 0.5.2
> 
> Dhruva Gole (1):
>   optee-os: Enable SW PRNG for OP-TEE in AM62X
> 
> Jai Luthra (2):
>   conf: machine: am62axx: Add camera overlays for AM62A SK
>   conf: machine: am62axx: Add overlays for IMX390 cameras
> 
> Judith Mendez (1):
>   trusted-firmware-a: upgrade to v2.8+
> 
> Kamlesh Gurudasani (2):
>   optee-os: Update SRCREV for OP-TEE TRNG in AM62X
>   optee-os: Revert to lower log level for AM62x
> 
> Manorit Chawdhry (5):
>   conf: machine: Add J784S4 hs platform
>   j784s4-hs: changes to support new hs platform
>   optee: update optee-client, optee-test, optee-examples to 3.19 tag
>   optee: update optee components to 3.20 tag
>   optee: fix the sha for 3.20 tag
> 
> Paresh Bhagat (1):
>   machine: Add am62axx evm configuration
> 
> Praneeth Bajjuri (1):
>   optee-os: Lower log level for am62axx
> 
> Ryan Eatmon (3):
>   conf: Remove vmlinux.gz from KERNEL_IMAGETYPES
>   hs: Deploy the unsigned versions of bl31 and bl32
>   ti-sci-fw: Add SYSFW_SUFFIX to sysfw.itb files
> 
> Sai Sree Kartheek Adivi (1):
>   am62axx-evm: Add AM62A HS-FS evm configuration
> 
> Siddharth Vadapalli (1):
>   conf: machine: am62axx: Add overlay for second CPSW3G Port
> 
> Sinthu Raja (6):
>   conf: machine: k3: Define RD, DTB and DTBO load address for FIT image
>   conf: machine: j721s2-evm: Add support for J721S2 HS-FS
>   conf: machine: j721s2: Add AM68 SK specific dtb and dtbo to
>     KERNEL_DEVICETREE
>   conf: machine: j721s2: Fix DTB overlay extension for OV5640
>   conf: machine: j721s2: Add FPDLink overlays for am68-sk
>   conf: machine: j721s2: Add ehrpwm overlay for am68-sk
> 
> Vaishnav Achath (7):
>   conf: machine: j7200-evm: Add MCSPI loopback overlay for J7200
>   conf: machine: j721e-evm: Add camera overlays for J721E EVM
>   conf: machine: j721s2-evm: Add camera overlays for J721S2 EVM
>   conf: machine: j784s4-evm: Add camera overlays for J784S4 EVM
>   conf: machine: j721e-evm: Add MCSPI loopback overlay for J721E
>   conf: machine: j721s2-evm: Add MCSPI loopback overlay for J721S2
>   conf: machine: j784s4-evm: Add MCSPI loopback overlay for J784S4
> 
> Zachary Booth (1):
>   conf: omap-a15: Fix parsing when KERNEL_DEVICETREE is not set
> 
>  .../conf/machine/am62axx-evm-k3r5-gp.conf     |  19 +++
>  .../conf/machine/am62axx-evm-k3r5-hs-fs.conf  |  14 +++
>  .../conf/machine/am62axx-evm-k3r5-hs-se.conf  |  22 ++++
>  meta-ti-bsp/conf/machine/am62axx-evm.conf     |  30 +++++
>  ...-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} |   7 ++
>  .../conf/machine/am62xx-evm-k3r5-hs-fs.conf   |  14 +++
>  .../conf/machine/am62xx-evm-k3r5-hs-se.conf   |  21 ++++
>  meta-ti-bsp/conf/machine/am62xx-evm.conf      |   9 ++
>  .../machine/am62xx-lp-evm-k3r5-hs-fs.conf     |  14 +++
>  .../machine/am62xx-lp-evm-k3r5-hs-se.conf     |  21 ++++
>  .../conf/machine/am62xx-lp-evm-k3r5.conf      |  12 +-
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |   7 +-
>  meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |   8 --
>  meta-ti-bsp/conf/machine/include/am62axx.inc  |  26 +++++
>  .../conf/machine/include/am62xx-lp.inc        |  21 ++++
>  meta-ti-bsp/conf/machine/include/am62xx.inc   |  14 +++
>  meta-ti-bsp/conf/machine/include/k3.inc       |   7 +-
>  meta-ti-bsp/conf/machine/include/omap-a15.inc |   2 +-
>  meta-ti-bsp/conf/machine/j7200-evm.conf       |   2 +
>  meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |   8 --
>  meta-ti-bsp/conf/machine/j721e-evm.conf       |  23 ++++
>  meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |   8 --
>  .../conf/machine/j721s2-evm-k3r5-gp.conf      |  20 ++++
>  .../machine/j721s2-evm-k3r5-sr1-hs-fs.conf    |  15 +++
>  meta-ti-bsp/conf/machine/j721s2-evm.conf      |  35 ++++++
>  meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |  21 ++--
>  .../conf/machine/j784s4-evm-k3r5-gp.conf      |  20 ++++
>  .../machine/j784s4-evm-k3r5-sr1-hs-fs.conf    |  16 +++
>  meta-ti-bsp/conf/machine/j784s4-evm.conf      |  35 ++++++
>  .../conf/machine/j784s4-hs-evm-k3r5.conf      |  11 ++
>  meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   |  25 ++++
>  meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf  |   3 +
>  meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf  |   3 +
>  .../conf/multiconfig/k3r5-sr1-hs-fs.conf      |   3 +
>  meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf    |   3 +
>  .../cnm-wave-fw/cnm-wave-fw_git.bb            |   2 +-
>  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |   4 +-
>  .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  36 +++++-
>  .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |   2 +-
>  .../trusted-firmware-a_%.bbappend             |  16 ++-
>  .../u-boot/u-boot-ti-staging_2021.01.bb       |   2 +-
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 +
>  .../recipes-devtools/k3conf/k3conf_git.bb     |   2 +-
>  .../recipes-kernel/linux/kernel-rdepends.inc  |   2 +
>  .../linux/linux-ti-staging-rt_5.10.bb         |   4 +-
>  .../linux/linux-ti-staging_5.10.bb            |   4 +-
>  .../optee/optee-client_3.16%.bbappend         |   9 +-
>  .../optee/optee-examples_%.bbappend           |   5 +-
>  .../optee/optee-os-tadevkit_%.bbappend        |   4 +-
>  .../optee/optee-os_3.16%.bbappend             |  15 +--
>  .../optee/optee-test_%.bbappend               |   4 +-
>  meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc  |   6 +-
>  .../recipes-ti/secdev/ti-k3-secdev_git.bb     |   2 +-
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 108 +++++++++++-------
>  54 files changed, 629 insertions(+), 118 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm.conf
>  rename meta-ti-bsp/conf/machine/{am62xx-evm-k3r5.conf => am62xx-evm-k3r5-gp.conf} (54%)
>  create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
>  create mode 100644 meta-ti-bsp/conf/machine/include/am62axx.inc
>  create mode 100644 meta-ti-bsp/conf/machine/include/am62xx-lp.inc
>  create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
>  create mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
>  create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
>  create mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>  create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
>  create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
>  create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
> 
> -- 
> 2.25.1

