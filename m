Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.2844.1575575737025208278
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 11:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IuSu4SMO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5JtaZ5037667;
	Thu, 5 Dec 2019 13:55:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575575736;
	bh=tojhvAgR8Ux/1i2I8zMvTDIqBsX1v+569BDcTHge6E0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IuSu4SMOQq0WEdL45lS48SFNfBFHg45a68ubR7yqXSSj37xSptkaSuPbgQkqEYu/i
	 fEypIzjvtoTEZ3v2WGBIVgcYv5RE6rINMUM0L2Yxmb858A2nyer9ulrzTsQs/0EckT
	 mMpl8LpkgJJmTwomXTVUe77sBPQUIwgXSjnso8dM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB5JtakP126443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2019 13:55:36 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 13:55:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 13:55:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5JtYrY099768;
	Thu, 5 Dec 2019 13:55:34 -0600
Date: Thu, 5 Dec 2019 14:55:34 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <d-senicic1@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][thud/master][PATCH] cmem: Adding am5729idk specific CMEM configuration
Message-ID: <20191205195534.GO24609@beryl>
References: <20191127142816.15503-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191127142816.15503-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 27, 2019 at 09:28:16AM -0500, djordje senicic via Lists.Yoctoproject.Org wrote:
> - CMEM memory block increased to 512MB to enable TIDL using 4xEVE and 2xDSP
> 
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-kernel/linux/cmem.inc                 |  9 +++--
>  .../linux/files/dra7xx/cmem-am572i.dtsi       | 40 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
> 
> diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
> index 8bd643f4..8d33fe35 100644
> --- a/recipes-kernel/linux/cmem.inc
> +++ b/recipes-kernel/linux/cmem.inc
> @@ -2,14 +2,15 @@
>  #
>  # Use these for temporary overrides
>  CMEM_MACHINE = "${MACHINE}"
> -CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
> -CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
> +CMEM_MACHINE_am57xx-evm = "am571x am572x am572i am574x"
> +CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am572i am574x"
>  CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
>  CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
>  
>  # Set cmem.dtsi per machine or machine variant
>  CMEM_DTSI = "cmem.dtsi"
>  CMEM_DTSI_am571x = "cmem-am571x.dtsi"
> +CMEM_DTSI_am572i = "cmem-am572i.dtsi"

Why not use the full "idk" instead of a single "i" in dtsi and machine names - 
a single change from "x" to "i" is too subtle and can be missed/forgotten in 
the future...


>  CMEM_DTSI_am574x = "cmem-am574x.dtsi"
>  CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
>  CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
> @@ -18,8 +19,8 @@ CMEM_DTSI_dra76x = "cmem-dra76x.dtsi"
>  # Split device trees between variants
>  CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
>  CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
> -CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb \
> -                          am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
> +CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb"
> +CMEM_DEVICETREE_am572i = "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
>  CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
> diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
> new file mode 100644
> index 00000000..6c39e22c
> --- /dev/null
> +++ b/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
> @@ -0,0 +1,40 @@
> +/ {
> +        reserved-memory {
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +                ranges;
> +
> +                cmem_block_mem_0: cmem_block_mem@a0000000 {
> +                        reg = <0x0 0xa0000000 0x0 0x20000000>;
> +                        no-map;
> +                        status = "okay";
> +                };
> +
> +		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
> +			reg = <0x0 0x40500000 0x0 0x100000>;
> +			no-map;
> +			status = "okay";
> +		};
> +        };
> +
> +        cmem {
> +                compatible = "ti,cmem";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +		#pool-size-cells = <2>;
> +
> +                status = "okay";
> +
> +                cmem_block_0: cmem_block@0 {
> +                        reg = <0>;
> +                        memory-region = <&cmem_block_mem_0>;
> +                        cmem-buf-pools = <1 0x0 0x20000000>;
> +                };
> +
> +		cmem_block_1: cmem_block@1 {
> +			reg = <1>;
> +			memory-region = <&cmem_block_mem_1_ocmc3>;
> +		};
> +        };
> +};
> -- 
> 2.17.1
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12533): https://lists.yoctoproject.org/g/meta-ti/message/12533
> Mute This Topic: https://lists.yoctoproject.org/mt/62541901/1051543
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denys@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

