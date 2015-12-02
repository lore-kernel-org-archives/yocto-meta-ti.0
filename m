Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94B62E00404; Tue,  1 Dec 2015 19:06:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5F93E00321
	for <meta-ti@yoctoproject.org>; Tue,  1 Dec 2015 19:06:24 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 821C152997; Wed,  2 Dec 2015 03:06:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151202030624.821C152997@arago-project.org>
Date: Wed,  2 Dec 2015 03:06:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jason Reeder : pru-icss: bump SRCREV and PV due to bug fixes
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
X-List-Received-Date: Wed, 02 Dec 2015 03:06:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bdd8a5c7a80fd3cfe9afb37352d541bd18a22c6c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bdd8a5c7a80fd3cfe9afb37352d541bd18a22c6c

Author: Jason Reeder <jreeder@ti.com>
Date:   Tue Dec  1 05:17:14 2015 +0000

pru-icss: bump SRCREV and PV due to bug fixes

Due to bug fixes and updates the package version is being
incremented to 4.0.1. The commit ID is also being updated
to reflect these changes.

Signed-off-by: Jason Reeder <jreeder@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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


