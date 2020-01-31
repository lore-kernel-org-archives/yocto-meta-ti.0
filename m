Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.1595.1580499446626084206
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MdNcdHZA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJbPF3106571
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:37:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499445;
	bh=9g2yo+h5O4bLMWMFabIHzUFla2o0he7pOuC1RkpMlqY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MdNcdHZAL1sslxucOo7uUGW9w8kMM6did919eqhmMMMFHvLZLCTncKt1fxB+l/Z9+
	 GMFiZykXDCauVbJSbhHOGNG5hPppLuOzl+v3YPVAfa9FQV3diV52UxqrwuQ8Zrh/ue
	 FqJrjR08Yx4M0i9ItoJb8S+2jF0Xw7PfDnm0edco=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJbPCI024093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:37:25 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:37:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:37:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJbP3I116381;
	Fri, 31 Jan 2020 13:37:25 -0600
Date: Fri, 31 Jan 2020 14:37:25 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 3/3] recipes-graphics: Use M for kernel build subdirectory over SUBDIRS
Message-ID: <20200131193725.GE23242@beryl>
References: <20200131192111.29813-1-afd@ti.com>
 <20200131192111.29813-3-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200131192111.29813-3-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2020 at 02:21:11PM -0500, Andrew F. Davis wrote:
> SUBDIRS has been deprecated for a while and as of k5.4 no longer works.
> Use M= instead.

Thanks! Sorry, can you please swap this with patch #2, so I can merge it w/o 
moving things around yet. Thanks.


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb          | 2 +-
>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
> index 2f4b7ac5..bc907263 100644
> --- a/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
> +++ b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
> @@ -32,5 +32,5 @@ PVR_WS = "wayland"
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
>  
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> index 5c1a50de..751dfc74 100644
> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -38,9 +38,9 @@ do_compile_prepend() {
>  }
>  
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
>  
>  do_install_k3() {
> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> -- 
> 2.17.1
> 
