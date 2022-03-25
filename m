Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D556FC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 21:38:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.865.1648244334536705927
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 14:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9684240C46;
	Fri, 25 Mar 2022 21:38:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNVOyOSEcfy8; Fri, 25 Mar 2022 21:38:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A48740B05;
	Fri, 25 Mar 2022 21:38:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 959C51748B6; Fri, 25 Mar 2022 17:38:49 -0400 (EDT)
Date: Fri, 25 Mar 2022 17:38:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Darren Etheridge <detheridge@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move
 all platforms to ddk 1.15
Message-ID: <20220325213849.GI23554@denix.org>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 21:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14559

On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
> On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
> >On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
> >>Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> >>
> >>Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
> >
> >Overall looks good, please see inline below.
> >
> >
> >>Signed-off-by: Darren Etheridge <detheridge@ti.com>
> >>---
> >>
> >>No changes in the content of the patch, however I regenerated it with the
> >>similarity threshold reduced as requested by Denys.
> >>
> >>  conf/machine/am62xx-evm.conf                  |  2 ++
> >>  conf/machine/j721s2-evm.conf                  |  2 ++
> >>  ...bb => ti-img-rogue-driver_1.15.6133109.bb} | 20 +++++++++++--------
> >>  ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 13 ++++++------
> >>  4 files changed, 23 insertions(+), 14 deletions(-)
> >>  rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.13.5776728.bb => ti-img-rogue-driver_1.15.6133109.bb} (48%)
> >>  rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (84%)
> >>
> >>diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> >>index 600abb58..086e40e4 100644
> >>--- a/conf/machine/am62xx-evm.conf
> >>+++ b/conf/machine/am62xx-evm.conf
> >>@@ -4,6 +4,8 @@
> >>  require conf/machine/include/am62xx.inc
> >>+MACHINE_FEATURES += "gpu"
> >>+
> >>  KERNEL_DEVICETREE = " \
> >>      ti/k3-am625-sk.dtb \
> >>      ti/k3-am625-sk-lpmdemo.dtb \
> >>diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> >>index 82fd33da..e5ed0b73 100644
> >>--- a/conf/machine/j721s2-evm.conf
> >>+++ b/conf/machine/j721s2-evm.conf
> >>@@ -4,6 +4,8 @@
> >>  require conf/machine/include/j7.inc
> >>+MACHINE_FEATURES += "gpu"
> >>+
> >>  SERIAL_CONSOLES = "115200;ttyS10"
> >>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>  TFA_K3_USART = "0x8"
> >>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >>similarity index 48%
> >>rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> >>rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >>index a05de0f2..fbff6c51 100644
> >>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> >>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >>@@ -7,17 +7,17 @@ inherit module features_check
> >>  REQUIRED_MACHINE_FEATURES = "gpu"
> >>-MACHINE_KERNEL_PR_append = "b"
> >>+MACHINE_KERNEL_PR_append = "a"
> >>  PR = "${MACHINE_KERNEL_PR}"
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>-COMPATIBLE_MACHINE = "j7"
> >>+COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> >>  DEPENDS = "virtual/kernel"
> >>  PROVIDES = "virtual/gpudriver"
> >>-BRANCH = "1.13-5776728/linux-k5.10"
> >>+BRANCH = "linuxws/dunfell/k5.10/${PV}"
> >>  SRC_URI = " \
> >>      git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> >>@@ -26,15 +26,19 @@ SRC_URI = " \
> >>  S = "${WORKDIR}/git"
> >>-SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
> >>+SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
> >>-PVR_SOC = "j721e_linux"
> >
> >I was actually thinking of keeping PVR_SOC variable and moving it to
> >corresponding machine configs.
> >
> 
> 
> PVR_SOC is a bit of a legacy name, especially since PVR is now IMG.

PVR or PowerVR name is still used as an overall umbrella for all of 
Imagination's graphics, vision and AI chips, including SGX and Rogue/RGX:
https://en.wikipedia.org/wiki/PowerVR


> Thinking on this, the mapping between SoC family and the internal names
> like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the version of this
> driver. For instance in the next DDK I may want the target name to
> go from "am62_linux" to "axb_128_linux", I would have to
> change things here (update the SRCREV) AND in the machine config.

1. I totally agree that "axb_128_linux" makes more sense than "am62_linux".
2. Changes like that happen very rarely.
3. You can call it PVR_MODEL or PVR_PRODUCT if you want, instead of PVR_SOC.


> Mapping here feels like the right spot to me. I'd even argue the same
> for OPTEEMACHINE and the like, should go in the optee.bbappends with the
> rest of our platform specific recipe fixups, etc.

The number of overrides in the recipe will keep on growing, as each new 
platform will need to add own config. That's the whole point of the machine 
configuration file to have those defined centrally.

The goal is to have a recipe as machine-agnostic and clean, as possible. Do 
not overwhelm it with tons of conditionals like that - any machine-specific 
configuration should be set in the machine config file.


> >>-PVR_BVNC = "22.104.208.318"
> >>+TARGET_PRODUCT_j7-evm = "j721e_linux"
> >>+TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> 
> 
> The driver depends on the SoC, not the EVM. s/j721s2-evm/j721s2
> I know you cant do that in dunfell but if my other series gets into
> main it should be fixed there, where we have a SOC_FAMILY for these
> SoCs.
> 
> Andrew
> 
> 
> >>+TARGET_PRODUCT_am62xx = "am62_linux"
> >
> >E.g. instead of these 3 overrides in the recipe, those 3 machines will be
> >setting their respective PVR_SOC variables, which is more descriptive than
> >TARGET_PRODUCT.
> >
> >Similar to how machine configs already set KERNEL_DEVICETREE, UBOOT_MACHINE,
> >TFA_PLATFORM or OPTEEMACHINE.
> >
> >I know SGX been using TARGET_PRODUCT historically, but outside of the recipe
> >it won't make much sense.
> >
> >But it may be too disruptive for Dunfell at this point. I can do such change
> >in master when porting this patch over on top of Andrew's changes.
> >
> >
> >>+TARGET_BVNC_j7-evm = "22.104.208.318"
> >>+TARGET_BVNC_j721s2-evm = "36.53.104.796"
> >>+TARGET_BVNC_am62xx = "33.15.11.3"
> >>  PVR_BUILD = "release"
> >>  PVR_WS = "wayland"
> >>-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
> >>+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> >>  do_install() {
> >>-    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> >>+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> >>  }
> >>diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >>similarity index 84%
> >>rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> >>rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >>index 5194015e..e00dce99 100644
> >>--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> >>+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >>@@ -8,17 +8,18 @@ inherit features_check
> >>  REQUIRED_MACHINE_FEATURES = "gpu"
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>-COMPATIBLE_MACHINE = "j7"
> >>+COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> >>-PR = "r3"
> >>+PR = "r1"
> >>  BRANCH = "linuxws/dunfell/k5.10/${PV}"
> >>  SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> >>+SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
> >>-SRCREV = "5ef38353c38d921a65ea6df75c7b6ce710b66034"
> >>-
> >>-PVR_SOC ?= "j721e_linux"
> >>+TARGET_PRODUCT_j7-evm = "j721e_linux"
> >>+TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> >>+TARGET_PRODUCT_am62xx = "am62_linux"
> >
> >Same here.
> >
> >
> >>  PVR_BUILD ?= "release"
> >>  PVR_WS = "wayland"
> >>@@ -50,7 +51,7 @@ RRECOMMENDS_${PN} += "ti-img-rogue-driver"
> >>  S = "${WORKDIR}/git"
> >>  do_install () {
> >>-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
> >>+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
> >>      chown -R root:root ${D}
> >>  }
> >>-- 
> >>2.17.1
> >>
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

