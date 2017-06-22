Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CEFFE00BC8; Thu, 22 Jun 2017 15:09:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFF1BE00BD0
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 15:09:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MM9f0g029679
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498169381;
	bh=Gs5e6UDzMSwnh3EV0wnAlPQKp/3kjNQv01pG+QUmSFs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SkicAgKJv6AotJP0xEOJXoiJKOnDydqjdvtkdcHwXy+zzoYGmyuo9eG83pvBd51bj
	bykJpRqfZ2mpkIbov5II4e5IpMsCdmEfU0Q0Oc0jmSkC9lSYmSdtx888aUs5itRRHZ
	1q9x78dOAQip3vOnX3cyWDpXs65ZMj1xWo8w6fRg=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MM9aTk028961
	for <meta-ti@yoctoproject.org>; Thu, 22 Jun 2017 17:09:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:09:36 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MM9VdY020398;	Thu, 22 Jun 2017 17:09:36 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jun 2017 18:09:24 -0400
Message-ID: <1498169365-10248-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1498169365-10248-1-git-send-email-h-gou@ti.com>
References: <1498169365-10248-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] uio-test-pruss: version bump to 1.0.1.0 and add support for am3/am4
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
X-List-Received-Date: Thu, 22 Jun 2017 22:09:53 -0000
Content-Type: text/plain

* Also defines are added to allow switching the git repo through
  local.confappend

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


