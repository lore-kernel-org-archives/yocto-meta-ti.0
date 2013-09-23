Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5470BE0155D
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 10:57:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A15F52AA0; Mon, 23 Sep 2013 17:57:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130923175714.6A15F52AA0@arago-project.org>
Date: Mon, 23 Sep 2013 17:57:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump to 3. 12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Mon, 23 Sep 2013 17:57:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: a27001ce6d4d4e8e1fa4bf2c54fdc82b79bb6006
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a27001ce6d4d4e8e1fa4bf2c54fdc82b79bb6006

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep 20 15:22:24 2013 -0400

linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Dan Murphy <DMurphy@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 7d84cc4..694a164 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
-PV = "3.10+3.11-rc6"
+SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
+PV = "3.11+3.12-rc1"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


