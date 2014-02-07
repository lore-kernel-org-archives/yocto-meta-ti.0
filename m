Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 562D1E006EE
	for <meta-ti@yoctoproject.org>; Thu,  6 Feb 2014 19:30:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 24A5F52A73; Fri,  7 Feb 2014 03:30:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140207033040.24A5F52A73@arago-project.org>
Date: Fri,  7 Feb 2014 03:30:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.12.10, merge Audio/ Display fixed
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
X-List-Received-Date: Fri, 07 Feb 2014 03:30:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: cb01c93702519562431b56d2a5fca3e2ccbf6f8b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cb01c93702519562431b56d2a5fca3e2ccbf6f8b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb  7 08:54:54 2014 +0000

linux-ti-staging: update to 3.12.10, merge Audio/Display fixed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index bb4791f..87f5f3c 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "a4daf45088f752ed6b33239026518fc3d1bce2bc"
-PV = "3.12.9"
+SRCREV = "7f280334068b7c875ade51f8f3921ab311f0c824"
+PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


