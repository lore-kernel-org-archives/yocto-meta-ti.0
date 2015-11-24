Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55931E00B44; Tue, 24 Nov 2015 10:17:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5584E00B44
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 10:17:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9134D529D8; Tue, 24 Nov 2015 18:17:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151124181710.9134D529D8@arago-project.org>
Date: Tue, 24 Nov 2015 18:17:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Eric Ruei : omap5-sgx-ddk-um-linux: bump SRCREV of ti33x for configuration variable DefaultPixelFormat support
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
X-List-Received-Date: Tue, 24 Nov 2015 18:17:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: fa241fbacfb88ebcdca633aeaa3b9c64b1d2b8b5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fa241fbacfb88ebcdca633aeaa3b9c64b1d2b8b5

Author: Eric Ruei <a0850410@uda0850410>
Date:   Mon Nov 23 23:31:51 2015 +0000

omap5-sgx-ddk-um-linux: bump SRCREV of ti33x for configuration variable DefaultPixelFormat support

    * DefaultPixelFormat is used to set the default EGL pixel format

Signed-off-by: Eric Ruei <a0850410@uda0850410>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index a3a4e6d..8b032e3 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -11,7 +11,7 @@ BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
-SRCREV_ti33x    = "b535b96043ae2206e0c3d24b66599ca0fbe706d3"
+SRCREV_ti33x    = "84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0"
 SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
 
 INITSCRIPT_NAME = "pvr-init"
@@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r13"
+PR = "r14"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"


