Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9D9DE013DE
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 07:36:42 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8E78052A8E; Mon, 26 Aug 2013 14:36:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130826143633.8E78052A8E@arago-project.org>
Date: Mon, 26 Aug 2013 14:36:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am437x-evm: add machine config for Sitara AM437x EVM
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
X-List-Received-Date: Mon, 26 Aug 2013 14:36:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: e9e944715a109323c44ccff208e3451717e4ab15
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e9e944715a109323c44ccff208e3451717e4ab15

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 23 15:48:53 2013 -0400

am437x-evm: add machine config for Sitara AM437x EVM

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/am437x-evm.conf |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
new file mode 100644
index 0000000..901bfe8
--- /dev/null
+++ b/conf/machine/am437x-evm.conf
@@ -0,0 +1,35 @@
+#@TYPE: Machine
+#@NAME: AM437x EVM
+#@DESCRIPTION: Machine configuration for the TI AM437x EVM
+
+require conf/machine/include/ti43x.inc
+
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
+GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_FEATURES += "touchscreen"
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO0"
+
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
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"


