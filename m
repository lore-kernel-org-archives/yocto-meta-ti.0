Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC6C3E01653
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 09:22:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E527052A8B; Fri, 18 Oct 2013 16:22:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131018162219.E527052A8B@arago-project.org>
Date: Fri, 18 Oct 2013 16:22:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : u-boot-ti-staging: update to 2013.10 release
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
X-List-Received-Date: Fri, 18 Oct 2013 16:22:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3f3bad888972776b4740f7210e709b74362631f5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3f3bad888972776b4740f7210e709b74362631f5

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Oct 18 07:27:43 2013 -0500

u-boot-ti-staging: update to 2013.10 release

* Update the U-Boot LICENSE md5sum for the new release.
* Update the PV for the new U-Boot release
* Add the SRCREV that points to the 2013.10 release
* Use the ti-u-boot-2013.10 branch

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...staging_git.bb => u-boot-ti-staging_2013.10.bb} |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
similarity index 53%
rename from recipes-bsp/u-boot/u-boot-ti-staging_git.bb
rename to recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index a5882b0..ab6b038 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -2,16 +2,17 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=bc069111b5e5b1ed8bed98ae73b596ec"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-PV = "2013.07+2013.10-rc4"
+PV = "2013.10"
 PR = "r0+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
-BRANCH ?= "master"
+BRANCH ?= "ti-u-boot-2013.10"
 
-SRCREV = "0c5274e6f3231a3a28dafc1204b3f71a3534c520"
+# Corresponds to 2013.10
+SRCREV = "183acb700378a8cfc5d50a01a65de93fb2c24586"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


