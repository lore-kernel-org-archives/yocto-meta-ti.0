Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53637E007C8
	for <meta-ti@yoctoproject.org>; Sat,  7 Dec 2013 13:41:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8B09A52A65; Sat,  7 Dec 2013 21:41:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131207214127.8B09A52A65@arago-project.org>
Date: Sat,  7 Dec 2013 21:41:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.12. 2 plus fixes in connectivity, pm, rpmsg etc.
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
X-List-Received-Date: Sat, 07 Dec 2013 21:41:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 802a01fd247e8ae892ddfa133eb8258102205f4d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=802a01fd247e8ae892ddfa133eb8258102205f4d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec  4 15:06:07 2013 -0500

linux-ti-staging: update to 3.12.2 plus fixes in connectivity, pm, rpmsg etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index dd93168..8965941 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "95cb8e7d94bdbc6cd26b6d2ab074343a8dd81b7a"
-PV = "3.12.1"
+SRCREV = "c077af8403a538e129164081cbe7527f22bb56b6"
+PV = "3.12.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


