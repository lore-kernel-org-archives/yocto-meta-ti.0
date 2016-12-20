Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 749E3E00DE5; Tue, 20 Dec 2016 08:25:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 629 seconds by postgrey-1.32 at yocto-www;
	Tue, 20 Dec 2016 08:24:58 PST
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D51E3E00C22
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 08:24:58 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBKGESWp029964
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 10:14:28 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBKGESOX005245
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 10:14:28 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 10:14:28 -0600
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBKGESNF006743;	Tue, 20 Dec 2016 10:14:28 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Dec 2016 11:14:26 -0500
Message-ID: <1482250466-32489-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pruss-lld: set CLEANBROKEN
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
X-List-Received-Date: Tue, 20 Dec 2016 16:25:02 -0000
Content-Type: text/plain

* The Linux binaries are built by the "makefile_armv7".
* pruss-lld provides a "makefile", but it is used for building the
  RTOS binaries.
* This "makefile" requires the ti-pdk-build-rtos package and is broken
  without it, so therefore set CLEANBROKEN instead of pulling in
  unnecessary dependencies.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb | 2 ++
 recipes-bsp/pruss-lld/pruss-lld_git.bb      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
index d994ec8..696f5a7 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS="common-csl-ip pruss-lld osal"
 
 include pruss-lld.inc
 
+CLEANBROKEN = "1"
+
 PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
index 72670f4..451819d 100644
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS="common-csl-ip osal"
 
 include pruss-lld.inc
 
+CLEANBROKEN = "1"
+
 PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


