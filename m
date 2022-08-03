Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CDFC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 20:00:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.166.1659556831319622027
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 13:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XkfQjDO1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 273K0S18019069;
	Wed, 3 Aug 2022 15:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659556828;
	bh=ILVaXChx1fP1f1tYL33bkAmy1g/EIC8qBOUOdVyJdyk=;
	h=From:To:CC:Subject:Date;
	b=XkfQjDO1j9D1a88Q0x2HZbmQSk6Ov4HMzD4ZzDgdY3o2f3QsNxq76DOJrgF+ZmW4j
	 Idx3XnyqGkFBHpH14Jgne9j9Nbx15ilFskvE3NE4Qqm7My0CBhd4SeZjgJSB1+L2K9
	 e8bPxAe9kO3Fjm8s6LdP19igYZiRU4VDQMTJvPpg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 273K0Sav094583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Aug 2022 15:00:28 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 3
 Aug 2022 15:00:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 3 Aug 2022 15:00:28 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 273K0PdL020302;
	Wed, 3 Aug 2022 15:00:26 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] cmem-mod: Remove CMEM kernel
 module
Date: Wed, 3 Aug 2022 15:00:25 -0500
Message-ID: <20220803200025.29681-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Aug 2022 20:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14920

CMEM has been deprecated for removal for some time now. All users should
have migrated to the Linux upstream DMA-BUF Heaps framework. Remove CMEM.

We only remove the kernel module part in this patch to prevent builds
from breaking in the meta-arago layer due to dependencies on the CMEM
library. These packages should either be updated or disabled. After
that we will remove the library.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb  | 18 ----
 meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb      |  2 -
 meta-ti-bsp/recipes-kernel/linux/cmem.inc     | 96 -------------------
 .../recipes-kernel/linux/files/cmem.dtsi      | 38 --------
 .../linux/files/dra7xx/cmem-am571x.dtsi       | 29 ------
 .../dra7xx/cmem-am5729-beagleboneai.dtsi      | 40 --------
 .../linux/files/dra7xx/cmem-am572idk.dtsi     | 40 --------
 .../linux/files/dra7xx/cmem-am574x.dtsi       | 40 --------
 .../linux/files/dra7xx/cmem-dra71x.dtsi       | 29 ------
 .../linux/files/dra7xx/cmem-dra72x.dtsi       | 29 ------
 .../linux/files/dra7xx/cmem-dra76x.dtsi       | 29 ------
 .../linux/files/dra7xx/cmem.dtsi              | 40 --------
 .../linux/linux-ti-staging_5.10.bb            |  1 -
 .../linux/linux-ti-staging_5.4.bb             |  1 -
 14 files changed, 432 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/cmem.inc
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb b/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
deleted file mode 100644
index ea2cc5f4..00000000
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
-
-include cmem.inc
-
-# This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR:append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-
-inherit module
-
-EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra"'
-MAKE_TARGETS = "module"
-
-KERNEL_MODULE_AUTOLOAD += "cmemk"
-
-do_install:prepend() {
-    cp ${B}/src/cmem/module/Module.symvers ${B}/ || true
-}
diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb b/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
index f69c22fb..2042b08a 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "The cmem component supports contiguous memory allocation from use
 
 include cmem.inc
 
-RDEPENDS:${PN} = "cmem-mod"
-
 PR = "r0"
 
 PACKAGES =+ "${PN}-test"
diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
deleted file mode 100644
index fd913f6c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
+++ /dev/null
@@ -1,96 +0,0 @@
-# Add concept of machine variants to split DTBs into subsets
-#
-# Use these for temporary overrides
-CMEM_MACHINE = "${MACHINE}"
-CMEM_MACHINE:am57xx-evm = "am571x am572x am572idk am5729-beagleboneai am574x"
-CMEM_MACHINE:am57xx-hs-evm = "am571x am572x am572idk am5729-beagleboneai am574x"
-CMEM_MACHINE:dra7xx-evm = "dra71x dra72x dra74x dra76x"
-CMEM_MACHINE:dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
-
-# Set cmem.dtsi per machine or machine variant
-CMEM_DTSI = "cmem.dtsi"
-CMEM_DTSI_am571x = "cmem-am571x.dtsi"
-CMEM_DTSI_am572idk = "cmem-am572idk.dtsi"
-CMEM_DTSI_am5729-beagleboneai = "cmem-am5729-beagleboneai.dtsi"
-CMEM_DTSI_am574x = "cmem-am574x.dtsi"
-CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
-CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
-CMEM_DTSI_dra76x = "cmem-dra76x.dtsi"
-
-# Split device trees between variants
-CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
-CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb"
-CMEM_DEVICETREE_am572idk = "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_am5729-beagleboneai = "am5729-beagleboneai.dtb"
-CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
-CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
-                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_dra76x = "dra76-evm.dtb dra76-evm-tfp410.dtb"
-
-# Flag to enable CMEM injection
-RESERVE_CMEM ?= "0"
-
-# Variables which influence setup_cmem
-CMEM_VARS  = "RESERVE_CMEM CMEM_MACHINE"
-CMEM_VARS += "CMEM_DTSI ${@' '.join(map(lambda s: 'CMEM_DTSI_' + s, (d.getVar('CMEM_MACHINE') or '').split()))}"
-CMEM_VARS += "CMEM_DEVICETREE ${@' '.join(map(lambda s: 'CMEM_DEVICETREE_' + s, (d.getVar('CMEM_MACHINE') or '').split()))}"
-
-# Add correct cmem.dtsi to SRC_URI for each variant for a given machine
-python do_unpack() {
-    old_overrides = d.getVar('OVERRIDES', False)
-
-    # Initialize with empty string to simplify logic to append to SRC_URI
-    cmem_dtsi = set([''])
-
-    for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
-        # Create copy of data for additional override
-        localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
-        bb.data.update_data(localdata)
-
-        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
-
-    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
-    bb.build.exec_func('base_do_unpack', d)
-}
-
-python do_setup_cmem() {
-    import shutil
-
-    old_overrides = d.getVar('OVERRIDES', False)
-
-    if d.getVar('RESERVE_CMEM') is '1':
-        for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
-            # Create copy of data for additional override
-            localdata = bb.data.createCopy(d)
-            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
-            bb.data.update_data(localdata)
-
-            # Get source directory and dtsi filename
-            src_dir  = localdata.getVar('WORKDIR')
-            src_dtsi = localdata.getVar('CMEM_DTSI')
-
-            # Get destination directory and destination dtsi filename which adds
-            #   the MACHINE prefix.
-            dst_dir  = os.path.join(localdata.getVar('S'), localdata.expand('arch/${ARCH}/boot/dts'))
-            dst_dtsi = localdata.expand('${MACHINE}-${CMEM_DTSI}')
-
-            # Copy cmem.dtsi into source tree
-            if localdata.getVar('ARCH') is 'arm64':
-                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,'ti',dst_dtsi))
-            else:
-                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
-
-            # Inject dtsi into each dts in list
-            for dtb in (localdata.getVar('CMEM_DEVICETREE') or '').split():
-                dts = dtb[:-4] + '.dts'
-
-                with open(os.path.join(dst_dir,dts), 'a') as dts_file:
-                    dts_file.write('\n#include "%s"\n' % dst_dtsi)
-}
-
-do_patch[postfuncs] += "do_setup_cmem"
-do_patch[vardeps] += "${CMEM_VARS}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi
deleted file mode 100644
index 23119861..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * This is a placeholder for CMEM reserved memory declarations. This
- * is simply an example and does not actually reserve any memory for
- * CMEM.
- *
- * The commented sections below provide an example for how to provide
- * a reserved memory region for CMEM to use as a buffer pool.
- */
-/ {
-/*
-	reserved-memory {
-		cmem_block_mem_0: cmem_block_mem@a0000000 {
-			reg = <0x0 0xa0000000 0x0 0x0a000000>;
-			no-map;
-			status = "okay";
-		};
-	};
-*/
-
-	cmem {
-		compatible = "ti,cmem";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-		status = "disabled";
-/*
-		status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0a000000>;
-                };
-*/
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
deleted file mode 100644
index e0511d08..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		cmem_block_mem_0: cmem_block_mem@a0000000 {
-			reg = <0x0 0xa0000000 0x0 0x18000000>;
-			no-map;
-			status = "okay";
-		};
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg = <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status = "okay";
-		};
-	};
-
-	cmem {
-		compatible = "ti,cmem";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-		status = "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg = <0>;
-			memory-region = <&cmem_block_mem_0>;
-			cmem-buf-pools = <1 0x0 0x18000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg = <1>;
-			memory-region = <&cmem_block_mem_1_ocmc3>;
-		};
-	};
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
deleted file mode 100644
index 6c39e22c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x20000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg = <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status = "okay";
-		};
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x20000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg = <1>;
-			memory-region = <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
deleted file mode 100644
index 8fb3e871..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x18000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg = <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status = "okay";
-		};
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x18000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg = <1>;
-			memory-region = <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
deleted file mode 100644
index 9d207db5..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x18000000>;
-                        no-map;
-                        status = "okay";
-                };
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x18000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi
deleted file mode 100644
index c7781c48..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg = <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status = "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg = <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status = "okay";
-		};
-        };
-
-        cmem {
-                compatible = "ti,cmem";
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-		#pool-size-cells = <2>;
-
-                status = "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg = <0>;
-                        memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x0 0x0c000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg = <1>;
-			memory-region = <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a0581cb4..69a31128 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -7,7 +7,6 @@ inherit kernel
 
 DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 9b2d1be1..62a12c59 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -7,7 +7,6 @@ inherit kernel
 
 DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
-- 
2.36.1


