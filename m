Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 521A3E006D9
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 11:52:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4F6EB52AA5; Mon, 27 Jan 2014 19:52:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140127195204.4F6EB52AA5@arago-project.org>
Date: Mon, 27 Jan 2014 19:52:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to stable 3.12.9, other bugfixes
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
X-List-Received-Date: Mon, 27 Jan 2014 19:52:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 7f2773454b349d2a4d5a9601e6a524c40b664f73
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f2773454b349d2a4d5a9601e6a524c40b664f73

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 27 13:47:17 2014 -0500

linux-ti-staging: update to stable 3.12.9, other bugfixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index ab7b44b..a0c8aec 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,8 +36,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "af17c0c3a9f2f787f731e6124766443f8343be17"
-PV = "3.12.8"
+SRCREV = "ae99216c5588fc0f9f6a48cb3da47c15f19e6415"
+PV = "3.12.9"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"


