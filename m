Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D60E3E008C1; Mon,  7 Mar 2016 17:30:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37313E00AD7
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 17:30:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3297B52AFA; Tue,  8 Mar 2016 01:30:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308013013.3297B52AFA@arago-project.org>
Date: Tue,  8 Mar 2016 01:30:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : prueth-fw: add FW images for AM437x
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
X-List-Received-Date: Tue, 08 Mar 2016 01:30:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 61384b9c6ddb2d19ab45a69d1a1b80330fc6c146
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=61384b9c6ddb2d19ab45a69d1a1b80330fc6c146

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  8 07:17:47 2016 +0000

prueth-fw: add FW images for AM437x

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/prueth-fw/prueth-fw_git.bb |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 3b760ac..e4970aa 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -1,25 +1,28 @@
-DESCRIPTION = "PRU Ethernet firmware for AM57xx"
+DESCRIPTION = "PRU Ethernet firmware for AM57xx and AM437x"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "1.0.0"
-PR = "r0"
+PV_am57xx-evm = "1.0.0"
+PV_am437x-evm = "2.1.2"
+
+PR = "r1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am57xx-evm"
+COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "4ead3b8c189f217ee2c01ea3c56ef08d6a517f28"
+SRCREV = "f6c712fd26044d90939ff774f07dfcb951bcefc9"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-TARGET = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+TARGET_am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+TARGET_am437x-evm = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/ti-pruss


