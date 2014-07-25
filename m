Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50002E006C4; Fri, 25 Jul 2014 10:23:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02345E003FA
	for <meta-ti@yoctoproject.org>; Fri, 25 Jul 2014 10:23:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 95E1E529B9; Fri, 25 Jul 2014 17:23:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140725172309.95E1E529B9@arago-project.org>
Date: Fri, 25 Jul 2014 17:23:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: update to 2014.07 release version
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
X-List-Received-Date: Fri, 25 Jul 2014 17:23:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: fd4246e492525a6b143cefec2f0a942f8d0a8d95
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fd4246e492525a6b143cefec2f0a942f8d0a8d95

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul 24 02:39:19 2014 +0000

u-boot: update to 2014.07 release version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-bsp/u-boot/u-boot_2014.07.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
index 9da6f7d..91406f9 100644
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -11,17 +11,14 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-# This is still an RC so set the PV accordingly to allow proper version
-# ordering when the RC is dropped.
-PV = "2014.04+2014.07-rc3"
-PR = "r0"
+PV = "2014.07"
 
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-# Corresponds to tag v2014.07-rc3
-SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
+# Corresponds to tag v2014.07
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


