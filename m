Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F759E00CE4; Fri,  4 Mar 2016 09:12:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D777EE00CD9
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 09:12:58 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6AF3F52A2E; Fri,  4 Mar 2016 17:12:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160304171258.6AF3F52A2E@arago-project.org>
Date: Fri,  4 Mar 2016 17:12:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new verison 3.0.1.0
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
X-List-Received-Date: Fri, 04 Mar 2016 17:12:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: cd70a13b89df564244aa89b36560b425b84d1323
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd70a13b89df564244aa89b36560b425b84d1323

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Mar  4 04:51:51 2016 +0000

multiprocmgr: Update to new verison 3.0.1.0

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


