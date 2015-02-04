Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68941E0082D; Wed,  4 Feb 2015 07:40:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AC36E00753
	for <meta-ti@yoctoproject.org>; Wed,  4 Feb 2015 07:40:50 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t14FenMS029465
	for <meta-ti@yoctoproject.org>; Wed, 4 Feb 2015 09:40:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14FemB8011843
	for <meta-ti@yoctoproject.org>; Wed, 4 Feb 2015 09:40:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Feb 2015 09:40:48 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t14Fem2I028213;	Wed, 4 Feb 2015 09:40:48 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Feb 2015 10:40:45 -0500
Message-ID: <1423064446-7202-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-eula-unpack: Add support for general binary installers.
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
X-List-Received-Date: Wed, 04 Feb 2015 15:40:55 -0000
Content-Type: text/plain

* ti-unpack.inc has been created to allow support for general binary
  installers by creating a variable which is used to pass arbitrary
  arguments to the executable.
* ti-eula-unpack.inc sets the default arguments to retain support for
  recipes which still use this feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/includes/ti-eula-unpack.inc |   67 +-------------------------
 recipes-ti/includes/ti-unpack.inc      |   83 ++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 65 deletions(-)
 create mode 100644 recipes-ti/includes/ti-unpack.inc

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
 
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
new file mode 100644
index 0000000..c19c78c
--- /dev/null
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -0,0 +1,83 @@
+# This file defines function used for unpacking the .bin file downloaded over
+# the http.
+#  BINFILE - name of the install jammer .bin file
+#  TARFILE - name of the tar file inside the install jammer
+#  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin file.
+#  TI_BIN_UNPK_CMDS   - contains list of commands separated with colon to be 
+#                       passed while unpacking the bin file. The keyword 
+#                       workdir expands to WORKDIR and commands are appendded
+#                       with '\n'. Eg. TI_BIN_UNPK_CMDS="Y:Y: qY:workdir"
+#  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
+#                       the output in some internal directory
+
+python do_unpack () {
+    bb.build.exec_func('base_do_unpack', d)
+    bb.build.exec_func('ti_bin_do_unpack', d)
+}
+
+TI_BIN_UNPK_WDEXT ?= ""
+python ti_bin_do_unpack() {
+
+    import os
+
+    # InstallJammer requires 32bit version of glibc
+    lib32path = '/lib'
+    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
+        lib32path = '/lib32'
+    if not os.path.exists('%s/libc.so.6' % lib32path):
+        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ubuntu/Debian")
+
+    localdata = bb.data.createCopy(d)
+    bb.data.update_data(localdata)
+
+    binfile  = bb.data.getVar('BINFILE', localdata)
+    binfile  = bb.data.expand(binfile, localdata)
+
+    # Change to the working directory
+    save_cwd = os.getcwd()
+    workdir  = bb.data.getVar('WORKDIR', localdata)
+    workdir  = bb.data.expand(workdir, localdata)
+    os.chdir(workdir)
+
+    # Get unpack args
+    arg_string = bb.data.getVar('TI_BIN_UNPK_ARGS', localdata)
+    arg_string = bb.data.expand(arg_string, localdata)
+
+    # Get unpack commands
+    cmd_string = bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
+    cmd_list = cmd_string.split( ":" )
+
+    # Make the InstallJammer binary executable so we can run it
+    os.chmod(binfile, 0755)
+
+    # Run the InstallJammer binary and accept the EULA
+    filename = "HOME=%s ./%s %s" % (workdir, binfile, arg_string)
+    
+    # Test executable by printing installer version or help screen (--version currently broken for some installers) 
+    # - this is currently broken in some IJ installers - comment out for now
+    #if os.system(filename + " --version") != 0:
+    #   print "ERROR: ti-eula-unpack: failed to execute binary installer"
+    #   raise bb.build.FuncFailed()
+ 
+    f = os.popen(filename,'w')
+    for cmd in cmd_list:
+        if cmd == "workdir":
+            wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
+            wdext = bb.data.expand(wdext, localdata)
+            cmd = workdir+wdext
+        f.write(cmd+'\n');
+    f.close()
+
+    # Expand the tarball that was created if required
+    tarfile  = bb.data.getVar('TARFILE', localdata)    
+    if bool(tarfile) == True:
+        tarfile  = bb.data.expand(tarfile, localdata)
+        tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
+        if os.system(tcmd) != 0:
+            print "ERROR: ti-eula-unpack: failed to extract tarfile"
+            raise bb.build.FuncFailed()
+
+    # Return to the previous directory
+    os.chdir(save_cwd)
+}
+
-- 
1.7.9.5


