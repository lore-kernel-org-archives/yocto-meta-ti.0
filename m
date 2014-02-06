Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F076E003D2
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 18:52:59 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A3D9D52A54; Thu,  6 Feb 2014 02:52:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140206025259.A3D9D52A54@arago-project.org>
Date: Thu,  6 Feb 2014 02:52:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with many fixes for the upcoming release
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
X-List-Received-Date: Thu, 06 Feb 2014 02:53:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: db1e0b9f315fca1a95251e348a0ff6395addcb33
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=db1e0b9f315fca1a95251e348a0ff6395addcb33

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb  5 18:24:59 2014 -0500

linux-ti-staging: update with many fixes for the upcoming release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index a0c8aec..bb4791f 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "ae99216c5588fc0f9f6a48cb3da47c15f19e6415"
+SRCREV = "a4daf45088f752ed6b33239026518fc3d1bce2bc"
 PV = "3.12.9"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


