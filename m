Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2894E00A26; Thu, 29 Oct 2015 12:40:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DC34E00985
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 12:40:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DF2D752A5A; Thu, 29 Oct 2015 19:40:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151029194042.DF2D752A5A@arago-project.org>
Date: Thu, 29 Oct 2015 19:40:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: cmem.inc: Implement way to configure more complex CMEM config
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
X-List-Received-Date: Thu, 29 Oct 2015 19:40:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1010d17019ba97d96edfab9f416818cd1b070ee5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1010d17019ba97d96edfab9f416818cd1b070ee5

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Oct 29 18:06:06 2015 +0000

linux: cmem.inc: Implement way to configure more complex CMEM config

* Supply the entire cmem.dtsi per machine
  - Disabled by default
  - Currently only supported for dra7xx and k2hk-evm
* Enable by setting RESERVE_CMEM = "1"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc                 |    9 +---
 recipes-kernel/linux/files/cmem.dtsi          |   42 +++++++++++++------
 recipes-kernel/linux/files/dra7xx/cmem.dtsi   |   26 ++++++++++++
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi |   54 +++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 21 deletions(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 742f3c8..fc0bf48 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -1,17 +1,12 @@
 SRC_URI += "file://cmem.dtsi"
 
-CMEM_BASE ?= ""
-CMEM_SIZE ?= ""
+RESERVE_CMEM ?= "0"
 
 do_setup_cmem() {
-    if [ ! -z "${CMEM_BASE}" ]
+    if [ "${RESERVE_CMEM}" == "1" ]
     then
         cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
 
-        sed -i -e "s|__CMEM_BASE__|${CMEM_BASE}|g" \
-               -e "s|__CMEM_SIZE__|${CMEM_SIZE}|g" \
-               ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
-
         for dtb in ${KERNEL_DEVICETREE}
         do
             dts=`echo $dtb | sed -e 's|dtb$|dts|'`
diff --git a/recipes-kernel/linux/files/cmem.dtsi b/recipes-kernel/linux/files/cmem.dtsi
index 6b1da99..2311986 100644
--- a/recipes-kernel/linux/files/cmem.dtsi
+++ b/recipes-kernel/linux/files/cmem.dtsi
@@ -1,24 +1,38 @@
+/*
+ * This is a placeholder for CMEM reserved memory declarations. This
+ * is simply an example and does not actually reserve any memory for
+ * CMEM.
+ *
+ * The commented sections below provide an example for how to provide
+ * a reserved memory region for CMEM to use as a buffer pool.
+ */
 / {
-        reserved-memory {
-                cmem_block_mem_0: cmem_block_mem@__CMEM_BASE__ {
-                        reg = <0x__CMEM_BASE__ 0x__CMEM_SIZE__>;
-                        no-map;
-                        status = "okay";
-                };
-        };
+/*
+	reserved-memory {
+		cmem_block_mem_0: cmem_block_mem@a0000000 {
+			reg = <0x0 0xa0000000 0x0 0x0a000000>;
+			no-map;
+			status = "okay";
+		};
+	};
+*/
 
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-                status = "okay";
+		#pool-size-cells = <2>;
+
+		status = "disabled";
+/*
+		status = "okay";
 
                 cmem_block_0: cmem_block@0 {
                         reg = <0>;
                         memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x__CMEM_SIZE__>;
+                        cmem-buf-pools = <1 0x0 0x0a000000>;
                 };
+*/
         };
-
 };
diff --git a/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
new file mode 100644
index 0000000..d91faf9
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
@@ -0,0 +1,26 @@
+/ {
+        reserved-memory {
+                cmem_block_mem_0: cmem_block_mem@a0000000 {
+                        reg = <0x0 0xa0000000 0x0 0x0a000000>;
+                        no-map;
+                        status = "okay";
+                };
+        };
+
+        cmem {
+                compatible = "ti,cmem";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+                status = "okay";
+
+                cmem_block_0: cmem_block@0 {
+                        reg = <0>;
+                        memory-region = <&cmem_block_mem_0>;
+                        cmem-buf-pools = <1 0x0 0x0a000000>;
+                };
+        };
+
+};
diff --git a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
new file mode 100644
index 0000000..7e897ab
--- /dev/null
+++ b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
@@ -0,0 +1,54 @@
+/ {
+        reserved-memory {
+                mpm_block_mem_0: mpm_block_mem@820000000 {
+                        reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+                        no-map;
+                        status = "okay";
+                };
+
+                cmem_block_mem_0: cmem_block_mem@829000000 {
+                        reg = <0x00000008 0x29000000 0x00000000 0x57000000>;
+                        no-map;
+                        status = "okay";
+                };
+
+                cmem_block_mem_1: cmem_block_mem@00c100000 {
+                        reg = <0x00000000 0x0c100000 0x00000000 0x00480000>;
+                        no-map;
+                        status = "okay";
+                };
+
+                cmem_block_mem_2: cmem_block_mem@822000000 {
+                        reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
+                        no-map;
+                        status = "okay";
+                };
+        };
+
+        cmem {
+                compatible = "ti,cmem";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+                status = "okay";
+
+                cmem_block_0: cmem_block@0 {
+                        reg = <0>;
+                        memory-region = <&cmem_block_mem_0>;
+                        cmem-buf-pools = <1 0x00000000 0x57000000>;
+                };
+
+                cmem_block_1: cmem_block@1 {
+                        reg = <1>;
+                        memory-region = <&cmem_block_mem_1>;
+                };
+
+                cmem_block_2: cmem_block@2 {
+                        reg = <2>;
+                        memory-region = <&cmem_block_mem_2>;
+                };
+        };
+
+};


