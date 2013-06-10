Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 751B2E01538
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2013 08:39:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DD0945299C; Mon, 10 Jun 2013 15:39:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130610153908.DD0945299C@arago-project.org>
Date: Mon, 10 Jun 2013 15:39:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : u-boot-dra7xx: update to latest sources
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
X-List-Received-Date: Mon, 10 Jun 2013 15:39:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 428c9db65f69c5c885b014c49ddedf3130cf16f3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=428c9db65f69c5c885b014c49ddedf3130cf16f3

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jun 10 08:54:34 2013 -0500

u-boot-dra7xx: update to latest sources

* Update to latest sources which pulls in the QSPI patches

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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


