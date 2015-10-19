Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E2D0E0049B; Mon, 19 Oct 2015 12:24:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7083E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:24:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJOfws012128
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:24:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJOfeq012836
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:24:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:24:41 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJOfrM002235;	Mon, 19 Oct 2015 14:24:41 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:24:39 -0400
Message-ID: <1445282679-8973-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hyplnk-lld: Update to new version 2.1.0.5
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
X-List-Received-Date: Mon, 19 Oct 2015 19:24:48 -0000
Content-Type: text/plain

- Remove seperate build for dynamic and static cases
  Make now creates two test binaries one use dynamic and other using
  static library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   14 +++-----------
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |    7 ++++---
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
index 8212c97..c33e2df 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -2,22 +2,14 @@ include hyplnk-lld.inc
 
 DEPENDS = "common-csl-ip hyplnk-lld"
 
-CHOICELIST = " yes \
-               no  \
-"
-
 do_compile () {
 	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		HYPLNK_SRC_DIR="${S}"
 	for device in ${DEVICELIST}
 	do
-		for choice in ${CHOICELIST}
-		do
-			make -f makefile_armv7 tests examples \
-				PDK_INSTALL_PATH="${STAGING_INCDIR}" \
-				DEVICE="$device" HYPLNK_SRC_DIR="${S}" \
-				USEDYNAMIC_LIB="$choice"
-		done
+		make -f makefile_armv7 tests examples \
+			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
 	done
 }
 
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 7f46b7d..70b5d80 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -9,10 +9,11 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=6233
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
-# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.02
-SRCREV = "8451586025a0cf561ed9bc6ab70a2cad88a7e95e"
+FILESPATH_prepend := "${THISDIR}/files"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05
+SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
 
-PV = "2.1.0.2"
+PV = "2.1.0.5"
 PR = "r1"
 
 DEVICELIST = " k2h \
-- 
1.7.9.5


