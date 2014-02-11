Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D69FCE007B3
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 14:08:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9DE3D52AA8; Tue, 11 Feb 2014 22:08:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140211220840.9DE3D52AA8@arago-project.org>
Date: Tue, 11 Feb 2014 22:08:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with QSPI partition size changes
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
X-List-Received-Date: Tue, 11 Feb 2014 22:08:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: e5984623e9cf66042b6af58bc540993d5cb42ad2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e5984623e9cf66042b6af58bc540993d5cb42ad2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 11 14:36:31 2014 -0500

u-boot-ti-staging: update with QSPI partition size changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index f964b41..9a95cc3 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,13 +5,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
-SRCREV = "aa2521229894dcade9426796889d0793a4547acf"
+SRCREV = "f2dcae2f9e9434392673fea7584641afa98f4232"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


