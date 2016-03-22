Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63D74E0086B; Tue, 22 Mar 2016 12:19:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F2E9E00509
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:19:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MJJUbA015122
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:19:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MJJUMs022935
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 14:19:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Mar 2016 14:19:29 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2MJJUit025049;	Tue, 22 Mar 2016 14:19:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 22 Mar 2016 15:19:29 -0400
Message-ID: <1458674369-30105-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gdbc6x: Bump SRCREV so that all machines use same branch
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
X-List-Received-Date: Tue, 22 Mar 2016 19:19:35 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
index 4513a91..4d77117 100644
--- a/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -1,13 +1,9 @@
 # This corresponds to version 1.1.0
-SRCREV = "1ab06f8bcfe7540754558bac331a0312c4b59142"
-SRCREV_keystone = "913f18db6325e08f634be6dda91f57fb0ec8c838"
+SRCREV = "653f7d0a345bede0542326090b622b885545c712"
 
 PV = "1.1.0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-BRANCH_keystone = "k2h"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


