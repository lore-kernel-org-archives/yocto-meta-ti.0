Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F003DE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 08:10:48 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFAle1009483
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 10:10:47 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFAk8t005325
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 20:40:46 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:40:46 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFAhYJ023846;
	Tue, 19 Mar 2013 20:40:44 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Mar 2013 10:10:40 -0500
Message-ID: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-ti-staging: Add OMAP5 support
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
X-List-Received-Date: Tue, 19 Mar 2013 15:10:49 -0000
Content-Type: text/plain

* Add the KERNEL_DEVICETREE definitions for omap5-evm
* Add the omap-a15 SOC_FAMILY to the list of COMPATIBLE_MACHINEs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index cfd4da0..3ff038d 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -32,8 +32,9 @@ DEPENDS_ti33x += "am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts"
 
-COMPATIBLE_MACHINE = "ti33x"
+COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


