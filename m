Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B085EE00C80; Mon,  9 Jul 2018 18:07:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FC2CE00929
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2018 18:07:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6A17Rem042610
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 20:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531184847;
	bh=3fdNPI4zlxukzW0jvSZxBye6LgsEqaoaSii+608UXfk=;
	h=From:To:CC:Subject:Date;
	b=fRtV3OK4gyYAQgsJGsrI2wCMeSCQvpGmmsO+AjSkTweHTdb3/Kd+LtiADYCXDmZVH
	dp6aMofquPXoSoYtyVqItjbGTPLncyHJPa1kTvYlqnvGo78yklQbj1mREjh5dLggr8
	FUELHrFSq1Wd6tuNb3KOodXv8pCc4JYaPgt3dUUg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A17R3S023112
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 20:07:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 20:07:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 20:07:26 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A17QQv007376;
	Mon, 9 Jul 2018 20:07:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Jul 2018 01:06:01 +0000
Message-ID: <20180710010601.15333-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] meta-ti: cleanup use of d.getVar()
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
X-List-Received-Date: Tue, 10 Jul 2018 01:07:28 -0000
Content-Type: text/plain

1. drop use of True as second parameter, which is default, to align with master
2. there were instances of incorrectly passing 'd' as second parameter from
previous conversion from bb.data.getVar() usage

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk.bbclass                           |  2 +-
 conf/machine/include/beaglebone.inc              |  2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb             |  2 +-
 .../libgal/ti-gc320-libs_5.0.11.p7.bb            |  6 +++---
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb        |  6 +++---
 recipes-kernel/linux/cmem.inc                    | 16 ++++++++--------
 recipes-ti/devtools/ti-cgt6x_8.2.2.bb            |  8 ++++----
 recipes-ti/includes/ti-unpack.inc                | 12 ++++++------
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 540a665c..7ad6205d 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -67,7 +67,7 @@ PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
 PARALLEL_MAKE = ""
 
 def get_doxygen_support(d):
-    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) == '1':
+    if d.getVar('TI_PDK_DOXYGEN_SUPPORT') == '1':
         return ''
     return 'DOXYGEN_SUPPORT=no'
 
diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
index b10146d1..2e14cf1d 100644
--- a/conf/machine/include/beaglebone.inc
+++ b/conf/machine/include/beaglebone.inc
@@ -1,5 +1,5 @@
 python () {
-    layers = d.getVar("BBFILE_COLLECTIONS", True)
+    layers = d.getVar("BBFILE_COLLECTIONS")
     if not layers:
         return
     if "yoctobsp" in layers:
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 761210e7..22a8c4f8 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,5 +1,5 @@
 python __anonymous() {
-    features = d.getVar("MACHINE_FEATURES", d, 1)
+    features = d.getVar("MACHINE_FEATURES")
     if not features:
         return
     if "mmip" not in features:
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 52df495d..dafaac1e 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -14,11 +14,11 @@ SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = d.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES")
     if not tunes:
         return
-    pkgn = d.getVar("PN", d, 1)
-    pkgv = d.getVar("PV", d, 1)
+    pkgn = d.getVar("PN")
+    pkgv = d.getVar("PV")
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 354e081f..345f8fca 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -14,11 +14,11 @@ SRCREV = "358fe42d34a7570896e5d1639869da564ddd0484"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = d.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES")
     if not tunes:
         return
-    pkgn = d.getVar("PN", d, 1)
-    pkgv = d.getVar("PV", d, 1)
+    pkgn = d.getVar("PN")
+    pkgv = d.getVar("PV")
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index ad122799..8325c00f 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -39,13 +39,13 @@ python do_unpack() {
     # Initialize with empty string to simplify logic to append to SRC_URI
     cmem_dtsi = set([''])
 
-    for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+    for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
         # Create copy of data for additional override
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
         bb.data.update_data(localdata)
 
-        cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
+        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
 
     d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
     bb.build.exec_func('base_do_unpack', d)
@@ -56,27 +56,27 @@ python do_setup_cmem() {
 
     old_overrides = d.getVar('OVERRIDES', False)
 
-    if d.getVar('RESERVE_CMEM', True) is '1':
-        for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+    if d.getVar('RESERVE_CMEM') is '1':
+        for cmem_machine in (d.getVar('CMEM_MACHINE') or '').split():
             # Create copy of data for additional override
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
             bb.data.update_data(localdata)
 
             # Get source directory and dtsi filename
-            src_dir  = localdata.getVar('WORKDIR', True)
-            src_dtsi = localdata.getVar('CMEM_DTSI', True)
+            src_dir  = localdata.getVar('WORKDIR')
+            src_dtsi = localdata.getVar('CMEM_DTSI')
 
             # Get destination directory and destination dtsi filename which adds
             #   the MACHINE prefix.
-            dst_dir  = os.path.join(localdata.getVar('S', True), 'arch/arm/boot/dts')
+            dst_dir  = os.path.join(localdata.getVar('S'), 'arch/arm/boot/dts')
             dst_dtsi = localdata.expand('${MACHINE}-${CMEM_DTSI}')
 
             # Copy cmem.dtsi into source tree
             shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
 
             # Inject dtsi into each dts in list
-            for dtb in (localdata.getVar('CMEM_DEVICETREE', True) or '').split():
+            for dtb in (localdata.getVar('CMEM_DEVICETREE') or '').split():
                 dts = dtb[:-4] + '.dts'
 
                 with open(os.path.join(dst_dir,dts), 'a') as dts_file:
diff --git a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb b/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
index 04e55ae9..53f52526 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
@@ -13,14 +13,14 @@ COMPATIBLE_HOST_class-target = "arm.*-linux"
 
 # For now we only have hardfp version for target class
 python __anonymous() {
-    c = d.getVar("CLASSOVERRIDE", d, 1)
+    c = d.getVar("CLASSOVERRIDE")
 
     if c == "class-target":
-        tunes = d.getVar("TUNE_FEATURES", d, 1)
+        tunes = d.getVar("TUNE_FEATURES")
         if not tunes:
             return
-        pkgn = d.getVar("PN", d, 1)
-        pkgv = d.getVar("PV", d, 1)
+        pkgn = d.getVar("PN")
+        pkgv = d.getVar("PV")
         if "callconvention-hard" not in tunes:
             bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index cc315dff..a571fd5d 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -29,21 +29,21 @@ python ti_bin_do_unpack() {
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
 
-    binfile  = d.getVar('BINFILE', localdata)
+    binfile  = localdata.getVar('BINFILE')
     binfile  = bb.data.expand(binfile, localdata)
 
     # Change to the working directory
     save_cwd = os.getcwd()
-    workdir  = d.getVar('WORKDIR', localdata)
+    workdir  = localdata.getVar('WORKDIR')
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
 
     # Get unpack args
-    arg_string = d.getVar('TI_BIN_UNPK_ARGS', localdata)
+    arg_string = localdata.getVar('TI_BIN_UNPK_ARGS')
     arg_string = bb.data.expand(arg_string, localdata)
 
     # Get unpack commands
-    cmd_string = d.getVar('TI_BIN_UNPK_CMDS', localdata)
+    cmd_string = localdata.getVar('TI_BIN_UNPK_CMDS')
     cmd_list = cmd_string.split( ":" )
 
     # Make the InstallJammer binary executable so we can run it
@@ -61,14 +61,14 @@ python ti_bin_do_unpack() {
     f = os.popen(filename,'w')
     for cmd in cmd_list:
         if cmd == "workdir":
-            wdext = d.getVar('TI_BIN_UNPK_WDEXT', localdata)
+            wdext = localdata.getVar('TI_BIN_UNPK_WDEXT')
             wdext = bb.data.expand(wdext, localdata)
             cmd = workdir+wdext
         f.write(cmd+'\n');
     f.close()
 
     # Expand the tarball that was created if required
-    tarfile  = d.getVar('TARFILE', localdata)
+    tarfile  = localdata.getVar('TARFILE')
     if bool(tarfile) == True:
         tarfile  = bb.data.expand(tarfile, localdata)
         tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
-- 
2.17.1


