Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B6D1E014B6
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 15:48:00 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKP006NOBAK2552@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 03 Apr 2013 17:47:23 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4EC342018B; Wed,
	03 Apr 2013 18:47:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 03 Apr 2013 18:47:03 -0400
Message-id: <1365029224-21885-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 1/2] u-boot-ti-staging: update SRCREV for more omap5 changes, bump PR
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
X-List-Received-Date: Wed, 03 Apr 2013 22:48:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index f6cbeee..cf01bd0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,12 +2,12 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
-SRCREV = "24043d3b0b6d54b4f73263903499fd3e63980830"
+SRCREV = "9aab8612f643ab90df837e743f5435bba2ae68cf"
 
 SPL_BINARY = "MLO"
-- 
1.8.1.5


