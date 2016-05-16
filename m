Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54219E00BF8; Mon, 16 May 2016 15:54:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E33B7E00B1E
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 15:54:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4GMsYbv025002
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 17:54:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GMsYvM028252
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 17:54:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 May 2016 17:54:33 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4GMsXDe019961;	Mon, 16 May 2016 17:54:33 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 May 2016 18:54:32 -0400
Message-ID: <1463439272-29074-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] linux-ti-staging: Add new device tree target am572x-idk-pru-excl-uio.dtb
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
X-List-Received-Date: Mon, 16 May 2016 22:54:39 -0000
Content-Type: text/plain

This new device tree file is to support pruss with uio based drivers
alone.
Adds uio entries for pruss susbsystem and disables other drivers
controlling the same.
New dtb is added only if ENABLE_TI_UIO_DEVICES is enabled.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Modified recipe to new dtb, only if ENABLE_TI_UIO_DEVICES defined
- Modified dtsi to make the uio interrupts edge triggerred
- Updated comments
---
---
 .../linux/files/dra7xx/am572x-pru-uio.dtsi         | 191 +++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |   2 +
 recipes-kernel/linux/ti-uio.inc                    |  13 ++
 3 files changed, 206 insertions(+)
 create mode 100644 recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
new file mode 100644
index 0000000..577603a
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
@@ -0,0 +1,191 @@
+/ {
+	ocp {
+		pruss2_eth {
+		status = "disabled";
+		};
+		uio_pruss1_mem: uio_pruss1_mem {
+			compatible = "ti,uio-module-drv";
+			ti,hwmods = "pruss1";
+			mem = <0x4b200000 0x2000>,
+			      <0x4b202000 0x2000>,
+			      <0x4b210000 0x8000>,
+			      <0x4b220000 0x2000>,
+			      <0x4b226000 0x2000>,
+			      <0x4b22e000 0x31c>,
+			      <0x4b232000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_evt0: uio_pruss1_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt1: uio_pruss1_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 187 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt2: uio_pruss1_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt3: uio_pruss1_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt4: uio_pruss1_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt5: uio_pruss1_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt6: uio_pruss1_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 192 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss1_evt7: uio_pruss1_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+
+		uio_pruss1_0_mem: uio_pruss1_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b234000 0x3000>,
+			      <0x4b222000 0x400>,
+			      <0x4b222400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_1_mem: uio_pruss1_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b238000 0x3000>,
+			      <0x4b224000 0x400>,
+			      <0x4b224400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_mdio: uio_pruss1_mdio {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b232400 0x90>;
+			status = "okay";
+		};
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			ti,hwmods = "pruss2";
+			mem = <0x4b280000 0x2000>,
+			      <0x4b282000 0x2000>,
+			      <0x4b290000 0x8000>,
+			      <0x4b2a0000 0x2000>,
+			      <0x4b2a6000 0x2000>,
+			      <0x4b2ae000 0x31c>,
+			      <0x4b2b2000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt5: uio_pruss2_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 201 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 202 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b4000 0x3000>,
+			      <0x4b2a2000 0x400>,
+			      <0x4b2a2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b8000 0x3000>,
+			      <0x4b2a4000 0x400>,
+			      <0x4b2a4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_mdio: uio_pruss2_mdio {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b2400 0x90>;
+			mem-names = "mdio";
+			status = "okay";
+		};
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
+&pruss2 {
+	status = "disabled";
+};
+
+&pru2_0 {
+	status = "disabled";
+};
+
+&pru2_1 {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index e7d5503..db3db9c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -63,6 +63,8 @@ KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
+KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"
+
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 776e4a4..8dcee72 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -2,6 +2,7 @@ SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e-evm = " file://k2e-uio.dtsi"
+SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
 
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
@@ -24,4 +25,16 @@ do_setup_uio() {
     fi
 }
 
+do_setup_uio_append_am57xx-evm() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am572x-idk-pru-excl-uio.dts"
+        dtsi="am572x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am572x-idk.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 do_patch[postfuncs] += "do_setup_uio"
-- 
1.9.1


