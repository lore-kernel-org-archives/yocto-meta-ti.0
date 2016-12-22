Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 977F9E00B8E; Thu, 22 Dec 2016 10:19:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 675D8E00B8E
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2016 10:19:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 827EE52AA3; Thu, 22 Dec 2016 18:19:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161222181950.827EE52AA3@arago-project.org>
Date: Thu, 22 Dec 2016 18:19:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ti-sgx-ddk-um: Add support for YUYV EGLImage
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
X-List-Received-Date: Thu, 22 Dec 2016 18:19:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 214642b9f021f976f2b184c3006202a33c7ac0d7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=214642b9f021f976f2b184c3006202a33c7ac0d7

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Dec 22 11:57:13 2016 +0000

ti-sgx-ddk-um: Add support for YUYV EGLImage

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 301bdd4..95c513d 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "3c0537748dd283b2de9c5369570aa2aade5a9979"
+SRCREV = "739111e5d67871d08f9d7e643492bee40dce933c"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r18"
+PR = "r19"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"


