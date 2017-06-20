Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8391E00B2E; Tue, 20 Jun 2017 13:33:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F0FEE00AF0
	for <meta-ti@yoctoproject.org>; Tue, 20 Jun 2017 13:33:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5KKXUbv010364
	for <meta-ti@yoctoproject.org>; Tue, 20 Jun 2017 15:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497990810;
	bh=K19x8whVrfRXMVh4BWRa4N/EfnQFHhv3J0kAvuid1yU=;
	h=From:To:CC:Subject:Date;
	b=UhmS3j/K0G68z8IQp5bcGLfTOTGbD4Y8DUgDpoY+t31jAgu9qqBR2rVclDu7ZDdPT
	kUIQaAwBdU563JnFIPR+d9Zh4GmcJEBFxWx2Wf6BiYruU10z4x3DHrYn7ugDV/dp6I
	gJ4Za3w6tSAv1V/cxBtXfLoKY4DdNzXI0McNngic=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5KKXUoV014094
	for <meta-ti@yoctoproject.org>; Tue, 20 Jun 2017 15:33:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Jun 2017 15:33:29 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5KKXTr6029705;	Tue, 20 Jun 2017 15:33:29 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Jun 2017 16:33:28 -0400
Message-ID: <1497990808-5652-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] multiprocmgr-rtos: Update to remove host contamination warning
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
X-List-Received-Date: Tue, 20 Jun 2017 20:33:33 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
index c88f0d7..4147ee2 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -6,7 +6,7 @@ require recipes-ti/multiprocmgr/multiprocmgr.inc
 
 DEPENDS = "ti-cgt6x-native"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 PACKAGES =+ "${PN}-test"
 FILES_${PN}-test = "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
@@ -22,8 +22,9 @@ do_compile() {
 }
 
 do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${MPM_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
 
     # Copy C66x binaries
     install -d ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin
-- 
1.9.1


