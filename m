Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6814.1575594108091709979
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 17:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 43D1240C06;
	Fri,  6 Dec 2019 01:01:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPBQAVoe-1pT; Fri,  6 Dec 2019 01:01:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1431840C04;
	Fri,  6 Dec 2019 01:01:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 47CD8174336; Thu,  5 Dec 2019 20:01:44 -0500 (EST)
Date: Thu, 5 Dec 2019 20:01:44 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: d-senicic1@ti.com
Cc: meta-ti@yoctoproject.org, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][thud/master][PATCHv2] cmem: am5729idk has specific CMEM cfg increased to 512MB
Message-ID: <20191206010144.GW4735@denix.org>
References: <20191205222612.31112-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191205222612.31112-1-x0157990@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, merged into next for testing.

On Thu, Dec 05, 2019 at 05:26:12PM -0500, djordje senicic via Lists.Yoctoproject.Org wrote:
> - CMEM memory block increased to 512MB to enable TIDL using 4xEVE and 2xDSP
> 
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> 
> ---
>  recipes-kernel/linux/cmem.inc                 |  9 +++--
>  .../linux/files/dra7xx/cmem-am572idk.dtsi     | 40 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
> 
> diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
> index 8bd643f4..23e48f12 100644
> --- a/recipes-kernel/linux/cmem.inc
> +++ b/recipes-kernel/linux/cmem.inc
> @@ -2,14 +2,15 @@
>  #
>  # Use these for temporary overrides
>  CMEM_MACHINE = "${MACHINE}"
> -CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
> -CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
> +CMEM_MACHINE_am57xx-evm = "am571x am572x am572idk am574x"
> +CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am572idk am574x"
>  CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
>  CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
>  
>  # Set cmem.dtsi per machine or machine variant
>  CMEM_DTSI = "cmem.dtsi"
>  CMEM_DTSI_am571x = "cmem-am571x.dtsi"
> +CMEM_DTSI_am572idk = "cmem-am572idk.dtsi"
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
> +CMEM_DEVICETREE_am572idk = "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
>  CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
> diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
> new file mode 100644
> index 00000000..6c39e22c
> --- /dev/null
> +++ b/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
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
> View/Reply Online (#12552): https://lists.yoctoproject.org/g/meta-ti/message/12552
> Mute This Topic: https://lists.yoctoproject.org/mt/67252659/3617104
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-

