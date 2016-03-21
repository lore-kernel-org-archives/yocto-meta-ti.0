Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF97DE00CC0; Mon, 21 Mar 2016 07:51:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62D4DE00C90
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 07:51:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LEpHBT015625
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LEpH1x024803
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 09:51:17 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LEpFko000744;	Mon, 21 Mar 2016 09:51:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 10:51:08 -0400
Message-ID: <1458571873-12889-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] hyplnk-lld: Upgrade to version 2.1.0.6
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
X-List-Received-Date: Mon, 21 Mar 2016 14:51:24 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 9f7ac6a..9ab7339 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -13,15 +13,15 @@ HYPLNK_GIT_PROTOCOL = "git"
 HYPLNK_GIT_BRANCH = "master"
 HYPLNK_GIT_DESTSUFFIX = "git/ti/drv/${LLDNAME}"
 
-# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05A
-HYPLNK_SRCREV = "2acb36a78fee9691a9433f0ce23cf00561123934"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.06
+HYPLNK_SRCREV = "a1953ca33114c5a4daca6289a7fb75b201f566d2"
 
 BRANCH="${HYPLNK_GIT_BRANCH}"
 SRC_URI = "${HYPLNK_GIT_URI};destsuffix=${HYPLNK_GIT_DESTSUFFIX};protocol=${HYPLNK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${HYPLNK_SRCREV}"
 
-PV = "2.1.0.5"
-INC_PR = "r3"
+PV = "2.1.0.6"
+INC_PR = "r0"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2e-evm  = "k2e"
-- 
1.9.1


