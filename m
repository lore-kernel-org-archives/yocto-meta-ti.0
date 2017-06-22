Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44B21E00BFF; Thu, 22 Jun 2017 15:09:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE7FBE00B58
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 15:09:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MM9h0N029683
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498169383;
	bh=7VX6KdHMXObOdhamDen+bsk8EESEJuQsHnmWHeH0oJ0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jN043MezCbZG87d1cbynFsYvceNHlFl+JfMG272LXS0NshQluMcXlByDxfl/SDeOK
	JP+aV+zldOav6+/QgdaXzBXO7eO98d+QatMxrphj6Bbw1r/o4ArDkLLQfSoOgxaULT
	FqWtjjK8AiheuJyr6ItdlaeiNbc62/LIOBMI0N1E=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MM9c6U020466
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:09:38 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MM9VdZ020398;	Thu, 22 Jun 2017 17:09:38 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jun 2017 18:09:25 -0400
Message-ID: <1498169365-10248-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1498169365-10248-1-git-send-email-h-gou@ti.com>
References: <1498169365-10248-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] linux-ti-staging: include pru-uio device tree files for am3/am4
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
X-List-Received-Date: Thu, 22 Jun 2017 22:09:56 -0000
Content-Type: text/plain

* These device tree files are to support pruss with uio based
  drivers alone. The new dtbs are added only if ENABLE_TI_UIO_DEVICES
  is enabled.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../linux/files/ti33x/am335x-pru-uio.dtsi          | 192 ++++++++++++++
 .../linux/files/ti43x/am437x-pru-uio.dtsi          | 292 +++++++++++++++++++++
 recipes-kernel/linux/ti-uio.inc                    |  28 ++
 3 files changed, 512 insertions(+)
 create mode 100644 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
 create mode 100644 recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
new file mode 100644
index 0000000..2d9127b
--- /dev/null
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -0,0 +1,192 @@
+&pruss_soc_bus {
+		uio_pruss_mdio: uio_pruss_mdio@4a332400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x4a332400 0x90>;
+			clocks = <&dpll_core_m4_ck>;
+			clock-names = "fck";
+			bus_freq = <1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uio_pruss_mem: uio_pruss_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a300000 0x2000>,
+			      <0x4a302000 0x2000>,
+			      <0x4a310000 0x3000>,
+			      <0x4a320000 0x2000>,
+			      <0x4a326000 0x2000>,
+			      <0x4a32e000 0x31c>,
+			      <0x4a332000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+
+			status = "okay";
+		};
+		uio_pruss_mem2: uio_pruss_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a328000 0xd4>,
+			      <0x4a330000 0x174>,
+			      <0x4a332400 0x90>,
+			      <0x40302000 0x0e000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+
+		uio_pruss_evt0: uio_pruss_evt0 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <20>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt1: uio_pruss_evt1 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <21>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt2: uio_pruss_evt2 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <22>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt3: uio_pruss_evt3 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <23>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt4: uio_pruss_evt4 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <24>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt5: uio_pruss_evt5 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <25>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt6: uio_pruss_evt6 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <26>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt7: uio_pruss_evt7 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <27>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss_0_mem: uio_pruss_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a334000 0x2000>,
+			      <0x4a322000 0x400>,
+			      <0x4a322400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss_1_mem: uio_pruss_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a338000 0x2000>,
+			      <0x4a324000 0x400>,
+			      <0x4a324400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&am33xx_pinmux {
+	uio_pruss_mdio_eth_default: uio_pruss_mdio_eht_default {
+		pinctrl-single,pins = <
+			AM33XX_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))           /* gpmc_clk.pr1_mdio_mdclk */
+			AM33XX_IOPAD(0x888, (PIN_INPUT  | MUX_MODE5))           /* gpmc_csn3.pr1_mdio_data */
+			AM33XX_IOPAD(0x89c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* gpmc_ben0_cle.gpio2_5 */
+			/* disable CPSW MDIO */
+			AM33XX_IOPAD(0x948, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_data.gpio0_0 */
+			AM33XX_IOPAD(0x94c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_clk.gpio0_1 */
+			AM33XX_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))   /* dss_data0.pr1_mii_mt0_clk */
+			AM33XX_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data5.pr1_mii0_txd0 */
+			AM33XX_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))   /* dss_data4.pr1_mii0_txd1 */
+			AM33XX_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))   /* dss_data3.pr1_mii0_txd2 */
+			AM33XX_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))   /* dss_data2.pr1_mii0_txd3 */
+			AM33XX_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))   /* dss_data11.pr1_mii0_rxd0 */
+			AM33XX_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))   /* dss_data10.pr1_mii0_rxd1 */
+			AM33XX_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))   /* dss_data9.pr1_mii0_rxd2 */
+			AM33XX_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))   /* dss_data8.pr1_mii0_rxd3 */
+			AM33XX_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data1.pr1_mii0_txen */
+			AM33XX_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))   /* dss_data14.pr1_mii_mr0_clk */
+			AM33XX_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))   /* dss_data15.pr1_mii0_rxdv */
+			AM33XX_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))   /* dss_data13.pr1_mii0_rxer */
+			AM33XX_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))   /* dss_data12.pr1_mii0_rxlink */
+			AM33XX_IOPAD(0x8e8, (PIN_INPUT  | MUX_MODE2))   /* dss_pclk.pr1_mii0_crs */
+
+			AM33XX_IOPAD(0x840, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a0.pr1_mii_mt1_clk */
+			AM33XX_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a4.pr1_mii1_txd0 */
+			AM33XX_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a3.pr1_mii1_txd1 */
+			AM33XX_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a2.pr1_mii1_txd2 */
+			AM33XX_IOPAD(0x844, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a1.pr1_mii1_txd3 */
+			AM33XX_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a8.pr1_mii1_rxd0 */
+			AM33XX_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a7.pr1_mii1_rxd1 */
+			AM33XX_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a6.pr1_mii1_rxd2 */
+			AM33XX_IOPAD(0x854, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a5.pr1_mii1_rxd3 */
+			AM33XX_IOPAD(0x874, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_wpn.pr1_mii1_txen */
+			AM33XX_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a9.pr1_mii_mr1_clk */
+			AM33XX_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a10.pr1_mii1_rxdv */
+			AM33XX_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a11.pr1_mii1_rxer */
+			AM33XX_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))   /* gpmc_ben1.pr1_mii1_rxlink */
+			AM33XX_IOPAD(0x8ec, (PIN_INPUT  | MUX_MODE2))   /* lcd_ac_bias_en.pr1_mii1_crs */
+			AM33XX_IOPAD(0x870, (PIN_INPUT  | MUX_MODE5))   /* gpmc_wait0.pr1_mii1_col */
+		>;
+	};
+};
+
+&uio_pruss_mdio {
+	pinctrl-0 = <&uio_pruss_mdio_eth_default>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>; /* PHY datasheet states 1uS min */
+	status = "okay";
+
+	uio_pruss_eth0_phy: ethernet-phy@1 {
+		reg = <1>;
+	};
+
+	uio_pruss_eth1_phy: ethernet-phy@3 {
+		reg = <3>;
+	};
+};
+
+&pruss {
+	status = "disabled";
+};
+
+&pru0 {
+	status = "disabled";
+};
+
+&pru1 {
+	status = "disabled";
+};
+
+&pruss_intc {
+	status = "disabled";
+};
+
+&pruss_mdio {
+	status = "disabled";
+};
+
+&pruss_emac0 {
+	status = "disabled";
+};
+
+&pruss_emac1 {
+	status = "disabled";
+};
diff --git a/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
new file mode 100644
index 0000000..80993c4
--- /dev/null
+++ b/recipes-kernel/linux/files/ti43x/am437x-pru-uio.dtsi
@@ -0,0 +1,292 @@
+&pruss_soc_bus {
+		uio_pruss2_mdio: uio_mdio@54432400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x54432400 0x90>;
+			clocks = <&dpll_core_m4_ck>;
+			clock-names = "fck";
+			bus_freq = <1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54400000 0x2000>,
+			      <0x54402000 0x2000>,
+			      <0x54410000 0x8000>,
+			      <0x54420000 0x2000>,
+			      <0x54426000 0x2000>,
+			      <0x5442e000 0x31c>,
+			      <0x54432000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54428000 0x38>,
+			      <0x54430000 0x60>,
+			      <0x54432400 0x90>,
+			      <0x40320000 0x20000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt5: uio_pruss2_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54434000 0x3000>,
+			      <0x54422000 0x400>,
+			      <0x54422400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54438000 0x3000>,
+			      <0x54424000 0x400>,
+			      <0x54424400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_mem: uio_pruss1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54440000 0x1000>,
+			      <0x54442000 0x1000>,
+			      <0x54450000 0x8000>,
+			      <0x54460000 0x2000>,
+			      <0x54466000 0x2000>,
+			      <0x5446e000 0x31c>,
+			      <0x54472000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_mem2: uio_pruss1_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54468000 0x38>,
+			      <0x54470000 0x60>,
+			      <0x54472400 0x90>,
+			      <0x40302000 0x1e000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss1_evt0: uio_pruss1_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt1: uio_pruss1_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt2: uio_pruss1_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt3: uio_pruss1_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt4: uio_pruss1_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt5: uio_pruss1_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt6: uio_pruss1_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt7: uio_pruss1_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss1_0_mem: uio_pruss1_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54474000 0x1000>,
+			      <0x54462000 0x400>,
+			      <0x54462400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss1_1_mem: uio_pruss1_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x54478000 0x1000>,
+			      <0x54464000 0x400>,
+			      <0x54464400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&am43xx_pinmux {
+	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))           /* gpmc_clk.pr1_mdio_mdclk */
+			AM4372_IOPAD(0xa70, (PIN_INPUT  | MUX_MODE8))           /* xdma_event_intr0.pr1_mdio_data */
+			AM4372_IOPAD(0xa00, (PIN_INPUT_PULLUP | MUX_MODE7))     /* cam1_data6.gpio4_20 */
+			AM4372_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))   /* dss_data0.pr1_mii_mt0_clk */
+			AM4372_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data5.pr1_mii0_txd0 */
+			AM4372_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))   /* dss_data4.pr1_mii0_txd1 */
+			AM4372_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))   /* dss_data3.pr1_mii0_txd2 */
+			AM4372_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))   /* dss_data2.pr1_mii0_txd3 */
+			AM4372_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))   /* dss_data11.pr1_mii0_rxd0 */
+			AM4372_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))   /* dss_data10.pr1_mii0_rxd1 */
+			AM4372_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))   /* dss_data9.pr1_mii0_rxd2 */
+			AM4372_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))   /* dss_data8.pr1_mii0_rxd3 */
+			AM4372_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data1.pr1_mii0_txen */
+			AM4372_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))   /* dss_data14.pr1_mii_mr0_clk */
+			AM4372_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))   /* dss_data15.pr1_mii0_rxdv */
+			AM4372_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))   /* dss_data13.pr1_mii0_rxer */
+			AM4372_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))   /* dss_data12.pr1_mii0_rxlink */
+			AM4372_IOPAD(0xa40, (PIN_INPUT  | MUX_MODE5))   /* gpio5_10.pr1_mii0_crs */
+			AM4372_IOPAD(0xa38, (PIN_INPUT  | MUX_MODE5))   /* gpio5_8.pr1_mii0_col */
+			AM4372_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a6.pr1_mii_mt1_clk */
+			AM4372_IOPAD(0x854, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a5.pr1_mii1_txd0 */
+			AM4372_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a4.pr1_mii1_txd1 */
+			AM4372_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a3.pr1_mii1_txd2 */
+			AM4372_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a2.pr1_mii1_txd3 */
+			AM4372_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a11.pr1_mii1_rxd0 */
+			AM4372_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a10.pr1_mii1_rxd1 */
+			AM4372_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a9.pr1_mii1_rxd2 */
+			AM4372_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a8.pr1_mii1_rxd3 */
+			AM4372_IOPAD(0x840, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a0.pr1_mii1_txen */
+			AM4372_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a7.pr1_mii_mr1_clk */
+			AM4372_IOPAD(0x844, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a1.pr1_mii1_rxdv */
+			AM4372_IOPAD(0x874, (PIN_INPUT  | MUX_MODE5))   /* gpmc_wpn.pr1_mii1_rxer */
+			AM4372_IOPAD(0xa4c, (PIN_INPUT  | MUX_MODE5))   /* gpio5_13.pr1_mii1_rxlink */
+			AM4372_IOPAD(0xa44, (PIN_INPUT  | MUX_MODE5))   /* gpio5_11.pr1_mii1_crs */
+			AM4372_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))   /* gpmc_be1n.pr1_mii1_col */
+		>;
+	};
+};
+
+&uio_pruss2_mdio {
+	pinctrl-0 = <&uio_pruss2_mdio_eth_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
+
+	uio_pruss2_eth0_phy: uio_ethernet-phy@0 {
+		reg = <0>;
+	};
+
+	uio_pruss2_eth1_phy: uio_ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&pruss1 {
+	status = "disabled";
+};
+
+&pru1_0 {
+	status = "disabled";
+};
+
+&pru1_1 {
+	status = "disabled";
+};
+
+&pruss1_intc {
+	status = "disabled";
+};
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss0 {
+	status = "disabled";
+};
+
+&pru0_0 {
+	status = "disabled";
+};
+
+&pru0_1 {
+	status = "disabled";
+};
+
+&pruss0_intc {
+	status = "disabled";
+};
+
+&pruss1_emac0 {
+	status = "disabled";
+};
+
+&pruss1_emac1 {
+	status = "disabled";
+};
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 4615373..5c43637 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -3,6 +3,8 @@ SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
+SRC_URI_append_ti33x = " file://am335x-pru-uio.dtsi"
+SRC_URI_append_ti43x = " file://am437x-pru-uio.dtsi"
 
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
@@ -11,6 +13,8 @@ DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
 KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"
+KERNEL_DEVICETREE_append_ti33x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-excl-uio.dtb", "", d)}"
+KERNEL_DEVICETREE_append_ti43x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-excl-uio.dtb", "", d)}"
 
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
@@ -39,4 +43,28 @@ do_setup_uio_append_am57xx-evm() {
     fi
 }
 
+do_setup_uio_append_ti33x() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am335x-icev2-pru-excl-uio.dts"
+        dtsi="am335x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am335x-icev2.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
+do_setup_uio_append_ti43x() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am437x-idk-pru-excl-uio.dts"
+        dtsi="am437x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am437x-idk-evm.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 do_patch[postfuncs] += "do_setup_uio"
-- 
1.9.1


