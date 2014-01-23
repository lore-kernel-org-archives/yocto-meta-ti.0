Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B6EAE00861
	for <meta-ti@yoctoproject.org>; Thu, 23 Jan 2014 11:07:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 048EE529AD; Thu, 23 Jan 2014 19:07:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140123190721.048EE529AD@arago-project.org>
Date: Thu, 23 Jan 2014 19:07:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to stable 3.12.8, other bugfixes
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
X-List-Received-Date: Thu, 23 Jan 2014 19:07:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: f894102725d2c8fa8ce7e5a6e5ec9d0a392eed03
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f894102725d2c8fa8ce7e5a6e5ec9d0a392eed03

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jan 21 10:52:19 2014 -0500

linux-ti-staging: update to stable 3.12.8, other bugfixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 2d9f813..ab7b44b 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "b0f3ccd18d39c375491519ba285babf152eab9d8"
-PV = "3.12.4"
+SRCREV = "af17c0c3a9f2f787f731e6124766443f8343be17"
+PV = "3.12.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


