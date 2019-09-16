Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B16AE00A49; Mon, 16 Sep 2019 08:43:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31A1AE00942
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 08:43:57 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GFhujF086098
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568648636;
	bh=lcofOwCUWe/Gmli4d4th8ODTt+BvSD+Wmxynmi6Q6kw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WLw1tSZpAd3HyNafViVwEqbaA89GNiF1IFVvyV6rch4uNiEnM4S4k6rDx++RLCT7c
	rqoLLZqPHv6Yjp2RExyA70RMKsuJDo0ROJKx9kHMuhwGzIZ8ZrtOvuKVFDglI8cu7l
	6IyzpGiALTR1jCjf0hNdMiYk2qA/UA8bSaX2L/Ng=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GFhuAI081412
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:43:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 10:43:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 10:43:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GFhuOp075654;
	Mon, 16 Sep 2019 10:43:56 -0500
Date: Mon, 16 Sep 2019 11:43:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20190916154355.GB26975@beryl>
References: <20190914135151.3619-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190914135151.3619-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][RFC] Mesa recipie now provides GL frontend libs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2019 15:43:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Andrew,

Thanks for pushing this forward! I'll give it some thought and more thorough 
review, but the first comment I had so far is that bbappend won't work for 
this purpose, as it would modify Mesa recipe unconditionally and BSP layers 
are not allowed to do that. Also, can the dependency between Mesa and DDK be 
the other way around?

Denys


On Sat, Sep 14, 2019 at 09:51:51AM -0400, Andrew F. Davis wrote:
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
> 
> Hello all,
> 
> This is a preview change of our GPU driver stack. Mesa can now used to
> provide the GL frontend libraries (EGL/GBM) for our SGX based systems.
> This greatly expands our supported extensions and improves compatibility
> with software designed to work with Mesa and Mesa provided tooling. The
> existing backend is now confined to just a DRI backend used to provide
> the GLES1/2 functions. The extensions/compatibility on this part of the
> stack will not change.
> 
> The Mesa-side-glue to interface with the SGX DRI blobs is currently
> internal only until we can find the right way to distribute the patches
> (recipe patches in meta-ti or as a fork of Mesa hosted on git.ti.com).
> Currently they are on my internal only bitbucket, so those outside TI
> will not be able to test just yet :( but can review this recipe patch
> just the same.
> 
> What you need to do right now for this to have an effect is to change
> your preferred provider of GL libs over in your distro layer to the
> new mesa-pvr.
> 
> -PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> -PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
> +PREFERRED_PROVIDER_virtual/egl = "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles1 = "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles2 = "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgbm = "mesa-pvr"
> 
> At some point I'd like this to just be "mesa" but with some bbappends to
> change the repo and some per platform PACKAGECONFIG magic set so it
> builds the same as this recipe.
> 
> All comments, opinions, and concerns welcome :)
> 
> Andrew
> 
>  recipes-graphics/libgles/mesa-pvr_git.bb      | 46 +++++++++++++++++++
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 28 ++---------
>  2 files changed, 49 insertions(+), 25 deletions(-)
>  create mode 100644 recipes-graphics/libgles/mesa-pvr_git.bb
> 
> diff --git a/recipes-graphics/libgles/mesa-pvr_git.bb b/recipes-graphics/libgles/mesa-pvr_git.bb
> new file mode 100644
> index 00000000..f66197c5
> --- /dev/null
> +++ b/recipes-graphics/libgles/mesa-pvr_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "Mesa with IMG PVR DRI driver"
> +
> +HOMEPAGE = "http://mesa3d.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> +
> +PV = "0.0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI = "git://git@bitbucket.itg.ti.com/~a0226330/mesa.git;protocol=ssh;branch=${BRANCH}"
> +BRANCH = "mesa-19.1.6-pvr-buildup"
> +SRCREV = "ea27ae6fdaf9d813dc484113661afa6276cdd5da"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native wayland-native wayland libdrm wayland-protocols xorgproto libdrm ti-sgx-ddk-um"
> +RDEPENDS_${PN} = "ti-sgx-ddk-um"
> +EXTRANATIVEPATH += "chrpath-native"
> +PROVIDES = "virtual/libgles1 virtual/libgles2 virtual/egl virtual/libgbm"
> +
> +inherit meson pkgconfig python3native gettext distro_features_check
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
> +
> +EXTRA_OEMESON = " \
> +    -Dshared-glapi=true \
> +    -Dgallium-opencl=disabled \
> +    -Dglx-read-only-text=true \
> +    -Dplatforms=wayland,drm \
> +    -Dglx=disabled \
> +    -Ddri-drivers=pvr \
> +    -Ddri3=false \
> +    -Dgles1=true \
> +    -Dgles2=true \
> +    -Degl=true \
> +    -Dgallium-drivers='' \
> +    -Dvulkan-drivers='' \
> +    -Dllvm=false \
> +    -Dlibunwind=false \
> +"
> +
> +# mesa tries to run cross-built gen_matypes on build machine to get struct size information
> +EXTRA_OEMESON_append = " -Dasm=false"
> +
> +FILES_${PN} += " ${libdir}/dri/*"
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 7a6f013e..f063e455 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>  
> -PR = "r34"
> +PR = "r35"
>  
> -BRANCH = "ti-img-sgx/thud/${PV}"
> +BRANCH = "ti-img-sgx/thud/${PV}-mesa-experimental"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
> +SRCREV = "a6c033f992d124cfc4ee1488b2565c20116f653c"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> @@ -23,23 +23,9 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> -
>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
>  RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
>  
> -RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> -RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> -
> -RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm"
> -RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> -
> -RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
> -RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> -
>  # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
>  RPROVIDES_${PN} += "libGLESv2.so.1"
>  
> @@ -54,20 +40,12 @@ do_install () {
>  
>  FILES_${PN} =  "${bindir}/*"
>  FILES_${PN} += " ${libdir}/*"
> -FILES_${PN} +=  "${includedir}/*"
>  FILES_${PN} +=  "${sysconfdir}/*"
>  
> -PACKAGES =+ "${PN}-plugins"
> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> -RDEPENDS_${PN} += "${PN}-plugins"
> -
> -ALLOW_EMPTY_${PN}-plugins = "1"
> -
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  
>  INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
> -INSANE_SKIP_${PN}-plugins = "dev-so"
>  INSANE_SKIP_${PN} += "already-stripped"
>  
>  CLEANBROKEN = "1"
> -- 
> 2.17.1
> 

