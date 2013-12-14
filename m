Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EED02E007FE
	for <meta-ti@yoctoproject.org>; Fri, 13 Dec 2013 23:32:28 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXS00E04CXO1050@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 14 Dec 2013 01:32:12 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 153322016B; Sat,
	14 Dec 2013 02:32:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 14 Dec 2013 02:32:04 -0500
Message-id: <1387006324-18171-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1387006324-18171-1-git-send-email-denis@denix.org>
References: <1387006324-18171-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot-ti-staging: update with omap5 clock fix
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
X-List-Received-Date: Sat, 14 Dec 2013 07:32:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index 80688f4..e0623fd 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "4c677486ec4897c90272aac77f8156c15ca27ce2"
+SRCREV = "310aa487aa540609dc5e6a27dfa6c36067babf8c"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.8.3.2


