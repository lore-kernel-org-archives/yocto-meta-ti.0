Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29162E0153F
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 10:59:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D812552A7A; Thu, 11 Jul 2013 17:59:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130711175933.D812552A7A@arago-project.org>
Date: Thu, 11 Jul 2013 17:59:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : u-boot-am33x: Update am335x to use latest u-boot for 3.2 kernel
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
X-List-Received-Date: Thu, 11 Jul 2013 17:59:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: f35d7c584914b493a381f5a1e0c9bc87d8a2a403
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f35d7c584914b493a381f5a1e0c9bc87d8a2a403

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Jul  2 11:47:59 2013 -0500

u-boot-am33x: Update am335x to use latest u-boot for 3.2 kernel

Latest commit includes the following:
* Add support for Beaglebone Black
* Add fix for Linaro toolchain to insure NOR and RNDIS works.
* Add workaround for Errata 1.0.24
* Enable DDR3 power down for BBB and GP evm.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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


