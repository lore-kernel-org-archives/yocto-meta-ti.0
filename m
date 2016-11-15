Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DBA3E00C20; Tue, 15 Nov 2016 11:32:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26EB4E00C31
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 11:32:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1913452AAE; Tue, 15 Nov 2016 19:32:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161115193246.1913452AAE@arago-project.org>
Date: Tue, 15 Nov 2016 19:32:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cmem: add special handling for dra72x variant
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
X-List-Received-Date: Tue, 15 Nov 2016 19:32:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 108f5ee0ec9cd8336195f51632ee604ce0ba7307
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=108f5ee0ec9cd8336195f51632ee604ce0ba7307

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Nov 15 04:13:04 2016 +0000

cmem: add special handling for dra72x variant

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc                      |    7 ++++-
 recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi |   29 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index b60909c..d4edc60 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -4,17 +4,22 @@
 CMEM_MACHINE = "${MACHINE}"
 CMEM_MACHINE_am57xx-evm = "am571x am572x"
 CMEM_MACHINE_am57xx-hs-evm = "am571x am572x"
+CMEM_MACHINE_dra7xx-evm = "dra72x dra74x"
+CMEM_MACHINE_dra7xx-hs-evm = "dra72x dra74x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
 
 # Split device trees between variants
 CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
 CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am572x-idk.dtb \
                           am572x-idk-lcd-osd.dtb am572x-idk-lcd-osd101t2587.dtb"
-
+CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb \
+                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb"
 
 # Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
new file mode 100644
index 0000000..ebd6129
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
@@ -0,0 +1,29 @@
+/ {
+        reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                cmem_block_mem_0: cmem_block_mem@a0000000 {
+                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
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
+                        cmem-buf-pools = <1 0x0 0x0c000000>;
+                };
+        };
+};


