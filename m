Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57281E0072F
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:03:49 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BK3lrR032151
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:03:48 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3l0i016463
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:33:47 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:33:47 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3bVY012196;
	Tue, 12 Mar 2013 01:33:45 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:03:34 -0500
Message-ID: <1363032215-12645-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] linux-ti-staging: package all dtb files for ti33x
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
X-List-Received-Date: Mon, 11 Mar 2013 20:03:49 -0000
Content-Type: text/plain

* For the ti33x SOC_FAMILY device package the dtb files for all
  of the am335x boards instead of just the single EVM file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 5f4a05d..f6fa6d2 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -12,7 +12,9 @@ require recipes-kernel/linux/setup-defconfig.inc
 # for ti33x SOC_FAMILY devices
 DEPENDS_ti33x += "am33x-cm3"
 
-KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+# Default is to package all dts files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
 
 COMPATIBLE_MACHINE = "ti33x"
@@ -25,7 +27,7 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.0.4


