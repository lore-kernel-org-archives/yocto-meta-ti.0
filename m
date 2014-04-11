Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8CDAE006C0
	for <meta-ti@yoctoproject.org>; Fri, 11 Apr 2014 12:59:42 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C9E44529BB; Fri, 11 Apr 2014 19:59:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140411195940.C9E44529BB@arago-project.org>
Date: Fri, 11 Apr 2014 19:59:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest stable 3.12. 17 version
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
X-List-Received-Date: Fri, 11 Apr 2014 19:59:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cffa34a876152d784d9f0e48f2bfd787e158da36
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cffa34a876152d784d9f0e48f2bfd787e158da36

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Apr  8 20:48:38 2014 +0000

linux-ti-staging: update to the latest stable 3.12.17 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 1668c28..96be621 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,12 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-# Corresponds to tag ti2013.12.01
-SRCREV = "2325bb5680986b6914d8fd0b5d0bdc20081fe8d3"
-PV = "3.12.10"
+SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
+PV = "3.12.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "k+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


