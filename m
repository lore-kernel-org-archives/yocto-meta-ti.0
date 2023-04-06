Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B19AC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:47:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.168466.1680810455667648361
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78F3740C3E;
	Thu,  6 Apr 2023 19:47:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzLLNGUhhEx4; Thu,  6 Apr 2023 19:47:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26D4140027;
	Thu,  6 Apr 2023 19:47:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F4131637FB; Thu,  6 Apr 2023 15:46:53 -0400 (EDT)
Date: Thu, 6 Apr 2023 15:46:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 5/5] meta-ti-bsp: graphics:
 Correct dependency chain
Message-ID: <20230406194653.GN9226@denix.org>
References: <20230406192847.7934-1-afd@ti.com>
 <20230406192847.7934-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406192847.7934-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16309

On Thu, Apr 06, 2023 at 02:28:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Previously the virtual/gpudriver provider would point to the kernel-mode
> driver, which would cause Mesa libraries to depend on those and not the
> user-mode driver. It is the user-mode driver that should depend on the
> kernel-mode driver, not the other way around. The logical dependency
> chain should be:

No, umlibs already has lots of virtual providers to choose from - virtual/egl, 
virtual/gles and even virtual/mesa. And virtual/gpudriver was specifically 
added to point to a kernel-mode driver - rogue-driver or sgx-km.

So, flipping the dependency chain is probably the correct change, but changing 
what virtual/gpudriver means seems wrong. 


> App -> virtual/libgl -> Mesa -> virtual/gpudriver -> IMG-UM -> IMG-KM
> 
> Flip the dependency chain so it matches the above. While here make
> the UM driver depend on, not just recommend, the KM driver as it is
> not functional with out it.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am62xx.inc                 | 2 +-
>  meta-ti-bsp/conf/machine/include/j721e.inc                  | 2 +-
>  meta-ti-bsp/conf/machine/include/j721s2.inc                 | 2 +-
>  meta-ti-bsp/conf/machine/include/j784s4.inc                 | 2 +-
>  .../powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb     | 2 --
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 2 --
>  .../libgles/ti-img-rogue-umlibs_1.18.6276027.bb             | 5 ++++-
>  .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb  | 5 +++--
>  meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend     | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend        | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc              | 6 +++---
>  11 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index af6a6db4..93151bcf 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -6,7 +6,7 @@ MACHINE_FEATURES += "screen gpu"
>  SERIAL_CONSOLES = "115200;ttyS2"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>  
>  # Default tiboot3.bin on AM62x is for HS-FS
>  BBMULTICONFIG = "k3r5-hs-fs"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 8f9c24e6..05aa7515 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721e"
>  
>  MACHINE_FEATURES += "screen gpu"
>  
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>  
>  # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
>  do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 70569a16..9a21df49 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j721s2"
>  
>  MACHINE_FEATURES += "screen gpu"
>  
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>  
>  TFA_BOARD = "generic"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index d03ee4a4..74b64203 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY:append = ":j784s4"
>  
>  MACHINE_FEATURES += "screen gpu"
>  
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-umlibs"
>  
>  TFA_BOARD = "j784s4"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
> index 96fb7484..2e2fe1ac 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232
>  
>  inherit module
>  
> -PROVIDES = "virtual/gpudriver"
> -
>  MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index bf4fa98a..ed614038 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
>  
>  inherit module
>  
> -PROVIDES = "virtual/gpudriver"
> -
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
>  
>  MACHINE_KERNEL_PR:append = "x"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> index 94d14ded..f6f363b0 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  
> +PROVIDES = "virtual/gpudriver"
> +
>  inherit bin_package
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -22,7 +24,8 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>  PVR_BUILD = "release"
>  PVR_WS = "lws-generic"
>  
> -RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
> +RDEPENDS:${PN} += "libdrm"
> +RDEPENDS:${PN} += "ti-img-rogue-driver"
>  
>  do_install:append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 755cc4f5..3a91d9c3 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>  LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>  
> +PROVIDES = "virtual/gpudriver"
> +
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
>  
> @@ -35,8 +37,7 @@ def use_initscript(d):
>  inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
>  
>  RDEPENDS:${PN} += "libdrm"
> -
> -RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
> +RDEPENDS:${PN} += "ti-sgx-ddk-km"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> index 912e9e9d..f505a569 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> @@ -1 +1 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs ti-sgx-ddk-um', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> index 912e9e9d..f505a569 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> @@ -1 +1 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs ti-sgx-ddk-um', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> index 96c484a7..d9e56d84 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>  SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
>  
>  PACKAGECONFIG:append = " \
> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-umlibs', 'pvr', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-um', 'sgx', '', d)} \
>  "
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
> @@ -45,4 +45,4 @@ do_install:append () {
>      rm -rf ${D}${datadir}/pkgconfig
>  }
>  
> -RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> +RDEPENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> -- 
> 2.39.2

