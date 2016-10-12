Return-Path: <poojaprajod@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AC1DE00D03; Wed, 12 Oct 2016 09:33:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8229E00CFE
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 09:33:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CGX6Jf030316
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 11:33:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CGX6vO024552
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 11:33:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 11:33:06 -0500
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CGX4lF023001;	Wed, 12 Oct 2016 11:33:05 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1476289982-25015-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:52:03 -0800
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-ti/libdce] libdce: SRCREV update to 3.00.12.00
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
Date: Wed, 12 Oct 2016 16:33:16 -0000
X-Original-Date: Wed, 12 Oct 2016 22:03:02 +0530
X-List-Received-Date: Wed, 12 Oct 2016 16:33:16 -0000
Content-Type: text/plain

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.10.01.bb | 15 ---------------
 recipes-multimedia/libdce/libdce_3.00.12.00.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 recipes-multimedia/libdce/libdce_3.00.10.01.bb
 create mode 100644 recipes-multimedia/libdce/libdce_3.00.12.00.bb

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
diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
new file mode 100644
index 0000000..6905bc9
--- /dev/null
+++ b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
@@ -0,0 +1,15 @@
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
+PR = "r1"
-- 
1.9.1


