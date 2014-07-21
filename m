Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37FE7E00572; Mon, 21 Jul 2014 06:47:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D26C7E002AA
	for <meta-ti@yoctoproject.org>; Mon, 21 Jul 2014 06:47:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 057E431604D3;
	Mon, 21 Jul 2014 15:46:55 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: meta-ti@yoctoproject.org
Date: Mon, 21 Jul 2014 15:46:48 +0200
Message-Id: <1405950408-31691-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2] wic: wks and source plugin for build SD card image
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
X-List-Received-Date: Mon, 21 Jul 2014 13:47:13 -0000

Commit 2b524321a25c35c5f987b8331e41b49d3b2e2d2b removed bbclass for
building SD card images in favor of using wic. This commit adds a mic
source plugin that prepares a useable boot partition as part of wic's
image creation process. The plugin defines a new source type -
beaglebonebootimg, similarly to the existing bootimg-{efi,pcbios} in
current poky tree.

An example *.wks for setting up the partitions is provided as well.
Usage:

  wic create beaglebonesdimage -e core-image-minimal

Wic cannot handle non {h,s}da disk handling at this time, --ondisk
needs to account for this, hence disks need to be named like in the
example (mmcblk0p instead of mmcblk0).

Accompanying patches in poky are needed for proper handling of any non /
and /boot partitions as well as fs mount options (--fsoptions). Entry
for partition mounted at /media/data is provided for reference only.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/image/canned-wks/beaglebonesdimage.wks |   9 ++
 .../lib/mic/plugins/source/beaglebonebootimg.py    | 100 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 scripts/lib/image/canned-wks/beaglebonesdimage.wks
 create mode 100644 scripts/lib/mic/plugins/source/beaglebonebootimg.py

diff --git a/scripts/lib/image/canned-wks/beaglebonesdimage.wks b/scripts/lib/image/canned-wks/beaglebonesdimage.wks
new file mode 100644
index 0000000..c01607f
--- /dev/null
+++ b/scripts/lib/image/canned-wks/beaglebonesdimage.wks
@@ -0,0 +1,9 @@
+# short-description: Create SD card image for BeagleBone
+# long-description: Creates a partitioned SD card image for use with BeagleBone
+
+# vfat boot partition
+part --source beaglebonebootimg --ondisk mmcblk0p --fstype=vfat --label boot --active --align 1024 --size 10
+# root filesystem
+part / --source rootfs --ondisk mmcblk0p --fstype=ext3 --label root --align 1024
+# data partition
+# part /media/data --ondisk mmcblk0p --fstype=vfat --label data --align 1024 --size 100 --fsoptions sync
diff --git a/scripts/lib/mic/plugins/source/beaglebonebootimg.py b/scripts/lib/mic/plugins/source/beaglebonebootimg.py
new file mode 100644
index 0000000..ee1c3c7
--- /dev/null
+++ b/scripts/lib/mic/plugins/source/beaglebonebootimg.py
@@ -0,0 +1,100 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'beaglebonebootimg' source plugin class for 'wic'
+#
+# AUTHORS
+# Maciej Borzecki <maciej.borzecki (at] open-rnd.pl>
+#
+
+import os
+
+from mic import msger
+from mic.pluginbase import SourcePlugin
+from mic.utils.oe.misc import *
+
+class BootimgPcbiosPlugin(SourcePlugin):
+    name = 'beaglebonebootimg'
+
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image. Do nothing.
+        """
+        pass
+
+    @classmethod
+    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
+                               bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before do_prepare_partition(). Possibly prepare
+        configuration files of some sort.
+
+        """
+        pass
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, does the following:
+        - sets up a vfat partition
+        - copies u-boot
+        - copies MLO
+        """
+        hdddir = "%s/boot" % cr_workdir
+        rm_cmd = "rm -rf %s" % cr_workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s" % hdddir
+        tmp = exec_cmd(install_cmd)
+
+        img_deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+
+        mlo_img = "MLO"
+        mlo_src_path = os.path.join(img_deploy_dir, mlo_img)
+
+        uboot_img = "u-boot.img"
+        uboot_src_path = os.path.join(img_deploy_dir, uboot_img)
+
+        for entry in [(mlo_src_path, "MLO"), (uboot_src_path, "u-boot.img")]:
+            file_src, file_dst = entry
+            print '-- install %s as %s' % (file_src, file_dst)
+            install_cmd = "install -m 0644 %s %s" \
+                          % (file_src, os.path.join(hdddir, file_dst))
+            tmp = exec_cmd(install_cmd)
+
+        if part.get_size() == 0:
+            msger.error('Boot partition may not be 0 in size')
+
+        du_cmd = "du -bks %s" % hdddir
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        extra_blocks = part.get_extra_block_count(blocks)
+        if extra_blocks == 0:
+            msger.error('Not enough space in boot parition')
+
+        part.prepare_empty_partition(cr_workdir, oe_builddir, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (part.source_file, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
-- 
1.9.0


