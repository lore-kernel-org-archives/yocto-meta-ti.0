Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6594E00BE0; Tue, 20 Dec 2016 13:41:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59474E00A64
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 13:41:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0444B52A05; Tue, 20 Dec 2016 21:41:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161220214121.0444B52A05@arago-project.org>
Date: Tue, 20 Dec 2016 21:41:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Thomas Perrot : recipes: fix build issue due to bb.data.* deprecation
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
X-List-Received-Date: Tue, 20 Dec 2016 21:41:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d8827afedc66b610f1fc9c5990bc4271917643b6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d8827afedc66b610f1fc9c5990bc4271917643b6

Author: Thomas Perrot <thomas.perrot@tupi.fr>
Date:   Thu Dec  8 01:39:49 2016 +0000

recipes: fix build issue due to bb.data.* deprecation

Causes following error:
Exception: AttributeError: module 'bb.data' has no attribute 'getVar'

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb |    6 +++---
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    6 +++---
 recipes-ti/devtools/ti-cgt6x_8.1.0.bb              |    8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 45c8d51..394d1e4 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -14,11 +14,11 @@ SRCREV = "ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES", d, 1)
     if not tunes:
         return
-    pkgn = bb.data.getVar("PN", d, 1)
-    pkgv = bb.data.getVar("PV", d, 1)
+    pkgn = d.getVar("PN", d, 1)
+    pkgv = d.getVar("PV", d, 1)
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 5903b2e..301bdd4 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -12,11 +12,11 @@ SRCREV = "3c0537748dd283b2de9c5369570aa2aade5a9979"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES", d, 1)
     if not tunes:
         return
-    pkgn = bb.data.getVar("PN", d, 1)
-    pkgv = bb.data.getVar("PV", d, 1)
+    pkgn = d.getVar("PN", d, 1)
+    pkgv = d.getVar("PV", d, 1)
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
index 79b562a..5e97927 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
@@ -13,14 +13,14 @@ COMPATIBLE_HOST_class-target = "arm.*-linux"
 
 # For now we only have hardfp version for target class
 python __anonymous() {
-    c = bb.data.getVar("CLASSOVERRIDE", d, 1)
+    c = d.getVar("CLASSOVERRIDE", d, 1)
 
     if c == "class-target":
-        tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+        tunes = d.getVar("TUNE_FEATURES", d, 1)
         if not tunes:
             return
-        pkgn = bb.data.getVar("PN", d, 1)
-        pkgv = bb.data.getVar("PV", d, 1)
+        pkgn = d.getVar("PN", d, 1)
+        pkgv = d.getVar("PV", d, 1)
         if "callconvention-hard" not in tunes:
             bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))


