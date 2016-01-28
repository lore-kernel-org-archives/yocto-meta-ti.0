Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13B44E008F5; Thu, 28 Jan 2016 12:31:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A19A8E00803
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 12:31:18 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SKVHi1005412
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 14:31:17 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SKVHuZ008067
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 14:31:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 14:31:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SKVHbq020379;
	Thu, 28 Jan 2016 14:31:17 -0600
Date: Thu, 28 Jan 2016 15:31:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160128203101.GI11314@edge>
References: <1454006836-7313-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454006836-7313-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux: cmem: Update reserved CMEM regions
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
X-List-Received-Date: Thu, 28 Jan 2016 20:31:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please briefly specify the reason for the change. Thanks.


On Thu, Jan 28, 2016 at 01:47:16PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-kernel/linux/files/dra7xx/cmem.dtsi  | 20 +++++++++++--
>  recipes-kernel/linux/files/k2e-evm/cmem.dtsi | 42 ++++++++++++++++++++++++++++
>  recipes-kernel/linux/files/k2l-evm/cmem.dtsi | 42 ++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-kernel/linux/files/k2e-evm/cmem.dtsi
>  create mode 100644 recipes-kernel/linux/files/k2l-evm/cmem.dtsi
> 
> diff --git a/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
> index d91faf9..c7781c4 100644
> --- a/recipes-kernel/linux/files/dra7xx/cmem.dtsi
> +++ b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
> @@ -1,10 +1,20 @@
>  / {
>          reserved-memory {
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +                ranges;
> +
>                  cmem_block_mem_0: cmem_block_mem@a0000000 {
> -                        reg = <0x0 0xa0000000 0x0 0x0a000000>;
> +                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
>                          no-map;
>                          status = "okay";
>                  };
> +
> +		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
> +			reg = <0x0 0x40500000 0x0 0x100000>;
> +			no-map;
> +			status = "okay";
> +		};
>          };
>  
>          cmem {
> @@ -19,8 +29,12 @@
>                  cmem_block_0: cmem_block@0 {
>                          reg = <0>;
>                          memory-region = <&cmem_block_mem_0>;
> -                        cmem-buf-pools = <1 0x0 0x0a000000>;
> +                        cmem-buf-pools = <1 0x0 0x0c000000>;
>                  };
> -        };
>  
> +		cmem_block_1: cmem_block@1 {
> +			reg = <1>;
> +			memory-region = <&cmem_block_mem_1_ocmc3>;
> +		};
> +        };
>  };
> diff --git a/recipes-kernel/linux/files/k2e-evm/cmem.dtsi b/recipes-kernel/linux/files/k2e-evm/cmem.dtsi
> new file mode 100644
> index 0000000..236b0ba
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2e-evm/cmem.dtsi
> @@ -0,0 +1,42 @@
> +/ {
> +	reserved-memory {
> +		mpm_block_mem_0: mpm_block_mem@820000000 {
> +			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
> +			no-map;
> +			status = "okay";
> +		};
> +
> +		cmem_block_mem_0: cmem_block_mem@829000000 {
> +			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
> +			no-map;
> +			status = "okay";
> +		};
> +
> +		cmem_block_mem_1: cmem_block_mem@00c100000 {
> +			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
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
> +			cmem-buf-pools = <1 0x00000000 0x1E000000>;
> +		};
> +
> +		cmem_block_1: cmem_block@1 {
> +			reg = <1>;
> +			memory-region = <&cmem_block_mem_1>;
> +		};
> +	};
> +};
> diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
> new file mode 100644
> index 0000000..236b0ba
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
> @@ -0,0 +1,42 @@
> +/ {
> +	reserved-memory {
> +		mpm_block_mem_0: mpm_block_mem@820000000 {
> +			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
> +			no-map;
> +			status = "okay";
> +		};
> +
> +		cmem_block_mem_0: cmem_block_mem@829000000 {
> +			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
> +			no-map;
> +			status = "okay";
> +		};
> +
> +		cmem_block_mem_1: cmem_block_mem@00c100000 {
> +			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
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
> +			cmem-buf-pools = <1 0x00000000 0x1E000000>;
> +		};
> +
> +		cmem_block_1: cmem_block@1 {
> +			reg = <1>;
> +			memory-region = <&cmem_block_mem_1>;
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

