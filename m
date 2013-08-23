Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02032E003D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 12:59:23 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS0006YV261TBB0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 Aug 2013 14:59:02 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0AD4C200E2; Fri,
	23 Aug 2013 15:58:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Aug 2013 15:58:24 -0400
Message-id: <1377287906-17115-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1377287906-17115-1-git-send-email-denis@denix.org>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] u-boot-ti-staging: add the latest integration tree in prep for 2013.10 release
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
X-List-Received-Date: Fri, 23 Aug 2013 19:59:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_git.bb

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
new file mode 100644
index 0000000..bd6188d
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -0,0 +1,19 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
+
+PV = "2013.09+2013.10-rc1"
+PR = "r0+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+SRCREV = "39bc12ddc36c9e30199471da0f3a929b178a04b2"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.8.3.2


