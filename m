Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5247CE002F9; Fri, 20 Feb 2015 09:28:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5E5CE002AC
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 09:28:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id ACFEC52A4B; Fri, 20 Feb 2015 17:28:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150220172800.ACFEC52A4B@arago-project.org>
Date: Fri, 20 Feb 2015 17:28:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-eula-unpack: Add support for general binary installers.
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
X-List-Received-Date: Fri, 20 Feb 2015 17:28:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b06623fa2a2245f7914a120b99edf4152ec7aea5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b06623fa2a2245f7914a120b99edf4152ec7aea5

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Feb  5 21:28:28 2015 +0000

ti-eula-unpack: Add support for general binary installers.

* ti-unpack.inc has been created to allow support for general binary
  installers by creating a variable which is used to pass arbitrary
  arguments to the executable.
* ti-eula-unpack.inc sets the default arguments to retain support for
  recipes which still use this feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-eula-unpack.inc |   67 +-------------------------
 recipes-ti/includes/ti-unpack.inc      |   83 ++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 65 deletions(-)

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


