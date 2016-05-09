Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F76AE0077E; Mon,  9 May 2016 09:40:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DF18E0071C
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 09:40:42 -0700 (PDT)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6X00ED24ZA1B90@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 09 May 2016 11:40:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=2TjCG__PGJiSiX4drf4A:9
Received: by 100.15.86.14 with SMTP id 0b35844f; Mon, 09 May 2016 16:40:23 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9B31D161FF2;	Mon,
	9 May 2016 12:40:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 09 May 2016 12:40:18 -0400
Message-id: <1462812020-15437-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] prueth-fw: add FW images for am335x
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
X-List-Received-Date: Mon, 09 May 2016 16:40:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

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
-- 
2.2.0


