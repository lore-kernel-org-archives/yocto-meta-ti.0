Return-Path: <jreeder@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34750E007D5; Mon, 30 Nov 2015 15:17:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30A9FE007D5
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 15:17:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAUNHGoJ004338
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 17:17:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAUNHGcx021628
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 17:17:16 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Nov 2015 17:17:16 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAUNHGmW000357;	Mon, 30 Nov 2015 17:17:16 -0600
Received: from localhost (uda0273976.am.dhcp.ti.com [128.247.125.230])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	tAUNHG924423; Mon, 30 Nov 2015 17:17:16 -0600 (CST)
From: Jason Reeder <jreeder@ti.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Mon, 30 Nov 2015 17:17:14 -0600
Message-ID: <1448925434-8505-1-git-send-email-jreeder@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Dec 2015 19:00:08 -0800
Cc: Jason Reeder <jreeder@ti.com>
Subject: [PATCH] pru-icss: bump SRCREV and PV due to bug fixes
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
X-List-Received-Date: Mon, 30 Nov 2015 23:17:20 -0000
Content-Type: text/plain

Due to bug fixes and updates the package version is being
incremented to 4.0.1. The commit ID is also being updated
to reflect these changes.

Signed-off-by: Jason Reeder <jreeder@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 802521b..30bb3c3 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "476289eb7c3a91977bae84aea55c56f3120b48ea"
+SRCREV = "c21ff82cf0a8864a66505be88be1d579a66a983a"
 
-PV = "4.0.0.0"
+PV = "4.0.1"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
-- 
1.9.1


