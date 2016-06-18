Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D21DFE00E61; Fri, 17 Jun 2016 19:19:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94918E00E5C
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 19:19:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5I2JIgb030142
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 21:19:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5I2JpEN021175
	for <meta-ti@yoctoproject.org>; Fri, 17 Jun 2016 21:19:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Jun 2016 21:19:50 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5I2Jojb028745;	Fri, 17 Jun 2016 21:19:50 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jun 2016 22:19:47 -0400
Message-ID: <1466216388-64901-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] uio-module-drv: Update to new version 2.0.1.2
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
X-List-Received-Date: Sat, 18 Jun 2016 02:19:55 -0000
Content-Type: text/plain

One API change in read/write
Additional test code added

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 18 +++++++++++++++---
 recipes-bsp/uio-module-drv/uio-module-drv.inc         |  6 +++---
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
index 161c45b..15b959e 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -2,10 +2,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH = "master"
-# This corresponds to version 02.00.00.00
-SRCREV = "6a7eda36e390658593a5b8d87b0f00beb3997240"
+# This corresponds to version 02.00.01.00
+SRCREV = "19761495883bf8fb2670b0929d255135bd295dcb"
 
-PV = "2.0.0.0+git${SRCPV}"
+PV = "2.0.1.0+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


