Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3379AE00A71; Fri,  7 Aug 2015 14:12:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07139E00A5B
	for <meta-ti@yoctoproject.org>; Fri,  7 Aug 2015 14:12:36 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSQ00KBIDKCKG40@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 07 Aug 2015 16:12:17 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=58weLiRpcdHt3V6m1-kA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C7892161B47;	Fri,
	7 Aug 2015 17:12:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 07 Aug 2015 17:12:12 -0400
Message-id: <1438981932-12002-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido/master][PATCH] linux-ti-staging, keystone.inc: update, add keystone support to staging kernel
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
X-List-Received-Date: Fri, 07 Aug 2015 21:12:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc                             |  6 +++---
 .../linux/linux-ti-staging-4.1/keystone/configs/systest       |  1 +
 recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig  |  1 +
 recipes-kernel/linux/linux-ti-staging_4.1.bb                  | 11 +++++++----
 4 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig

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
-- 
2.2.0


