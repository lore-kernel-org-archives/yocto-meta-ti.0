Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6343E00509; Tue, 22 Mar 2016 13:26:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4384E00509
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 13:26:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 621EE529AD; Tue, 22 Mar 2016 20:26:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160322202614.621EE529AD@arago-project.org>
Date: Tue, 22 Mar 2016 20:26:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pktlib: Upgrade to version 2.1.0.7
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
X-List-Received-Date: Tue, 22 Mar 2016 20:26:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c93678aa08bc0df0f1f36a84afe48723406de58e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c93678aa08bc0df0f1f36a84afe48723406de58e

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Mar 23 01:58:49 2016 +0000

pktlib: Upgrade to version 2.1.0.7

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index 9a45340..341391e 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -9,14 +9,14 @@ PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
 PKTLIB_GIT_PROTOCOL = "git"
 PKTLIB_GIT_BRANCH = "master"
 
-# Corresponds to DEV.PKTLIB.2.1.0.6
-PKTLIB_SRCREV = "2aa4843d79c344c2d76d0d5d32ecda3d7213d514"
+# Corresponds to DEV.PKTLIB.2.1.0.7
+PKTLIB_SRCREV = "22f66931964c25f83d1971f7eb78902d10c17d8a"
 
 BRANCH = "${PKTLIB_GIT_BRANCH}"
 SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PKTLIB_SRCREV}"
 
-PV = "2.1.0.6"
+PV = "2.1.0.7"
 PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"


