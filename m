Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36A4DE00948; Mon, 15 Feb 2016 14:28:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C933EE00807
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 14:27:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9A9A152A8B; Mon, 15 Feb 2016 22:27:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160215222747.9A9A152A8B@arago-project.org>
Date: Mon, 15 Feb 2016 22:27:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : omap5-sgx-ddk-um-linux: Specify COMPATIBLE_MACHINE list
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
X-List-Received-Date: Mon, 15 Feb 2016 22:28:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 88bdd10290ea1dc601e9509b63a08468a3a6e0d1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=88bdd10290ea1dc601e9509b63a08468a3a6e0d1

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Feb 16 01:04:04 2016 +0000

omap5-sgx-ddk-um-linux: Specify COMPATIBLE_MACHINE list

* This is only compatible with ti33x, ti43, and omap-a15 as a SRCREV
  is only supplied for these SOC families.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index dfd22d0..0cdab96 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH_omap-a15 = "master"
@@ -19,7 +20,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r14"
+PR = "r15"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"


