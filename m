Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EC5CE00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 14:19:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E6C95529A0; Thu,  3 May 2012 21:19:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503211925.E6C95529A0@arago-project.org>
Date: Thu,  3 May 2012 21:19:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : beaglebone: re-enable THUMB2_KERNEL in defconfig, as it affects boot time by .5s
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 21:19:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b478431b3cb62dae735c26fa2dfd025ffbf0776c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b478431b3cb62dae735c26fa2dfd025ffbf0776c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May  3 15:16:55 2012 -0400

beaglebone: re-enable THUMB2_KERNEL in defconfig, as it affects boot time by .5s

This reverts commit 3c693c26087aa148b944166083b5336f05d1c15b.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 42be8cd..0912875 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -420,7 +420,8 @@ CONFIG_PREEMPT_NONE=y
 # CONFIG_PREEMPT_VOLUNTARY is not set
 # CONFIG_PREEMPT is not set
 CONFIG_HZ=100
-# CONFIG_THUMB2_KERNEL is not set
+CONFIG_THUMB2_KERNEL=y
+CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y
 CONFIG_ARM_ASM_UNIFIED=y
 CONFIG_AEABI=y
 CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y


