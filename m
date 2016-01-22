Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A65B8E0085A; Thu, 21 Jan 2016 21:52:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA401E0085A
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 21:52:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D03E152A4B; Fri, 22 Jan 2016 05:52:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160122055217.D03E152A4B@arago-project.org>
Date: Fri, 22 Jan 2016 05:52:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: split out systest defconfig into own recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 05:52:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 085f3d58e4293806683a49c084ce49181eb97f1d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=085f3d58e4293806683a49c084ce49181eb97f1d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jan 20 05:49:37 2016 +0000

linux-ti-staging: split out systest defconfig into own recipe

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../defconfig}                                     |    0
 .../keystone/defconfig}                            |    0
 .../linux/linux-ti-staging-systest_4.1.bb          |    5 +++++
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |    1 -
 recipes-kernel/linux/setup-defconfig.inc           |   10 +++++++++-
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.1/configs/systest
rename to recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-4.1/keystone/configs/systest
rename to recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
new file mode 100644
index 0000000..30962e6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
@@ -0,0 +1,5 @@
+require linux-ti-staging_4.1.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
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


