Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDF95E009CA; Mon, 20 Jun 2016 13:56:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A37D0E009CB
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:56:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1C35F52AA4; Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620205653.1C35F52AA4@arago-project.org>
Date: Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-test-pruss: Add recipe to build uio pruss test firmware
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
Commit: cbfd89ceb79d8a390bda673cf4046c63c6370f5f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cbfd89ceb79d8a390bda673cf4046c63c6370f5f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Jun 21 00:53:29 2016 +0000

uio-test-pruss: Add recipe to build uio pruss test firmware

This firmware images are expected to be used with uio pruss test code

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
new file mode 100644
index 0000000..ee8204a
--- /dev/null
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Provides test pruss firmware for uio based tests"
+LICENSE = "BSD-3-Clause"
+PV = "1.0.0.0"
+require recipes-ti/includes/ti-paths.inc
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "ti-cgt-pru-native"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git;protocol=git;branch=${BRANCH}"
+LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
+
+# Corresponds to version 01.00.00.00
+SRCREV = "f04b91b84331c9a12c897e4eb2836a0a3e3a5fae"
+
+COMPATIBLE_MACHINE = "am57xx"
+EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR}"
+
+do_install() {
+    install -d ${D}${bindir}/
+    cp -r *.bin ${D}${bindir}/
+}


