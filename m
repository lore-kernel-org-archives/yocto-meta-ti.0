Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B89FE002F9; Fri, 20 Feb 2015 08:57:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C15EE00289
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 08:57:30 -0800 (PST)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NK20018AXQZH610@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 20 Feb 2015 10:57:14 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=Rzel2kV36hGfTeZIa1kA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0E953200E2;	Fri,
	20 Feb 2015 11:56:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Feb 2015 11:56:58 -0500
Message-id: <1424451418-9348-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ti-eula-unpack: Add support for general binary installers.
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
X-List-Received-Date: Fri, 20 Feb 2015 16:57:50 -0000

From: Jacob Stiffler <j-stiffler@ti.com>

* ti-unpack.inc has been created to allow support for general binary
  installers by creating a variable which is used to pass arbitrary
  arguments to the executable.
* ti-eula-unpack.inc sets the default arguments to retain support for
  recipes which still use this feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/includes/ti-eula-unpack.inc             |   67 +-------------------
 .../includes/{ti-eula-unpack.inc => ti-unpack.inc} |    9 ++-
 2 files changed, 9 insertions(+), 67 deletions(-)
 copy recipes-ti/includes/{ti-eula-unpack.inc => ti-unpack.inc} (91%)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index aee88f1..912cd18 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -9,70 +9,7 @@
 #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
 #                       the output in some internal directory
 
-python do_unpack () {
-    bb.build.exec_func('base_do_unpack', d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-}
+require ../includes/ti-unpack.inc
 
-TI_BIN_UNPK_WDEXT ?= ""
-python ti_bin_do_unpack() {
-
-    import os
-
-    # InstallJammer requires 32bit version of glibc
-    lib32path = '/lib'
-    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
-        lib32path = '/lib32'
-    if not os.path.exists('%s/libc.so.6' % lib32path):
-        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian")
-
-    localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
-
-    binfile  = bb.data.getVar('BINFILE', localdata)
-    binfile  = bb.data.expand(binfile, localdata)
-
-    # Change to the working directory
-    save_cwd = os.getcwd()
-    workdir  = bb.data.getVar('WORKDIR', localdata)
-    workdir  = bb.data.expand(workdir, localdata)
-    os.chdir(workdir)
-
-    # Get unpack commands
-    cmd_string = bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
-    cmd_list = cmd_string.split( ":" )
-
-    # Make the InstallJammer binary executable so we can run it
-    os.chmod(binfile, 0755)
-
-    # Run the InstallJammer binary and accept the EULA
-    filename = "HOME=%s ./%s --mode console" % (workdir, binfile)
-    
-    # Test executable by printing installer version or help screen (--version currently broken for some installers) 
-    # - this is currently broken in some IJ installers - comment out for now
-    #if os.system(filename + " --version") != 0:
-    #   print "ERROR: ti-eula-unpack: failed to execute binary installer"
-    #   raise bb.build.FuncFailed()
- 
-    f = os.popen(filename,'w')
-    for cmd in cmd_list:
-        if cmd == "workdir":
-            wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
-            wdext = bb.data.expand(wdext, localdata)
-            cmd = workdir+wdext
-        f.write(cmd+'\n');
-    f.close()
-
-    # Expand the tarball that was created if required
-    tarfile  = bb.data.getVar('TARFILE', localdata)    
-    if bool(tarfile) == True:
-        tarfile  = bb.data.expand(tarfile, localdata)
-        tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
-        if os.system(tcmd) != 0:
-            print "ERROR: ti-eula-unpack: failed to extract tarfile"
-            raise bb.build.FuncFailed()
-
-    # Return to the previous directory
-    os.chdir(save_cwd)
-}
+TI_BIN_UNPK_ARGS = "--mode console"
 
diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-unpack.inc
similarity index 91%
copy from recipes-ti/includes/ti-eula-unpack.inc
copy to recipes-ti/includes/ti-unpack.inc
index aee88f1..c19c78c 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -1,7 +1,8 @@
 # This file defines function used for unpacking the .bin file downloaded over
-# the http and display EULA.
+# the http.
 #  BINFILE - name of the install jammer .bin file
 #  TARFILE - name of the tar file inside the install jammer
+#  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin file.
 #  TI_BIN_UNPK_CMDS   - contains list of commands separated with colon to be 
 #                       passed while unpacking the bin file. The keyword 
 #                       workdir expands to WORKDIR and commands are appendded
@@ -38,6 +39,10 @@ python ti_bin_do_unpack() {
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
 
+    # Get unpack args
+    arg_string = bb.data.getVar('TI_BIN_UNPK_ARGS', localdata)
+    arg_string = bb.data.expand(arg_string, localdata)
+
     # Get unpack commands
     cmd_string = bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
     cmd_list = cmd_string.split( ":" )
@@ -46,7 +51,7 @@ python ti_bin_do_unpack() {
     os.chmod(binfile, 0755)
 
     # Run the InstallJammer binary and accept the EULA
-    filename = "HOME=%s ./%s --mode console" % (workdir, binfile)
+    filename = "HOME=%s ./%s %s" % (workdir, binfile, arg_string)
     
     # Test executable by printing installer version or help screen (--version currently broken for some installers) 
     # - this is currently broken in some IJ installers - comment out for now
-- 
1.7.9.5


