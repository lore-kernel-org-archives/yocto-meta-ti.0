Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5D1C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:22:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5886.1683832967632605203
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YO8p0lcl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BJMemS106316;
	Thu, 11 May 2023 14:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683832960;
	bh=X/iwAYMWJkhqXYMwMJ0HUf6WT1GEr9t7Ksg2HVYI+Q0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YO8p0lclGNUl5emSTkNU6SKb2/heDH/SzwrZVjrYr4sapy80RS+NR7XTIaMDs62TR
	 J9UwaRphLD7SmMHUSAnISaWiigmg/MEMX5UWHz+QS6ewco8JDPC96Vn5cGtvSZQOcl
	 gsReW81Du80QCZyHYj2dkeMmEUIwMVq2Q9xtSRRw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BJMeEa059469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 14:22:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 14:22:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 14:22:40 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BJMdXX128915;
	Thu, 11 May 2023 14:22:39 -0500
Message-ID: <412e9901-88a6-5e09-8a5c-38a1a240d743@ti.com>
Date: Thu, 11 May 2023 14:22:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] mesa-pvr: convert bbappend
 into standalone alternative provider
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <rs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20230511184049.1074923-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230511184049.1074923-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:22:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16519


This does not apply against kirkstone cleanly because of the mesa 
version change from 22 to 23 for master.  I'll fix it as I apply the 
patch, but I wanted to inform anyone trying it themselves.


On 5/11/2023 1:40 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> There are some unobvious issues with adding PVR support to Mesa
> via a bbappend:
> 
> 1. We need to mark mesa package as machine-specific, due to
> differences in builds between SGX, Rogue and software-rendering
> 
> 2. We also need to then mark mesa package as providing safe
> ABIs (EGL/GLES/GBM) in order for all generic dependent packages
> to not be treated as machine-specific, allowing their re-use
> across different machines of the same architecture
> 
> But doing the above alters the upstream mesa package and changes
> its signatures even when not building for TI platforms, which is
> a Yocto Project compliance violation.
> 
> In order to resolve this issue, convert Mesa bbappend, that adds
> PVR support, into its own standalone alternative provider, called
> mesa-pvr and allow selecting it with PREFERRED_PROVIDER settings.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/layer.conf                            |  2 +-
>   meta-ti-bsp/conf/machine/beagleplay.conf               |  1 +
>   meta-ti-bsp/conf/machine/include/am62xx.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/am65xx.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/j721e.inc             |  1 +
>   meta-ti-bsp/conf/machine/include/j721s2.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/j784s4.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/mesa-pvr.inc          |  8 ++++++++
>   meta-ti-bsp/conf/machine/include/omap-a15.inc          |  1 +
>   meta-ti-bsp/conf/machine/include/ti33x.inc             |  1 +
>   meta-ti-bsp/conf/machine/include/ti43x.inc             |  1 +
>   .../recipes-graphics/mesa/mesa-gl_23.%.bbappend        |  1 -
>   .../mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb}          | 10 ++++++----
>   meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend   |  1 -
>   14 files changed, 24 insertions(+), 7 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/include/mesa-pvr.inc
>   delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
>   rename meta-ti-bsp/recipes-graphics/mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb} (88%)
>   delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 5520c7c2..bb286c2b 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_meta-ti-bsp = " \
>   "
>   
>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> -    mesa \
> +    mesa-pvr \
>   "
>   
>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index e8d25cd9..c7b1414a 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -10,6 +10,7 @@ MACHINE_FEATURES += "screen gpu"
>   SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "lite"
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index 623d90eb..c4582c13 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am62xx"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   # Default tiboot3.bin on AM62x is for HS-FS
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 9fe851f4..9cbce243 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am65xx"
>   
>   MACHINE_FEATURES += "screen touchscreen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   
>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 5e325ffe..f707cf26 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721e"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 70569a16..98cc611f 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721s2"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index d03ee4a4..de207687 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j784s4"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> new file mode 100644
> index 00000000..d5581315
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> @@ -0,0 +1,8 @@
> +PREFERRED_PROVIDER_virtual/mesa ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/egl ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgbm ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libglx ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgl ?= "mesa-pvr"
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> index 49db1cb6..700b1a11 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -12,6 +12,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index 4f6d90bf..bce88309 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index 5b40925e..c1009dc6 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> deleted file mode 100644
> index 912e9e9d..00000000
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> similarity index 88%
> rename from meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index caf94156..0de3cb94 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -2,11 +2,13 @@
>   # upstream yet. This allows us to build the shims we need without completely
>   # clobbering mesa.
>   
> -FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +require recipes-graphics/mesa/mesa.inc
> +
> +SUMMARY += " (with PowerVR support for TI platforms)"
>   
>   LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
>   
> -BRANCH = "powervr/kirkstone/22.3.5"
> +BRANCH = "powervr/kirkstone/${PV}"
>   
>   SRC_URI = " \
>       git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
> @@ -38,7 +40,6 @@ PACKAGECONFIG:remove = "xvmc"
>   PACKAGECONFIG[xvmc] = ""
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> -PV = "22.3.5+pvr"
>   
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
> @@ -50,6 +51,7 @@ do_install:append () {
>       rm -rf ${D}${datadir}/pkgconfig
>   }
>   
> -FILES:mesa-vulkan-drivers += " ${libdir}/libpvr_mesa_wsi.so"
> +FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
> +FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
>   
>   RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> deleted file mode 100644
> index 912e9e9d..00000000
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16516): https://lists.yoctoproject.org/g/meta-ti/message/16516
> Mute This Topic: https://lists.yoctoproject.org/mt/98834047/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

