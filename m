Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C0C7E007E4; Mon,  9 May 2016 09:50:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09EBCE0077E
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 09:50:52 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7715F52ACA; Mon,  9 May 2016 16:50:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160509165050.7715F52ACA@arago-project.org>
Date: Mon,  9 May 2016 16:50:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : prueth-fw: add FW images for am335x
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
X-List-Received-Date: Mon, 09 May 2016 16:50:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f7c550cdfb6bb5079b34059c5ea44bfedc3c2474
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f7c550cdfb6bb5079b34059c5ea44bfedc3c2474

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon May  9 22:40:18 2016 +0000

prueth-fw: add FW images for am335x

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/prueth-fw/prueth-fw_git.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index e4970aa..234fba5 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -1,20 +1,21 @@
-DESCRIPTION = "PRU Ethernet firmware for AM57xx and AM437x"
+DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV_am57xx-evm = "1.0.0"
 PV_am437x-evm = "2.1.2"
+PV_am335x-evm = "2.1.2"
 
-PR = "r1"
+PR = "r2"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm"
+COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f6c712fd26044d90939ff774f07dfcb951bcefc9"
+SRCREV = "4096bf1129c4a707069e685edd44ca64bd51421d"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
@@ -23,6 +24,7 @@ S = "${WORKDIR}/git"
 
 TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
 TARGET_am437x-evm = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
+TARGET_am335x-evm = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/ti-pruss


