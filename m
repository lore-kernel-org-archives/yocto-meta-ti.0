Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2134E00C23; Wed, 21 May 2014 12:33:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB046E00B85
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:33:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A91EB52A0E; Wed, 21 May 2014 19:33:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521193333.A91EB52A0E@arago-project.org>
Date: Wed, 21 May 2014 19:33:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: k2e-evm config: add k2e-evm machine config
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
X-List-Received-Date: Wed, 21 May 2014 19:33:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 9c5900749c527639246baf2bee2b8cece80d6c68
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9c5900749c527639246baf2bee2b8cece80d6c68

Author: Hao Zhang <hzhang@ti.com>
Date:   Mon May 19 19:51:51 2014 +0000

keystone: k2e-evm config: add k2e-evm machine config

Add a new k2e-evm machine config for Keystone II SoC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2e-evm.conf |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

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


