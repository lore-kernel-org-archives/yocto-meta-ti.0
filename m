Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85D3CE005B9; Wed, 27 May 2015 07:10:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51E01E005B9
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:10:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4REAjHJ024443
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:45 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4REAjnR013752
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 09:10:45 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4REAgJI027888;	Wed, 27 May 2015 09:10:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 10:10:35 -0400
Message-ID: <1432735838-7207-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] ti-paths: Add PDK_INSTALL_DIR for RTOS drivers.
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
X-List-Received-Date: Wed, 27 May 2015 14:10:51 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/includes/ti-paths.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 4e6227e..b902cbb 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -43,6 +43,7 @@ export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
 export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
 export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
+export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -76,10 +77,10 @@ export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECI
 export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
 export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
 export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
+export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
 DSPSUFFIX_ti816x = "xe674"
 DSPSUFFIX_ti814x = "xe674"
 DSPSUFFIX ?= "x64P"
-
-- 
1.7.9.5


