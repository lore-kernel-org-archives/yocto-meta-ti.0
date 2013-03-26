Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FF32E01474
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 11:36:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CC93052AAA; Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326183618.CC93052AAA@arago-project.org>
Date: Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: Update to latest staging kernel
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
X-List-Received-Date: Tue, 26 Mar 2013 18:36:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 2d10089a70c5c238510f10e29e79c1704d7cfa98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2d10089a70c5c238510f10e29e79c1704d7cfa98

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Mar 22 14:25:47 2013 -0500

linux-ti-staging: Update to latest staging kernel

* Update to the latest 3.8.4 based staging kernel

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 3ff038d..3dc2001 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -40,8 +40,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
-PV = "3.8.3"
+SRCREV = "a91f8e121dbe0b5fb84000d9ae14fac8880c44a7"
+PV = "3.8.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


