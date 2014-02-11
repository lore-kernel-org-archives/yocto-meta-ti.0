Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2734E007B4
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 14:08:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BAF2652AB2; Tue, 11 Feb 2014 22:08:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140211220840.BAF2652AB2@arago-project.org>
Date: Tue, 11 Feb 2014 22:08:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with PM, connectivity and Display/Audio fixes
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
X-List-Received-Date: Tue, 11 Feb 2014 22:08:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 5b6c24b167f0adc16ec42471505bd5232cb88b79
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5b6c24b167f0adc16ec42471505bd5232cb88b79

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 11 16:50:11 2014 -0500

linux-ti-staging: update with PM, connectivity and Display/Audio fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 87f5f3c..8254cc3 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "7f280334068b7c875ade51f8f3921ab311f0c824"
+SRCREV = "c883f50c5bbf1bf5bfaeb550991caf5fc77a1c4d"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


