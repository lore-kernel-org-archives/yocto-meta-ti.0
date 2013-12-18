Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF1A8E007FB
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2013 18:52:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D96D552A38; Wed, 18 Dec 2013 02:52:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131218025231.D96D552A38@arago-project.org>
Date: Wed, 18 Dec 2013 02:52:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with fixes for platform and connectivity
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
X-List-Received-Date: Wed, 18 Dec 2013 02:52:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0d5b0cab9d8dbd3a4f82f7b615f4af6c59910bf0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0d5b0cab9d8dbd3a4f82f7b615f4af6c59910bf0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec 17 20:24:32 2013 -0500

linux-ti-staging: update with fixes for platform and connectivity

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index eaf0df2..f2eed95 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -33,11 +33,11 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.12.y"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "9921cde9aa3f323d5a0e9e5207b7ad173652a89d"
+SRCREV = "6279006c8da4f160949ea919e1e41bdb49dfba06"
 PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


