Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 837D9E00C9B; Fri, 12 Feb 2016 13:34:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42B5AE00C95
	for <meta-ti@yoctoproject.org>; Fri, 12 Feb 2016 13:33:59 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9874852A80; Fri, 12 Feb 2016 21:33:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160212213357.9874852A80@arago-project.org>
Date: Fri, 12 Feb 2016 21:33:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-sci-fw: update to 0.1.1.1 version
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
X-List-Received-Date: Fri, 12 Feb 2016 21:34:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7e492603be1b812d08f55bf573bcfb8014e1e583
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7e492603be1b812d08f55bf573bcfb8014e1e583

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 13 02:04:58 2016 +0000

ti-sci-fw: update to 0.1.1.1 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index dff0712..5526776 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.0.70"
-PR = "r1"
+PV = "0.1.1.1"
+PR = "r0"
 
 CLEANBROKEN = "1"
 
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
+SRCREV = "382de6987b6683555f9c48ae6a2343f246434b38"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"


