Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C6BAE00CC8; Tue,  1 Mar 2016 15:05:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59DACE00C9E
	for <meta-ti@yoctoproject.org>; Tue,  1 Mar 2016 15:05:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6597952A4F; Tue,  1 Mar 2016 23:05:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160301230515.6597952A4F@arago-project.org>
Date: Tue,  1 Mar 2016 23:05:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: cmem: k2g-evm: Add CMEM regions for k2g-evm
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
X-List-Received-Date: Tue, 01 Mar 2016 23:05:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3ceebfaf5f0828a173da66e48a5a562634e79470
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3ceebfaf5f0828a173da66e48a5a562634e79470

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Mar  1 20:59:56 2016 +0000

linux: cmem: k2g-evm: Add CMEM regions for k2g-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2g-evm/cmem.dtsi |   54 ++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/files/k2g-evm/cmem.dtsi b/recipes-kernel/linux/files/k2g-evm/cmem.dtsi
new file mode 100644
index 0000000..f30bf5b
--- /dev/null
+++ b/recipes-kernel/linux/files/k2g-evm/cmem.dtsi
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
+                        reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
+                        no-map;
+                        status = "okay";
+                };
+
+                cmem_block_mem_1: cmem_block_mem@00c000000 {
+                        reg = <0x00000000 0x0c000000 0x00000000 0x00100000>;
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
+                        cmem-buf-pools = <1 0x00000000 0x17000000>;
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


