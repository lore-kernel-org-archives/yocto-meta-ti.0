Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19BB9E015D6
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 19:27:51 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTL00KHZYTMCV43@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Sep 2013 21:27:38 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C8BB200F4; Mon,
	23 Sep 2013 22:27:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Sep 2013 22:27:09 -0400
Message-id: <1379989631-8098-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1379989631-8098-1-git-send-email-denis@denix.org>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] u-boot-ti-staging: update to the latest 2013.10-rc2 and make it the default
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
X-List-Received-Date: Tue, 24 Sep 2013 02:27:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
index 8d96aee..8c005b4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -4,16 +4,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
 
-PV = "2013.07+2013.10-rc1"
+PV = "2013.07+2013.10-rc2"
 PR = "r0+gitr${SRCPV}"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-SRCREV = "39bc12ddc36c9e30199471da0f3a929b178a04b2"
+SRCREV = "fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.8.3.2


