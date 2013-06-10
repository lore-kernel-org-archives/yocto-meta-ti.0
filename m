Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC5CFE01513
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2013 06:46:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5ADkmtI000742
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2013 08:46:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5ADkmWG011520
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2013 08:46:48 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 10 Jun 2013 08:46:47 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5ADkivC028797;
	Mon, 10 Jun 2013 08:46:46 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 10 Jun 2013 08:54:34 -0500
Message-ID: <1370872474-14987-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] u-boot-dra7xx: update to latest sources
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
X-List-Received-Date: Mon, 10 Jun 2013 13:46:50 -0000
Content-Type: text/plain

* Update to latest sources which pulls in the QSPI patches

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
index eb3fc05..7cf1b8f 100644
--- a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
+++ b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.04+"
 
 # This commit corresponds to ti2013.04.02 release tag
-SRCREV = "e2315adf674b60132f0c5c8fe6eac5d109b81688"
+SRCREV = "ca435c914e069f5b74f05f667e2064784943a0ac"
 
 SPL_BINARY = "MLO"
-- 
1.7.0.4


