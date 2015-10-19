Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4702E0049B; Mon, 19 Oct 2015 12:39:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3B56E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:39:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJdF7L026448
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:39:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJdFRe013882
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:39:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:39:15 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJdF1k013538;	Mon, 19 Oct 2015 14:39:15 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:39:14 -0400
Message-ID: <1445283554-9827-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: Update to new version 2.0.1.10
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
X-List-Received-Date: Mon, 19 Oct 2015 19:39:22 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 1d9b326..d9360b5 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -5,9 +5,9 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
 BRANCH = "master"
-# The following commits correspond to DEV.MPM-2.00.01.08
-SRCREV = "ae3d5630b7c7ce5a795d56bd58957175402a0d17"
-PV = "2.0.1.8"
+# The following commits correspond to DEV.MPM-2.00.01.10D
+SRCREV = "4cb6009d6a3c94cea41ae6155a974e9ca44d982f"
+PV = "2.0.1.10"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


