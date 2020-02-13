Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.1362.1581619800139879935
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 10:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qfg/cVRN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DInxXU096921
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 12:49:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581619799;
	bh=RgveRXfngjrSMQPae2xevOiz0jhSbKUZOQz/ovWJjSY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Qfg/cVRNnMYWlN5ZBVA4QqqPLFAqT8NZ/VFrIODu8fJfGoAcYdBa1UgLcqxWoW8U+
	 iwMkelJZj7KMofJZ2909ObquaT4haBr0imutMwSAMLbOb0OCGDluyE9xVkR2/iEVKf
	 ndp2nZva22hiylTE79ycf9SLfIS7a1BalWKH5D68=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DInxr2044019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 12:49:59 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 12:49:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 12:49:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DInwaD053807;
	Thu, 13 Feb 2020 12:49:58 -0600
Date: Thu, 13 Feb 2020 13:49:58 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV for zeus support
Message-ID: <20200213184958.GD7085@beryl>
References: <20200213162958.7600-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200213162958.7600-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 13, 2020 at 11:29:57AM -0500, Andrew F. Davis wrote:
> This also allows us to do two extra tasks so lets do them here:
>  - Add support back for Beagleboard and Pandaboard
>  - Remove plugins workaround as SO names are handled correctly now

Thanks for the update and for taking care of these 2 extra items!


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index ecf3ffcc..129d5cee 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -4,19 +4,21 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>  
> -PR = "r34"
> +PR = "r35"
>  
> -BRANCH = "ti-img-sgx/thud/${PV}"
> +BRANCH = "ti-img-sgx/zeus/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
> +SRCREV = "ce7b96b88d31da27af5b3a2a890aba180a014fc4"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
>  TARGET_PRODUCT_ti43x = "ti437x"
>  TARGET_PRODUCT_k3 = "ti654x"
> +TARGET_PRODUCT_beagleboard = "ti343x"
> +TARGET_PRODUCT_pandaboard = "ti443x"
>  
>  INITSCRIPT_NAME = "rc.pvr"
>  INITSCRIPT_PARAMS = "defaults 8"
> @@ -59,14 +61,7 @@ FILES_${PN} += " ${libdir}/*"
>  FILES_${PN} +=  "${includedir}/*"
>  FILES_${PN} +=  "${sysconfdir}/*"
>  
> -PACKAGES =+ "${PN}-plugins"
> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
> -RDEPENDS_${PN} += "${PN}-plugins"
> -
> -ALLOW_EMPTY_${PN}-plugins = "1"
> -
>  INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
> -INSANE_SKIP_${PN}-plugins = "dev-so"
> -INSANE_SKIP_${PN} += "already-stripped"
> +INSANE_SKIP_${PN} += "already-stripped dev-deps"

What's new dev-deps is for?


>  CLEANBROKEN = "1"
> -- 
> 2.17.1
> 
