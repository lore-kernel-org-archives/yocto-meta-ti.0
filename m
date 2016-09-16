Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 703AAE00C9A; Fri, 16 Sep 2016 09:19:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FE68E00C7A
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0DD1552991; Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161906.0DD1552991@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: add new method for cmem injection
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0623707d8084b2856b74a1b40aa2dee361f6b933
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0623707d8084b2856b74a1b40aa2dee361f6b933

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Sep 14 00:21:17 2016 +0000

linux: add new method for cmem injection

* Add new method to perform CMEM DT injection as it is required to
  customize at a finer level than machine.
* Now CMEM injection can be performed per DT.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc                      |   78 +++++++++++++++++---
 recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi |   29 +++++++
 2 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index fc0bf48..b60909c 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -1,18 +1,72 @@
-SRC_URI += "file://cmem.dtsi"
+# Add concept of machine variants to split DTBs into subsets
+#
+# Use these for temporary overrides
+CMEM_MACHINE = "${MACHINE}"
+CMEM_MACHINE_am57xx-evm = "am571x am572x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x"
 
+# Set cmem.dtsi per machine or machine variant
+CMEM_DTSI = "cmem.dtsi"
+CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+
+# Split device trees between variants
+CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
+CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am572x-idk.dtb \
+                          am572x-idk-lcd-osd.dtb am572x-idk-lcd-osd101t2587.dtb"
+
+
+# Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
 
-do_setup_cmem() {
-    if [ "${RESERVE_CMEM}" == "1" ]
-    then
-        cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
-
-        for dtb in ${KERNEL_DEVICETREE}
-        do
-            dts=`echo $dtb | sed -e 's|dtb$|dts|'`
-            echo "#include \"${MACHINE}-cmem.dtsi\"" >> ${S}/arch/arm/boot/dts/$dts
-        done
-    fi
+# Add correct cmem.dtsi to SRC_URI for each variant for a given machine
+python() {
+    old_overrides = d.getVar('OVERRIDES', False)
+
+    # Initialize with empty string to simplify logic to append to SRC_URI
+    cmem_dtsi = set([''])
+
+    for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+        # Create copy of data for additional override
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
+        bb.data.update_data(localdata)
+
+        cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
+
+    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
+}
+
+python do_setup_cmem() {
+    import shutil
+
+    old_overrides = d.getVar('OVERRIDES', False)
+
+    if d.getVar('RESERVE_CMEM', True) is '1':
+        for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+            # Create copy of data for additional override
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
+            bb.data.update_data(localdata)
+
+            # Get source directory and dtsi filename
+            src_dir  = localdata.getVar('WORKDIR', True)
+            src_dtsi = localdata.getVar('CMEM_DTSI', True)
+
+            # Get destination directory and destination dtsi filename which adds
+            #   the MACHINE prefix.
+            dst_dir  = os.path.join(localdata.getVar('S', True), 'arch/arm/boot/dts')
+            dst_dtsi = localdata.expand('${MACHINE}-${CMEM_DTSI}')
+
+            # Copy cmem.dtsi into source tree
+            shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
+
+            # Inject dtsi into each dts in list
+            for dtb in (localdata.getVar('CMEM_DEVICETREE', True) or '').split():
+                dts = dtb[:-4] + '.dts'
+
+                with open(os.path.join(dst_dir,dts), 'a') as dts_file:
+                    dts_file.write('\n#include "%s"\n' % dst_dtsi)
 }
 
 do_patch[postfuncs] += "do_setup_cmem"
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
new file mode 100644
index 0000000..ebd6129
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
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


