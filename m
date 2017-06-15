Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8F49E00B9E; Thu, 15 Jun 2017 09:56:49 -0700 (PDT)
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
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5F1AE00B99
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 09:56:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FGuf33022410
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 11:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497545801;
	bh=VaV4VlaHwQhTwa141GGl7HEea1EfYENUVHLI6nfIBfs=;
	h=From:To:CC:Subject:Date;
	b=V+SOY7R9DCzamxq3ZWuxnVP/ETpQJGpOFnSx8e3DcOrnfGSt8MFRAmUnKTW0wcP8m
	ntSskpk9lbXWTTOPFrzbdiAvznykCMgJU5jC+eZfEI2pqIH8rDPTRRM3Iqjw0MWZ3N
	pEtUwVC2ituy5Os6BRX22nOyGveykYB6DdVcIbOY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FGufCT006361
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 11:56:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 11:56:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FGuebx014761;	Thu, 15 Jun 2017 11:56:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Jun 2017 12:51:04 -0400
Message-ID: <1497545464-10491-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 2/2] openmp-rtos: bump SRCREV to version 2.6.1.0
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
X-List-Received-Date: Thu, 15 Jun 2017 16:56:50 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* fixed typo in commit message

 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 3ec3aff..4fede03 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_06_00_00"
+PV = "2_06_01_00"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -15,7 +15,7 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
 SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
 "
 
-SRCREV = "a9aae66f792e999dafbd2e0bd834f98122398c4c"
+SRCREV = "bb04bfcb184e313300b95cd42089654da5c2706b"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-- 
2.7.4


