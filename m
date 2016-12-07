Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4A65E00D72; Wed,  7 Dec 2016 11:50:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADBEDE0073D
	for <meta-ti@yoctoproject.org>; Wed,  7 Dec 2016 11:50:42 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B2D3452A0E; Wed,  7 Dec 2016 19:50:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161207195041.B2D3452A0E@arago-project.org>
Date: Wed,  7 Dec 2016 19:50:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: e-ruei1@ti.com : ti-sgx-ddk-um: fix a bug at the drmModeAddFB() call at null_drm_ws.c
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
X-List-Received-Date: Wed, 07 Dec 2016 19:50:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: ca02a57aa96a8a5a816c027a8ee494820b22749e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca02a57aa96a8a5a816c027a8ee494820b22749e

Author: e-ruei1@ti.com <e-ruei1@ti.com>
Date:   Wed Dec  7 21:00:59 2016 +0000

ti-sgx-ddk-um: fix a bug at the drmModeAddFB() call at null_drm_ws.c

Both parameter depth and bpp are set to uiPixelWidthInBits at the current
implementation, however, the depth may not be the same as bpp for certain
pixel format such as XRGB8888. This bug was exposed by the recent DRM
driver change introducing strict error checking. To fix this problem,
add utility function uiPixelDepthInBits to derive and use depth based on
the pixel format.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 770cda2..5903b2e 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "a5152f0b90bf3916eb1f478ac9fefe7d7ebe8bd9"
+SRCREV = "3c0537748dd283b2de9c5369570aa2aade5a9979"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r17"
+PR = "r18"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"


