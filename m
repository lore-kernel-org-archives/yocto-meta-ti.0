Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF428C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.832.1667602020641868297
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9FA640D8C
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzrWqIe08iYe for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D612C40D8D
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7D4521636BB
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 50/50] cmem-mod: Remove CMEM kernel module
Date: Fri,  4 Nov 2022 22:46:52 +0000
Message-Id: <20221104224653.1223044-51-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15319

From: Andrew Davis <afd@ti.com>

CMEM has been deprecated for removal for some time now. All users should
have migrated to the Linux upstream DMA-BUF Heaps framework. Remove CMEM.

We only remove the kernel module part in this patch to prevent builds
from breaking in the meta-arago layer due to dependencies on the CMEM
library. These packages should either be updated or disabled. After
that we will remove the library.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
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
 13 files changed, 431 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/cmem.inc
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am=
571x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am=
5729-beagleboneai.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am=
572idk.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am=
574x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dr=
a71x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dr=
a72x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dr=
a76x.dtsi
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dt=
si

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb b/meta-ti-bsp/r=
ecipes-bsp/cmem/cmem-mod_git.bb
deleted file mode 100644
index ea2cc5f4..00000000
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "Kernel module for contiguous memory allocation from use=
rspace"
-
-include cmem.inc
-
-# This package builds a kernel module, use kernel PR as base and append =
a local
-MACHINE_KERNEL_PR:append =3D "a"
-PR =3D "${MACHINE_KERNEL_PR}"
-
-inherit module
-
-EXTRA_OEMAKE +=3D '-f lu.mak KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}=
" TOOLCHAIN_PREFIX=3D"${TOOLCHAIN_PREFIX}" EXEC_DIR=3D"${D}${nonarch_base=
_libdir}/modules/${KERNEL_VERSION}/extra"'
-MAKE_TARGETS =3D "module"
-
-KERNEL_MODULE_AUTOLOAD +=3D "cmemk"
-
-do_install:prepend() {
-    cp ${B}/src/cmem/module/Module.symvers ${B}/ || true
-}
diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb b/meta-ti-bsp/recip=
es-bsp/cmem/cmem_git.bb
index f69c22fb..2042b08a 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
@@ -2,8 +2,6 @@ DESCRIPTION =3D "The cmem component supports contiguous m=
emory allocation from use
=20
 include cmem.inc
=20
-RDEPENDS:${PN} =3D "cmem-mod"
-
 PR =3D "r0"
=20
 PACKAGES =3D+ "${PN}-test"
diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/reci=
pes-kernel/linux/cmem.inc
deleted file mode 100644
index fd913f6c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
+++ /dev/null
@@ -1,96 +0,0 @@
-# Add concept of machine variants to split DTBs into subsets
-#
-# Use these for temporary overrides
-CMEM_MACHINE =3D "${MACHINE}"
-CMEM_MACHINE:am57xx-evm =3D "am571x am572x am572idk am5729-beagleboneai =
am574x"
-CMEM_MACHINE:am57xx-hs-evm =3D "am571x am572x am572idk am5729-beaglebone=
ai am574x"
-CMEM_MACHINE:dra7xx-evm =3D "dra71x dra72x dra74x dra76x"
-CMEM_MACHINE:dra7xx-hs-evm =3D "dra71x dra72x dra74x dra76x"
-
-# Set cmem.dtsi per machine or machine variant
-CMEM_DTSI =3D "cmem.dtsi"
-CMEM_DTSI_am571x =3D "cmem-am571x.dtsi"
-CMEM_DTSI_am572idk =3D "cmem-am572idk.dtsi"
-CMEM_DTSI_am5729-beagleboneai =3D "cmem-am5729-beagleboneai.dtsi"
-CMEM_DTSI_am574x =3D "cmem-am574x.dtsi"
-CMEM_DTSI_dra71x =3D "cmem-dra71x.dtsi"
-CMEM_DTSI_dra72x =3D "cmem-dra72x.dtsi"
-CMEM_DTSI_dra76x =3D "cmem-dra76x.dtsi"
-
-# Split device trees between variants
-CMEM_DEVICETREE =3D "${KERNEL_DEVICETREE}"
-CMEM_DEVICETREE_am571x =3D "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dt=
b am571x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_am572x =3D "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc=
.dtb"
-CMEM_DEVICETREE_am572idk =3D "am572x-idk.dtb am572x-idk-lcd-osd101t2045.=
dtb am572x-idk-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_am5729-beagleboneai =3D "am5729-beagleboneai.dtb"
-CMEM_DEVICETREE_am574x =3D "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dt=
b"
-CMEM_DEVICETREE_dra71x =3D "dra71-evm.dtb"
-CMEM_DEVICETREE_dra72x =3D "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb =
dra72-evm-lcd-osd101t2587.dtb \
-                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2=
045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_dra74x =3D "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dr=
a7-evm-lcd-osd101t2587.dtb"
-CMEM_DEVICETREE_dra76x =3D "dra76-evm.dtb dra76-evm-tfp410.dtb"
-
-# Flag to enable CMEM injection
-RESERVE_CMEM ?=3D "0"
-
-# Variables which influence setup_cmem
-CMEM_VARS  =3D "RESERVE_CMEM CMEM_MACHINE"
-CMEM_VARS +=3D "CMEM_DTSI ${@' '.join(map(lambda s: 'CMEM_DTSI_' + s, (d=
.getVar('CMEM_MACHINE') or '').split()))}"
-CMEM_VARS +=3D "CMEM_DEVICETREE ${@' '.join(map(lambda s: 'CMEM_DEVICETR=
EE_' + s, (d.getVar('CMEM_MACHINE') or '').split()))}"
-
-# Add correct cmem.dtsi to SRC_URI for each variant for a given machine
-python do_unpack() {
-    old_overrides =3D d.getVar('OVERRIDES', False)
-
-    # Initialize with empty string to simplify logic to append to SRC_UR=
I
-    cmem_dtsi =3D set([''])
-
-    for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
-        # Create copy of data for additional override
-        localdata =3D bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overr=
ides))
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
-    old_overrides =3D d.getVar('OVERRIDES', False)
-
-    if d.getVar('RESERVE_CMEM') is '1':
-        for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
-            # Create copy of data for additional override
-            localdata =3D bb.data.createCopy(d)
-            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_o=
verrides))
-            bb.data.update_data(localdata)
-
-            # Get source directory and dtsi filename
-            src_dir  =3D localdata.getVar('WORKDIR')
-            src_dtsi =3D localdata.getVar('CMEM_DTSI')
-
-            # Get destination directory and destination dtsi filename wh=
ich adds
-            #   the MACHINE prefix.
-            dst_dir  =3D os.path.join(localdata.getVar('S'), localdata.e=
xpand('arch/${ARCH}/boot/dts'))
-            dst_dtsi =3D localdata.expand('${MACHINE}-${CMEM_DTSI}')
-
-            # Copy cmem.dtsi into source tree
-            if localdata.getVar('ARCH') is 'arm64':
-                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join=
(dst_dir,'ti',dst_dtsi))
-            else:
-                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join=
(dst_dir,dst_dtsi))
-
-            # Inject dtsi into each dts in list
-            for dtb in (localdata.getVar('CMEM_DEVICETREE') or '').split=
():
-                dts =3D dtb[:-4] + '.dts'
-
-                with open(os.path.join(dst_dir,dts), 'a') as dts_file:
-                    dts_file.write('\n#include "%s"\n' % dst_dtsi)
-}
-
-do_patch[postfuncs] +=3D "do_setup_cmem"
-do_patch[vardeps] +=3D "${CMEM_VARS}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/cmem.dtsi b/meta-ti-b=
sp/recipes-kernel/linux/files/cmem.dtsi
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
-			reg =3D <0x0 0xa0000000 0x0 0x0a000000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-*/
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "disabled";
-/*
-		status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x0a000000>;
-                };
-*/
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dt=
si b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am571x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-be=
agleboneai.dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am57=
29-beagleboneai.dtsi
deleted file mode 100644
index e0511d08..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am5729-beaglebon=
eai.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-	reserved-memory {
-		#address-cells =3D <2>;
-		#size-cells =3D <2>;
-		ranges;
-
-		cmem_block_mem_0: cmem_block_mem@a0000000 {
-			reg =3D <0x0 0xa0000000 0x0 0x18000000>;
-			no-map;
-			status =3D "okay";
-		};
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg =3D <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg =3D <0>;
-			memory-region =3D <&cmem_block_mem_0>;
-			cmem-buf-pools =3D <1 0x0 0x18000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			memory-region =3D <&cmem_block_mem_1_ocmc3>;
-		};
-	};
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.=
dtsi b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
deleted file mode 100644
index 6c39e22c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am572idk.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x20000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg =3D <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status =3D "okay";
-		};
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x20000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			memory-region =3D <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dt=
si b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
deleted file mode 100644
index 8fb3e871..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x18000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg =3D <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status =3D "okay";
-		};
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x18000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			memory-region =3D <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dt=
si b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra71x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dt=
si b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
deleted file mode 100644
index ebd61296..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra72x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x0c000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dt=
si b/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
deleted file mode 100644
index 9d207db5..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem-dra76x.dtsi
+++ /dev/null
@@ -1,29 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x18000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x18000000>;
-                };
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi b/me=
ta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi
deleted file mode 100644
index c7781c48..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/dra7xx/cmem.dtsi
+++ /dev/null
@@ -1,40 +0,0 @@
-/ {
-        reserved-memory {
-                #address-cells =3D <2>;
-                #size-cells =3D <2>;
-                ranges;
-
-                cmem_block_mem_0: cmem_block_mem@a0000000 {
-                        reg =3D <0x0 0xa0000000 0x0 0x0c000000>;
-                        no-map;
-                        status =3D "okay";
-                };
-
-		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
-			reg =3D <0x0 0x40500000 0x0 0x100000>;
-			no-map;
-			status =3D "okay";
-		};
-        };
-
-        cmem {
-                compatible =3D "ti,cmem";
-                #address-cells =3D <1>;
-                #size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-                status =3D "okay";
-
-                cmem_block_0: cmem_block@0 {
-                        reg =3D <0>;
-                        memory-region =3D <&cmem_block_mem_0>;
-                        cmem-buf-pools =3D <1 0x0 0x0c000000>;
-                };
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			memory-region =3D <&cmem_block_mem_1_ocmc3>;
-		};
-        };
-};
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index fdb34a84..a0af03c5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -7,7 +7,6 @@ inherit kernel
=20
 DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
--=20
2.25.1


