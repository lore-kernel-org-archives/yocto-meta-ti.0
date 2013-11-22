Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD3FFE006B9
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:29:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5708F52A6A; Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122042953.5708F52A6A@arago-project.org>
Date: Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : u-boot-glsdk: update to latest fixes
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
X-List-Received-Date: Fri, 22 Nov 2013 04:29:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: d6b47b7cd7e80ff7c55882fd358e9af5f0fc744c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d6b47b7cd7e80ff7c55882fd358e9af5f0fc744c

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Mon Oct 21 18:44:42 2013 +0530

u-boot-glsdk: update to latest fixes

* Migration of u-boot code to omapzoom.org. The development tree is shared
  between the Linux and Android teams.This enables a common u-boot development
  platform for both the teams for better alignment.
* Enable UART boot mode for dra7xx
* Add VIP,VPE and Ethernet crossbar setting for dra7xx
* Add SPL API, QSPI, and serial flash support of dra7xx

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
index d60ef44..07df497 100644
--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
@@ -2,15 +2,15 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices supported by the GLSDK product"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.omapzoom.org/repo/u-boot.git;protocol=git;branch=${BRANCH}"
 
-BRANCH ?= "master"
+BRANCH ?= "p-ti-u-boot-2013.04"
 
-SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
+SRCREV = "76447484441a4b8e00840a2bde74e66dbac9e631"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


