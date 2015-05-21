Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF22FE00A08; Thu, 21 May 2015 08:12:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84A47E009D2
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 08:12:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DF249529AA; Thu, 21 May 2015 15:12:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150521151200.DF249529AA@arago-project.org>
Date: Thu, 21 May 2015 15:12:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: remove unused and upstreamed 2015.01
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
X-List-Received-Date: Thu, 21 May 2015 15:12:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e7601086a4db4dbbb93b50251642794314b8e46f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e7601086a4db4dbbb93b50251642794314b8e46f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 21 07:56:21 2015 +0000

u-boot: remove unused and upstreamed 2015.01

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2015.01.bb |   27 ---------------------------
 1 files changed, 0 insertions(+), 27 deletions(-)

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


