Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89D86E00D1B; Sun,  3 Jul 2016 19:14:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 178B9E00D26
	for <meta-ti@yoctoproject.org>; Sun,  3 Jul 2016 19:14:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 455BA52A26; Mon,  4 Jul 2016 02:14:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160704021431.455BA52A26@arago-project.org>
Date: Mon,  4 Jul 2016 02:14:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : uio-module-drv-test: replace machine override with SOC override
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
X-List-Received-Date: Mon, 04 Jul 2016 02:14:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 501709c38d02f4f9faf1d61c3d1523c3118c9a19
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=501709c38d02f4f9faf1d61c3d1523c3118c9a19

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jul  1 22:21:25 2016 +0000

uio-module-drv-test: replace machine override with SOC override

This package is now used for multiple omap-a15 SOCs, having only single machine
covered in overrides breaks other machines.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 197b36f..8303efe 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEVICE_NAME_am57xx-evm = "am57xx"
+DEVICE_NAME_omap-a15 = "am57xx"
 DEVICE_NAME_keystone = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
 
@@ -25,6 +25,6 @@ do_install_append_keystone () {
 	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}/.
 }
 
-do_install_append_am57xx-evm () {
+do_install_append_omap-a15 () {
 	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
 }


