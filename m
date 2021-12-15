Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1229.1639601695874416826
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 12:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3159140C4E
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 20:54:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChPtDyMkTOly for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 20:54:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F51A406B7
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 20:54:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E54C2174719; Wed, 15 Dec 2021 15:54:54 -0500 (EST)
Date: Wed, 15 Dec 2021 15:54:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] ti-sgx-ddk-km: Fix build with kernel 5.10 and musl support
Message-ID: <20211215205454.GQ18191@denix.org>
References: <20211210002522.1561830-1-raj.khem@gmail.com>
 <16BF3E7E9677FB08.24693@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16BF3E7E9677FB08.24693@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This one is also missing from master.


On Thu, Dec 09, 2021 at 07:51:38PM -0500, Denys Dmytriyenko wrote:
> On Thu, Dec 09, 2021 at 04:25:22PM -0800, Khem Raj wrote:
> > This adds a patch to fix runtime problems loading the kernel module with
> > kernel 5.10
> > 
> > Adds support to build with musl targets
> > 
> > Add yoe to recognised OE distributions
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Denys Dmytriyenko <denys@konsulko.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> > ---
> > v2: Add upstream status to patches
> 
> Thanks! Although I wonder if the first patch should be treated as 
> "Inappropriate [OE-specific]", as it was there for few years already 
> and does actually add support for OE-specific toolchains...
> 
> 
> >  ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 20 +++++++++----
> >  ...02-Fix-driver-config-for-5.10-kernel.patch | 29 +++++++++++++++++++
> >  .../ti-sgx-ddk-km_1.17.4948957.bb             |  1 +
> >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  1 +
> >  4 files changed, 46 insertions(+), 5 deletions(-)
> >  create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> > 
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > index 15105eac..4f71ea9d 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > @@ -1,23 +1,33 @@
> > -From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
> > +From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
> >  From: Denys Dmytriyenko <denys@ti.com>
> >  Date: Mon, 9 Sep 2019 17:05:48 -0400
> > -Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> > +Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> >   suffix
> >  
> > +OE toolchains are not having armhf in its name but they still are armhf
> > +ABI, teach this to sgx module build system
> > +
> > +recognize musleabi in tuples as well
> > +
> > +Add yoe distro support
> > +
> > +Upstream-Status: Pending
> > +
> >  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >  
> >  diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> > -index dead2f9..2ba3e5e 100644
> > +index dead2f9..1b5f090 100644
> >  --- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> >  +++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> >  @@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
> >     ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> >      $(1)_compiler_preferred_target := aarch64-linux-gnu
> >     endif
> > -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > ++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
> >  +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> >  +  endif
> >     ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > @@ -30,5 +40,5 @@ index dead2f9..2ba3e5e 100644
> >   endef
> >   
> >  -- 
> > -2.7.4
> > +2.34.1
> >  
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> > new file mode 100644
> > index 00000000..1f097909
> > --- /dev/null
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> > @@ -0,0 +1,29 @@
> > +From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
> > +From: Paul Barker <paul.barker@sancloud.com>
> > +Date: Wed, 27 Oct 2021 10:34:32 +0100
> > +Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
> > +
> > +See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
> > +
> > +Upstream-Status: Pending
> > +Ref: BSP-66
> > +Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> > +---
> > + eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > +index 3f27926..18d515a 100644
> > +--- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > ++++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > +@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
> > + $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
> > + endif
> > + 
> > ++PVR_LINUX_MEM_AREA_USE_VMAP = 1
> > + ifneq ($(strip $(KERNELDIR)),)
> > + PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
> > + ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
> > +-- 
> > +2.34.1
> > +
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > index 3848e84e..e6247e08 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > @@ -22,6 +22,7 @@ BRANCH = "ti-img-sgx/${PV}/k5.10"
> >  
> >  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
> >      file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
> > +    file://0002-Fix-driver-config-for-5.10-kernel.patch \
> >  "
> >  
> >  S = "${WORKDIR}/git"
> > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > index 87bbb437..9d55122c 100644
> > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > @@ -32,6 +32,7 @@ inherit update-rc.d
> >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> >  
> >  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> > +DEPENDS:append:libc-musl = " gcompat"
> >  RDEPENDS:${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
> >  
> >  RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
> > -- 
> > 2.34.1
> > 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
