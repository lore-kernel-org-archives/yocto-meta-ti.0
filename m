Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3302E00D0E; Tue,  6 Dec 2016 16:47:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 693E6E00CF0
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2016 16:47:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B0E0952AD7; Wed,  7 Dec 2016 00:47:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161207004718.B0E0952AD7@arago-project.org>
Date: Wed,  7 Dec 2016 00:47:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : recipes-kernel: cmem.dtsi: Update memory sections for DDR and MSMC
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
X-List-Received-Date: Wed, 07 Dec 2016 00:47:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 102c4181a729eed48def0044369a3e9b685d3d75
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=102c4181a729eed48def0044369a3e9b685d3d75

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec  3 07:18:40 2016 +0000

recipes-kernel: cmem.dtsi: Update memory sections for DDR and MSMC

cmem.dtsi splits the already defined dsp_common_mpm_area DDR memory into
a smaller MPM segment and other CMEM blocks.
The mpm_block_mem is removed and instead the original memory sections
dsp_common_mpm_area and mpm_mem in the kernel dtb are updated to reflect

On the MSMC memory, cmem.dtsi defines a sram subnode instead of the
reserved memory.
mpm MSMC areas are already captured in the kernel dtb.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2e/cmem.dtsi      |   27 ++++----
 recipes-kernel/linux/files/k2g/cmem.dtsi      |   91 +++++++++++++------------
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi |   91 +++++++++++++------------
 recipes-kernel/linux/files/k2l-evm/cmem.dtsi  |   20 ++++--
 4 files changed, 120 insertions(+), 109 deletions(-)

diff --git a/recipes-kernel/linux/files/k2e/cmem.dtsi b/recipes-kernel/linux/files/k2e/cmem.dtsi
index 4c8e785..2a2909a 100644
--- a/recipes-kernel/linux/files/k2e/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2e/cmem.dtsi
@@ -1,22 +1,10 @@
 / {
 	reserved-memory {
-		mpm_block_mem_0: mpm_block_mem@820000000 {
-			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-			no-map;
-			status = "okay";
-		};
-
 		cmem_block_mem_0: cmem_block_mem@829000000 {
 			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
 			no-map;
 			status = "okay";
 		};
-
-		cmem_block_mem_1: cmem_block_mem@00c080000 {
-			reg = <0x00000000 0x0c080000 0x00000000 0x000c0000>;
-			no-map;
-			status = "okay";
-		};
 	};
 
 	cmem {
@@ -36,7 +24,20 @@
 
 		cmem_block_1: cmem_block@1 {
 			reg = <1>;
-			memory-region = <&cmem_block_mem_1>;
+			sram = <&sram_cmem>;
 		};
 	};
 };
+
+&dsp_common_mpm_area {
+	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+};
+&mpm_mem {
+	reg = <0xa0000000 0x02000000>;
+};
+
+&msm_ram {
+	sram_cmem: sram-cmem@80000 {
+		reg = <0x80000 0xc0000>;
+	};
+};
diff --git a/recipes-kernel/linux/files/k2g/cmem.dtsi b/recipes-kernel/linux/files/k2g/cmem.dtsi
index f30bf5b..4716581 100644
--- a/recipes-kernel/linux/files/k2g/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2g/cmem.dtsi
@@ -1,54 +1,55 @@
 / {
-        reserved-memory {
-                mpm_block_mem_0: mpm_block_mem@820000000 {
-                        reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_0: cmem_block_mem@829000000 {
-                        reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_1: cmem_block_mem@00c000000 {
-                        reg = <0x00000000 0x0c000000 0x00000000 0x00100000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_2: cmem_block_mem@822000000 {
-                        reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
+	reserved-memory {
+
+		cmem_block_mem_0: cmem_block_mem@829000000 {
+			reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_2: cmem_block_mem@822000000 {
+			reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		#pool-size-cells = <2>;
 
-                status = "okay";
+		status = "okay";
 
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x00000000 0x17000000>;
-                };
+		cmem_block_0: cmem_block@0 {
+			reg = <0>;
+			memory-region = <&cmem_block_mem_0>;
+			cmem-buf-pools = <1 0x00000000 0x17000000>;
+		};
 
-                cmem_block_1: cmem_block@1 {
-                        reg = <1>;
-                        memory-region = <&cmem_block_mem_1>;
-                };
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			sram = <&sram_cmem>;
+		};
 
-                cmem_block_2: cmem_block@2 {
-                        reg = <2>;
-                        memory-region = <&cmem_block_mem_2>;
-                };
-        };
+		cmem_block_2: cmem_block@2 {
+			reg = <2>;
+			memory-region = <&cmem_block_mem_2>;
+		 };
+	};
+};
+
+&dsp_common_mpm_area {
+	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+};
+&mpm_mem {
+	reg = <0xa0000000 0x02000000>;
+};
 
+&msm_ram {
+	sram_cmem: sram-cmem@a0000 {
+		reg = <0xa0000 0x57000>;
+	};
 };
diff --git a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
index 98e9e7c..e5927ba 100644
--- a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
@@ -1,54 +1,55 @@
 / {
-        reserved-memory {
-                mpm_block_mem_0: mpm_block_mem@820000000 {
-                        reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_0: cmem_block_mem@829000000 {
-                        reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_1: cmem_block_mem@00c100000 {
-                        reg = <0x00000000 0x0c100000 0x00000000 0x00480000>;
-                        no-map;
-                        status = "okay";
-                };
-
-                cmem_block_mem_2: cmem_block_mem@822000000 {
-                        reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
+	reserved-memory {
+
+		cmem_block_mem_0: cmem_block_mem@829000000 {
+			reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_2: cmem_block_mem@822000000 {
+			reg = <0x00000008 0x22000000 0x00000000 0x07000000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		#pool-size-cells = <2>;
 
-                status = "okay";
+		status = "okay";
 
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x00000000 0x17000000>;
-                };
+		cmem_block_0: cmem_block@0 {
+			reg = <0>;
+			memory-region = <&cmem_block_mem_0>;
+			cmem-buf-pools = <1 0x00000000 0x17000000>;
+		};
 
-                cmem_block_1: cmem_block@1 {
-                        reg = <1>;
-                        memory-region = <&cmem_block_mem_1>;
-                };
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			sram = <&sram_cmem>;
+		};
 
-                cmem_block_2: cmem_block@2 {
-                        reg = <2>;
-                        memory-region = <&cmem_block_mem_2>;
-                };
-        };
+		cmem_block_2: cmem_block@2 {
+			reg = <2>;
+			memory-region = <&cmem_block_mem_2>;
+		 };
+	};
+};
+
+&dsp_common_mpm_area {
+	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+};
+&mpm_mem {
+	reg = <0xa0000000 0x02000000>;
+};
 
+&msm_ram {
+	sram_cmem: sram-cmem@100000 {
+		reg = <0x100000 0x480000>;
+	};
 };
diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
index 4c8e785..8b09642 100644
--- a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
@@ -1,10 +1,5 @@
 / {
 	reserved-memory {
-		mpm_block_mem_0: mpm_block_mem@820000000 {
-			reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
-			no-map;
-			status = "okay";
-		};
 
 		cmem_block_mem_0: cmem_block_mem@829000000 {
 			reg = <0x00000008 0x22000000 0x00000000 0x1E000000>;
@@ -36,7 +31,20 @@
 
 		cmem_block_1: cmem_block@1 {
 			reg = <1>;
-			memory-region = <&cmem_block_mem_1>;
+			sram = <&sram_cmem>;
 		};
 	};
 };
+
+&dsp_common_mpm_area {
+	reg = <0x00000008 0x20000000 0x00000000 0x02000000>;
+};
+&mpm_mem {
+	reg = <0xa0000000 0x02000000>;
+};
+
+&msm_ram {
+	sram_cmem: sram-cmem@80000 {
+		reg = <0x80000 0xc0000>;
+	};
+};


