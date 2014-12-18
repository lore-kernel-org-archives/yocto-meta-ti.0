Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE2BCE00A1A; Thu, 18 Dec 2014 15:11:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BAB4E002F9
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 15:11:31 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGS006QAWF58T80@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 18 Dec 2014 17:11:30 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B94OC1pJ c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=_KTewm4GxciJfHG3V2cA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C72DE200F0;	Thu,
	18 Dec 2014 18:11:29 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 18 Dec 2014 18:11:29 -0500
Message-id: <1418944289-3522-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot-ti-staging: update with latest fixes
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
X-List-Received-Date: Thu, 18 Dec 2014 23:11:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index d3cea77..a895978 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2014.07"
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2014.07"
 
-SRCREV = "6ff3f70e38ca6933a7dcfb84eefd0597e9558bc3"
+SRCREV = "b6f7378f75acab9b08d229f9bf0197779107db55"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.2.0


