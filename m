Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E366E0084A; Mon, 26 Jun 2017 11:23:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E21DAE0048B
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 11:23:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QIN7Gv013823
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 13:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498501387;
	bh=ggXwBJG6YTvbzzHx7Fi25zxPfGndZF2oMDZH7u7Mo/c=;
	h=From:To:CC:Subject:Date;
	b=mQ0kTM00OTaGetenFpl63meVcnk4Tf87WXcJBqmt+x7X9GAxRPQDXsrx+pJZqYmx4
	XD9+u6kTQvLpIdoIBDCD6TkARCKRl9S5v8Kok+QwMjW6qgmKdj5t/7/YEajqZdHSOF
	VNfZO34VRjzYiSWE1xsMxqIwWgb1kt04KBeQYiFU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIN7Go004446
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 13:23:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 13:23:07 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5QIN7i8010119;	Mon, 26 Jun 2017 13:23:07 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 26 Jun 2017 14:23:05 -0400
Message-ID: <1498501385-21976-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 2/3] uio-test-pruss: version bump to 1.0.1.0 and add support for am3/am4
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
X-List-Received-Date: Mon, 26 Jun 2017 18:23:12 -0000
Content-Type: text/plain

* Also defined variables for GIT SRC_URI parameters

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index a342fe3..724ca07 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Provides test pruss firmware for uio based tests"
 LICENSE = "BSD-3-Clause"
-PV = "1.0.0.0"
+PV = "1.0.1.0"
 require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/git"
@@ -8,20 +8,27 @@ S = "${WORKDIR}/git"
 DEPENDS = "ti-cgt-pru-native"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git;protocol=git;branch=${BRANCH}"
 LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
 
-# Corresponds to version 01.00.00.00A
-SRCREV = "88e78564ff9094ecb13b53d627fa6bfb25d9ac03"
+UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
+UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
+SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
 
-PR = "r1"
+# Corresponds to version 01.00.01.00
+UIO_TEST_PRUSS_SRCREV = "72f7454c2460bd7d52dab70631b38bf5d3585542"
 
-COMPATIBLE_MACHINE = "omap-a15"
+SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
+
+PR = "r2"
+
+COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICE_NAME = ""
 DEVICE_NAME_append_am57xx-evm = "am57xx"
+DEVICE_NAME_append_ti33x = "am33xx"
+DEVICE_NAME_append_ti43x = "am43xx"
 
 EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR} DEVICE=${DEVICE_NAME}"
 
-- 
1.9.1


