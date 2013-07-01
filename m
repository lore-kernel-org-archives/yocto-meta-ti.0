Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 649F1E013B0
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:12:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61DCGDX022824
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:12:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61DCGgZ030942
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:12:16 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 08:12:16 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61DCEsB031703;
	Mon, 1 Jul 2013 08:12:15 -0500
Date: Mon, 1 Jul 2013 18:42:14 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701131214.GA8381@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv2] recipes-bsp: u-boot: Add GLSDK Staging tree
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
X-List-Received-Date: Mon, 01 Jul 2013 13:12:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* The GLSDK u-boot staging tree is based off the Core SDK 2013.04.02
  release. This tree will be used to stage patches and fixes on
  top of the Core SDK U-Boot. The GLSDK release will use this tree
  for product development.
* Includes fix to OMAP5 so that QSPI is not enabled.

v2:
* Fix PR to start for r0

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../u-boot/u-boot-glsdk-staging_2013.01.01.bb      |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb

diff --git a/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
new file mode 100644
index 0000000..d60ef44
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
@@ -0,0 +1,16 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices supported by the GLSDK product"
+
+PR = "r0+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.0.4


