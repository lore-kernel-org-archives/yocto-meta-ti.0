Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F568E00BF5; Thu,  3 Mar 2016 14:51:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE638E00BEB
	for <meta-ti@yoctoproject.org>; Thu,  3 Mar 2016 14:51:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u23MpsxS017445
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 16:51:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23Mpsaf018792
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 16:51:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 16:51:53 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u23MprpK003189;	Thu, 3 Mar 2016 16:51:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Mar 2016 17:51:51 -0500
Message-ID: <1457045511-16254-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: Update to new verison 3.0.1.0
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
X-List-Received-Date: Thu, 03 Mar 2016 22:51:59 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Note:
The changes in this version needs corresponding
change in kernel version and hence need to be
coordinated

---
---
 recipes-ti/multiprocmgr/multiprocmgr.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 122ac0f..915ac7a 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -8,11 +8,11 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
 MULTIPROCMGR_GIT_PROTOCOL = "git"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
-# The following commits correspond to DEV.MPM-3.00.00.02
-MULTIPROCMGR_SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
+# The following commits correspond to DEV.MPM-3.00.01.00
+MULTIPROCMGR_SRCREV = ""
 
-PV = "3.0.0.2"
-INC_PR = "r2"
+PV = "3.0.1.0"
+INC_PR = "r0"
 
 BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
 SRC_URI = "${MULTIPROCMGR_GIT_URI};protocol=${MULTIPROCMGR_GIT_PROTOCOL};branch=${BRANCH}"
-- 
1.9.1


