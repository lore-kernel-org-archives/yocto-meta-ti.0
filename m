Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD2E9E00BDF; Mon, 19 May 2014 12:20:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82D6CE00B20
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:20:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKDRV018311
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKDIV020527
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:13 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJog9019914;	Mon, 19 May 2014 14:20:11 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:46 -0500
Message-ID: <1400527188-16951-8-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] bltsville: Add TI BLTsville library
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
X-List-Received-Date: Mon, 19 May 2014 19:20:23 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated from meta-ti-glsdk and preserved authorship for
  Mrinmayee
* This library allows use of the GC320 2D blitter
* Modified for upstream:
    * LICENSE was changed to BSD-3-Clause but the TI-TSPA license
      is still present as well so modified this to be a dual
      license package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-graphics/bltsville/bltsville_git.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-graphics/bltsville/bltsville_git.bb

diff --git a/recipes-graphics/bltsville/bltsville_git.bb b/recipes-graphics/bltsville/bltsville_git.bb
new file mode 100644
index 0000000..158d189
--- /dev/null
+++ b/recipes-graphics/bltsville/bltsville_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Userspace libraries and headers for TI BLTsville implementation"
+HOMEPAGE = "http://omapzoom.org/?p=platform/external/bltsville.git;a=summary"
+LICENSE = "BSD-3-Clause & TI-TSPA"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148 \
+                    file://ticpu/license;md5=0bb831850a0de80e32a63772d89c6562"
+
+PR = "r2"
+
+SRCREV = "016586280ecdae201fd6e340ec8c4f8a9605cc94"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.omapzoom.org/platform/external/bltsville.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+	chmod +x autogen.sh
+	./autogen.sh --prefix=${prefix} --with-libtool-sysroot=${STAGING_DIR_TARGET}
+}
+
+FILES_${PN} += "${libdir}/libbltsville_ticpu_license.txt"   
-- 
1.7.9.5


