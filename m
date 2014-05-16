Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E692E00BC6; Fri, 16 May 2014 12:22:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1655AE00BA1
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:22:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJMTN0021812
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:22:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJMTb8010401
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:22:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:22:29 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJMTfi020207;	Fri, 16 May 2014 14:22:29 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNi9-0006S4-8r; Fri, 16 May 2014
	15:22:29 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 May 2014 15:22:28 -0400
Message-ID: <1400268148-24770-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 3/3] keystone: k2e-evm config: add k2e-evm machine config
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
X-List-Received-Date: Fri, 16 May 2014 19:22:38 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Add a new k2e-evm machine config for Keystone II SoC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/{k2hk-evm.conf => k2e-evm.conf} |    8 ++++----
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 copy conf/machine/{k2hk-evm.conf => k2e-evm.conf} (79%)

diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2e-evm.conf
similarity index 79%
copy from conf/machine/k2hk-evm.conf
copy to conf/machine/k2e-evm.conf
index 2885335..551587f 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -1,12 +1,12 @@
 #@TYPE: Machine
-#@NAME: Keystone 2 machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2
+#@NAME: Keystone 2 K2E machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
 
 require conf/machine/include/keystone.inc
 
-UBOOT_MACHINE = "k2hk_evm_config"
+UBOOT_MACHINE = "k2e_evm_config"
 
-BOOT_MONITOR_MAKE_TARGET = "k2hk"
+BOOT_MONITOR_MAKE_TARGET = "k2e"
 
 IMAGE_FSTYPES += "ubi tar.gz cpio"
 
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 0761d83..b3aa806 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,7 @@ BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
 
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


