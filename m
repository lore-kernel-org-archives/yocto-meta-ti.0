Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BF2DE00C49; Mon, 21 Sep 2015 08:40:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8987DE00B31
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 08:40:27 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NV1000NKA6QF7A0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 Sep 2015 10:40:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=ztGQagcx57n3yV9kHsAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E3284161C4C;	Mon,
	21 Sep 2015 11:40:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 21 Sep 2015 11:40:00 -0400
Message-id: <1442850000-6905-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1442850000-6905-1-git-send-email-denis@denix.org>
References: <1442850000-6905-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot-ti-stagaing: redo the last fix
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
X-List-Received-Date: Mon, 21 Sep 2015 15:40:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index 0dcc292..93745ba 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r9"
+PR = "r10"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "b5a8694cf6a0f2ac504e16e3068b967f3ecc8700"
+SRCREV = "d49aa5effa20d0b943c74ced84e67defce6d6d1c"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.2.0


