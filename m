Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E552E00B6C; Mon, 19 May 2014 06:51:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6968E00B66
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 06:51:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JDpUhx009910
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:31 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDpUgu024529
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 08:51:30 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JDpUCX005940;	Mon, 19 May 2014 08:51:30 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WmNyU-0005nH-8n; Mon, 19 May 2014
	09:51:30 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 09:51:28 -0400
Message-ID: <1400507488-22241-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: v2 1/3] keystone: machine config: change machine config name from keystone-evm to k2hk-evm
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
X-List-Received-Date: Mon, 19 May 2014 13:51:35 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Keystone II SOC family has multiple devices and EVMs: k2hk, k2l
and k2e, each EVM should have a separate machine config, and share
the common keystone SOC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/{keystone-evm.conf => k2hk-evm.conf} |    4 ++--
 recipes-bsp/boot-monitor/boot-monitor_git.bb      |    2 +-
 recipes-kernel/linux/linux-keystone-rt_3.10.bb    |    2 +-
 recipes-kernel/linux/linux-keystone_3.10.bb       |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename conf/machine/{keystone-evm.conf => k2hk-evm.conf} (86%)

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
 
-- 
1.7.9.5


