Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB270C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 20:22:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.544.1681330925186143906
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 13:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F181340C6C;
	Wed, 12 Apr 2023 20:22:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn40Q3WxTML7; Wed, 12 Apr 2023 20:22:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD0A440BE6;
	Wed, 12 Apr 2023 20:21:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0375A163816; Wed, 12 Apr 2023 16:21:20 -0400 (EDT)
Date: Wed, 12 Apr 2023 16:21:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org,
	nm@ti.com
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 6/6] meta-ti-bsp:
 graphics: Rename SGX driver recipes to match Rogue
Message-ID: <20230412202119.GI9226@denix.org>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412184242.29743-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 20:22:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16382

On Wed, Apr 12, 2023 at 01:42:42PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The names we use for the GPU components are not consistent nor do the
> intuitively describe their function. Let's fix that.
> 
> We do 3 things, first powervr-drivers/ contains only the kernel-mode
> half of the driver, for GPUs most of the driver lives in userspace,
> and the "PowerVR" name is no longer correct for the latest GPUs. Rename
> this to ti-img-gpu-km/ which matches better with our naming for the
> user-mode half and the TI/IMG codecs.
> 
> Next, ti-img-rogue-driver is renamed ti-img-rogue-km, same reasoning
> as above and matches the SGX version of the same.
> 
> The usermode driver lives in a directory named "libgles", but the
> driver does not just provide libgles, it also can provide OpenCL,
> DRI, and Vulkan. Rename to match the kernel-mode half.
> 
> Lastly, the acronym "DDK" is short for "Driver Development Kit".
> This kit is provided by Imagination to TI and is what we use to
> "Develop" the "Driver". What we ship is not the DDK, it is the
> driver itself. The name DDK seems to have just been passed through.
> Remove use of "ddk" where we can.
> 
> To summarize:
> 
>  * powervr-drivers     -> ti-img-gpu-km
>  * ti-img-rogue-driver -> ti-img-rogue-km
>  * ti-sgx-ddk-km       -> ti-img-sgx-km
>  * libgles             -> ti-img-gpu-umlibs
>  * ti-sgx-ddk-um       -> ti-img-sgx-umlibs

Renaming recipes will have a huge impact downstream! Last time we renamed 
omap5-sgx-ddk-um-linux to ti-sgx-ddk-um, there's been a lot of breakage and 
tons of complaints from customers and the community at large (in public and 
even more so in private)...

First of all, you are only advised to do such thing in master (and not right 
before the next release, which is now), definitely not in a stable branch, 
especially not in a LTS branch (e.g. kirkstone).

Second, do it during the version bump - keep the old version under the old 
name, add a new version with the new name.

Third, you have to provide backward compatibility and setup corresponding 
preemption/replacement policy (at least RPROVIDES, RREPLACES, RCONFLICTS). 
But that alone won't help with downstream layers adding their bbappends.

Just checking a few public OEM layers that are downstream to meta-ti (and 
that's just the tip of the iceberg, as majority of customer layers are not 
even public!):

Phytec:
https://github.com/phytec/meta-phytec/blob/kirkstone/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bbappend

Toradex (seems to be a bit outdated, I'm guessing they pin to specific SHA):
https://git.toradex.com/cgit/meta-toradex-ti.git/tree/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bbappend?h=kirkstone-6.x.y
https://git.toradex.com/cgit/meta-toradex-ti.git/tree/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bbappend?h=kirkstone-6.x.y

Variscite:
Their meta-variscite-bsp-ti layer doesn't appear to touch graphics and is 
still on dunfell...

SanCloud:
Also doesn't appear to modify graphics recipes directly.

AGL:
https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/meta-agl.git;a=blob;f=meta-agl-bsp/meta-ti-bsp/recipes-bsp/ti-sgx-ddk-km/ti-sgx-ddk-km_%25.bbappend;hb=HEAD
https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/meta-agl.git;a=blob;f=meta-agl-bsp/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_%25.bbappend;hb=HEAD

These are just bbappends, but I'm sure there are other references to these 
current names in configs and/or their recipes...

AFAIK, AGL, for example, hasn't yet fully recovered from the latest graphics 
changes separating Mesa - there's work in progress going on right now.

I fully understand the desire to simplify and unify things, like directory 
and recipe names. But it comes with a lot of complications and require extra 
thought put into how not to break things for everyone around...

Yocto Project guidelines for public BSPs are much stricter than those for 
Distros or customer/product layers. It may be convenient to think of meta-ti 
as a "leaf" of the project, but it is actually quite a large "branch" with 
other "branches" and "leaves" downstream depending on it...

-- 
Denys


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  ...compiler-support-OpenEmbedded-nodistro-internal-aarc.patch | 0
>  .../ti-img-rogue-km_1.18.6276027.bb}                          | 0
>  .../ti-img-sgx-km_1.17.4948957.bb}                            | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend       | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend          | 2 +-
>  meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc                | 4 ++--
>  .../ti-img-rogue-umlibs_1.18.6276027.bb                       | 3 ++-
>  .../ti-img-sgx-umlibs}/pvrsrvkm.rules                         | 0
>  .../ti-img-sgx-umlibs_1.17.4948957.bb}                        | 2 +-
>  9 files changed, 8 insertions(+), 7 deletions(-)
>  rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-img-rogue-driver => ti-img-gpu-km/ti-img-rogue-km}/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch (100%)
>  rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb => ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb} (100%)
>  rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb => ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb} (97%)
>  rename meta-ti-bsp/recipes-graphics/{libgles => ti-img-gpu-umlibs}/ti-img-rogue-umlibs_1.18.6276027.bb (94%)
>  rename meta-ti-bsp/recipes-graphics/{libgles/ti-sgx-ddk-um => ti-img-gpu-umlibs/ti-img-sgx-umlibs}/pvrsrvkm.rules (100%)
>  rename meta-ti-bsp/recipes-graphics/{libgles/ti-sgx-ddk-um_1.17.4948957.bb => ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb} (98%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
> similarity index 100%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
> rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb
> similarity index 100%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
> rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
> similarity index 97%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
> index bf4fa98a..a624017d 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
> @@ -45,4 +45,4 @@ do_install:am65xx() {
>      make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
>  
> -RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
> +RRECOMMENDS:${PN} += "ti-img-sgx-umlibs"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> index 912e9e9d..17187330 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> @@ -1 +1 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km ti-img-sgx-km', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> index 912e9e9d..17187330 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> @@ -1 +1 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km ti-img-sgx-km', 'pvr-mesa.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> index 96c484a7..85f6968e 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>  SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
>  
>  PACKAGECONFIG:append = " \
> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km', 'pvr', '', d)} \
> +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-sgx-km', 'sgx', '', d)} \
>  "
>  
>  PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
> similarity index 94%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
> index 94d14ded..32525d48 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> +++ b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -22,7 +22,8 @@ TARGET_PRODUCT:am62xx = "am62_linux"
>  PVR_BUILD = "release"
>  PVR_WS = "lws-generic"
>  
> -RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
> +RDEPENDS:${PN} += "mesa-megadriver libdrm"
> +RDEPENDS:${PN} += "ti-img-rogue-km"
>  
>  do_install:append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs/pvrsrvkm.rules
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs/pvrsrvkm.rules
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
> index 755cc4f5..4b34e8b7 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
> @@ -36,7 +36,7 @@ inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
>  
>  RDEPENDS:${PN} += "libdrm"
>  
> -RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
> +RRECOMMENDS:${PN} += "ti-img-sgx-km"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.39.2

