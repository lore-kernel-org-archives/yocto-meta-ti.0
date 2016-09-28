Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98B5CE00C9D; Wed, 28 Sep 2016 00:26:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40270E00CA3
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 00:26:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 758D752A70; Wed, 28 Sep 2016 07:26:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160928072647.758D752A70@arago-project.org>
Date: Wed, 28 Sep 2016 07:26:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-sci-fw: update to version 0.1.1.22
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
X-List-Received-Date: Wed, 28 Sep 2016 07:26:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 84d1ecaf323f9a13ae791176bfa0aec99b587184
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=84d1ecaf323f9a13ae791176bfa0aec99b587184

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep 28 01:47:28 2016 +0000

ti-sci-fw: update to version 0.1.1.22

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 7cbe859..70c9698 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.1.12"
+PV = "0.1.1.22"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "89c279adfdd0e58f002ba6f0c26a14869b2d74cb"
+SRCREV = "43c9f88e3c9dc974cfcf9cf62befaf433ab1514b"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"


