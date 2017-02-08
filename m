Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1A05E009CD; Wed,  8 Feb 2017 13:51:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F1F2E006C6
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2017 13:51:12 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18LpCtL020170
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 15:51:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18LpCuT029699
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 15:51:12 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 15:51:11 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v18LpBxO022189;	Wed, 8 Feb 2017 15:51:11 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Feb 2017 16:51:10 -0500
Message-ID: <1486590670-50918-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] uio-test-pruss: Update to fix issue with make
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
X-List-Received-Date: Wed, 08 Feb 2017 21:51:14 -0000
Content-Type: text/plain

Add device option to build for specific device
Make package Machine dependent

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index 0a82d63..a342fe3 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -11,11 +11,19 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git;protocol=git;branch=${BRANCH}"
 LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
 
-# Corresponds to version 01.00.00.00
-SRCREV = "f04b91b84331c9a12c897e4eb2836a0a3e3a5fae"
+# Corresponds to version 01.00.00.00A
+SRCREV = "88e78564ff9094ecb13b53d627fa6bfb25d9ac03"
+
+PR = "r1"
 
 COMPATIBLE_MACHINE = "omap-a15"
-EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEVICE_NAME = ""
+DEVICE_NAME_append_am57xx-evm = "am57xx"
+
+EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR} DEVICE=${DEVICE_NAME}"
 
 do_install() {
     install -d ${D}${bindir}/
-- 
1.9.1


