Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 532C3E00973; Mon, 21 Mar 2016 09:44:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58A5AE00CC6
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:44:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A09952A1C; Mon, 21 Mar 2016 16:44:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321164438.6A09952A1C@arago-project.org>
Date: Mon, 21 Mar 2016 16:44:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-sci-fw: update to the latest version 0.1.1.4
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
X-List-Received-Date: Mon, 21 Mar 2016 16:44:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7e26452bae0b01922509883a4935cfb64f2bfd1f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7e26452bae0b01922509883a4935cfb64f2bfd1f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 21 22:36:54 2016 +0000

ti-sci-fw: update to the latest version 0.1.1.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 5526776..877d510 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.1.1"
+PV = "0.1.1.4"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "382de6987b6683555f9c48ae6a2343f246434b38"
+SRCREV = "11c3f5df2276c542966c32e95289ec49d111a696"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"


