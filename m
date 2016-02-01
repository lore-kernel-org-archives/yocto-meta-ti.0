Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 534E0E0079A; Mon,  1 Feb 2016 13:41:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BE9DE00444
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 13:41:10 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LfA6c011770
	for <meta-ti@yoctoproject.org>; Mon, 1 Feb 2016 15:41:10 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LfAiJ011711
	for <meta-ti@yoctoproject.org>; Mon, 1 Feb 2016 15:41:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:41:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11Lf9JE006808;
	Mon, 1 Feb 2016 15:41:09 -0600
Date: Mon, 1 Feb 2016 16:40:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160201214054.GT11314@edge>
References: <1454016127-25221-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454016127-25221-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-staging: Update to include uio device tree entries
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
X-List-Received-Date: Mon, 01 Feb 2016 21:41:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 28, 2016 at 04:22:07PM -0500, Jacob Stiffler wrote:
> - Adds device tree entries for multiple devices that use uio driver
> - These entries are added for k2h, k2l & k2e : keystone2 platforms
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi    |  32 ++++
>  recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi  |  58 +++++++
>  recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi    |  10 ++
>  .../linux/files/keystone/keystone-uio.dtsi         | 186 +++++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_4.1.bb       |   3 +-
>  recipes-kernel/linux/ti-uio.inc                    |  24 +++
>  6 files changed, 312 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
>  create mode 100644 recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
>  create mode 100644 recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
>  create mode 100644 recipes-kernel/linux/files/keystone/keystone-uio.dtsi
>  create mode 100644 recipes-kernel/linux/ti-uio.inc
> 
> diff --git a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
> new file mode 100644
> index 0000000..36f41b0
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
> @@ -0,0 +1,32 @@
> +/ {
> +	soc {
> +		uio_hyperlink0: hyperlink0 {
> +			compatible = "ti,uio-ti-pdrv";
> +			mem  = <0x21400000 0x00001000
> +				0x40000000 0x10000000
> +				0x0231a000 0x00002000>;
> +			clocks = <&clkhyperlink0>;
> +			interrupts	= <0 387 0x101>;
> +			cfg-params
> +			{
> +				ti,serdes_refclk_khz = <312500>;
> +				ti,serdes_maxserrate_khz = <6250000>;
> +				ti,serdes_lanerate = "half";
> +				ti,serdes_numlanes = <4>;
> +				ti,serdes_c1 = <4 4 4 4>;
> +				ti,serdes_c2 = <0 0 0 0>;
> +				ti,serdes_cm = <0 0 0 0>;
> +				ti,serdes_tx_att = <12 12 12 12>;
> +				ti,serdes_tx_vreg = <4 4 4 4>;
> +				ti,serdes_rx_att = <11 11 11 11>;
> +				ti,serdes_rx_boost = <3 3 3 3>;
> +			};
> +		};
> +		uio_srss: srss {
> +			compatible = "ti,uio-ti-pdrv";
> +			mem  = <0x02330000 0x0000400>;
> +			clocks=<&clksr>;
> +			interrupts = <0 0x173 0xf01>;
> +		};
> +	};
> +};
> diff --git a/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi b/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
> new file mode 100644
> index 0000000..cabe0b8
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
> @@ -0,0 +1,58 @@
> +/ {
> +	soc {
> +		uio_hyperlink0: hyperlink0 {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x21400000 0x00001000
> +				0x40000000 0x10000000
> +				0x0231a000 0x00002000>;
> +			clocks = <&clkhyperlink0>;
> +			interrupts	= <0 387 0x101>;
> +			cfg-params
> +			{
> +				ti,serdes_refclk_khz = <312500>;
> +				ti,serdes_maxserrate_khz = <6250000>;
> +				ti,serdes_lanerate = "half";
> +				ti,serdes_numlanes = <4>;
> +				ti,serdes_c1 = <4 4 4 4>;
> +				ti,serdes_c2 = <0 0 0 0>;
> +				ti,serdes_cm = <0 0 0 0>;
> +				ti,serdes_tx_att = <12 12 12 12>;
> +				ti,serdes_tx_vreg = <4 4 4 4>;
> +				ti,serdes_rx_att = <11 11 11 11>;
> +				ti,serdes_rx_boost = <3 3 3 3>;
> +			};
> +		};
> +
> +		uio_hyperlink1: hyperlink1 {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x21400000 0x00001000
> +				0x28000000 0x08000000
> +				0x0231c000 0x00002000>;
> +			clocks = <&clkhyperlink1>;
> +			interrupts	= <0 388 0x101>;
> +			cfg-params
> +			{
> +				ti,serdes_refclk_khz = <312500>;
> +				ti,serdes_maxserrate_khz = <6250000>;
> +				ti,serdes_lanerate = "half";
> +				ti,serdes_numlanes = <4>;
> +				ti,serdes_c1 = <4 4 4 4>;
> +				ti,serdes_c2 = <0 0 0 0>;
> +				ti,serdes_cm = <0 0 0 0>;
> +				ti,serdes_tx_att = <12 12 12 12>;
> +				ti,serdes_tx_vreg = <4 4 4 4>;
> +				ti,serdes_rx_att = <11 11 11 11>;
> +				ti,serdes_rx_boost = <3 3 3 3>;
> +			};
> +		};
> +
> +		uio_srio: srio {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x0232C000 0x00002000
> +				0x02900000 0x00040000
> +				0x0232C000 0x00002000>;
> +			clocks=<&clksrio>;
> +			interrupts = <0 154 0xf01>;
> +		};
> +	};
> +};
> diff --git a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
> new file mode 100644
> index 0000000..0334483
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
> @@ -0,0 +1,10 @@
> +/ {
> +	soc {
> +		uio_srss: srss {
> +			compatible = "ti,uio-ti-pdrv";
> +			mem  = <0x02330000 0x0000400>;
> +			clocks=<&clksr>;
> +			interrupts = <0 0x173 0xf01>;
> +		};
> +	};
> +};
> diff --git a/recipes-kernel/linux/files/keystone/keystone-uio.dtsi b/recipes-kernel/linux/files/keystone/keystone-uio.dtsi
> new file mode 100644
> index 0000000..43b183d
> --- /dev/null
> +++ b/recipes-kernel/linux/files/keystone/keystone-uio.dtsi
> @@ -0,0 +1,186 @@
> +/ {
> +	soc {
> +		uio_mpax: mpax {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x00bc00000 0x00000a00>;
> +		};
> +
> +		uio_edma3: edma3 {
> +			compatible = "ti,uio-module-drv";
> +			mem = <0x02700000 0x000C0000>;
> +		};
> +		uio_secmgr: secmgr {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x002500100 0x00000004>;
> +		};
> +		uio_qmss: qmss {
> +			compatible = "ti,uio-module-drv";
> +			mem  = <0x02a00000 0x00100000
> +				0x23a00000 0x00200000>;
> +		};
> +
> +		uio_qpend0: qpend0 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 44 0xf04>;
> +			interrupt-mode = <1>; /* Interrupt mode oneshot */
> +			cfg-params
> +			{
> +				ti,qm-queue = <662>;
> +			};
> +		};
> +
> +		uio_qpend1: qpend1 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 45 0xf04>;
> +			interrupt-mode = <1>; /* Interrupt mode oneshot */
> +			cfg-params
> +			{
> +				ti,qm-queue = <663>;
> +			};
> +		};
> +
> +		uio_qpend2: qpend2 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 46 0xf04>;
> +			interrupt-mode = <1>; /* Interrupt mode oneshot */
> +			cfg-params
> +			{
> +				ti,qm-queue = <664>;
> +			};
> +		};
> +
> +		uio_qpend3: qpend3 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 47 0xf04>;
> +			interrupt-mode = <1>; /* Interrupt mode oneshot */
> +			cfg-params
> +			{
> +				ti,qm-queue = <665>;
> +			};
> +		};
> +
> +		/* The following uio cic2 entries allow access to interupt output
> +		 * by the cic2 controller: The actual input event triggering the
> +		 * interrupt is assumed to be programmed other drivers
> +		 */
> +		uio_cic2_out32: cic2_out32 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 451 0xf01>;
> +		};
> +
> +		uio_cic2_out33: cic2_out33 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 452 0xf01>;
> +		};
> +
> +		uio_cic2_out34: cic2_out34 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 453 0xf01>;
> +		};
> +
> +		uio_cic2_out35: cic2_out35 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 454 0xf01>;
> +		};
> +
> +		uio_cic2_out36: cic2_out36 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 455 0xf01>;
> +		};
> +
> +		uio_cic2_out37: cic2_out37 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 456 0xf01>;
> +		};
> +
> +		uio_cic2_out38: cic2_out38 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 457 0xf01>;
> +		};
> +
> +		uio_cic2_out39: cic2_out39 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 458 0xf01>;
> +		};
> +
> +		uio_cic2_out40: cic2_out40 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 459 0xf01>;
> +		};
> +
> +		uio_cic2_out41: cic2_out41 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 460 0xf01>;
> +		};
> +
> +		uio_cic2_out42: cic2_out42 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 461 0xf01>;
> +		};
> +
> +		uio_cic2_out43: cic2_out43 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 462 0xf01>;
> +		};
> +
> +		uio_cic2_out44: cic2_out44 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 463 0xf01>;
> +		};
> +
> +		uio_cic2_out45: cic2_out45 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 464 0xf01>;
> +		};
> +
> +		uio_cic2_out46: cic2_out46 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 465 0xf01>;
> +		};
> +
> +		uio_cic2_out47: cic2_out47 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 466 0xf01>;
> +		};
> +
> +		uio_cic2_out18: cic2_out18 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 467 0xf01>;
> +		};
> +
> +		uio_cic2_out19: cic2_out19 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 468 0xf01>;
> +		};
> +
> +		uio_cic2_out22: cic2_out22 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 469 0xf01>;
> +		};
> +
> +		uio_cic2_out23: cic2_out23 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 470 0xf01>;
> +		};
> +
> +		uio_cic2_out50: cic2_out50 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 471 0xf01>;
> +		};
> +
> +		uio_cic2_out51: cic2_out51 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 472 0xf01>;
> +		};
> +
> +		uio_cic2_out66: cic2_out66 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 473 0xf01>;
> +		};
> +
> +		uio_cic2_out67: cic2_out67 {
> +			compatible = "ti,uio-module-drv";
> +			interrupts = <0 474 0xf01>;
> +		};
> +	};
> +};
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
> index 59805c6..842ed4e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
> @@ -8,6 +8,7 @@ inherit kernel
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/cmem.inc
> +require recipes-kernel/linux/ti-uio.inc
>  
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
> @@ -68,7 +69,7 @@ SRCREV = "08ad1740b59cc3aef52a2612b1e807a3e844583c"
>  PV = "4.1.16+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "c"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
> diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
> new file mode 100644
> index 0000000..82cbbce
> --- /dev/null
> +++ b/recipes-kernel/linux/ti-uio.inc
> @@ -0,0 +1,24 @@
> +SRC_URI_append_keystone += "file://keystone-uio.dtsi"
> +SRC_URI_append_k2hk-evm += "file://k2hk-uio.dtsi"
> +SRC_URI_append_k2l-evm += "file://k2l-uio.dtsi"
> +SRC_URI_append_k2e-evm += "file://k2e-uio.dtsi"

Use either _append or += as there's no reason to use both. If you end up using 
_append, don't forget that it doesn't add any spaces, so you may need to 
prepend one.


> +DTSI_LIST = ""
> +DTSI_LIST_append_keystone += "keystone-uio.dtsi"
> +DTSI_LIST_append_k2hk-evm += "k2hk-uio.dtsi"
> +DTSI_LIST_append_k2l-evm += "k2l-uio.dtsi"
> +DTSI_LIST_append_k2e-evm += "k2e-uio.dtsi"

Same here ^^^

Also, this change is unconditional, unlike cmem that uses RESERVE_CMEM 
variable. Please change it so that .inc file can be safely included w/o 
forcing dts changes. Thanks.


> +do_setup_uio() {
> +    for dtsi in ${DTSI_LIST}
> +    do
> +        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
> +        for dtb in ${KERNEL_DEVICETREE}
> +        do
> +            dts=`echo $dtb | sed -e 's|dtb$|dts|'`
> +            echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
> +        done
> +    done
> +}
> +
> +do_patch[postfuncs] += "do_setup_uio"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

