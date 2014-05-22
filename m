Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A07FAE00A44; Thu, 22 May 2014 09:25:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RCVD_IN_DNSWL_NONE,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from vms173017pub.verizon.net (unknown [206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C038E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 09:25:14 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5Z00702HLFNI30@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 22 May 2014 11:25:06 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2199C20101; Thu,
	22 May 2014 12:24:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 22 May 2014 12:24:47 -0400
Message-id: <1400775888-23432-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 1/2] omap5-sgx-ddk-um-linux: remove version 1.9.0.10 as replaced by 1.9.0.12
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
X-List-Received-Date: Thu, 22 May 2014 16:25:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also version 1.9.0.10 of the recipe doesn't have necessary PROVIDES and
results in conflicts with mesa and other gl/gles providers.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     | 26 ----------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb

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
-- 
1.9.3


