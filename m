Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22BB6E00D8B; Tue, 29 Oct 2019 16:29:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D3E5E00C46
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2019 16:29:04 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TNT3xb047155
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2019 18:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572391743;
	bh=DY4JBQPF/pdq0ZwwdPlUjS33MAcvLiGbnzVfIlCXrF8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qLB9u9UZl2i6amqaSPHZPM/de+HA/NgmjZlJUf4gOgqc3dE+gRvZJkxJsGOE4wJ8A
	pOfQoiwZbkBj//MD4thzzCxws/9OeFB2SkGif9J84iBwLimVLfvu1dIO8zK4NlRlVY
	iy8kHujLpSyy2vcv3juBVbi5ulTAljwFM6DkOdgo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TNT2sD117115
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2019 18:29:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 18:28:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 18:28:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TNT3Hd007985;
	Tue, 29 Oct 2019 18:29:03 -0500
Date: Tue, 29 Oct 2019 19:29:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191029232901.GK7518@beryl>
References: <20191029132020.8891-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191029132020.8891-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-sgx-ddk-um: update SRCREV to pick up Mesa-based EGL/GLES libraries
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
X-List-Received-Date: Tue, 29 Oct 2019 23:29:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 29, 2019 at 09:20:20AM -0400, Eric Ruei wrote:
> This is the initial step toward Mesa-based EGL/GLES libraries which
> support all the required EGL 1.5 extensions. We plan to provide a
> Mesa-pvr recipe to build Mesa from source and SGX/DDK patches where
> ti-sgx-ddk-um shall provide the EGL/GLES plugins only at the next step.

Eric,

The new binaries are huge. The compressed package went from 900 KB to 8 MB in 
size and now both AM3 and AM4 won't fit into allocated rootfs size...


> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 7a6f013e..3991d917 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -11,7 +11,7 @@ PR = "r34"
>  BRANCH = "ti-img-sgx/thud/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
> +SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> @@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
>  
>  do_install () {
>      oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> -    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
> +    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
> +
> +    rm -rf ${D}${includedir}/GL
>  
>      chown -R root:root ${D}
>  }
> @@ -58,7 +60,7 @@ FILES_${PN} +=  "${includedir}/*"
>  FILES_${PN} +=  "${sysconfdir}/*"
>  
>  PACKAGES =+ "${PN}-plugins"
> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
>  RDEPENDS_${PN} += "${PN}-plugins"
>  
>  ALLOW_EMPTY_${PN}-plugins = "1"
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

