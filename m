Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19B22E00922; Fri, 27 Mar 2015 09:47:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45622E00906
	for <meta-ti@yoctoproject.org>; Fri, 27 Mar 2015 09:47:55 -0700 (PDT)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLV006K7QN0WG90@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Mar 2015 11:47:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KaRlarcG c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=_KTewm4GxciJfHG3V2cA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B383520188;	Fri,
	27 Mar 2015 12:47:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 27 Mar 2015 12:47:24 -0400
Message-id: <1427474844-18399-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot-ti-staging: update with x15 fixes
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
X-List-Received-Date: Fri, 27 Mar 2015 16:47:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index 65b092a..25201d7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2014.07"
-PR = "r8+gitr${SRCPV}"
+PR = "r9+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2014.07"
 
-SRCREV = "b376eda1caae974c38f9138ba3e79868d34e3634"
+SRCREV = "67b4cea8897cef6797549c8fa1f89ee7e36b6cdd"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.2.0


