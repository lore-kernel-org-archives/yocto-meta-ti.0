Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D049E00D3B; Tue, 25 Oct 2016 15:56:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDF6E00BE7
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:56:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D0D8F52AD5; Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025225609.D0D8F52AD5@arago-project.org>
Date: Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : prueth-fw: update with k2g-ice firmware images
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
X-List-Received-Date: Tue, 25 Oct 2016 22:56:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b9a690700666bd265ea698fa858e1b9cdcb82bfb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b9a690700666bd265ea698fa858e1b9cdcb82bfb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct 26 01:43:10 2016 +0000

prueth-fw: update with k2g-ice firmware images

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/prueth-fw/prueth-fw_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index f48bb25..77445e9 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -1,19 +1,18 @@
-DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
+DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x, AM335x and K2G"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "3.1.4"
-
-PR = "r0"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm"
+COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "2229dbcb088365e1be8f00af6589e93eddfa3f2f"
+SRCREV = "4ed1022c62bfe4ed4c66112024c8ee1301e9439d"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
@@ -23,6 +22,7 @@ S = "${WORKDIR}/git"
 TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
 TARGET_am437x-evm = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
 TARGET_am335x-evm = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
+TARGET_k2g = "k2g-pru0-prueth-fw.elf k2g-pru1-prueth-fw.elf"
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/ti-pruss


