Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 370F3E01684
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2013 09:19:41 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6DD1752A67; Tue,  8 Oct 2013 16:19:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131008161941.6DD1752A67@arago-project.org>
Date: Tue,  8 Oct 2013 16:19:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: bump to 3.12-rc4 with latest merges
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
X-List-Received-Date: Tue, 08 Oct 2013 16:19:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b4f33a5a409c9f7ffcd439cd50322729fd11ca2c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b4f33a5a409c9f7ffcd439cd50322729fd11ca2c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Oct  7 14:04:46 2013 -0400

linux-ti-staging: bump to 3.12-rc4 with latest merges

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 80ebde8..18ec70d 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "e34b95baedccea12af9c0e81be77ed0a18ddae82"
-PV = "3.11+3.12-rc3"
+SRCREV = "cfb43bb45e51e2cbff47d62fa348de6a30147f41"
+PV = "3.11+3.12-rc4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


