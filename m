Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E13BFE00B74; Mon, 20 Jun 2016 13:56:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A257AE009CA
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:56:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B452152A8E; Mon, 20 Jun 2016 20:56:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620205652.B452152A8E@arago-project.org>
Date: Mon, 20 Jun 2016 20:56:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update to new version 2.1.0.0
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
X-List-Received-Date: Mon, 20 Jun 2016 20:57:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 1eae6f96fed1441427ccccd67f58b698f0c335a1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1eae6f96fed1441427ccccd67f58b698f0c335a1

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Jun 21 02:04:12 2016 +0000

uio-module-drv: Update to new version 2.1.0.0

One API change in read/write
Additional test code added

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |   18 +++++++++++++++---
 recipes-bsp/uio-module-drv/uio-module-drv.inc      |    6 +++---
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 3134a03..1923b36 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,16 +2,28 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r1"
+PR = "r0"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "keystone|am57xx-evm"
+
+DEVICE_NAME_am57xx-evm = "am57xx"
+DEVICE_NAME_keystone-evm = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
 
 do_compile() {
-	oe_runmake -C ${S} test
+	oe_runmake -C ${S} test "DEVICE=${DEVICE_NAME}"
 }
 
 do_install() {
 	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/test/uio_mem_test ${D}${bindir}/.
+	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
+}
+
+do_install_append_keystone () {
 	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}/.
 }
+
+do_install_append_am57xx-evm () {
+	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
+}
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 161c45b..88eab76 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -2,10 +2,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH = "master"
-# This corresponds to version 02.00.00.00
-SRCREV = "6a7eda36e390658593a5b8d87b0f00beb3997240"
+# This corresponds to version 02.01.00.00
+SRCREV = "19761495883bf8fb2670b0929d255135bd295dcb"
 
-PV = "2.0.0.0+git${SRCPV}"
+PV = "2.1.0.0+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 


