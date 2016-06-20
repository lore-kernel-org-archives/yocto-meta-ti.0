Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42DF6E0091D; Mon, 20 Jun 2016 11:53:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3DD1E008BC
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 11:53:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5KIrVLP015124
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:53:31 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KIrVgS020911
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:53:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Jun 2016 13:53:30 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5KIrVQg012544;	Mon, 20 Jun 2016 13:53:31 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <j-stiffler@ti.com>
Date: Mon, 20 Jun 2016 14:53:29 -0400
Message-ID: <1466448809-11227-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] uio-test-pruss: Add recipe to build uio pruss test firmware
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
X-List-Received-Date: Mon, 20 Jun 2016 18:53:36 -0000
Content-Type: text/plain

This firmware images are expected to be used with uio pruss test code

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb

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
-- 
1.9.1


