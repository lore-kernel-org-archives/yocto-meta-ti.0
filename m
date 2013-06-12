Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B30ECE014DE
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 09:24:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF27252A74; Wed, 12 Jun 2013 16:24:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130612162457.BF27252A74@arago-project.org>
Date: Wed, 12 Jun 2013 16:24:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to ti2013.04.02 release
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
X-List-Received-Date: Wed, 12 Jun 2013 16:24:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 9826121536555c2d3a96232b0b40b1d66acfc7cf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9826121536555c2d3a96232b0b40b1d66acfc7cf

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jun 12 12:21:08 2013 -0400

linux-ti-staging: update to ti2013.04.02 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 39f0e31..29ffebc 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -26,12 +26,12 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-# This commit corresponds to ti2013.04.00 release tag
-SRCREV = "e7460f2acdea5c9b766c7eb76bad5ab2ed7e566c"
+# This commit corresponds to ti2013.04.02 release tag
+SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


