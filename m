Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0215E00B60; Mon,  9 May 2016 07:40:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBCFEE00B60
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 07:40:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3F775529C2; Mon,  9 May 2016 14:40:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160509144025.3F775529C2@arago-project.org>
Date: Mon,  9 May 2016 14:40:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-sci-fw: update to the latest 0.1.1.12
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
X-List-Received-Date: Mon, 09 May 2016 14:40:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9b6527720cf43d2042cdc93b91d0f8f04cc02da7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9b6527720cf43d2042cdc93b91d0f8f04cc02da7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri May  6 23:27:20 2016 +0000

ti-sci-fw: update to the latest 0.1.1.12

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 877d510..7cbe859 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.1.4"
+PV = "0.1.1.12"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "11c3f5df2276c542966c32e95289ec49d111a696"
+SRCREV = "89c279adfdd0e58f002ba6f0c26a14869b2d74cb"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"


