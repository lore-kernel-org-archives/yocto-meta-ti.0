Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98C5BE00CBE; Mon, 21 Mar 2016 07:51:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0828CE00973
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 07:51:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LEpGKa015171
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LEpGMb001305
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 09:51:16 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LEpFkl000744;	Mon, 21 Mar 2016 09:51:16 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 10:51:05 -0400
Message-ID: <1458571873-12889-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] rm-lld: Upgrade to version 2.2.0.1
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
X-List-Received-Date: Mon, 21 Mar 2016 14:51:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/rm-lld/rm-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld.inc b/recipes-bsp/rm-lld/rm-lld.inc
index be71761..70d9b5b 100644
--- a/recipes-bsp/rm-lld/rm-lld.inc
+++ b/recipes-bsp/rm-lld/rm-lld.inc
@@ -7,14 +7,14 @@ RM_LLD_GIT_PROTOCOL = "git"
 RM_LLD_GIT_BRANCH = "master"
 RM_LLD_GIT_DESTSUFFIX = "git/ti/drv/rm"
 
-# Below commit ID corresponds to DEV.RM_LLD.02.02.00.00
-RM_LLD_SRCREV = "48fc05bf1835f76760da4341a4c551398aeeb7cd"
+# Below commit ID corresponds to DEV.RM_LLD.02.02.00.01
+RM_LLD_SRCREV = "841f2df9726f456d6c026c0aa03095699962d048"
 
 BRANCH = "${RM_LLD_GIT_BRANCH}"
 SRC_URI = "${RM_LLD_GIT_URI};destsuffix=${RM_LLD_GIT_DESTSUFFIX};protocol=${RM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${RM_LLD_SRCREV}"
 
-PV = "02.02.00.00"
+PV = "02.02.00.01"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone"
-- 
1.9.1


