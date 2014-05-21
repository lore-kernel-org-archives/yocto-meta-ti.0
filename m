Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9C0CE00C71; Wed, 21 May 2014 12:57:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6846DE00C35
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E02B652A83; Wed, 21 May 2014 19:57:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195733.E02B652A83@arago-project.org>
Date: Wed, 21 May 2014 19:57:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : bltsville: Add TI BLTsville library
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
X-List-Received-Date: Wed, 21 May 2014 19:57:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: c5c384d009a166d2636d48a6e23241950f19105b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5c384d009a166d2636d48a6e23241950f19105b

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Tue May 20 01:19:46 2014 +0000

bltsville: Add TI BLTsville library

* Migrated from meta-ti-glsdk and preserved authorship for
  Mrinmayee
* This library allows use of the GC320 2D blitter
* Modified for upstream:
    * LICENSE was changed to BSD-3-Clause but the TI-TSPA license
      is still present as well so modified this to be a dual
      license package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/bltsville/bltsville_git.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

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


