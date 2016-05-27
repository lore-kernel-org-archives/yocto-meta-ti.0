Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C3AEE00DE9; Thu, 26 May 2016 19:02:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 506EAE00DEA
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 19:02:22 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7668152AEB; Fri, 27 May 2016 02:02:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160527020221.7668152AEB@arago-project.org>
Date: Fri, 27 May 2016 02:02:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: e-ruei1@ti.com : ti-sgx-ddk-um: update srcrev and bump PR
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
X-List-Received-Date: Fri, 27 May 2016 02:02:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 2a57c4c76800e34d97a3885239b8fd954b1a1387
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2a57c4c76800e34d97a3885239b8fd954b1a1387

Author: e-ruei1@ti.com <e-ruei1@ti.com>
Date:   Fri May 27 01:33:11 2016 +0000

ti-sgx-ddk-um: update srcrev and bump PR

* bring in the fix of QML overlay display problem

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 0021884..e5c5de6 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "8d4ba04a2da59989b21aacca9defdf387e321695"
+SRCREV = "54ba970e33d3c13f726d7c035f3b5c3dcb74afdc"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r11"
+PR = "r12"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"


