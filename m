Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58502E008E5; Mon,  2 Feb 2015 13:42:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0531CE0086F
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 13:42:20 -0800 (PST)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJ500JSPYXSGGQ0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 02 Feb 2015 15:41:53 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PYxIXZlY c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=_KTewm4GxciJfHG3V2cA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 858D72016F;	Mon,
	2 Feb 2015 16:41:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 02 Feb 2015 16:41:48 -0500
Message-id: <1422913308-8965-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1422913308-8965-1-git-send-email-denis@denix.org>
References: <1422913308-8965-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot-ti-staging: update with am57x/x15 and config fixes
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
X-List-Received-Date: Mon, 02 Feb 2015 21:42:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index 2845750..dd9326a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2014.07"
-PR = "r6+gitr${SRCPV}"
+PR = "r7+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2014.07"
 
-SRCREV = "705aec706adf37b63fd4b09660c638150e606fdb"
+SRCREV = "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.2.0


