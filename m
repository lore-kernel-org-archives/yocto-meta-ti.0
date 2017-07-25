Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38B9EE00BC0; Tue, 25 Jul 2017 14:06:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75480E00B43
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 14:06:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6PL6fu7026662
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 16:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501016801;
	bh=Iribw9dcylYyVSpoNV3ylyDgv4KByWELaF+xkZozK3w=;
	h=From:To:Subject:Date;
	b=SBIHAetAuTuSdN1t/NnNWTYWUSeEyWjn1mPvc+tLITHUAkc6F260Ga4DP0NKay6qy
	gIoN9xFH7rhKl6HPL7o5Wiq/09m3Of7kTjOZG+nNFRKQry7hM4aU3tn7+R/NCcp0QM
	I9s+ER6ctZsPXKLSxJpuxn+uPpbjnwM7p3v7d4fs=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PL6fwo029098
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 16:06:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 16:06:40 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6PL6fIV004221	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 16:06:41
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Jul 2017 16:06:38 -0500
Message-ID: <1501016801-28357-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 1/4] ti-paths.inc: added path for TI CGT6x 7.x.x
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
X-List-Received-Date: Tue, 25 Jul 2017 21:06:43 -0000
Content-Type: text/plain

This directory path is for installing TI CGT6x 7.x.x as well as
invoking the installation from other recipes.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/includes/ti-paths.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a7ea9a7..ebd4b8a 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -55,7 +55,7 @@ export VLIB_C66_INSTALL_DIR_RECIPE        = "${installdir}/ti-vlib-c66x-tree"
 export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
-
+export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -101,6 +101,7 @@ export VLIB_C66_INSTALL_DIR        = "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DI
 export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
 export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
+export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
-- 
1.9.1


