Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE27CE00D4A; Mon, 29 Feb 2016 13:16:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18BABE00CF3
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 13:16:25 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5D47B52AB7; Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160229211622.5D47B52AB7@arago-project.org>
Date: Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omap5-sgx-ddk-um-linux: bump SRCREV for bug fixes in Wayland EGL
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
X-List-Received-Date: Mon, 29 Feb 2016 21:16:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 648a2cc05798453c86d0c2de6cefa044e59ae2c8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=648a2cc05798453c86d0c2de6cefa044e59ae2c8

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Mon Feb 29 11:32:17 2016 +0000

omap5-sgx-ddk-um-linux: bump SRCREV for bug fixes in Wayland EGL

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index a53902b..d6d457d 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "562db8257cc4bf04647e06a8644d73f5d77fe711"
+SRCREV = "3a6fbbf28701188e7072a601b8bf78c3d081ef67"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
@@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r4"
+PR = "r5"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"


