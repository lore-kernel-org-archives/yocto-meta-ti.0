Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A067E00A7D; Mon, 27 Jul 2015 17:39:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6A6AE00A73
	for <meta-ti@yoctoproject.org>; Mon, 27 Jul 2015 17:39:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 76B5052A14; Tue, 28 Jul 2015 00:39:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150728003939.76B5052A14@arago-project.org>
Date: Tue, 28 Jul 2015 00:39:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "u-boot-ti-staging: add version 2015.07-rc3"
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
X-List-Received-Date: Tue, 28 Jul 2015 00:39:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 25bc201f81642c816c241e29db9ace5cb71cfd26
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=25bc201f81642c816c241e29db9ace5cb71cfd26

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jul 27 20:37:35 2015 -0400

Revert "u-boot-ti-staging: add version 2015.07-rc3"

No plans to support ti-u-boot-2015.07 on daisy

This reverts commit 2bb8a7425c2c53d9ac73ef162cabfe17e45f2781.

---

 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
deleted file mode 100644
index 10566bb..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require u-boot-ti.inc
-
-# u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
-
-PR = "r0"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2015.07"
-
-SRCREV = "9c6b05cb724e18d1db3f9e1a75b2272572f06fbd"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"


