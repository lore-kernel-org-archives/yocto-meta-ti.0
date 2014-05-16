Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 404E1E00BB7; Fri, 16 May 2014 12:15:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFB8EE00716
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:14:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJE8Rf017070
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:14:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJE8GW008417
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:14:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:14:07 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJE7C7009706;	Fri, 16 May 2014 14:14:07 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNa3-0006NW-JN; Fri, 16 May 2014
	15:14:07 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 May 2014 15:14:06 -0400
Message-ID: <1400267646-24486-1-git-send-email-hzhang@ti.com>
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
X-List-Received-Date: Fri, 16 May 2014 19:15:22 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Add a new k2e-evm machine config for Keystone II SoC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/k2e-evm.conf                    |   30 ++++++++++++++++++++++++++
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 conf/machine/k2e-evm.conf

diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
new file mode 100644
index 0000000..551587f
--- /dev/null
+++ b/conf/machine/k2e-evm.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2E machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
+
+require conf/machine/include/keystone.inc
+
+UBOOT_MACHINE = "k2e_evm_config"
+
+BOOT_MONITOR_MAKE_TARGET = "k2e"
+
+IMAGE_FSTYPES += "ubi tar.gz cpio"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+SYSVINIT_ENABLED_GETTYS = ""
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 3856 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              2048
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
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


