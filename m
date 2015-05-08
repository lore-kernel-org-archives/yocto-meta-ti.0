Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E97D8E009F3; Fri,  8 May 2015 07:10:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8613E00A1E
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 07:10:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48E9x8c004542
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:09:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48E9xfY019815
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:09:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 09:09:59 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48E9xUc016498;	Fri, 8 May 2015 09:09:59 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 8 May 2015 10:09:53 -0400
Message-ID: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-xdais: Move LIC_FILES_CHKSUM into recipe.
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
X-List-Received-Date: Fri, 08 May 2015 14:10:09 -0000
Content-Type: text/plain

* This is version specific, so it should not be in a version-agnostic
  include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
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
-- 
1.7.9.5


