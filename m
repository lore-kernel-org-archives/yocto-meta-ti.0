Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AEF59E0095D; Mon, 10 Oct 2016 02:49:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CC5AE00815
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 02:49:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1265F52AA4; Mon, 10 Oct 2016 09:49:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161010094907.1265F52AA4@arago-project.org>
Date: Mon, 10 Oct 2016 09:49:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: python3 fixes
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
X-List-Received-Date: Mon, 10 Oct 2016 09:49:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 48ffe2b2da9b44cdb0ce055c008ab21843ec98b3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48ffe2b2da9b44cdb0ce055c008ab21843ec98b3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct  8 10:36:45 2016 +0000

recipes: python3 fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/setup-defconfig.inc |    2 +-
 recipes-ti/includes/ti-unpack.inc        |    8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 7faf7f2..dcf2ada 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -4,7 +4,7 @@ def get_git_revision(p):
     import subprocess
 
     try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
     except OSError:
         return None
 
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index 9101044..1922db6 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -17,7 +17,6 @@ python do_unpack () {
 
 TI_BIN_UNPK_WDEXT ?= ""
 python ti_bin_do_unpack() {
-
     import os
 
     # InstallJammer requires 32bit version of glibc
@@ -48,11 +47,11 @@ python ti_bin_do_unpack() {
     cmd_list = cmd_string.split( ":" )
 
     # Make the InstallJammer binary executable so we can run it
-    os.chmod(binfile, 0755)
+    os.chmod(binfile, 0o755)
 
     # Run the InstallJammer binary and accept the EULA
     filename = "HOME=%s ./%s %s" % (workdir, binfile, arg_string)
-    
+
     # Test executable by printing installer version or help screen (--version currently broken for some installers) 
     # - this is currently broken in some IJ installers - comment out for now
     #if os.system(filename + " --version") != 0:
@@ -74,10 +73,9 @@ python ti_bin_do_unpack() {
         tarfile  = bb.data.expand(tarfile, localdata)
         tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
         if os.system(tcmd) != 0:
-            print "ERROR: ti-eula-unpack: failed to extract tarfile"
+            print("ERROR: ti-eula-unpack: failed to extract tarfile")
             raise bb.build.FuncFailed()
 
     # Return to the previous directory
     os.chdir(save_cwd)
 }
-


