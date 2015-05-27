Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E3EAE0095D; Wed, 27 May 2015 05:15:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00341E00293
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 05:15:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RCFp8I020427
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:15:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RCFpj1026928
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:15:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 07:15:51 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4RCFpk7008813;	Wed, 27 May 2015 07:15:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 08:15:45 -0400
Message-ID: <1432728947-4837-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] ti-framework-components: Move LIC_FILES_CHKSUM into recipe.
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
X-List-Received-Date: Wed, 27 May 2015 12:15:55 -0000
Content-Type: text/plain

* This is version specific, so it should not be in a version-agnostic
  include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-framework-components.inc                    |    4 ----
 .../ti-framework-components_2.26.00.01.bb          |    3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
index f2244db..46f6cfd 100644
--- a/recipes-ti/framework-components/ti-framework-components.inc
+++ b/recipes-ti/framework-components/ti-framework-components.inc
@@ -3,13 +3,9 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/f
 SECTION = "devel"
 LICENSE = "BSD"
 
-LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
-
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r1"
-
 S = "${WORKDIR}/framework_components_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
index 7abe793..9570678 100644
--- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
+++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
@@ -1,6 +1,9 @@
 require ti-framework-components.inc
 
 PV = "2_26_00_01"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
 
 SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
 SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"
-- 
1.7.9.5


