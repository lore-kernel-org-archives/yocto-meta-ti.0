Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB155E00C69; Wed,  3 Feb 2016 18:07:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D6AFE00C65
	for <meta-ti@yoctoproject.org>; Wed,  3 Feb 2016 18:07:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8DA4752ABB; Thu,  4 Feb 2016 02:07:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160204020719.8DA4752ABB@arago-project.org>
Date: Thu,  4 Feb 2016 02:07:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux-ti-staging: Update to include uio device tree entries
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
X-List-Received-Date: Thu, 04 Feb 2016 02:07:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 48467358feb2f934296d07093fdb2e28b7149c9e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48467358feb2f934296d07093fdb2e28b7149c9e

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Feb  2 19:32:14 2016 +0000

linux-ti-staging: Update to include uio device tree entries

- Adds device tree entries for multiple devices that use uio driver
- These entries are added for k2h, k2l & k2e : keystone2 platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi    |   32 ++++
 recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi  |   58 ++++++
 recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi    |   10 +
 .../linux/files/keystone/keystone-uio.dtsi         |  186 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |    3 +-
 recipes-kernel/linux/ti-uio.inc                    |   27 +++
 6 files changed, 315 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
new file mode 100644
index 0000000..36f41b0
--- /dev/null
+++ b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
@@ -0,0 +1,32 @@
+/ {
+	soc {
+		uio_hyperlink0: hyperlink0 {
+			compatible = "ti,uio-ti-pdrv";
+			mem  = <0x21400000 0x00001000
+				0x40000000 0x10000000
+				0x0231a000 0x00002000>;
+			clocks = <&clkhyperlink0>;
+			interrupts	= <0 387 0x101>;
+			cfg-params
+			{
+				ti,serdes_refclk_khz = <312500>;
+				ti,serdes_maxserrate_khz = <6250000>;
+				ti,serdes_lanerate = "half";
+				ti,serdes_numlanes = <4>;
+				ti,serdes_c1 = <4 4 4 4>;
+				ti,serdes_c2 = <0 0 0 0>;
+				ti,serdes_cm = <0 0 0 0>;
+				ti,serdes_tx_att = <12 12 12 12>;
+				ti,serdes_tx_vreg = <4 4 4 4>;
+				ti,serdes_rx_att = <11 11 11 11>;
+				ti,serdes_rx_boost = <3 3 3 3>;
+			};
+		};
+		uio_srss: srss {
+			compatible = "ti,uio-ti-pdrv";
+			mem  = <0x02330000 0x0000400>;
+			clocks=<&clksr>;
+			interrupts = <0 0x173 0xf01>;
+		};
+	};
+};
diff --git a/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi b/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
new file mode 100644
index 0000000..cabe0b8
--- /dev/null
+++ b/recipes-kernel/linux/files/k2hk-evm/k2hk-uio.dtsi
@@ -0,0 +1,58 @@
+/ {
+	soc {
+		uio_hyperlink0: hyperlink0 {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x21400000 0x00001000
+				0x40000000 0x10000000
+				0x0231a000 0x00002000>;
+			clocks = <&clkhyperlink0>;
+			interrupts	= <0 387 0x101>;
+			cfg-params
+			{
+				ti,serdes_refclk_khz = <312500>;
+				ti,serdes_maxserrate_khz = <6250000>;
+				ti,serdes_lanerate = "half";
+				ti,serdes_numlanes = <4>;
+				ti,serdes_c1 = <4 4 4 4>;
+				ti,serdes_c2 = <0 0 0 0>;
+				ti,serdes_cm = <0 0 0 0>;
+				ti,serdes_tx_att = <12 12 12 12>;
+				ti,serdes_tx_vreg = <4 4 4 4>;
+				ti,serdes_rx_att = <11 11 11 11>;
+				ti,serdes_rx_boost = <3 3 3 3>;
+			};
+		};
+
+		uio_hyperlink1: hyperlink1 {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x21400000 0x00001000
+				0x28000000 0x08000000
+				0x0231c000 0x00002000>;
+			clocks = <&clkhyperlink1>;
+			interrupts	= <0 388 0x101>;
+			cfg-params
+			{
+				ti,serdes_refclk_khz = <312500>;
+				ti,serdes_maxserrate_khz = <6250000>;
+				ti,serdes_lanerate = "half";
+				ti,serdes_numlanes = <4>;
+				ti,serdes_c1 = <4 4 4 4>;
+				ti,serdes_c2 = <0 0 0 0>;
+				ti,serdes_cm = <0 0 0 0>;
+				ti,serdes_tx_att = <12 12 12 12>;
+				ti,serdes_tx_vreg = <4 4 4 4>;
+				ti,serdes_rx_att = <11 11 11 11>;
+				ti,serdes_rx_boost = <3 3 3 3>;
+			};
+		};
+
+		uio_srio: srio {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x0232C000 0x00002000
+				0x02900000 0x00040000
+				0x0232C000 0x00002000>;
+			clocks=<&clksrio>;
+			interrupts = <0 154 0xf01>;
+		};
+	};
+};
diff --git a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
new file mode 100644
index 0000000..0334483
--- /dev/null
+++ b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
@@ -0,0 +1,10 @@
+/ {
+	soc {
+		uio_srss: srss {
+			compatible = "ti,uio-ti-pdrv";
+			mem  = <0x02330000 0x0000400>;
+			clocks=<&clksr>;
+			interrupts = <0 0x173 0xf01>;
+		};
+	};
+};
diff --git a/recipes-kernel/linux/files/keystone/keystone-uio.dtsi b/recipes-kernel/linux/files/keystone/keystone-uio.dtsi
new file mode 100644
index 0000000..43b183d
--- /dev/null
+++ b/recipes-kernel/linux/files/keystone/keystone-uio.dtsi
@@ -0,0 +1,186 @@
+/ {
+	soc {
+		uio_mpax: mpax {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x00bc00000 0x00000a00>;
+		};
+
+		uio_edma3: edma3 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x02700000 0x000C0000>;
+		};
+		uio_secmgr: secmgr {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x002500100 0x00000004>;
+		};
+		uio_qmss: qmss {
+			compatible = "ti,uio-module-drv";
+			mem  = <0x02a00000 0x00100000
+				0x23a00000 0x00200000>;
+		};
+
+		uio_qpend0: qpend0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 44 0xf04>;
+			interrupt-mode = <1>; /* Interrupt mode oneshot */
+			cfg-params
+			{
+				ti,qm-queue = <662>;
+			};
+		};
+
+		uio_qpend1: qpend1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 45 0xf04>;
+			interrupt-mode = <1>; /* Interrupt mode oneshot */
+			cfg-params
+			{
+				ti,qm-queue = <663>;
+			};
+		};
+
+		uio_qpend2: qpend2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 46 0xf04>;
+			interrupt-mode = <1>; /* Interrupt mode oneshot */
+			cfg-params
+			{
+				ti,qm-queue = <664>;
+			};
+		};
+
+		uio_qpend3: qpend3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 47 0xf04>;
+			interrupt-mode = <1>; /* Interrupt mode oneshot */
+			cfg-params
+			{
+				ti,qm-queue = <665>;
+			};
+		};
+
+		/* The following uio cic2 entries allow access to interupt output
+		 * by the cic2 controller: The actual input event triggering the
+		 * interrupt is assumed to be programmed other drivers
+		 */
+		uio_cic2_out32: cic2_out32 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 451 0xf01>;
+		};
+
+		uio_cic2_out33: cic2_out33 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 452 0xf01>;
+		};
+
+		uio_cic2_out34: cic2_out34 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 453 0xf01>;
+		};
+
+		uio_cic2_out35: cic2_out35 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 454 0xf01>;
+		};
+
+		uio_cic2_out36: cic2_out36 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 455 0xf01>;
+		};
+
+		uio_cic2_out37: cic2_out37 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 456 0xf01>;
+		};
+
+		uio_cic2_out38: cic2_out38 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 457 0xf01>;
+		};
+
+		uio_cic2_out39: cic2_out39 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 458 0xf01>;
+		};
+
+		uio_cic2_out40: cic2_out40 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 459 0xf01>;
+		};
+
+		uio_cic2_out41: cic2_out41 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 460 0xf01>;
+		};
+
+		uio_cic2_out42: cic2_out42 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 461 0xf01>;
+		};
+
+		uio_cic2_out43: cic2_out43 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 462 0xf01>;
+		};
+
+		uio_cic2_out44: cic2_out44 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 463 0xf01>;
+		};
+
+		uio_cic2_out45: cic2_out45 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 464 0xf01>;
+		};
+
+		uio_cic2_out46: cic2_out46 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 465 0xf01>;
+		};
+
+		uio_cic2_out47: cic2_out47 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 466 0xf01>;
+		};
+
+		uio_cic2_out18: cic2_out18 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 467 0xf01>;
+		};
+
+		uio_cic2_out19: cic2_out19 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 468 0xf01>;
+		};
+
+		uio_cic2_out22: cic2_out22 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 469 0xf01>;
+		};
+
+		uio_cic2_out23: cic2_out23 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 470 0xf01>;
+		};
+
+		uio_cic2_out50: cic2_out50 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 471 0xf01>;
+		};
+
+		uio_cic2_out51: cic2_out51 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 472 0xf01>;
+		};
+
+		uio_cic2_out66: cic2_out66 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 473 0xf01>;
+		};
+
+		uio_cic2_out67: cic2_out67 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <0 474 0xf01>;
+		};
+	};
+};
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 7fe33ee..3bb2ac6 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -8,6 +8,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/cmem.inc
+require recipes-kernel/linux/ti-uio.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
@@ -68,7 +69,7 @@ SRCREV = "e4346cf990da13eb936de5e130d8a4baab5c5688"
 PV = "4.1.17+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
new file mode 100644
index 0000000..776e4a4
--- /dev/null
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -0,0 +1,27 @@
+SRC_URI_append_keystone = " file://keystone-uio.dtsi"
+SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
+SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
+SRC_URI_append_k2e-evm = " file://k2e-uio.dtsi"
+
+DTSI_LIST = ""
+DTSI_LIST_append_keystone = " keystone-uio.dtsi"
+DTSI_LIST_append_k2hk-evm = " k2hk-uio.dtsi"
+DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
+DTSI_LIST_append_k2e-evm = " k2e-uio.dtsi"
+
+do_setup_uio() {
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        for dtsi in ${DTSI_LIST}
+        do
+            cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+            for dtb in ${KERNEL_DEVICETREE}
+            do
+                dts=`echo $dtb | sed -e 's|dtb$|dts|'`
+                echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+            done
+        done
+    fi
+}
+
+do_patch[postfuncs] += "do_setup_uio"


