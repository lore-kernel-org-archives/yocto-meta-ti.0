Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E494E01509
	for <meta-ti@yoctoproject.org>; Fri,  5 Apr 2013 11:31:46 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id ED49B52AB1; Fri,  5 Apr 2013 18:31:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130405183145.ED49B52AB1@arago-project.org>
Date: Fri,  5 Apr 2013 18:31:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with the latest dss fixes in omap5 dts
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
X-List-Received-Date: Fri, 05 Apr 2013 18:31:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 891eddf7a2f2c031becb40282ca7aea8bf2841d4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=891eddf7a2f2c031becb40282ca7aea8bf2841d4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr  3 21:41:38 2013 -0400

linux-ti-staging: update with the latest dss fixes in omap5 dts

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 21202f4..77d8e8a 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -40,11 +40,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "f6ce51c2d6e5489262beb6f42cc39ac19e49bc9e"
+SRCREV = "881dfafeae47da3a8f5ff8c791753e4b4df8065b"
 PV = "3.8.5"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


