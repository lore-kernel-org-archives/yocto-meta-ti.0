Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33D6AE00A5B; Fri,  7 Aug 2015 14:47:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CF07E00A6C
	for <meta-ti@yoctoproject.org>; Fri,  7 Aug 2015 14:47:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 62D8C52987; Fri,  7 Aug 2015 21:47:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150807214711.62D8C52987@arago-project.org>
Date: Fri,  7 Aug 2015 21:47:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging, keystone.inc: update, add keystone support to staging kernel
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
X-List-Received-Date: Fri, 07 Aug 2015 21:47:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 0223434735e1d3dc289379ef15c6ab0c1d75cb0e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0223434735e1d3dc289379ef15c6ab0c1d75cb0e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug  8 03:12:12 2015 +0000

linux-ti-staging, keystone.inc: update, add keystone support to staging kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc                  |    6 +++---
 .../linux-ti-staging-4.1/keystone/configs/systest  |    1 +
 .../linux/linux-ti-staging-4.1/keystone/defconfig  |    1 +
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   11 +++++++----
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 820fe12..7920447 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -4,14 +4,14 @@ require conf/machine/include/soc-family.inc
 DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r8"
+MACHINE_KERNEL_PR = "r9"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest
new file mode 100644
index 0000000..68cfc25
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig
new file mode 100644
index 0000000..470cf11
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 67fba2c..f912d57 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -38,20 +38,23 @@ KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
 KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
 KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-es.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
+KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-4.1.y"
+BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "583d3e9ad9f1610b3ac0c531b10fed1cad466b5c"
+SRCREV = "fcd02dfa3a0aeec916697c15ff7652e445733950"
 PV = "4.1.4+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


