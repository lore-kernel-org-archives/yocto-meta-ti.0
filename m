Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80943C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 18:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23174.1681239592605584334
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9014540C7B;
	Tue, 11 Apr 2023 18:59:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHfY3dqLlsry; Tue, 11 Apr 2023 18:59:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A57540C2A;
	Tue, 11 Apr 2023 18:59:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 983EF1637FE; Tue, 11 Apr 2023 14:59:10 -0400 (EDT)
Date: Tue, 11 Apr 2023 14:59:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: Set common
 default SERIAL_CONSOLES for all K3
Message-ID: <20230411185910.GU9226@denix.org>
References: <20230405185027.26235-1-afd@ti.com>
 <20230405234952.GK9226@denix.org>
 <25ebd8fa-bd96-5829-9681-e9a7d26accd7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ebd8fa-bd96-5829-9681-e9a7d26accd7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 18:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16352

On Tue, Apr 11, 2023 at 12:27:10PM -0500, Andrew Davis wrote:
> On 4/5/23 6:49 PM, Denys Dmytriyenko wrote:
> >On Wed, Apr 05, 2023 at 01:50:27PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>The traditional order of serial consoles for K3 has ttyS2 being the
> >>primary UART attached console. ttyS0 is also a common choice for
> >>distros and the TI kernel may switch at some point. To prepare
> >>we check both UARTs on all K3 devices. Move this common check
> >>to a K3 common location.
> >
> >I see different K3 platforms use ttyS0, ttyS1, ttyS2 and ttyS3.
> >
> >Were others just mis-used as MCU UARTs or some other leftovers?
> >
> 
> Some look to be just misusing MCU UARTs, others types/leftovers.
> Hopefully this patch unifies everything. If one wants to use
> a different port then these two then can be chosen in DT.

Are there any derivative boards (like SK or other product-specific spins) that 
use a different main UART? I remember in pre-K3 days that used to be the case 
for some platforms, where EVM uses one UART and SK/ICE/etc. a different one...


> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf  | 3 ---
> >>  meta-ti-bsp/conf/machine/include/am62axx.inc   | 3 ---
> >>  meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 3 ---
> >>  meta-ti-bsp/conf/machine/include/am62xx.inc    | 3 ---
> >>  meta-ti-bsp/conf/machine/include/am64xx.inc    | 3 ---
> >>  meta-ti-bsp/conf/machine/include/am65xx.inc    | 3 ---
> >>  meta-ti-bsp/conf/machine/include/k3.inc        | 3 +++
> >>  meta-ti-bsp/conf/machine/j7200-evm.conf        | 3 ---
> >>  meta-ti-bsp/conf/machine/j721e-evm.conf        | 3 ---
> >>  meta-ti-bsp/conf/machine/j721s2-evm.conf       | 2 --
> >>  meta-ti-bsp/conf/machine/j721s2-hs-evm.conf    | 3 ---
> >>  meta-ti-bsp/conf/machine/j784s4-evm.conf       | 2 --
> >>  meta-ti-bsp/conf/machine/j784s4-hs-evm.conf    | 2 --
> >>  13 files changed, 3 insertions(+), 33 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>index 6e8c863c..e6cba3df 100644
> >>--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>@@ -4,9 +4,6 @@
> >>  require conf/machine/include/j721e.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  UBOOT_MACHINE = "j721e_evm_a72_config"
> >>  PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> >>diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>index d0970948..0c6b8503 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62axx"
> >>  MACHINE_FEATURES += "screen touchscreen"
> >>-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  TFA_K3_SYSTEM_SUSPEND = "1"
> >>  # Default tiboot3.bin on AM62A is for HS-FS
> >>diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> >>index d37d4673..4601603c 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> >>@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
> >>  MACHINE_FEATURES += "screen touchscreen"
> >>-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  TFA_K3_SYSTEM_SUSPEND = "1"
> >>  # Default tiboot3.bin on AM62x LP is for HS-FS
> >>diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> >>index af6a6db4..953128cc 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> >>@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
> >>  MACHINE_FEATURES += "screen gpu"
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >>  # Default tiboot3.bin on AM62x is for HS-FS
> >>diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> >>index 157bf5d5..c486f3c1 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> >>@@ -1,9 +1,6 @@
> >>  require conf/machine/include/k3.inc
> >>  SOC_FAMILY:append = ":am64xx"
> >>-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
> >>  KERNEL_DEVICETREE = " \
> >>diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> >>index 564d61b0..b848881c 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> >>@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am65xx"
> >>  MACHINE_FEATURES += "screen touchscreen gpu"
> >>-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> >>  KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
> >>diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> >>index 93bcea76..5c3c771a 100644
> >>--- a/meta-ti-bsp/conf/machine/include/k3.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/k3.inc
> >>@@ -53,3 +53,6 @@ MACHINE_FEATURES += "efi"
> >>  WKS_FILE ?= "sdimage-2part-efi.wks"
> >>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> >>  do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
> >>+
> >>+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> >>+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
> >>index b17b65b7..dff1da69 100644
> >>--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
> >>@@ -4,9 +4,6 @@
> >>  require conf/machine/include/j7200.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
> >>  KERNEL_DEVICETREE = " \
> >>diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>index f602a77b..8682ad60 100644
> >>--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>@@ -4,9 +4,6 @@
> >>  require conf/machine/include/j721e.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  KERNEL_DEVICETREE_PREFIX = " \
> >>      ti/k3-j721e \
> >>      ti/k3-j7200-mcspi-loopback \
> >>diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> >>index 1f54c7b1..a16e744d 100644
> >>--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> >>@@ -4,8 +4,6 @@
> >>  require conf/machine/include/j721s2.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>  TFA_K3_USART = "0x8"
> >>  OPTEE_K3_USART = "0x8"
> >>diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> >>index 8fa98440..085c91e7 100644
> >>--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
> >>@@ -4,9 +4,6 @@
> >>  require conf/machine/include/j721s2.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-
> >>  TFA_K3_USART = "0x8"
> >>  OPTEE_K3_USART = "0x8"
> >>diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>index 53bb4e4f..c0483505 100644
> >>--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>@@ -4,8 +4,6 @@
> >>  require conf/machine/include/j784s4.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>  TFA_K3_USART = "0x8"
> >>  OPTEE_K3_USART = "0x8"
> >>diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> >>index 1c56f55a..4deb0f8b 100644
> >>--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
> >>@@ -4,8 +4,6 @@
> >>  require conf/machine/include/j784s4.inc
> >>-SERIAL_CONSOLES = "115200;ttyS2"
> >>-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>  TFA_K3_USART = "0x8"
> >>  OPTEEMACHINE = "k3-j784s4"
> >>  OPTEE_K3_USART = "0x8"
> >>-- 
> >>2.39.2

