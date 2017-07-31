Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59C74E00C41; Mon, 31 Jul 2017 04:13:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7A40E00C37
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 04:13:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VBD9kS025401
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 06:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501499589;
	bh=fskqI2f6idiiMEA3fPv1UFCPW7ooqA8o3mC1/YV7ugA=;
	h=From:To:CC:Subject:Date;
	b=VI4VgcAcHAJJANgw//bwbEARvggS9guVlBOd1GujkLGRBU2aYxOPBFwTkVp0ARf90
	HjTPg7n0Qvkiq/h0IR57BXzjgOkkXJEUMAFAGXlBKTmJv22DZtmoBLbn62iM2SJCBP
	KTCsIE6mrs/VKhAM5zxwtNQhk5BtEH4m6cKmJ8zM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBD9RU003323
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 06:13:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 06:13:09 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBD7Pi001119;
	Mon, 31 Jul 2017 06:13:08 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Jul 2017 16:43:05 +0530
Message-ID: <1501499585-100353-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] libdce: Update PV and SRCREV
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
X-List-Received-Date: Mon, 31 Jul 2017 11:13:11 -0000
Content-Type: text/plain

Updates to dce_test to print additional
extendedError for VC1 and MPEG2

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.12.00.bb | 15 ---------------
 recipes-multimedia/libdce/libdce_3.00.13.00.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 recipes-multimedia/libdce/libdce_3.00.12.00.bb
 create mode 100644 recipes-multimedia/libdce/libdce_3.00.13.00.bb

diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
deleted file mode 100644
index 1a2c104..0000000
--- a/recipes-multimedia/libdce/libdce_3.00.12.00.bb
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
-SRCREV = "398dd27e7f3181fff9e3d910b418c69f1493f52f"
-
-PR = "r4"
-
-S = "${WORKDIR}/git"
-EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
diff --git a/recipes-multimedia/libdce/libdce_3.00.13.00.bb b/recipes-multimedia/libdce/libdce_3.00.13.00.bb
new file mode 100644
index 0000000..e2f3c28
--- /dev/null
+++ b/recipes-multimedia/libdce/libdce_3.00.13.00.bb
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
+SRCREV = "75810b7bb53d2d076a96c2d1e2f8c61b3c12cb6b"
+
+PR = "r5"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.9.1


