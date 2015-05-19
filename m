Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C264E0027F; Tue, 19 May 2015 12:31:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B69B3E004F6
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 12:31:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AED0452A31; Tue, 19 May 2015 19:31:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150519193138.AED0452A31@arago-project.org>
Date: Tue, 19 May 2015 19:31:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux/cmem.inc: Support reserving memory for CMEM.
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
X-List-Received-Date: Tue, 19 May 2015 19:31:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: a6afbc2e89febdcd66a3fd9eda8bc3e5987f740d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a6afbc2e89febdcd66a3fd9eda8bc3e5987f740d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 00:55:27 2015 +0000

linux/cmem.inc: Support reserving memory for CMEM.

To reserve contiguous memory for CMEM:
* include the "recipes-kernel/linux/cmem.inc"
* Set CMEM_BASE and CMEM_SIZE to the physical memory address and size,
  respectively, to reserve for CMEM.

Currently limited to reserving a single memory region used to create
a single buffer pool of a single buffer.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc        |   23 +++++++++++++++++++++++
 recipes-kernel/linux/files/cmem.dtsi |   24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)

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


