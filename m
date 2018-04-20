Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DBD5E00B18; Fri, 20 Apr 2018 12:29:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAF51E00AE4
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2018 12:29:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09A5620BC1;
	Fri, 20 Apr 2018 19:29:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8AF2T054bijO; Fri, 20 Apr 2018 19:29:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C116C20B70;
	Fri, 20 Apr 2018 19:29:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5EB0416343E;
	Fri, 20 Apr 2018 15:29:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Apr 2018 15:29:32 -0400
Message-Id: <1524252572-1667-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524252572-1667-1-git-send-email-denys@ti.com>
References: <1524252572-1667-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 3/3] recipes-bsp: whitespace cleanup
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
X-List-Received-Date: Fri, 20 Apr 2018 19:29:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         | 6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb   | 2 +-
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb      | 2 +-
 recipes-bsp/pruss-lld/pruss-lld_git.bb           | 2 +-
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb        | 2 +-
 recipes-bsp/qmss-lld/qmss-lld_git.bb             | 2 +-
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
index beed9d7..55f67bf 100644
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -15,15 +15,15 @@ FATFS_GIT_BRANCH = "master"
 # Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.09"
 FATFS_SRCREV = "a5652991a9dd9a9b9b9c5c2cf35d1417f8272b00"
 
-BRANCH ="${FATFS_GIT_BRANCH}"
+BRANCH = "${FATFS_GIT_BRANCH}"
 SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FATFS_SRCREV}"
 PV = "01.00.00.09"
 PR = "r0"
 
-DEPENDS_append = " mmcsd-lld-rtos \
-"
+DEPENDS_append = " mmcsd-lld-rtos"
+
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
index a295304..4c305db 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI ICSS-EMAC low level driver library"
 
-DEPENDS="common-csl-ip pruss-lld osal"
+DEPENDS = "common-csl-ip pruss-lld osal"
 
 include icss-emac-lld.inc
 
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
index 90764d1..93f1901 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI PRUSS low level driver tests"
 
-DEPENDS="common-csl-ip pruss-lld osal"
+DEPENDS = "common-csl-ip pruss-lld osal"
 
 include pruss-lld.inc
 
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
index 2eca4ff..79468ab 100644
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI PRUSS low level driver library"
 
-DEPENDS="common-csl-ip osal"
+DEPENDS = "common-csl-ip osal"
 
 include pruss-lld.inc
 
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index ed49b8e..77e698a 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
 
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld cmem uio-module-drv"
+DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld cmem uio-module-drv"
 
 include qmss-lld.inc
 
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index a3c1a3b..a87f490 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI QMSS low level driver library"
 
-DEPENDS="common-csl-ip rm-lld"
+DEPENDS = "common-csl-ip rm-lld"
 
 include qmss-lld.inc
 
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 15a7691..6ac9187 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="User space IO (UIO) driver for on-chip modules"
+DESCRIPTION = "User space IO (UIO) driver for on-chip modules"
 
 include uio-module-drv.inc
 
-- 
2.7.4


