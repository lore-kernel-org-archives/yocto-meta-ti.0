Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91A6BE00AEB; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE354E00A70
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:43 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JlhYp003134
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlhWm014810
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:42 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla79022118;	Tue, 3 Nov 2015 13:47:42 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:15 -0500
Message-ID: <1446580053-16935-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/27] hyplnk-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:45 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |  2 ++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         | 21 +++++++++++++--------
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |  2 ++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
index c33e2df..31b69c2 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -1,5 +1,7 @@
 include hyplnk-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "common-csl-ip hyplnk-lld"
 
 do_compile () {
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 70b5d80..09fec45 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -5,21 +5,26 @@ COMPATIBLE_MACHINE = "keystone"
 
 LLDNAME="hyplnk"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}/COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
+
+HYPLNK_GIT_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git"
+HYPLNK_GIT_PROTOCOL = "git"
+HYPLNK_GIT_BRANCH = "master"
+HYPLNK_GIT_DESTSUFFIX = "git/ti/drv/${LLDNAME}"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
-FILESPATH_prepend := "${THISDIR}/files"
 # Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05
-SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
+HYPLNK_SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
+
+BRANCH="${HYPLNK_GIT_BRANCH}"
+SRC_URI = "${HYPLNK_GIT_URI};destsuffix=${HYPLNK_GIT_DESTSUFFIX};protocol=${HYPLNK_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${HYPLNK_SRCREV}"
 
 PV = "2.1.0.5"
-PR = "r1"
+INC_PR = "r2"
 
 DEVICELIST = " k2h \
                k2k \
                k2e \
 "
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/${LLDNAME}"
+S = "${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index 8be072c..e20ad1f 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -1,5 +1,7 @@
 include hyplnk-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "common-csl-ip"
 
 SRC_URI += "file://init_hyplnk.sh"
-- 
1.9.1


