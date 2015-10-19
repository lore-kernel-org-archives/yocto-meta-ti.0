Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2902E006D1; Mon, 19 Oct 2015 14:11:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED5D5E0050E
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9D8EB52A8F; Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211146.9D8EB52A8F@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hyplnk-lld: Update to new version 2.1.0.5
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 596a5704a1edb59f03fa18ca4b160dbdd3a2a675
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=596a5704a1edb59f03fa18ca4b160dbdd3a2a675

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:24:39 2015 +0000

hyplnk-lld: Update to new version 2.1.0.5

- Remove seperate build for dynamic and static cases
  Make now creates two test binaries one use dynamic and other using
  static library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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


