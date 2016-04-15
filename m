Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54370E00CBB; Fri, 15 Apr 2016 03:02:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0214E00CBB
	for <meta-ti@yoctoproject.org>; Fri, 15 Apr 2016 03:02:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3FA2H2t015967
	for <meta-ti@yoctoproject.org>; Fri, 15 Apr 2016 05:02:17 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FA2Hoq017184
	for <meta-ti@yoctoproject.org>; Fri, 15 Apr 2016 05:02:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Apr 2016 05:02:17 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3FA2FtK018713;	Fri, 15 Apr 2016 05:02:16 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Apr 2016 15:32:14 +0530
Message-ID: <1460714534-4774-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [for master][PATCH] bltsville: Deprecate - no longer supported
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
X-List-Received-Date: Fri, 15 Apr 2016 10:02:44 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-graphics/bltsville/bltsville_git.bb | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 recipes-graphics/bltsville/bltsville_git.bb

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
-- 
1.9.1


