Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E64ECE01472
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:25:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 88A4952A21; Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130318232512.88A4952A21@arago-project.org>
Date: Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest merge of 3.8.3
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
X-List-Received-Date: Mon, 18 Mar 2013 23:25:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d3e7ad317131fbf16bb6922114daee6a41d3ea27
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d3e7ad317131fbf16bb6922114daee6a41d3ea27

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 14:33:32 2013 -0400

linux-ti-staging: update to the latest merge of 3.8.3

Switch to using the official git.ti.com URL instead of temp gitorious.ti.com

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index dfef76d..cfd4da0 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -39,13 +39,13 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "e69f39916783a559c499e264359edea315ef44fd"
-PV = "3.8.2"
+SRCREV = "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
+PV = "3.8.3"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 
-SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
 


