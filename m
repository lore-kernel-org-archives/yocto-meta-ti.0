Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 120CEE016E5
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:08:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9IC8CXl018321
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IC8Cdc015150
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 07:08:12 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IC8AMN022532	for
	<meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:11 -0500
Date: Fri, 18 Oct 2013 17:38:09 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131018120809.GA3385@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] u-boot-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 18 Oct 2013 12:08:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

 * Migration of u-boot code to omapzoom.org. The development tree is shared
   with the Android team.
 * Enable UART boot mode for dra7xx
 * Add VIP,VPE and Ethernet crossbar setting for dra7xx
 * Add SPL API, QSPI, and serial flash support of dra7xx

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
index d60ef44..4dde4e3 100644
--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
@@ -6,11 +6,11 @@ PR = "r0+gitr${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.omapzoom.org/repo/u-boot.git;protocol=git;branch=${BRANCH}"
 
-BRANCH ?= "master"
+BRANCH = "p-ti-u-boot-2013.04"
 
-SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
+SRCREV = "76447484441a4b8e00840a2bde74e66dbac9e631"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.9.5


