Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A507E00C64; Mon, 14 Mar 2016 12:10:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 170EAE008C1
	for <meta-ti@yoctoproject.org>; Mon, 14 Mar 2016 12:09:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2EJ9t9C008377
	for <meta-ti@yoctoproject.org>; Mon, 14 Mar 2016 14:09:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2EJ9tZp027597
	for <meta-ti@yoctoproject.org>; Mon, 14 Mar 2016 14:09:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Mar 2016 14:09:54 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2EJ9oeS023046;	Mon, 14 Mar 2016 14:09:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 14 Mar 2016 15:09:47 -0400
Message-ID: <1457982587-26111-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dsptop: Upgrade to 1.3.0
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
X-List-Received-Date: Mon, 14 Mar 2016 19:10:00 -0000
Content-Type: text/plain

* This upgrade includes debugss support for AM57xx EVM PG2.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dsptop/dsptop.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 04bf060..956dc31 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -1,7 +1,7 @@
-# This corresponds to version 1.2.0
-SRCREV = "7dca008bec245e4292897e2eea7b2edb0c51cd2b"
-PV = "1.2.0"
-INC_PR = "r2"
+# This corresponds to version 1.3.0
+SRCREV = "4d92879b632ba70402b61fa65cc58f5373eb5217"
+PV = "1.3.0"
+INC_PR = "r0"
 
 SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


