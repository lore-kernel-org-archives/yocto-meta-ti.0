Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C814AE01757
	for <meta-ti@yoctoproject.org>; Tue,  5 Nov 2013 10:37:58 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 868AC52A79; Tue,  5 Nov 2013 18:37:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131105183758.868AC52A79@arago-project.org>
Date: Tue,  5 Nov 2013 18:37:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with the final 3.12 release
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
X-List-Received-Date: Tue, 05 Nov 2013 18:37:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: b4d07f3b7c7114289e987a50e479a8bd76723b1f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b4d07f3b7c7114289e987a50e479a8bd76723b1f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  4 19:29:32 2013 -0500

linux-ti-staging: update with the final 3.12 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-ti-staging_git.bb => linux-ti-staging_3.12.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
similarity index 95%
rename from recipes-kernel/linux/linux-ti-staging_git.bb
rename to recipes-kernel/linux/linux-ti-staging_3.12.bb
index a1188e9..3abc2f4 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "836c92478128790c75b832d21d1b3ab839fa3ca7"
-PV = "3.11+3.12-rc7"
+SRCREV = "6a59302de4852678ccde5008ce531075c9b683d9"
+PV = "3.12"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


