Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8824.1581612007497918680
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 08:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WJvzub22;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DGe6Dm006902
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:40:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581612006;
	bh=9KJm28qrXOM78dSA5qfWwWFss5qIHRuaFpUciJUaigM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WJvzub22mKiDLNC+ku7uFg9Jucs7Z9jt6VpMQ7CL8zX7cRu0A0QLCWMCXo7U45b5o
	 +y9PUQWT09XN2k6c7yGSayqshKNfM+z4gKqVJdG5EuzmMSS8DW7FKNzMowDi74nx+t
	 92AnaiBjqmgEI6pvFiQ66eRPhJtwNs7Vm2+GpXBo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DGe6lr112640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 10:40:06 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 10:40:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 10:40:06 -0600
Received: from [10.250.73.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DGe564081336;
	Thu, 13 Feb 2020 10:40:06 -0600
Subject: Re: [meta-ti][zeus/master][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV for zeus support
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200213162958.7600-1-afd@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <474e179b-0731-bbdd-95e9-ac305f6c17b8@ti.com>
Date: Thu, 13 Feb 2020 11:40:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213162958.7600-1-afd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/13/20 11:29 AM, Andrew F. Davis wrote:
> This also allows us to do two extra tasks so lets do them here:
>  - Add support back for Beagleboard and Pandaboard
>  - Remove plugins workaround as SO names are handled correctly now
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---


There are a couple meta-arago side fixes to get weston/matrix to start
automatically, but with this I can start weston, kmscube, glmark2, and
other demos manually.

There is an issue with AM335x in that the rather limited tilcdc driver
only supports "RG16 BG24 XB24" pixel formats, but most applications
expect the availability the GBM native formats AR24 and XR24, we may
have to look into the red-blue wire swapping on the kernel side.

Andrew


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
>  
>  CLEANBROKEN = "1"
> 
