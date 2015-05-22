Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5C66E009ED; Fri, 22 May 2015 11:18:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58F9FE009ED
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 11:18:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6CEC552A4F; Fri, 22 May 2015 18:18:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522181847.6CEC552A4F@arago-project.org>
Date: Fri, 22 May 2015 18:18:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-xdais: Move LIC_FILES_CHKSUM into recipe.
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
X-List-Received-Date: Fri, 22 May 2015 18:18:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 472737bc11c98eab2d86fcbde7bae7b5ae18e70c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=472737bc11c98eab2d86fcbde7bae7b5ae18e70c

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May  8 20:09:53 2015 +0000

ti-xdais: Move LIC_FILES_CHKSUM into recipe.

* This is version specific, so it should not be in a version-agnostic
  include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/xdais/ti-xdais.inc           |    7 +------
 recipes-ti/xdais/ti-xdais_6.26.01.03.bb |    3 +++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
index 9514ce6..2e7eb13 100644
--- a/recipes-ti/xdais/ti-xdais.inc
+++ b/recipes-ti/xdais/ti-xdais.inc
@@ -3,13 +3,9 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/x
 LICENSE = "GPLv2"
 SECTION = "devel"
 
-LIC_FILES_CHKSUM = "file://xdais_6_26_01_03_manifest.html;md5=a5a675d49db2f658bb98746ec80cda4e"
-
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 
-PR = "r1"
-
 S = "${WORKDIR}/xdais_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
@@ -17,5 +13,4 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xd
 do_install() {
     install -d ${D}${XDAIS_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
-} 
-
+}
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
index 0451b2d..3d35863 100644
--- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
+++ b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
@@ -1,6 +1,9 @@
 require ti-xdais.inc
 
 PV = "6_26_01_03"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://xdais_6_26_01_03_manifest.html;md5=a5a675d49db2f658bb98746ec80cda4e"
 
 SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
 SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"


