Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1C09E0096A; Wed, 20 May 2015 19:56:49 -0700 (PDT)
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
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Wed, 20 May 2015 19:56:46 PDT
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BECB1E005B9
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 19:56:46 -0700 (PDT)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO00D14G242950@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 20 May 2015 20:56:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=JbALdvP9 c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=I-WnmoEoBGLIyJPiVYUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 921D120099;	Wed,
	20 May 2015 21:56:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 20 May 2015 21:56:21 -0400
Message-id: <1432173385-9193-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/5] u-boot: remove unused and upstreamed 2015.01
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
X-List-Received-Date: Thu, 21 May 2015 02:56:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2015.01.bb | 27 ---------------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot_2015.01.bb

diff --git a/recipes-bsp/u-boot/u-boot_2015.01.bb b/recipes-bsp/u-boot/u-boot_2015.01.bb
deleted file mode 100644
index ee02107..0000000
--- a/recipes-bsp/u-boot/u-boot_2015.01.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require u-boot-ti.inc
-
-# DEPEND on dtc-native for mainline u-boot because the mainline u-boot depends
-# on some of the latest syntax constructs for an appended in dtb used for
-# items like secure boot/image signing.
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "Mainline u-boot bootloader"
-
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
-
-PV = "2014.10+2015.01-rc4"
-
-SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "master"
-
-# Corresponds to tag v2015.01-rc4 plus more fixes
-SRCREV = "b188067f39627d977bb1db67c8456e9aaab90743"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
-
-SPL_BINARY_omapl138 = ""
-SPL_UART_BINARY_omapl138 = ""
-- 
2.2.0


