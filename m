Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEC2AE00D43; Wed, 18 May 2016 13:51:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 866C2E00D11
	for <meta-ti@yoctoproject.org>; Wed, 18 May 2016 13:51:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6882052AD1; Wed, 18 May 2016 20:51:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160518205155.6882052AD1@arago-project.org>
Date: Wed, 18 May 2016 20:51:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-ti-staging: Add new device tree target am572x-idk-pru-excl-uio.dtb
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
X-List-Received-Date: Wed, 18 May 2016 20:51:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 83d0ad1ba2381d6d61c3eb22cd38a0d711f95c10
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=83d0ad1ba2381d6d61c3eb22cd38a0d711f95c10

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue May 17 17:54:12 2016 +0000

linux-ti-staging: Add new device tree target am572x-idk-pru-excl-uio.dtb

This new device tree file is to support pruss with uio based drivers
alone.
Adds uio entries for pruss susbsystem and disables other drivers
controlling the same.
New dtb is added only if ENABLE_TI_UIO_DEVICES is enabled.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/files/dra7xx/am572x-pru-uio.dtsi         |  191 ++++++++++++++++++++
 recipes-kernel/linux/ti-uio.inc                    |   15 ++
 2 files changed, 206 insertions(+), 0 deletions(-)

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
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 776e4a4..f038bc8 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -2,6 +2,7 @@ SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e-evm = " file://k2e-uio.dtsi"
+SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
 
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
@@ -9,6 +10,8 @@ DTSI_LIST_append_k2hk-evm = " k2hk-uio.dtsi"
 DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e-evm = " k2e-uio.dtsi"
 
+KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"
+
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
     then
@@ -24,4 +27,16 @@ do_setup_uio() {
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


