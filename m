Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C72CEE00B30; Wed, 28 Oct 2015 07:36:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 588DDE007FE
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 07:36:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9SEa8BY006946
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 09:36:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9SEa8bR015275
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 09:36:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 28 Oct 2015 09:36:08 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9SEa8Nx022422;	Wed, 28 Oct 2015 09:36:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Oct 2015 10:36:06 -0400
Message-ID: <1446042966-13136-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] linux: cmem.inc: Implement way to configure more complex CMEM config
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
X-List-Received-Date: Wed, 28 Oct 2015 14:36:15 -0000
Content-Type: text/plain

* Supply the entire cmem.dtsi per machine
  - Disabled by default
  - Currently only supported for dra7xx and k2hk-evm
* Enable by setting RESERVE_CMEM = "1"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/cmem.inc                 |  9 +----
 recipes-kernel/linux/files/cmem.dtsi          | 16 +-------
 recipes-kernel/linux/files/dra7xx/cmem.dtsi   | 26 +++++++++++++
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi | 54 +++++++++++++++++++++++++++
 4 files changed, 84 insertions(+), 21 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem.dtsi
 create mode 100644 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi

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
index 6b1da99..8c62b06 100644
--- a/recipes-kernel/linux/files/cmem.dtsi
+++ b/recipes-kernel/linux/files/cmem.dtsi
@@ -1,24 +1,12 @@
 / {
-        reserved-memory {
-                cmem_block_mem_0: cmem_block_mem@__CMEM_BASE__ {
-                        reg = <0x__CMEM_BASE__ 0x__CMEM_SIZE__>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
         cmem {
                 compatible = "ti,cmem";
                 #address-cells = <1>;
                 #size-cells = <0>;
 
-                status = "okay";
+		#pool-size-cells = <1>;
 
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x__CMEM_SIZE__>;
-                };
+                status = "disabled";
         };
 
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
-- 
1.9.1


