Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6420E009A7; Fri, 23 May 2014 12:17:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61B0AE009E7
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3554752A8F; Fri, 23 May 2014 19:17:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191749.3554752A8F@arago-project.org>
Date: Fri, 23 May 2014 19:17:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : linux-ti-staging: Make files directory version specific
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
X-List-Received-Date: Fri, 23 May 2014 19:17:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ecfdfaa6fd53c94e73e228788eeb589920bf1ad1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ecfdfaa6fd53c94e73e228788eeb589920bf1ad1

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Thu May 22 22:16:14 2014 +0000

linux-ti-staging: Make files directory version specific

* As we add the next version of the linux-ti-staging kernel there
  will be a different list of config fragments, removed patches,
  etc.  For this reason it makes sense to have the file directory
  be version specific

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |    0
 .../baseport.cfg                                   |    0
 .../connectivity.cfg                               |    0
 .../defconfig                                      |    0
 .../ipc.cfg                                        |    0
 .../systest.cfg                                    |    0
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    3 +++
 7 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
rename to recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
diff --git a/recipes-kernel/linux/linux-ti-staging/baseport.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/baseport.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/connectivity.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging-3.12/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/defconfig
rename to recipes-kernel/linux/linux-ti-staging-3.12/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/ipc.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/systest.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index ac30ab5..dbb49b3 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -8,6 +8,9 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.12:"
+
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
 


