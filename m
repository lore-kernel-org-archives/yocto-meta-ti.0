Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4652E00CE1; Mon, 31 Oct 2016 01:41:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97003E00C86
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 01:41:07 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9V8f72O032619
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 03:41:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9V8f6Vu019973
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 03:41:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Oct 2016 03:41:06 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9V8f538009050;
	Mon, 31 Oct 2016 03:41:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Oct 2016 14:07:46 +0530
Message-ID: <1477903066-1422-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libdce: Rename recipe and bump SRCREV
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
X-List-Received-Date: Mon, 31 Oct 2016 08:41:11 -0000
Content-Type: text/plain

Make recipe compatible to 3.00.12.00 version
Includes minor bug fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.10.01.bb | 15 ---------------
 recipes-multimedia/libdce/libdce_git.bb        | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 recipes-multimedia/libdce/libdce_3.00.10.01.bb
 create mode 100644 recipes-multimedia/libdce/libdce_git.bb

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
deleted file mode 100644
index 7adb961..0000000
--- a/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libdrm ti-ipc"
-
-SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "f83e785d2b98404fed9e3a6264bf4945c65abd12"
-
-S = "${WORKDIR}/git"
-EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-
-PR = "r1"
diff --git a/recipes-multimedia/libdce/libdce_git.bb b/recipes-multimedia/libdce/libdce_git.bb
new file mode 100644
index 0000000..60bc140
--- /dev/null
+++ b/recipes-multimedia/libdce/libdce_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
+SRCREV = "281e466ff5b0344f538ec4e76076290e60774516"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+
+PV = "3.00.12.00"
+PR = "r2"
-- 
1.9.1


