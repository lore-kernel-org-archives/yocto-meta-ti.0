Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FD1BE013B0
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:32:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62GWwZU028825
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 11:32:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62GWwUR017729
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 11:32:58 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 11:32:58 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62GWtSP026407;
	Tue, 2 Jul 2013 11:32:57 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Jul 2013 11:47:59 -0500
Message-ID: <1372783680-32302-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [master & danny][PATCH 1/2] u-boot-am33x: Update am335x to use latest u-boot for 3.2 kernel
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
X-List-Received-Date: Tue, 02 Jul 2013 16:33:03 -0000
Content-Type: text/plain

Latest commit includes the following:
* Add support for Beaglebone Black
* Add fix for Linaro toolchain to insure NOR and RNDIS works.
* Add workaround for Errata 1.0.24
* Enable DDR3 power down for BBB and GP evm.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
index 19ec34e..cb2e850 100644
--- a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
@@ -6,15 +6,14 @@ COMPATIBLE_MACHINE = "ti33x"
 
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 # This version of u-boot is meant for 3.2 kernel which doesn't support device tree.
-BRANCH = "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
+BRANCH = "ti-u-boot-2013.01.01-amsdk-06.00.00.00"
 
-# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
-SRCREV = "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
+SRCREV = "540aa6fbb0c9274bda598f7e8819ed28259cad6b"
 
 # Set the name of the SPL that will built so that it is also packaged with u-boot.
 SPL_BINARY = "MLO"
-- 
1.7.0.4


