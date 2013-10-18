Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF32EE0167D
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 09:47:23 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 31C1352972; Fri, 18 Oct 2013 16:47:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131018164723.31C1352972@arago-project.org>
Date: Fri, 18 Oct 2013 16:47:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3. 12-rc5 and latest merges of feature trees
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
X-List-Received-Date: Fri, 18 Oct 2013 16:47:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: f61008a20340373247ebfd8f381e377b21f11afe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f61008a20340373247ebfd8f381e377b21f11afe

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Oct 18 12:25:30 2013 -0400

linux-ti-staging: update to 3.12-rc5 and latest merges of feature trees

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index f26b223..57628df 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "04faa81d0573686847c8c74f4c67c8a69c13ce9f"
-PV = "3.11+3.12-rc4"
+SRCREV = "eb765a394c625083399b956322451eb6872f16dc"
+PV = "3.11+3.12-rc5"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


