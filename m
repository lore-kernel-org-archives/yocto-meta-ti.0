Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.1625.1580499583386526511
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ptoo2njP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJdgbJ107099
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:39:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499582;
	bh=QF/B5eybcsd5AuGvMMyCN7RElTzUjZ1UsgkhzmxJ11A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ptoo2njPfkywfWEXv+bV4/9XsJ9v5EEyOBUCYesh3g2S7s/SuYPQGLHOh46NwwLAg
	 h5u17/KHRbEp7s5+ISJEOeO9KLBq+X2LzVK688m5Hu8oU5cTxzexW9iRKMOb7881Em
	 zvHF7osLhq+EXYcCQ6v94uhS9MWyoMws2bm05JYQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJdgLp061298
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:39:42 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:39:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:39:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJdfsh120774;
	Fri, 31 Jan 2020 13:39:42 -0600
Date: Fri, 31 Jan 2020 14:39:41 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][RFC] recipes-graphics: Enable SGX drivers for Beagleboard and Pandaboard
Message-ID: <20200131193941.GF23242@beryl>
References: <20200131192520.29950-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200131192520.29950-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2020 at 02:25:20PM -0500, Andrew F. Davis wrote:
> These boards have SGX GPUs but do not build as this recipe is not
> compatible with them, add compatibles for these machines.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
> 
> Currently and RFC until I can get these binaries pushed to the
> git.ti.com/graphics/omap5-sgx-ddk repos.
> 
> Tested working locally on latest with a Beagleboard and a Pandaboard.

Super! Thanks for doing it!


>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb | 4 +++-
>  recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> index 751dfc74..05bca918 100644
> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
>  
>  inherit module
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"

Can we use omap3 and omap4 SOC_FAMILY overrides instead of specific boards?


>  MACHINE_KERNEL_PR_append = "s"
>  PR = "${MACHINE_KERNEL_PR}"
> @@ -30,6 +30,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
>  TARGET_PRODUCT_ti43x = "ti437x"
>  TARGET_PRODUCT_k3 = "ti654x"
> +TARGET_PRODUCT_beagleboard = "ti343x"
> +TARGET_PRODUCT_pandaboard = "ti443x"
>  
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
>  
> diff --git a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
> index ecf3ffcc..e3b9b4d1 100644
> --- a/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -4,7 +4,7 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>  
>  PR = "r34"
>  
> @@ -17,6 +17,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
>  TARGET_PRODUCT_ti43x = "ti437x"
>  TARGET_PRODUCT_k3 = "ti654x"
> +TARGET_PRODUCT_beagleboard = "ti343x"
> +TARGET_PRODUCT_pandaboard = "ti443x"
>  
>  INITSCRIPT_NAME = "rc.pvr"
>  INITSCRIPT_PARAMS = "defaults 8"
> -- 
> 2.17.1
> 
