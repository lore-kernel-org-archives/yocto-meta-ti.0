Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5ED5E00CD9; Fri,  7 Oct 2016 21:36:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5097BE00CD6
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 21:36:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 182632099C;
	Sat,  8 Oct 2016 04:36:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vUeO6QFV69xP; Sat,  8 Oct 2016 04:36:48 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D82CB202B9;
	Sat,  8 Oct 2016 04:36:46 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 0FF0B162066;
	Sat,  8 Oct 2016 00:36:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat,  8 Oct 2016 00:36:45 -0400
Message-Id: <1475901405-2084-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] recipes: python3 fixes
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
X-List-Received-Date: Sat, 08 Oct 2016 04:36:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc | 2 +-
 recipes-ti/includes/ti-unpack.inc        | 8 +++-----
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
-- 
2.7.4


