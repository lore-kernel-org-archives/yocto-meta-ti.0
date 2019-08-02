Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 119B6E00E16; Fri,  2 Aug 2019 13:16:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC352E00E0B
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 13:16:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2057340BDE;
	Fri,  2 Aug 2019 20:16:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Eam_jSu_Pp3J; Fri,  2 Aug 2019 20:16:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 08B0340BDC;
	Fri,  2 Aug 2019 20:16:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 21B54171E1F;
	Fri,  2 Aug 2019 16:16:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Aug 2019 16:16:20 -0400
Message-Id: <1564776980-35936-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] recipes: suppress potential host contamination warnings due to ownership
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
X-List-Received-Date: Fri, 02 Aug 2019 20:16:25 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld_git.bb     | 1 +
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb | 1 +
 recipes-bsp/srio-lld/srio-lld_git.bb     | 1 +
 recipes-ti/ipc/ipc-transport-srio_git.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
index f310b17..12b1d06 100644
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -14,4 +14,5 @@ do_compile () {
 
 do_install () {
     oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    chown -R root:root ${D}
 }
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index 8ef3c82..08124d7 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -18,6 +18,7 @@ do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
 		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
+	chown -R root:root ${D}
 
 	# Set the generic device library symbolic link to default k2h
 	cd ${D}${libdir}
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
index 48e7633..3797bef 100644
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -17,4 +17,5 @@ do_compile () {
 
 do_install () {
 	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+	chown -R root:root ${D}
 }
diff --git a/recipes-ti/ipc/ipc-transport-srio_git.bb b/recipes-ti/ipc/ipc-transport-srio_git.bb
index f0586d8..ca7f7b6 100644
--- a/recipes-ti/ipc/ipc-transport-srio_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio_git.bb
@@ -13,4 +13,5 @@ do_compile () {
 do_install () {
 	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
 		INSTALL_LIB_BASE_DIR=${D}${libdir}
+	chown -R root:root ${D}
 }
-- 
2.7.4


