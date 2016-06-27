Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A182E00CE5; Mon, 27 Jun 2016 11:31:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 820F7E00CCD
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 11:31:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RIVKnD025606
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:31:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RIVKis020110
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:31:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 13:31:20 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5RIVICU031505;	Mon, 27 Jun 2016 13:31:20 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Jun 2016 14:31:06 -0400
Message-ID: <1467052268-22676-4-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1467052268-22676-1-git-send-email-jsobota@ti.com>
References: <1467052268-22676-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 4/6] rm-lld: Bump version
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
X-List-Received-Date: Mon, 27 Jun 2016 18:31:25 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/rm-lld/rm-lld.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
index 70d9b5b..4236fd2 100644
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -7,15 +7,15 @@ RM_LLD_GIT_PROTOCOL = "git"
 RM_LLD_GIT_BRANCH = "master"
 RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
 
-# Below commit ID corresponds to DEV.RM_LLD.02.02.00.01
-RM_LLD_SRCREV = "841f2df9726f456d6c026c0aa03095699962d048"
+# Below commit ID corresponds to "DEV.RM_LLD.02.02.00.02"
+RM_LLD_SRCREV = "6165053f88d1ccb5083f797d24800d5400804647"
 
 BRANCH = "${RM_LLD_GIT_BRANCH}"
 SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${RM_LLD_SRCREV}"
 
-PV = "02.02.00.01"
-INC_PR = "r0"
+PV = "02.02.00.02"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
 
-- 
1.7.10.4


