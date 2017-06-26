Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0791E0084A; Mon, 26 Jun 2017 11:25:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50C39E0048B
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 11:25:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QIPjFu026958
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 13:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498501545;
	bh=TcopQ3KpPHDkbUDouSLCcPsDJggsJtS27WYL5LK2prY=;
	h=From:To:CC:Subject:Date;
	b=n4dInD65ZY4RQWy4GUtpg931GaiH/0j3l/yM2ePKLoxICbOwt4twkOrQv8UYh5xZZ
	acftz1rhUOCh6F6iZd00dr/YFspkKVZ0bt7SsYBzgIber7Etz/8YaXoS2DIflXR5iH
	KfEz4426s7Q7CcAeTIG2ubOxTg4BYTxXhVqvsntk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIPjmD008090
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 13:25:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 13:25:44 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5QIPiBD012499;	Mon, 26 Jun 2017 13:25:44 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 26 Jun 2017 14:25:41 -0400
Message-ID: <1498501541-4633-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 1/3] uio-module-drv*: version bump to 2.2.0 and add test support for am3/am4
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
X-List-Received-Date: Mon, 26 Jun 2017 18:25:48 -0000
Content-Type: text/plain

* Also defined variables in .inc for GIT SRC_URI parameters

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 14 ++++++++++++--
 recipes-bsp/uio-module-drv/uio-module-drv.inc         | 12 ++++++++----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 8303efe..2e3bb91 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,12 +2,14 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r2"
+PR = "r3"
 
-COMPATIBLE_MACHINE = "keystone|omap-a15"
+COMPATIBLE_MACHINE = "keystone|omap-a15|ti33x|ti43x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICE_NAME_omap-a15 = "am57xx"
+DEVICE_NAME_ti33x = "am33xx"
+DEVICE_NAME_ti43x = "am43xx"
 DEVICE_NAME_keystone = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
 
@@ -28,3 +30,11 @@ do_install_append_keystone () {
 do_install_append_omap-a15 () {
 	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
 }
+
+do_install_append_ti33x () {
+        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
+}
+
+do_install_append_ti43x () {
+        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
+}
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 88eab76..6d55db2 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -2,11 +2,15 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH = "master"
-# This corresponds to version 02.01.00.00
-SRCREV = "19761495883bf8fb2670b0929d255135bd295dcb"
+# This corresponds to version 02.02.00.00
+UIO_MODULE_DRV_SRCREV = "59cd07395d7f26cbd01969d130d7b8bd5ccb12c5"
 
-PV = "2.1.0.0+git${SRCPV}"
+PV = "2.2.0.0+git${SRCPV}"
 
-SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
+UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
+UIO_MODULE_DRV_GIT_PROTOCOL = "git"
+SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${UIO_MODULE_DRV_SRCREV}"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


