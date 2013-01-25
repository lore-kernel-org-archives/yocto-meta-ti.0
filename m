Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45A13E006D2
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 00:04:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BE7E952AE3; Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130125080446.BE7E952AE3@arago-project.org>
Date: Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel.inc: drop use of KERNEL_CCSUFFIX to match oe-core
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
X-List-Received-Date: Fri, 25 Jan 2013 08:04:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9daa29790ddd699642c1689bc2cf7c77d18ed372
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9daa29790ddd699642c1689bc2cf7c77d18ed372

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jan 25 03:02:18 2013 -0500

multi-kernel.inc: drop use of KERNEL_CCSUFFIX to match oe-core

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index e5ebe56..9a0c090 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -119,5 +119,5 @@ do_deploy_append () {
 
 }
 
-do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
+do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 addtask compileconfigs after do_preparekernel before do_compile


