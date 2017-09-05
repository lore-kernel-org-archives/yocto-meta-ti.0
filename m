Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29C4FE00C09; Tue,  5 Sep 2017 15:13:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08EFAE00B77
	for <meta-ti@yoctoproject.org>; Tue,  5 Sep 2017 15:13:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85MDHS8021998
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 17:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504649597;
	bh=icD61qjG3frxRJ3vSZWFlkHYHMKEjaOqaS15rxW2isk=;
	h=From:To:CC:Subject:Date;
	b=JED1cjUv71GJd69rw1JGfobeS2EMxQZPQ4El9I2vLQxcTtGAEajUdKKTEMyeVJUOu
	wMEzboJhFDW+7sN7g5mmO5+Z/uxt9x1KTDZLddcM7JM+NhP4K3hMrvJs1dUYg2S5Vp
	UTykqBYjCA5mbJLcuw3h9kkVak1tu+VLrtZrB9No=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85MDC64014833
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 17:13:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 17:13:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 17:13:11 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85MDBrq023465;
	Tue, 5 Sep 2017 17:13:11 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Sep 2017 18:13:07 -0400
Message-ID: <1504649587-29636-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH] linux-ti-staging: include pru-uio device tree files for am571x and k2g
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
X-List-Received-Date: Tue, 05 Sep 2017 22:13:30 -0000
Content-Type: text/plain

* The pru-uio device tree file for am572x is also updated to support
  icss-emac-lld in Linux userspace.

* The new dtbs are added only if ENABLE_TI_UIO_DEVICES is enabled.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../linux/files/dra7xx/am571x-pru-uio.dtsi         | 284 +++++++++++++++
 .../linux/files/dra7xx/am572x-pru-uio.dtsi         | 263 ++++++++------
 .../linux/files/k2g/keystone-k2g-pru-uio.dtsi      | 391 +++++++++++++++++++++
 recipes-kernel/linux/ti-uio.inc                    |  26 +-
 4 files changed, 859 insertions(+), 105 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
 create mode 100644 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
new file mode 100644
index 0000000..71e0516
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/am571x-pru-uio.dtsi
@@ -0,0 +1,284 @@
+&pruss_soc_bus1 {
+                uio_pruss1_mdio {
+                        status = "okay";
+
+                        compatible = "ti,davinci_mdio";
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        clocks = <&dpll_gmac_h13x2_ck>;
+                        clock-names = "fck";
+                        bus_freq = <1000000>;
+                        reg = <0x4b232400 0x90>;
+
+                        reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+                        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
+                        uio_pruss1_eth0_phy: uio_ethernet-phy@0 {
+                            reg = <0>;
+                        };
+
+                        uio_pruss1_eth1_phy: uio_ethernet-phy@1 {
+                            reg = <1>;
+                         };
+                };
+
+		uio_pruss1_mem: uio_pruss1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b200000 0x2000>,
+			      <0x4b202000 0x2000>,
+			      <0x4b210000 0x8000>,
+			      <0x4b220000 0x5404>,
+			      <0x4b226000 0x474>,
+			      <0x4b22e000 0xc04>,
+			      <0x4b232000 0x154>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_mem2: uio_pruss1_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b228000 0xd4>,
+			      <0x4b230000 0x174>,
+			      <0x4b232400 0x234>,
+			      <0x40300000 0x40000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss1_evt0: uio_pruss1_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt1: uio_pruss1_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt2: uio_pruss1_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt3: uio_pruss1_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt4: uio_pruss1_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt5: uio_pruss1_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt6: uio_pruss1_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss1_evt7: uio_pruss1_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss1_0_mem: uio_pruss1_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b234000 0x3000>,
+			      <0x4b222000 0xb4>,
+			      <0x4b222400 0x3f4>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_1_mem: uio_pruss1_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b238000 0x3000>,
+			      <0x4b224000 0xb4>,
+			      <0x4b224400 0x3f4>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&pruss_soc_bus2 {
+                uio_pruss2_mdio {
+                        compatible = "ti,davinci_mdio";
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        clocks = <&dpll_gmac_h13x2_ck>;
+                        clock-names = "fck";
+                        bus_freq = <1000000>;
+                        reg = <0x4b2b2400 0x90>;
+                        status = "okay";
+
+                        reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+                        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
+
+                        uio_pruss2_eth0_phy: ethernet-phy@0 {
+                           reg = <0>;
+                        };
+
+                        uio_pruss2_eth1_phy: ethernet-phy@1 {
+                            reg = <1>;
+                         };
+                };
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b280000 0x2000>,
+			      <0x4b282000 0x2000>,
+			      <0x4b290000 0x8000>,
+			      <0x4b2a0000 0x5404>,
+			      <0x4b2a6000 0x474>,
+			      <0x4b2ae000 0xc04>,
+			      <0x4b2b2000 0x154>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2a8000 0xd4>,
+			      <0x4b2b0000 0x174>,
+			      <0x4b2b2400 0x234>,
+			      <0x40340000 0x40000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt5: uio_pruss2_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b4000 0x3000>,
+			      <0x4b2a2000 0xb4>,
+			      <0x4b2a2400 0x3f4>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b8000 0x3000>,
+			      <0x4b2a4000 0xb4>,
+			      <0x4b2a4400 0x3f4>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+	};
+
+&pruss1_eth {
+        status = "disabled";
+};
+
+&pruss1_emac0 {
+        status = "disabled";
+};
+
+&pruss1_emac1 {
+        status = "disabled";
+};
+
+&pruss2_emac0 {
+        status = "disabled";
+};
+
+&pruss2_emac1 {
+        status = "disabled";
+};
+
+&pruss1 {
+	status = "disabled";
+};
+
+&pru1_0 {
+        status = "disabled";
+};
+
+&pru1_1 {
+        status = "disabled";
+};
+
+&pruss1_intc {
+        status = "disabled";
+};
+
+&pruss1_mdio {
+        status = "disabled";
+};
+
+&pruss2 {
+	status = "disabled";
+};
+
+&pru2_0 {
+        status = "disabled";
+};
+
+&pru2_1 {
+        status = "disabled";
+};
+
+&pruss2_intc {
+        status = "disabled";
+};
+
+&pruss2_mdio {
+        status = "disabled";
+};
diff --git a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
index 828a0ce..f149cf1 100644
--- a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
@@ -1,92 +1,124 @@
-/ {
-	ocp {
-		pruss2_eth {
-		status = "disabled";
-		};
-		uio_pruss1_mem: uio_pruss1_mem {
-			compatible = "ti,uio-module-drv";
-			ti,hwmods = "pruss1";
-			mem = <0x4b200000 0x2000>,
-			      <0x4b202000 0x2000>,
-			      <0x4b210000 0x8000>,
-			      <0x4b220000 0x2000>,
-			      <0x4b226000 0x2000>,
-			      <0x4b22e000 0x31c>,
-			      <0x4b232000 0x58>;
-			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status = "okay";
-		};
-		uio_pruss1_mem2: uio_pruss1_mem2 {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b228000 0x38>,
-			      <0x4b230000 0x60>,
-			      <0x4b232400 0x90>;
-			mem-names = "uart", "ecap", "mdio";
-			status = "okay";
-		};
-		uio_pruss1_evt0: uio_pruss1_evt0 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt1: uio_pruss1_evt1 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 187 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt2: uio_pruss1_evt2 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt3: uio_pruss1_evt3 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt4: uio_pruss1_evt4 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt5: uio_pruss1_evt5 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt6: uio_pruss1_evt6 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 192 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
-		uio_pruss1_evt7: uio_pruss1_evt7 {
-			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-			status = "okay";
-		};
+&pruss_soc_bus1 {
+                uio_pruss1_mem: uio_pruss1_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b200000 0x2000>,
+                              <0x4b202000 0x2000>,
+                              <0x4b210000 0x8000>,
+                              <0x4b220000 0x2000>,
+                              <0x4b226000 0x2000>,
+                              <0x4b22e000 0x31c>,
+                              <0x4b232000 0x58>;
+                        mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+                                    "iep", "mii_rt";
+                        status = "okay";
+                };
+                uio_pruss1_mem2: uio_pruss1_mem2 {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b228000 0x38>,
+                              <0x4b230000 0x60>,
+                              <0x4b232400 0x90>,
+                              <0x40340000 0x40000>;
+                        mem-names = "uart", "ecap", "mdio", "ocmc";
+                        status = "okay";
+                };
+                uio_pruss1_evt0: uio_pruss1_evt0 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt1: uio_pruss1_evt1 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt2: uio_pruss1_evt2 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt3: uio_pruss1_evt3 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt4: uio_pruss1_evt4 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt5: uio_pruss1_evt5 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt6: uio_pruss1_evt6 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt7: uio_pruss1_evt7 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
 
-		uio_pruss1_0_mem: uio_pruss1_0_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b234000 0x3000>,
-			      <0x4b222000 0x400>,
-			      <0x4b222400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
+                uio_pruss1_0_mem: uio_pruss1_0_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b234000 0x3000>,
+                              <0x4b222000 0x400>,
+                              <0x4b222400 0x100>;
+                        mem-names = "iram", "control", "debug";
+                        status = "okay";
+                };
 
-		uio_pruss1_1_mem: uio_pruss1_1_mem {
-			compatible = "ti,uio-module-drv";
-			mem = <0x4b238000 0x3000>,
-			      <0x4b224000 0x400>,
-			      <0x4b224400 0x100>;
-			mem-names = "iram", "control", "debug";
-			status = "okay";
-		};
+                uio_pruss1_1_mem: uio_pruss1_1_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b238000 0x3000>,
+                              <0x4b224000 0x400>,
+                              <0x4b224400 0x100>;
+                        mem-names = "iram", "control", "debug";
+                        status = "okay";
+                };
+};
+
+&pruss1 {
+        status = "disabled";
+};
+
+&pru1_0 {
+        status = "disabled";
+};
+
+&pru1_1 {
+        status = "disabled";
+};
+
+&pruss1_intc {
+        status = "disabled";
+};
+
+&pruss_soc_bus2 {
+                uio_pruss2_mdio: uio_pruss2_mdio {
+                    compatible = "ti,davinci_mdio";
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    clocks = <&dpll_gmac_h13x2_ck>;
+                    clock-names = "fck";
+                    bus_freq = <1000000>;
+                    reg = <0x4b2b2400 0x90>;
+                    status = "disabled";
+                };
 
 		uio_pruss2_mem: uio_pruss2_mem {
 			compatible = "ti,uio-module-drv";
-			ti,hwmods = "pruss2";
 			mem = <0x4b280000 0x2000>,
 			      <0x4b282000 0x2000>,
 			      <0x4b290000 0x8000>,
@@ -102,48 +134,57 @@
 			compatible = "ti,uio-module-drv";
 			mem = <0x4b2a8000 0x38>,
 			      <0x4b2b0000 0x60>,
-			      <0x4b2b2400 0x90>;
-			mem-names = "uart", "ecap", "mdio";
+			      <0x4b2b2400 0x90>,
+			      <0x40300000 0x40000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
 			status = "okay";
 		};
 		uio_pruss2_evt0: uio_pruss2_evt0 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt1: uio_pruss2_evt1 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt2: uio_pruss2_evt2 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt3: uio_pruss2_evt3 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt4: uio_pruss2_evt4 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt5: uio_pruss2_evt5 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 201 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt6: uio_pruss2_evt6 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 202 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 		uio_pruss2_evt7: uio_pruss2_evt7 {
 			compatible = "ti,uio-module-drv";
-			interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
 			status = "okay";
 		};
 
@@ -163,23 +204,35 @@
 			mem-names = "iram", "control", "debug";
 			status = "okay";
 		};
-	};
 };
 
-&pruss1 {
-	status = "disabled";
+&uio_pruss2_mdio {
+        reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>,
+                      <&gpio5 9 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
 };
 
-&pru1_0 {
-	status = "disabled";
+&uio_pruss2_mdio {
+         status = "okay";
+         uio_pruss2_eth0_phy: uio_pruss2_eth0_phy@0 {
+             reg = <0>;
+         };
+
+         uio_pruss2_eth1_phy: uio_pruss2_eth1_phy@1 {
+              reg = <1>;
+          };
 };
 
-&pru1_1 {
-	status = "disabled";
+&pruss2_emac0 {
+        status = "disabled";
+};
+
+&pruss2_emac1 {
+        status = "disabled";
 };
 
 &pruss2 {
-	status = "disabled";
+        status = "disabled";
 };
 
 &pru2_0 {
@@ -190,6 +243,10 @@
 	status = "disabled";
 };
 
+&pruss2_intc {
+        status = "disabled";
+};
+
 &pruss2_mdio {
-	status = "disabled";
+        status = "disabled";
 };
diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
new file mode 100644
index 0000000..69955a4
--- /dev/null
+++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
@@ -0,0 +1,391 @@
+&pruss_soc_bus0 {
+		uio_pruss1_mdio: uio_mdio@20ab2400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x20ab2400 0x90>;
+			clocks = <&k2g_clks K2G_DEV_ICSS0 K2G_DEV_ICSS_CORE_CLK>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bus_freq = <2500000>;
+			status = "disabled";
+		};
+
+		uio_pruss1_mem: uio_pruss1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20a80000 0x2000>,
+			      <0x20a82000 0x2000>,
+			      <0x20a90000 0x10000>,
+			      <0x20aa0000 0x2000>,
+			      <0x20aa6000 0x2000>,
+			      <0x20aae000 0x31c>,
+			      <0x20ab2000 0x70>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_mem2: uio_pruss1_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20aa8000 0x38>,
+			      <0x20ab0000 0x60>,
+			      <0x20ab2400 0x90>,
+			      <0x0c080000 0xe000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss1_evt0: uio_pruss1_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 224 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt1: uio_pruss1_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 225 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt2: uio_pruss1_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 226 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt3: uio_pruss1_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 227 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt4: uio_pruss1_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 228 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt6: uio_pruss1_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 230 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt7: uio_pruss1_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 231 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+
+		uio_pruss1_0_mem: uio_pruss1_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ab4000 0x3000>,
+			      <0x20aa2000 0x400>,
+			      <0x20aa2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_1_mem: uio_pruss1_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ab8000 0x3000>,
+			      <0x20aa4000 0x400>,
+			      <0x20aa4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&pruss_soc_bus1 {
+		uio_pruss2_mdio: uio_mdio@20af2400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x20af2400 0x90>;
+			clocks = <&k2g_clks K2G_DEV_ICSS1 K2G_DEV_ICSS_CORE_CLK>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bus_freq = <2500000>;
+			status = "disabled";
+		};
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ac0000 0x2000>,
+			      <0x20ac2000 0x2000>,
+			      <0x20ad0000 0x10000>,
+			      <0x20ae0000 0x2000>,
+			      <0x20ae6000 0x2000>,
+			      <0x20aee000 0x31c>,
+			      <0x20af2000 0x70>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ae8000 0x38>,
+			      <0x20af0000 0x60>,
+			      <0x20af2400 0x90>,
+			      <0x0c08e000 0xe000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 232 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 233 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 234 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 235 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 236 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 238 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 239 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20af4000 0x3000>,
+			      <0x20ae2000 0x400>,
+			      <0x20ae2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20af8000 0x3000>,
+			      <0x20ae4000 0x400>,
+			      <0x20ae4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&k2g_pinctrl {
+	uio_pruss1_mdio_eth_default: uio_pruss1_mdio_eth_default {
+		pinctrl-single,pins = <
+                        K2G_CORE_IOPAD(0x12cc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)      /* pr0_mdio_data.pr0_mdio_data */
+                        K2G_CORE_IOPAD(0x12d0) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)      /* pr0_mdio_mdclk.pr0_mdio_mdclk */
+                        K2G_CORE_IOPAD(0x105c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_wait1.gpio0_23 (pr0_mii0_resetn) */
+                        K2G_CORE_IOPAD(0x1070) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_csn2.gpio0_28 (pr0_mii0_intn) */
+                        K2G_CORE_IOPAD(0x1054) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_be1n.gpio0_21 (pr0_mii1_resetn) */
+                        K2G_CORE_IOPAD(0x1074) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_csn3.gpio0_29 (pr0_mii1_intn) */
+
+                        /* PRUSS0 External Mux routing */
+                        K2G_CORE_IOPAD(0x11d4) (BUFFER_CLASS_B | MUX_MODE3)                     /* uart0_ctsn.gpio0_106 */
+                        K2G_CORE_IOPAD(0x11d8) (BUFFER_CLASS_B | MUX_MODE3)                     /* uart0_rtsn.gpio0_107 */
+                        K2G_CORE_IOPAD(0x11fc) (BUFFER_CLASS_B | MUX_MODE3)                     /* dcan0_rx.gpio1_57 */
+                        K2G_CORE_IOPAD(0x1200) (BUFFER_CLASS_B | MUX_MODE3)                     /* dcan0_tx.gpio1_56 */
+                        K2G_CORE_IOPAD(0x1224) (BUFFER_CLASS_B | MUX_MODE3)                     /* qspi_csn2.gpio1_66 */
+                        K2G_CORE_IOPAD(0x1228) (BUFFER_CLASS_B | MUX_MODE3)                     /* qspi_csn3.gpio1_67 */
+
+                        /* PRUSS0 PRU0 Ethernet */
+                        K2G_CORE_IOPAD(0x122c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo0.pr0_pru0_gpi0 (pr0_mii0_rxd0) */
+                        K2G_CORE_IOPAD(0x1230) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo1.pr0_pru0_gpi1 (pr0_mii0_rxd1) */
+                        K2G_CORE_IOPAD(0x1234) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo2.pr0_pru0_gpi2 (pr0_mii0_rxd2) */
+                        K2G_CORE_IOPAD(0x1238) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo3.pr0_pru0_gpi3 (pr0_mii0_rxd3) */
+                        K2G_CORE_IOPAD(0x123c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo4.pr0_pru0_gpi4 (pr0_mii0_rxdv) */
+                        K2G_CORE_IOPAD(0x1240) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo5.pr0_pru0_gpi5 (pr0_mii0_rxer) */
+                        K2G_CORE_IOPAD(0x1244) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo6.pr0_pru0_gpi6 (pr0_mii_mr0_clk) */
+
+                        K2G_CORE_IOPAD(0x124c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo8.pr0_pru0_gpi8 (pr0_mii0_rxlink) */
+                        K2G_CORE_IOPAD(0x1250) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo9.pr0_pru0_gpi9 (pr0_mii0_col) */
+                        K2G_CORE_IOPAD(0x1254) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo10.pr0_pru0_gpi10 (pr0_mii0_crs) */
+
+                        K2G_CORE_IOPAD(0x12a8) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo11.pr0_pru1_gpo11 (pr0_mii0_txd0) */
+                        K2G_CORE_IOPAD(0x12ac) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo12.pr0_pru1_gpo12 (pr0_mii0_txd1) */
+                        K2G_CORE_IOPAD(0x12b0) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo13.pr0_pru1_gpo13 (pr0_mii0_txd2) */
+                        K2G_CORE_IOPAD(0x12b4) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo14.pr0_pru1_gpo14 (pr0_mii0_txd3) */
+                        K2G_CORE_IOPAD(0x12b8) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo15.pr0_pru1_gpo15 (pr0_mii0_txen) */
+                        K2G_CORE_IOPAD(0x12bc) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo16.pr0_pru1_gpo16 (pr0_mii_mt0_clk) */
+
+                        /* PRUSS0 PRU1 Ethernet */
+                        K2G_CORE_IOPAD(0x127c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo0.pr0_pru1_gpi0 (pr0_mii1_rxd0) */
+                        K2G_CORE_IOPAD(0x1280) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo1.pr0_pru1_gpi1 (pr0_mii1_rxd1) */
+                        K2G_CORE_IOPAD(0x1284) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo2.pr0_pru1_gpi2 (pr0_mii1_rxd2) */
+                        K2G_CORE_IOPAD(0x1288) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo3.pr0_pru1_gpi3 (pr0_mii1_rxd3) */
+                        K2G_CORE_IOPAD(0x128c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo4.pr0_pru1_gpi4 (pr0_mii1_rxdv) */
+                        K2G_CORE_IOPAD(0x1290) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo5.pr0_pru1_gpi5 (pr0_mii1_rxer) */
+                        K2G_CORE_IOPAD(0x1294) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo6.pr0_pru1_gpi6 (pr0_mii_mr1_clk) */
+
+                        K2G_CORE_IOPAD(0x129c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo8.pr0_pru1_gpi8 (pr0_mii1_rxlink) */
+                        K2G_CORE_IOPAD(0x12a0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo9.pr0_pru1_gpi9 (pr0_mii1_col) */
+                        K2G_CORE_IOPAD(0x12a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo10.pr0_pru1_gpi10 (pr0_mii1_crs) */
+
+                        K2G_CORE_IOPAD(0x1258) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo11.pr0_pru0_gpo11 (pr0_mii1_txd0) */
+                        K2G_CORE_IOPAD(0x125c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo12.pr0_pru0_gpo12 (pr0_mii1_txd1) */
+                        K2G_CORE_IOPAD(0x1260) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo13.pr0_pru0_gpo13 (pr0_mii1_txd2) */
+                        K2G_CORE_IOPAD(0x1264) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo14.pr0_pru0_gpo14 (pr0_mii1_txd3) */
+                        K2G_CORE_IOPAD(0x1268) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo15.pr0_pru0_gpo15 (pr0_mii1_txen) */
+                        K2G_CORE_IOPAD(0x126c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo16.pr0_pru0_gpo16 (pr0_mii_mt1_clk) */
+		>;
+	};
+
+	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
+		pinctrl-single,pins = <
+                        K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)      /* pr1_mdio_data.pr1_mdio_data */
+                        K2G_CORE_IOPAD(0x1378) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)      /* pr1_mdio_mdclk.pr1_mdio_mdclk */
+                        K2G_CORE_IOPAD(0x1050) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_be0ncle.gpio0_20 (pr1_mii0_resetn) */
+                        K2G_CORE_IOPAD(0x1044) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_advnale.gpio0_17 (pr1_mii0_intn) */
+                        K2G_CORE_IOPAD(0x1060) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_wpn.gpio0_24 (pr1_mii1_resetn) */
+                        K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_wait0.gpio0_22 (pr1_mii1_intn) */
+
+                        /* PRUSS1 PRU0 Ethernet */
+                        K2G_CORE_IOPAD(0x12d4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo0.pr1_pru0_gpi0 (pr1_mii0_rxd0) */
+                        K2G_CORE_IOPAD(0x12d8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo1.pr1_pru0_gpi1 (pr1_mii0_rxd1) */
+                        K2G_CORE_IOPAD(0x12dc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo2.pr1_pru0_gpi2 (pr1_mii0_rxd2) */
+                        K2G_CORE_IOPAD(0x12e0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo3.pr1_pru0_gpi3 (pr1_mii0_rxd3) */
+                        K2G_CORE_IOPAD(0x12e4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo4.pr1_pru0_gpi4 (pr1_mii0_rxdv) */
+                        K2G_CORE_IOPAD(0x12e8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo5.pr1_pru0_gpi5 (pr1_mii0_rxer) */
+                        K2G_CORE_IOPAD(0x12ec) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo6.pr1_pru0_gpi6 (pr1_mii_mr0_clk) */
+
+                        K2G_CORE_IOPAD(0x12f4) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo8.pr1_pru0_gpi8 (pr1_mii0_rxlink) */
+                        K2G_CORE_IOPAD(0x12f8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo9.pr1_pru0_gpi9 (pr1_mii0_col) */
+                        K2G_CORE_IOPAD(0x12fc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo10.pr1_pru0_gpi10 (pr1_mii0_crs) */
+
+                        K2G_CORE_IOPAD(0x1350) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo11.pr1_pru1_gpo11 (pr1_mii0_txd0) */
+                        K2G_CORE_IOPAD(0x1354) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo12.pr1_pru1_gpo12 (pr1_mii0_txd1) */
+                        K2G_CORE_IOPAD(0x1358) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo13.pr1_pru1_gpo13 (pr1_mii0_txd2) */
+                        K2G_CORE_IOPAD(0x135c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo14.pr1_pru1_gpo14 (pr1_mii0_txd3) */
+                        K2G_CORE_IOPAD(0x1360) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo15.pr1_pru1_gpo15 (pr1_mii0_txen) */
+                        K2G_CORE_IOPAD(0x1364) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo16.pr1_pru1_gpo16 (pr1_mii_mt0_clk) */
+
+                        /* PRUSS1 PRU1 Ethernet */
+                        K2G_CORE_IOPAD(0x1324) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo0.pr1_pru1_gpi0 (pr1_mii1_rxd0) */
+                        K2G_CORE_IOPAD(0x132c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo2.pr1_pru1_gpi2 (pr1_mii1_rxd2) */
+                        K2G_CORE_IOPAD(0x1330) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo3.pr1_pru1_gpi3 (pr1_mii1_rxd3) */
+                        K2G_CORE_IOPAD(0x1334) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo4.pr1_pru1_gpi4 (pr1_mii1_rxdv) */
+                        K2G_CORE_IOPAD(0x1338) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo5.pr1_pru1_gpi5 (pr1_mii1_rxer) */
+                        K2G_CORE_IOPAD(0x133c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo6.pr1_pru1_gpi6 (pr1_mii_mr1_clk) */
+
+                        K2G_CORE_IOPAD(0x1344) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo8.pr1_pru1_gpi8 (pr1_mii1_rxlink) */
+                        K2G_CORE_IOPAD(0x1348) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo9.pr1_pru1_gpi9 (pr1_mii1_col) */
+                        K2G_CORE_IOPAD(0x134c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo10.pr1_pru1_gpi10 (pr1_mii1_crs) */
+
+                        K2G_CORE_IOPAD(0x1300) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo11.pr1_pru0_gpo11 (pr1_mii1_txd0) */
+                        K2G_CORE_IOPAD(0x1304) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo12.pr1_pru0_gpo12 (pr1_mii1_txd1) */
+                        K2G_CORE_IOPAD(0x1308) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo13.pr1_pru0_gpo13 (pr1_mii1_txd2) */
+                        K2G_CORE_IOPAD(0x130c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo14.pr1_pru0_gpo14 (pr1_mii1_txd3) */
+                        K2G_CORE_IOPAD(0x1310) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo15.pr1_pru0_gpo15 (pr1_mii1_txen) */
+                        K2G_CORE_IOPAD(0x1314) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo16.pr1_pru0_gpo16 (pr1_mii_mt1_clk) */
+		>;
+	};
+};
+
+&uio_pruss1_mdio {
+        status = "okay";
+        pinctrl-0 = <&uio_pruss1_mdio_eth_default>;
+        pinctrl-names = "default";
+        reset-gpios = <&gpio0 23 GPIO_ACTIVE_LOW>,
+                      <&gpio0 21 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <20>;
+
+        uio_pruss1_eth0_phy: uio-ethernet-phy@0 {
+                reg = <0>;
+        };
+
+        uio_pruss1_eth1_phy: uio-ethernet-phy@1 {
+                reg = <1>;
+        };
+};
+
+&uio_pruss2_mdio {
+        status = "okay";
+        pinctrl-0 = <&uio_pruss2_mdio_eth_default>;
+        pinctrl-names = "default";
+        reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>,
+                      <&gpio0 24 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <20>;
+
+        uio_pruss2_eth0_phy: uio-ethernet-phy@2 {
+                reg = <2>;
+        };
+
+        uio_pruss2_eth1_phy: uio-ethernet-phy@3 {
+                reg = <3>;
+        };
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
+&pruss0_mdio {
+	status = "disabled";
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
+&pruss0_emac0 {
+	status = "disabled";
+};
+
+&pruss0_emac1 {
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
index 5c43637..13cf53e 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -2,7 +2,10 @@ SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
-SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
+SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
+SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi \
+                              file://am571x-pru-uio.dtsi \
+"
 SRC_URI_append_ti33x = " file://am335x-pru-uio.dtsi"
 SRC_URI_append_ti43x = " file://am437x-pru-uio.dtsi"
 
@@ -12,9 +15,10 @@ DTSI_LIST_append_k2hk = " k2hk-uio.dtsi"
 DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
-KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"
+KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb", "", d)}"
 KERNEL_DEVICETREE_append_ti33x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-excl-uio.dtb", "", d)}"
 KERNEL_DEVICETREE_append_ti43x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-excl-uio.dtb", "", d)}"
+KERNEL_DEVICETREE_append_k2g = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " keystone-k2g-ice-pru-excl-uio.dtb", "", d)}"
 
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
@@ -40,6 +44,12 @@ do_setup_uio_append_am57xx-evm() {
         cp ${S}/arch/arm/boot/dts/am572x-idk.dts ${S}/arch/arm/boot/dts/$dts
         cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
         echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+
+        dts="am571x-idk-pru-excl-uio.dts"
+        dtsi="am571x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am571x-idk.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
     fi
 }
 
@@ -67,4 +77,16 @@ do_setup_uio_append_ti43x() {
     fi
 }
 
+do_setup_uio_append_k2g() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="keystone-k2g-ice-pru-excl-uio.dts"
+        dtsi="keystone-k2g-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/keystone-k2g-ice.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 do_patch[postfuncs] += "do_setup_uio"
-- 
1.9.1


