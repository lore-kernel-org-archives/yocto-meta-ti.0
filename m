Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 352E0E00F2E; Wed, 27 Jul 2016 18:36:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69D3FE00F2D
	for <meta-ti@yoctoproject.org>; Wed, 27 Jul 2016 18:36:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 87ADF52A96; Thu, 28 Jul 2016 01:36:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160728013624.87ADF52A96@arago-project.org>
Date: Thu, 28 Jul 2016 01:36:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to the latest
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
X-List-Received-Date: Thu, 28 Jul 2016 01:36:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6eccda9769f3fb0c8084204f19a04b0153df5f38
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6eccda9769f3fb0c8084204f19a04b0153df5f38

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul 28 07:29:50 2016 +0000

u-boot-ti-staging: update to the latest

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index f6377de..b633e83 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r10"
+PR = "r11"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2016.05"
 
-SRCREV = "a4560200fc597109328a6454094fa77516434880"
+SRCREV = "c389a5bbaace49c9ac16a9ff2b2b7b6b2545932e"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""


