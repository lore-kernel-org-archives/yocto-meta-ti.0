Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 604E8E01695
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 269B552A98; Mon, 30 Sep 2013 20:37:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203737.269B552A98@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.12-rc3 with rpmsg, connectivity, audio and display merged
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 1723eb00890b8e429cce81489d5a7b1b39efceb3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1723eb00890b8e429cce81489d5a7b1b39efceb3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 18:24:36 2013 -0400

linux-ti-staging: update to 3.12-rc3 with rpmsg, connectivity, audio and display merged

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 778ea7f..a91d101 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -28,8 +28,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
-PV = "3.11+3.12-rc1"
+SRCREV = "f7579525de9f1d6086c407a6980f4f1c1c574256"
+PV = "3.11+3.12-rc3"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


