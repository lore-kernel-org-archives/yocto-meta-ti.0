Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A70ECE013DF
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 22:57:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C718452A9A; Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330055709.C718452A9A@arago-project.org>
Date: Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES, use '+=' in assignment
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 05:57:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f02d5e79064f09100b430644a92fe7d2e1418bcd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f02d5e79064f09100b430644a92fe7d2e1418bcd

Author: Tom Rini <trini@ti.com>
Date:   Thu Mar 29 10:18:18 2012 -0700

am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES, use '+=' in assignment

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.  We also add
the required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
line that sets us to use the PSP kernel tree and reference the TI wiki
for the source of our info as well as dmesg / userland commands.

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index eedf072..e7ddd0b 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,12 +12,33 @@ GUI_MACHINE_CLASS = "smallscreen"
 
 require conf/machine/include/ti33x.inc
 
-IMAGE_FSTYPES ?= "tar.bz2"
+IMAGE_FSTYPES += "ubi tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1988"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 UBOOT_ARCH = "arm"


