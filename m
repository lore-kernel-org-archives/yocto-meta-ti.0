Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0762E00BDC; Fri, 23 Jun 2017 13:35:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63EF1E00B18
	for <meta-ti@yoctoproject.org>; Fri, 23 Jun 2017 13:35:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F28720C20;
	Fri, 23 Jun 2017 20:35:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id W7RJeKIM6alk; Fri, 23 Jun 2017 20:35:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 297B5208FB;
	Fri, 23 Jun 2017 20:35:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 38C6C16250E;
	Fri, 23 Jun 2017 16:35:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Jun 2017 16:35:20 -0400
Message-Id: <1498250124-22003-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] edme3-lld-rtos: drop ti-staging.inc and fix file-rdeps QA check
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
X-List-Received-Date: Fri, 23 Jun 2017 20:35:31 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 7fd778a..f524478 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -1,6 +1,5 @@
 require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
 
 PR = "${INC_PR}.1"
 
@@ -111,7 +110,7 @@ do_install () {
     cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
 }
 
-INSANE_SKIP_${PN}-dev = "arch ldflags"
+INSANE_SKIP_${PN}-dev = "arch ldflags file-rdeps"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
-- 
2.7.4


