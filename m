Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7007.1575594133106199961
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 17:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 887C140C06;
	Fri,  6 Dec 2019 01:02:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PCUmY7RXo20; Fri,  6 Dec 2019 01:02:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 681F440C04;
	Fri,  6 Dec 2019 01:02:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3990A174336; Thu,  5 Dec 2019 20:02:11 -0500 (EST)
Date: Thu, 5 Dec 2019 20:02:11 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: c-robey@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH v4] cmem: Adding am5729 beaglebonai CMEM configuration
Message-ID: <20191206010211.GX4735@denix.org>
References: <20191205211321.23743-1-c-robey@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191205211321.23743-1-c-robey@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, merged into next for testing.

On Thu, Dec 05, 2019 at 03:13:21PM -0600, Caleb Robey via Lists.Yoctoproject.Org wrote:
> CMEM memory block for bbai should be 402MB to allow full EVE
> acceleration and DSP use, but accounting for the BBAI only having
> 1GB of RAM.
> 
> Signed-off-by: Caleb Robey <c-robey@ti.com>
> 
> ---
> 
> v2 changes:
>     - Added am572b to CMEM_MACHINEs.
> 
> v3 changes:
>     - changed am572b to am5729-beagleboneai for clarity
> 
> v4 changes:
>     - corrected mistake of adding new CMEM machine and
>       added beagleboneai to the already known machines
> 
>  recipes-kernel/linux/cmem.inc                 |  6 ++-
>  .../dra7xx/cmem-am5729-beagleboneai.dtsi      | 40 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
> 
> diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
> index 8bd643f4..3ad8e25d 100644
> --- a/recipes-kernel/linux/cmem.inc
> +++ b/recipes-kernel/linux/cmem.inc
> @@ -2,14 +2,15 @@
>  #
>  # Use these for temporary overrides
>  CMEM_MACHINE = "${MACHINE}"
> -CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
> -CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
> +CMEM_MACHINE_am57xx-evm = "am571x am572x am5729-beagleboneai am574x"
> +CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am5729-beagleboneai am574x"
>  CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
>  CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
>  
>  # Set cmem.dtsi per machine or machine variant
>  CMEM_DTSI = "cmem.dtsi"
>  CMEM_DTSI_am571x = "cmem-am571x.dtsi"
> +CMEM_DTSI_am5729-beagleboneai = "cmem-am5729-beagleboneai.dtsi"
>  CMEM_DTSI_am574x = "cmem-am574x.dtsi"
>  CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
>  CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
> @@ -20,6 +21,7 @@ CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
>  CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb \
>                            am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
> +CMEM_DEVICETREE_am5729-beagleboneai = "am5729-beagleboneai.dtb"
>  CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
>  CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
> diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
> new file mode 100644
> index 00000000..e0511d08
> --- /dev/null
> +++ b/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
> @@ -0,0 +1,40 @@
> +/ {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cmem_block_mem_0: cmem_block_mem@a0000000 {
> +			reg = <0x0 0xa0000000 0x0 0x18000000>;
> +			no-map;
> +			status = "okay";
> +		};
> +
> +		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
> +			reg = <0x0 0x40500000 0x0 0x100000>;
> +			no-map;
> +			status = "okay";
> +		};
> +	};
> +
> +	cmem {
> +		compatible = "ti,cmem";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		#pool-size-cells = <2>;
> +
> +		status = "okay";
> +
> +		cmem_block_0: cmem_block@0 {
> +			reg = <0>;
> +			memory-region = <&cmem_block_mem_0>;
> +			cmem-buf-pools = <1 0x0 0x18000000>;
> +		};
> +
> +		cmem_block_1: cmem_block@1 {
> +			reg = <1>;
> +			memory-region = <&cmem_block_mem_1_ocmc3>;
> +		};
> +	};
> +};
> -- 
> 2.17.1
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12551): https://lists.yoctoproject.org/g/meta-ti/message/12551
> Mute This Topic: https://lists.yoctoproject.org/mt/67215961/3617104
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-

