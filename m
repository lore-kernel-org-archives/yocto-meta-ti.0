Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42B5EE017B6
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 07:42:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 77D56529D3; Wed, 30 Oct 2013 14:42:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131030144235.77D56529D3@arago-project.org>
Date: Wed, 30 Oct 2013 14:42:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3. 12-rc7 and latest merges of feature trees
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
X-List-Received-Date: Wed, 30 Oct 2013 14:42:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 7e054d1277cfe3b8d59725930cd42177cef1d9f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7e054d1277cfe3b8d59725930cd42177cef1d9f0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct 29 17:11:53 2013 -0400

linux-ti-staging: update to 3.12-rc7 and latest merges of feature trees

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index ec86506..a1188e9 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "eb765a394c625083399b956322451eb6872f16dc"
-PV = "3.11+3.12-rc5"
+SRCREV = "836c92478128790c75b832d21d1b3ab839fa3ca7"
+PV = "3.11+3.12-rc7"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


