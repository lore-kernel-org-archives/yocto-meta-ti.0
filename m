Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2FBDE00C0A; Wed, 21 May 2014 12:32:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4980BE00BFD
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:32:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 025A252A3E; Wed, 21 May 2014 19:32:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521193219.025A252A3E@arago-project.org>
Date: Wed, 21 May 2014 19:32:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: machine config: change machine config name from keystone-evm to k2hk-evm
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
X-List-Received-Date: Wed, 21 May 2014 19:32:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 4be60cf6cf44ac270bf5a106d63830a03cba1d76
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4be60cf6cf44ac270bf5a106d63830a03cba1d76

Author: Hao Zhang <hzhang@ti.com>
Date:   Mon May 19 19:51:28 2014 +0000

keystone: machine config: change machine config name from keystone-evm to k2hk-evm

Keystone II SOC family has multiple devices and EVMs: k2hk, k2l
and k2e, each EVM should have a separate machine config, and share
the common keystone SOC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/{keystone-evm.conf => k2hk-evm.conf} |    4 ++--
 recipes-bsp/boot-monitor/boot-monitor_git.bb      |    2 +-
 recipes-kernel/linux/linux-keystone-rt_3.10.bb    |    2 +-
 recipes-kernel/linux/linux-keystone_3.10.bb       |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/k2hk-evm.conf
similarity index 86%
rename from conf/machine/keystone-evm.conf
rename to conf/machine/k2hk-evm.conf
index 088e524..4b05f40 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: Keystone 2 machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2
+#@NAME: Keystone 2 K2HK machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK EVM
 
 require conf/machine/include/keystone.inc
 
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 7c5e9cf..c3d41f5 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -9,7 +9,7 @@ BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
-COMPATIBLE_MACHINE = "keystone-evm"
+COMPATIBLE_MACHINE = "keystone"
 
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index cbd02d6..eb4bbd2 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 54cb86a..93b5481 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 


