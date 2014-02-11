Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDD46E00799
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 13:52:08 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0U003DFQ1YJVC0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 11 Feb 2014 15:51:35 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BEA88200BE; Tue,
	11 Feb 2014 16:51:34 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 11 Feb 2014 16:51:27 -0500
Message-id: <1392155488-1163-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] u-boot-ti-staging: update with QSPI partition size changes
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
X-List-Received-Date: Tue, 11 Feb 2014 21:52:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.3.2


