Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C342E009D4; Thu,  9 Feb 2017 18:09:35 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2212E009CF
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2017 18:09:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 56E4952A12; Fri, 10 Feb 2017 02:09:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170210020930.56E4952A12@arago-project.org>
Date: Fri, 10 Feb 2017 02:09:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-test-pruss: Update to fix issue with make
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
X-List-Received-Date: Fri, 10 Feb 2017 02:09:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 75f488a797cddc5bf956d9287652b4872abe68f3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=75f488a797cddc5bf956d9287652b4872abe68f3

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Feb  9 03:51:10 2017 +0000

uio-test-pruss: Update to fix issue with make

Add device option to build for specific device
Make package Machine dependent

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

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


