Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D791E00C41; Thu, 17 Mar 2016 13:57:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6088E00C2B
	for <meta-ti@yoctoproject.org>; Thu, 17 Mar 2016 13:57:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7D02552A26; Thu, 17 Mar 2016 20:57:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160317205731.7D02552A26@arago-project.org>
Date: Thu, 17 Mar 2016 20:57:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jason Reeder : pru-icss: bump SRCREV and PV to bring in updates
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
X-List-Received-Date: Thu, 17 Mar 2016 20:57:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: f5c304d3650c93923a39507ed6310696b6524a7a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5c304d3650c93923a39507ed6310696b6524a7a

Author: Jason Reeder <jreeder@ti.com>
Date:   Thu Mar 17 03:58:30 2016 +0000

pru-icss: bump SRCREV and PV to bring in updates

Due to bug fixes and updates the package version is being
incremented to 4.0.2. The commit ID is also being updated
to reflect these changes.

Signed-off-by: Jason Reeder <jreeder@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 2d78fa5..075ac27 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "6f42b6006ba7a98c7ad9075424b8f77e8d531ab0"
+SRCREV = "804b548e69ef9fdf44445f6d0968d81cb8a1e7b4"
 
-PV = "4.0.1"
+PV = "4.0.2"
 PR = "r2"
 
 require recipes-ti/includes/ti-paths.inc


