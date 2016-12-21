Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D9F9E00955; Wed, 21 Dec 2016 10:24:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC7BFE007AA
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2016 10:24:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BDA3E52AD9; Wed, 21 Dec 2016 18:24:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161221182446.BDA3E52AD9@arago-project.org>
Date: Wed, 21 Dec 2016 18:24:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : remaining recipes: fix build issue due to bb.data. * deprecation
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
X-List-Received-Date: Wed, 21 Dec 2016 18:24:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 16a794009702db32c6c6570cda656e9732858573
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=16a794009702db32c6c6570cda656e9732858573

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 21 04:35:22 2016 +0000

remaining recipes: fix build issue due to bb.data.* deprecation

Causes following error:
Exception: AttributeError: module 'bb.data' has no attribute 'getVar'

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |    2 +-
 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   46 ++++++++++----------
 recipes-ti/includes/ti-unpack.inc                  |   12 +++---
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 85dfc26..2dd4962 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,5 +1,5 @@
 python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    features = d.getVar("MACHINE_FEATURES", d, 1)
     if not features:
         return
     if "mmip" not in features:
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index 5c87b4c..633e098 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -76,49 +76,49 @@ DSPSUFFIX_omap3530 = "x64P"
 python do_unpack () {
     bb.build.exec_func('base_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "omap3530_h264enc_2_01_013_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264enc_2_01_013_production.tar", d)
+    d.setVar("BINFILE", "omap3530_h264enc_2_01_013_production.bin", d)
+    d.setVar("TARFILE", "omap3530_h264enc_2_01_013_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "omap3530_h264dec_2_01_007_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production.tar", d)
+    d.setVar("BINFILE", "omap3530_h264dec_2_01_007_production.bin", d)
+    d.setVar("TARFILE", "omap3530_h264dec_2_01_007_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "omap3530_jpegenc_02_01_01_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production.tar", d)
+    d.setVar("BINFILE", "omap3530_jpegenc_02_01_01_00_production.bin", d)
+    d.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_jpegdec_02_00_01_01_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_jpegdec_02_00_01_01_production.bin", d)
+    d.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
+    d.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
+    d.setVar("BINFILE", "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
+    d.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)   
 
-    bb.data.setVar("BINFILE", "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
+    d.setVar("TARFILE", "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_aachedec_01_30_03_00_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_aachedec_01_30_03_00_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_aachedec_01_30_03_00_production.bin", d)
+    d.setVar("TARFILE", "dm6446_aachedec_01_30_03_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_g711enc_1_12_00_000_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
+    d.setVar("TARFILE", "dm6446_g711enc_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_g711dec_1_12_00_000_production.tar", d)
+    d.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
+    d.setVar("TARFILE", "dm6446_g711dec_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
-    bb.data.setVar("BINFILE", "c64xplus_deinterlacer_01_00_00_07_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_deinterlacer_01_00_00_07/c64xplus_deinterlacer_01_00_00_07_production.tar", d)
-    bb.data.setVar("TI_BIN_UNPK_CMDS", "y: :q: ", d)
+    d.setVar("BINFILE", "c64xplus_deinterlacer_01_00_00_07_production.bin", d)
+    d.setVar("TARFILE", "c64xplus_deinterlacer_01_00_00_07/c64xplus_deinterlacer_01_00_00_07_production.tar", d)
+    d.setVar("TI_BIN_UNPK_CMDS", "y: :q: ", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
 }
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index 1922db6..cc315df 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -29,21 +29,21 @@ python ti_bin_do_unpack() {
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
 
-    binfile  = bb.data.getVar('BINFILE', localdata)
+    binfile  = d.getVar('BINFILE', localdata)
     binfile  = bb.data.expand(binfile, localdata)
 
     # Change to the working directory
     save_cwd = os.getcwd()
-    workdir  = bb.data.getVar('WORKDIR', localdata)
+    workdir  = d.getVar('WORKDIR', localdata)
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
 
     # Get unpack args
-    arg_string = bb.data.getVar('TI_BIN_UNPK_ARGS', localdata)
+    arg_string = d.getVar('TI_BIN_UNPK_ARGS', localdata)
     arg_string = bb.data.expand(arg_string, localdata)
 
     # Get unpack commands
-    cmd_string = bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
+    cmd_string = d.getVar('TI_BIN_UNPK_CMDS', localdata)
     cmd_list = cmd_string.split( ":" )
 
     # Make the InstallJammer binary executable so we can run it
@@ -61,14 +61,14 @@ python ti_bin_do_unpack() {
     f = os.popen(filename,'w')
     for cmd in cmd_list:
         if cmd == "workdir":
-            wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
+            wdext = d.getVar('TI_BIN_UNPK_WDEXT', localdata)
             wdext = bb.data.expand(wdext, localdata)
             cmd = workdir+wdext
         f.write(cmd+'\n');
     f.close()
 
     # Expand the tarball that was created if required
-    tarfile  = bb.data.getVar('TARFILE', localdata)    
+    tarfile  = d.getVar('TARFILE', localdata)
     if bool(tarfile) == True:
         tarfile  = bb.data.expand(tarfile, localdata)
         tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)


