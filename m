Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86D7CE01642
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 11:42:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8CF19529CC; Fri,  4 Oct 2013 18:42:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131004184208.8CF19529CC@arago-project.org>
Date: Fri,  4 Oct 2013 18:42:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to the latest 2013.10-rc4, README changed slightly
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
X-List-Received-Date: Fri, 04 Oct 2013 18:42:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2b089a561df5c5a5a78aede666ee4c6000d22ac3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2b089a561df5c5a5a78aede666ee4c6000d22ac3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct  2 16:09:17 2013 -0400

u-boot-ti-staging: update to the latest 2013.10-rc4, README changed slightly

* Bump the SRCREV for 2013.10-rc4 pre-release
* The Licenses/README file has been changed with new licenses added, but the
  general license hasn't changed from GPLv2, so re-hash the file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
index 8c005b4..a5882b0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -2,16 +2,16 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=bc069111b5e5b1ed8bed98ae73b596ec"
 
-PV = "2013.07+2013.10-rc2"
+PV = "2013.07+2013.10-rc4"
 PR = "r0+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-SRCREV = "fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c"
+SRCREV = "0c5274e6f3231a3a28dafc1204b3f71a3534c520"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


