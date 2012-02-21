Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53E9DE0059B
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:26:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 374EB52AB5; Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221022619.374EB52AB5@arago-project.org>
Date: Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : ti-codecs-omap3530: fix for corrected ti-eula-unpack
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
X-List-Received-Date: Tue, 21 Feb 2012 02:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7a9f438424efa9cfc73c25da93938d1121971bb8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7a9f438424efa9cfc73c25da93938d1121971bb8

Author: Peter A. Bigot <bigotp@acm.org>
Date:   Tue Jan 31 06:40:56 2012 -0600

ti-codecs-omap3530: fix for corrected ti-eula-unpack

Remove directory prefix for tar files that use TI_BIN_UNPK_CMDS that
specifies unpacking into workdir; formerly that specification was ignored
and these were unpacked into a package-specific subdirectory of
${HOME}=${WORKDIR}.  Note c64xplus_deinterlacer overrides TI_BIN_UNPK_CMDS
and does not specify workdir, so its prefix is correct.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Acked-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index ae218b1..ea9f389 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -77,43 +77,43 @@ python do_unpack () {
     bb.build.exec_func('base_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_h264enc_2_01_013_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/omap3530_h264enc_2_01_013_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_h264enc_2_01_013_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_h264dec_2_01_007_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production/omap3530_h264dec_2_01_007_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_jpegenc_02_01_01_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production/omap3530_jpegenc_02_01_01_00_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_jpegdec_02_00_01_01_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production/c64xplus_jpegdec_02_00_01_01_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production/c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production/omap3530_mpeg4enc_02_04_00_00_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)   
 
     bb.data.setVar("BINFILE", "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_aachedec_01_30_03_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_aachedec_01_30_03_00_production/dm6446_aachedec_01_30_03_00_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_aachedec_01_30_03_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/dm6446_g711enc_1_12_00_000_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_g711enc_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/dm6446_g711dec_1_12_00_000_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_g711dec_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_deinterlacer_01_00_00_07_production.bin", d)


