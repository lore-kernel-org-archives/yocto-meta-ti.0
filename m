Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CED98E00B9C; Tue, 19 Jan 2016 16:50:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3606 seconds by postgrey-1.32 at yocto-www;
	Tue, 19 Jan 2016 16:50:10 PST
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E5E7E00B37
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 16:50:10 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1800ENB4UPJI90@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 19 Jan 2016 17:49:53 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=3QXp712F-g2Y2_exLPYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F9B5161B39;	Tue,
	19 Jan 2016 18:49:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Jan 2016 18:49:37 -0500
Message-id: <1453247377-3471-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: split out systest defconfig into own recipe
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
X-List-Received-Date: Wed, 20 Jan 2016 00:50:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../configs/systest => linux-ti-staging-systest-4.1/defconfig} |  0
 .../keystone/defconfig}                                        |  0
 ...ux-ti-staging-rt_4.1.bb => linux-ti-staging-systest_4.1.bb} |  4 ----
 recipes-kernel/linux/linux-ti-staging_4.1.bb                   |  1 -
 recipes-kernel/linux/setup-defconfig.inc                       | 10 +++++++++-
 5 files changed, 9 insertions(+), 6 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging-4.1/configs/systest => linux-ti-staging-systest-4.1/defconfig} (100%)
 rename recipes-kernel/linux/{linux-ti-staging-4.1/keystone/configs/systest => linux-ti-staging-systest-4.1/keystone/defconfig} (100%)
 copy recipes-kernel/linux/{linux-ti-staging-rt_4.1.bb => linux-ti-staging-systest_4.1.bb} (69%)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.1/configs/systest
rename to recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest
rename to recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
similarity index 69%
copy from recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
copy to recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
index ae958de..30962e6 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
@@ -3,7 +3,3 @@ require linux-ti-staging_4.1.bb
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
-
-BRANCH = "ti-rt-linux-4.1.y"
-
-SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index a6615aa..e02e5cd 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -7,7 +7,6 @@ inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/multi-kernel.inc
 require recipes-kernel/linux/cmem.inc
 
 # Look in the generic major.minor directory for files
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 2b67bfc..cfad14b 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,14 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-KERNEL_LOCALVERSION ?= ""
+def get_git_revision(p):
+    import subprocess
+
+    try:
+        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+    except OSError:
+        return None
+
+KERNEL_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
-- 
2.2.0


