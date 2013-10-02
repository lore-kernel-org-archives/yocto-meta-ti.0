Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 979A8E01686
	for <meta-ti@yoctoproject.org>; Wed,  2 Oct 2013 13:12:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU200BQ35GITH02@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 02 Oct 2013 15:12:19 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6F868200A9; Wed,
	02 Oct 2013 16:12:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 02 Oct 2013 16:12:11 -0400
Message-id: <1380744731-3881-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Tom Rini <trini@ti.com>
Subject: [PATCH] u-boot-ti-staging: update to the latest 2013.10-rc4, README changed slightly
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
X-List-Received-Date: Wed, 02 Oct 2013 20:12:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Bump the SRCREV for 2013.10-rc4 pre-release
* The Licenses/README file has been changed with new licenses added, but the
  general license hasn't changed from GPLv2, so re-hash the file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
1.8.3.2


