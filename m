Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28981E009BC; Thu, 23 Apr 2015 04:42:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC854E00998
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 04:42:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NBgI51022047
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NBgHvt020444
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 06:42:17 -0500
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3NBgFsl012904;	Thu, 23 Apr 2015 06:42:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Apr 2015 07:42:10 -0400
Message-ID: <1429789331-18918-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 1/2] linux/cmem.inc: Support reserving memory for CMEM.
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
X-List-Received-Date: Thu, 23 Apr 2015 11:42:22 -0000
Content-Type: text/plain

To reserve contiguous memory for CMEM:
* include the "recipes-kernel/linux/cmem.inc"
* Set CMEM_BASE and CMEM_SIZE to the physical memory address and size,
  respectively, to reserve for CMEM.

Currently limited to reserving a single memory region used to create
a single buffer pool of a single buffer.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/cmem.inc        |   22 ++++++++++++++++++++++
 recipes-kernel/linux/linux/cmem.dtsi |   24 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-kernel/linux/cmem.inc
 create mode 100644 recipes-kernel/linux/linux/cmem.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
new file mode 100644
index 0000000..c23445a
--- /dev/null
+++ b/recipes-kernel/linux/cmem.inc
@@ -0,0 +1,22 @@
+FILESEXTRAPATHS_append = ":${THISDIR}/linux"
+
+SRC_URI += "file://cmem.dtsi"
+
+CMEM_BASE ?= ""
+CMEM_SIZE ?= ""
+
+do_compileconfigs_prepend() {
+    if [ ! -z "${CMEM_BASE}" ]
+    then
+        cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
+
+        sed -i -e "s|__CMEM_BASE__|${CMEM_BASE}|g" \
+               -e "s|__CMEM_SIZE__|${CMEM_SIZE}|g" \
+               ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
+
+        for dts in ${KERNEL_DEVICETREE}
+        do
+            echo "#include \"${MACHINE}-cmem.dtsi\"" >> ${S}/arch/arm/boot/dts/${dts%.dtb}.dts
+        done
+    fi
+}
diff --git a/recipes-kernel/linux/linux/cmem.dtsi b/recipes-kernel/linux/linux/cmem.dtsi
new file mode 100644
index 0000000..6b1da99
--- /dev/null
+++ b/recipes-kernel/linux/linux/cmem.dtsi
@@ -0,0 +1,24 @@
+/ {
+        reserved-memory {
+                cmem_block_mem_0: cmem_block_mem@__CMEM_BASE__ {
+                        reg = <0x__CMEM_BASE__ 0x__CMEM_SIZE__>;
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
+                status = "okay";
+
+                cmem_block_0: cmem_block@0 {
+                        reg = <0>;
+                        memory-region = <&cmem_block_mem_0>;
+                        cmem-buf-pools = <1 0x__CMEM_SIZE__>;
+                };
+        };
+
+};
-- 
1.7.9.5


