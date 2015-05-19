Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC23CE0051B; Tue, 19 May 2015 11:55:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F949E0027F
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 11:55:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JItW1H011994
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 13:55:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JItWhL017749
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 13:55:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 13:55:32 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4JItW9i003899;	Tue, 19 May 2015 13:55:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 May 2015 14:55:27 -0400
Message-ID: <1432061727-12437-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] linux/cmem.inc: Support reserving memory for CMEM.
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
X-List-Received-Date: Tue, 19 May 2015 18:55:39 -0000
Content-Type: text/plain

To reserve contiguous memory for CMEM:
* include the "recipes-kernel/linux/cmem.inc"
* Set CMEM_BASE and CMEM_SIZE to the physical memory address and size,
  respectively, to reserve for CMEM.

Currently limited to reserving a single memory region used to create
a single buffer pool of a single buffer.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Instead of prepending to do_compileconfigs(), create new function,
  and append to do_patch[postfuncs].
* Replace bashism with sed.

 recipes-kernel/linux/cmem.inc        |   23 +++++++++++++++++++++++
 recipes-kernel/linux/files/cmem.dtsi |   24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-kernel/linux/cmem.inc
 create mode 100644 recipes-kernel/linux/files/cmem.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
new file mode 100644
index 0000000..742f3c8
--- /dev/null
+++ b/recipes-kernel/linux/cmem.inc
@@ -0,0 +1,23 @@
+SRC_URI += "file://cmem.dtsi"
+
+CMEM_BASE ?= ""
+CMEM_SIZE ?= ""
+
+do_setup_cmem() {
+    if [ ! -z "${CMEM_BASE}" ]
+    then
+        cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
+
+        sed -i -e "s|__CMEM_BASE__|${CMEM_BASE}|g" \
+               -e "s|__CMEM_SIZE__|${CMEM_SIZE}|g" \
+               ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
+
+        for dtb in ${KERNEL_DEVICETREE}
+        do
+            dts=`echo $dtb | sed -e 's|dtb$|dts|'`
+            echo "#include \"${MACHINE}-cmem.dtsi\"" >> ${S}/arch/arm/boot/dts/$dts
+        done
+    fi
+}
+
+do_patch[postfuncs] += "do_setup_cmem"
diff --git a/recipes-kernel/linux/files/cmem.dtsi b/recipes-kernel/linux/files/cmem.dtsi
new file mode 100644
index 0000000..6b1da99
--- /dev/null
+++ b/recipes-kernel/linux/files/cmem.dtsi
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


