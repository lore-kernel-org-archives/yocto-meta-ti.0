Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8535BE009E7; Fri, 22 May 2015 10:57:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C43E6E009E5
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 10:57:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 40F7552A4F; Fri, 22 May 2015 17:57:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522175703.40F7552A4F@arago-project.org>
Date: Fri, 22 May 2015 17:57:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt6x: Fix installation for native and nativesdk classes.
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
X-List-Received-Date: Fri, 22 May 2015 17:57:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e4f5110cf6ed0b2ef4a95085860a1672c272a570
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e4f5110cf6ed0b2ef4a95085860a1672c272a570

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May  8 18:33:57 2015 +0000

ti-cgt6x: Fix installation for native and nativesdk classes.

* Many RTOS packages assume that the entire cgt is installed in a
  single directory as opposed to standard install paths.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
index 69c6d60..2353ebd 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f1563
 LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 
 PE = "1"
+PR = "r1"
 
 require ../includes/ti-unpack.inc
 
@@ -49,6 +50,11 @@ do_install() {
         install -m 755 ${binfile} ${D}${bindir}
     done
 
+    install -d ${D}${datadir}/ti/cgt-c6x/bin
+    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
+        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
+    done
+
     install -d ${D}${datadir}/ti/cgt-c6x/include
     for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
         install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
@@ -102,4 +108,6 @@ do_install_class-target() {
 
 FILES_${PN} += "${datadir}/ti/*"
 
+FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
+
 BBCLASSEXTEND = "native nativesdk"


