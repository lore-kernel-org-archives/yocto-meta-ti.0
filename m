Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AFF0E00B71; Tue, 15 Nov 2016 19:34:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D4C9E00997
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 19:34:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AC45852AC6; Wed, 16 Nov 2016 03:34:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161116033452.AC45852AC6@arago-project.org>
Date: Wed, 16 Nov 2016 03:34:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jason Reeder : pru-icss: bump SRCREV and PV due to updates
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
X-List-Received-Date: Wed, 16 Nov 2016 03:34:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4f1c3bf31ff106f36ddf7f8a1c8e9a059362e93c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f1c3bf31ff106f36ddf7f8a1c8e9a059362e93c

Author: Jason Reeder <jreeder@ti.com>
Date:   Wed Nov 16 04:36:28 2016 +0000

pru-icss: bump SRCREV and PV due to updates

Due to bug fixes and updates, the package version number
is being incremented to 5.1.0. The commit ID is also being
updated to reflect these changes.

Signed-off-by: Jason Reeder <jreeder@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 1fbfd12..c8c472e 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "5e08c1f7c1f1d642b508e8b9cea246d9d8ef54c8"
+SRCREV = "4efd227bebd8eb0bc12f40fac043dc9c26d4f8c3"
 
-PV = "5.0.1"
+PV = "5.1.0"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc


