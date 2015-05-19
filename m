Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77AFFE0027F; Tue, 19 May 2015 11:24:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59BFDE004F6
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 11:24:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 142C052A31; Tue, 19 May 2015 18:24:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150519182449.142C052A31@arago-project.org>
Date: Tue, 19 May 2015 18:24:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline: update to the latest stable 3.14. 43 and lower default preference
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
X-List-Received-Date: Tue, 19 May 2015 18:24:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 0b7d3bcc374f3aff7e2ceda114c8613e22406a0a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0b7d3bcc374f3aff7e2ceda114c8613e22406a0a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue May 19 23:55:08 2015 +0000

linux-mainline: update to the latest stable 3.14.43 and lower default preference

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline_3.14.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index 440e170..b1d4eec 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -26,15 +26,15 @@ KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-COMPATIBLE_MACHINE = "ti33x|omap3"
+DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
 
 BRANCH = "linux-3.14.y"
 
-# Corresponds to tag v3.14.25
-SRCREV = "2dc2565902d3c24108c4b7101e91957fd068a242"
-PV = "3.14.25"
+# Corresponds to tag v3.14.43
+SRCREV = "13253707013a08ce5a279ebd029fa10230172458"
+PV = "3.14.43"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


