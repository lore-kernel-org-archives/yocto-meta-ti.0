Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26342E00EB7; Tue, 19 Apr 2016 15:06:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0538CE00C2E
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:05:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3CC8E529BF; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.3CC8E529BF@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : bltsville: Deprecate - no longer supported
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fdda559e85865e05431015abfd963e59d2badd54
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fdda559e85865e05431015abfd963e59d2badd54

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Fri Apr 15 16:02:14 2016 +0000

bltsville: Deprecate - no longer supported

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/bltsville/bltsville_git.bb |   22 ----------------------
 1 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/recipes-graphics/bltsville/bltsville_git.bb b/recipes-graphics/bltsville/bltsville_git.bb
deleted file mode 100644
index 776785d..0000000
--- a/recipes-graphics/bltsville/bltsville_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Userspace libraries and headers for TI BLTsville implementation"
-HOMEPAGE = "http://omapzoom.org/?p=platform/external/bltsville.git;a=summary"
-LICENSE = "BSD-3-Clause & TI-TSPA"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148 \
-                    file://ticpu/license;md5=0bb831850a0de80e32a63772d89c6562"
-
-PR = "r3"
-
-SRCREV = "a759bde8a5a6e518dfb8a6e633736a360005498e"
-
-inherit autotools-brokensep pkgconfig
-
-SRC_URI = "git://git.omapzoom.org/platform/external/bltsville.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-do_configure() {
-	chmod +x autogen.sh
-	./autogen.sh --prefix=${prefix} --with-libtool-sysroot=${STAGING_DIR_TARGET}
-}
-
-FILES_${PN} += "${libdir}/libbltsville_ticpu_license.txt"   


