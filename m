Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79F44E003D2; Mon, 23 Jun 2014 15:04:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD49FE00283
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:04:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0A23E52A42; Mon, 23 Jun 2014 22:04:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623220449.0A23E52A42@arago-project.org>
Date: Mon, 23 Jun 2014 22:04:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Scott Ellis : Remove deprecated update-modules from recipes
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
X-List-Received-Date: Mon, 23 Jun 2014 22:04:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 66abb4452eae5e5d5b89b4b13bf36f907d93aed8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=66abb4452eae5e5d5b89b4b13bf36f907d93aed8

Author: Scott Ellis <scott@jumpnowtek.com>
Date:   Sat Jun 14 04:34:03 2014 +0000

Remove deprecated update-modules from recipes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dsplink/ti-dsplink.inc                  |   16 ----------------
 .../local-power-manager/ti-local-power-manager.inc |   13 -------------
 recipes-ti/syslink/ti-syslink.inc                  |   16 ----------------
 3 files changed, 0 insertions(+), 45 deletions(-)

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index ce7cbf9..fa1c9dd 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -187,22 +187,6 @@ do_install () {
 
 PACKAGES =+ "ti-dsplink-module"
 FILES_ti-dsplink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/dsplinkk.ko" 
-RDEPENDS_ti-dsplink-module += "update-modules"
-
-pkg_postinst_ti-dsplink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-dsplink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 9155c76..2f2b525 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -113,19 +113,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-lpm-module"
 FILES_ti-lpm-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/*lpm*ko"
 RDEPENDS_ti-lpm-module += "ti-dsplink-module"
-RDEPENDS_ti-lpm-module += "update-modules"
-
-pkg_postinst_ti-lpm-module_append () {
-        if [ -n "$D" ]; then
-                exit 1
-        fi
-        depmod -a
-        update-modules || true
-}
-
-pkg_postrm_ti-lpm-module_append () {
-        update-modules || true
-}
 
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 70289d4..af5f896 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -216,22 +216,6 @@ do_install () {
 
 PACKAGES =+ "ti-syslink-module"
 FILES_ti-syslink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/syslink.ko" 
-RDEPENDS_ti-syslink-module += "update-modules"
-
-pkg_postinst_ti-syslink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-syslink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES =+ "ti-syslink-examples"
 RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"


