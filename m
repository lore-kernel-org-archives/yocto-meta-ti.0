Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4939DE00BC3; Fri, 23 May 2014 12:17:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CE37E00716
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E565152A88; Fri, 23 May 2014 19:17:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191748.E565152A88@arago-project.org>
Date: Fri, 23 May 2014 19:17:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap5-sgx-ddk-um-linux: remove version 1.9.0. 10 as replaced by 1.9.0.12
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
X-List-Received-Date: Fri, 23 May 2014 19:17:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ce23e062d0b958b234f83335e7c240cce819630e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ce23e062d0b958b234f83335e7c240cce819630e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 22 22:24:47 2014 +0000

omap5-sgx-ddk-um-linux: remove version 1.9.0.10 as replaced by 1.9.0.12

Also version 1.9.0.10 of the recipe doesn't have necessary PROVIDES and
results in conflicts with mesa and other gl/gles providers.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   26 --------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
deleted file mode 100644
index 37ca7d8..0000000
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Userspace libraries for omap5 sgx"
-HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
-
-COMPATIBLE_MACHINE = "omap-a15"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=http"
-
-PR = "r1"
-
-SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
-SRC_URI[sha256sum] = "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
-
-S = "${WORKDIR}/${PN}-${PV}"
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-}
-
-FILES_${PN} += "${libdir}/gbm/"
-
-INSANE_SKIP_${PN} = "useless-rpaths"
-INSANE_SKIP_${PN}-dev = "useless-rpaths"


