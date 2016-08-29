Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 805FAE00BEA; Mon, 29 Aug 2016 16:48:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 495EBE00BCE
	for <meta-ti@yoctoproject.org>; Mon, 29 Aug 2016 16:48:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DCB8E529DA; Mon, 29 Aug 2016 23:48:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160829234831.DCB8E529DA@arago-project.org>
Date: Mon, 29 Aug 2016 23:48:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : prueth-fw: update to version 3.1.4
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
X-List-Received-Date: Mon, 29 Aug 2016 23:48:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c8e80c8249222bbf9f180b33ec38cde39d6a230b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c8e80c8249222bbf9f180b33ec38cde39d6a230b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 30 01:17:19 2016 +0000

prueth-fw: update to version 3.1.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/prueth-fw/prueth-fw_git.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 234fba5..f48bb25 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -3,11 +3,9 @@ DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV_am57xx-evm = "1.0.0"
-PV_am437x-evm = "2.1.2"
-PV_am335x-evm = "2.1.2"
+PV = "3.1.4"
 
-PR = "r2"
+PR = "r0"
 
 CLEANBROKEN = "1"
 
@@ -15,7 +13,7 @@ COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "4096bf1129c4a707069e685edd44ca64bd51421d"
+SRCREV = "2229dbcb088365e1be8f00af6589e93eddfa3f2f"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"


