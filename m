Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD1FDE007F7
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:07:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CF6C152A20; Wed, 18 Dec 2013 18:07:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131218180709.CF6C152A20@arago-project.org>
Date: Wed, 18 Dec 2013 18:07:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with fix for remoteproc/ DT conflict
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
X-List-Received-Date: Wed, 18 Dec 2013 18:07:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 85c35541100affcdc47bb72619a59ce1c0d0ef85
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=85c35541100affcdc47bb72619a59ce1c0d0ef85

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 18 11:54:17 2013 -0500

linux-ti-staging: update with fix for remoteproc/DT conflict

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index f2eed95..cb3eabc 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -33,11 +33,11 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.12.y"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "6279006c8da4f160949ea919e1e41bdb49dfba06"
+SRCREV = "dfea149efb32485f17bb7440eb326549c8f647e2"
 PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


