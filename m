Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A822E009BD; Fri,  4 Dec 2015 19:12:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E973E009EA
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C07952AC5; Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031210.7C07952AC5@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-sci-fw: rename PMMC firmware to TI SCI and update to the latest
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f5c1f1943b24a5a678c0af309692e01722139b06
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5c1f1943b24a5a678c0af309692e01722139b06

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec  5 04:15:15 2015 +0000

ti-sci-fw: rename PMMC firmware to TI SCI and update to the latest

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../pmmc-fw_git.bb => ti-sci-fw/ti-sci-fw_git.bb}  |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
similarity index 82%
rename from recipes-bsp/pmmc-fw/pmmc-fw_git.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 8d86234..4294c6b 100644
--- a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "PMMC firmware"
+DESCRIPTION = "TI SCI firmware"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.0.63"
+PV = "0.1.0.70"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,13 +12,13 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
+SRCREV = "a5b1c3d043fef5869eaa937276976c0e3e23b966"
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-TARGET = "pmmc-firmware.bin"
+TARGET = "ti-sci-firmware-k2g.bin"
 
 do_install() {
 	install -d ${D}/boot


