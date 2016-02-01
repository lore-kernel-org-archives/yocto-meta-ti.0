Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D382DE007F2; Mon,  1 Feb 2016 14:09:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A881E007F2
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 14:09:03 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1C340529E7; Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160201220903.1C340529E7@arago-project.org>
Date: Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: cmem: Update reserved CMEM regions
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
X-List-Received-Date: Mon, 01 Feb 2016 22:09:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 60f57fbf323127996735380c14d4b1bfa93eb986
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=60f57fbf323127996735380c14d4b1bfa93eb986

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Jan 29 03:20:50 2016 +0000

linux: cmem: Update reserved CMEM regions

* dra7xx:
  - Increase DDR region required to pass OpenCL conformance
  - Add OCMC region
* k2e-evm, k2l-evm:
  - Add reserved regions for these machines

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/dra7xx/cmem.dtsi  |   20 ++++++++++--
 recipes-kernel/linux/files/k2e-evm/cmem.dtsi |   42 ++++++++++++++++++++++++++
 recipes-kernel/linux/files/k2l-evm/cmem.dtsi |   42 ++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
index d91faf9..c7781c4 100644
--- a/recipes-kernel/linux/files/dra7xx/cmem.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/cmem.dtsi
@@ -1,10 +1,20 @@
 / {
         reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
                 cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x0a000000>;
+                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
                         no-map;
                         status = "okay";
                 };
+
+		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
+			reg = <0x0 0x40500000 0x0 0x100000>;
+			no-map;
+			status = "okay";
+		};
         };
 
         cmem {
@@ -19,8 +29,12 @@
                 cmem_block_0: cmem_block@0 {
                         reg = <0>;
                         memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0a000000>;
+                        cmem-buf-pools = <1 0x0 0x0c000000>;
                 };
-        };
 
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1_ocmc3>;
+		};
+        };
 };
diff --git a/recipes-kernel/linux/files/k2e-evm/cmem.dtsi b/recipes-kernel/linux/files/k2e-evm/cmem.dtsi
new file mode 100644
index 0000000..236b0ba
--- /dev/null
+++ b/recipes-kernel/linux/files/k2e-evm/cmem.dtsi
@@ -0,0 +1,42 @@
+/ {
+	reserved-memory {
+		mpm_block_mem_0: mpm_block_mem@820000000 {
+			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_0: cmem_block_mem@829000000 {
+			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_1: cmem_block_mem@00c100000 {
+			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+		status = "okay";
+
+		cmem_block_0: cmem_block@0 {
+			reg = <0>;
+			memory-region = <&cmem_block_mem_0>;
+			cmem-buf-pools = <1 0x00000000 0x1E000000>;
+		};
+
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1>;
+		};
+	};
+};
diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
new file mode 100644
index 0000000..236b0ba
--- /dev/null
+++ b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
@@ -0,0 +1,42 @@
+/ {
+	reserved-memory {
+		mpm_block_mem_0: mpm_block_mem@820000000 {
+			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_0: cmem_block_mem@829000000 {
+			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_1: cmem_block_mem@00c100000 {
+			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+		status = "okay";
+
+		cmem_block_0: cmem_block@0 {
+			reg = <0>;
+			memory-region = <&cmem_block_mem_0>;
+			cmem-buf-pools = <1 0x00000000 0x1E000000>;
+		};
+
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1>;
+		};
+	};
+};


