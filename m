Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAA58E00B54; Tue,  8 Sep 2015 08:58:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF702E00B54
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 08:57:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0131952A02; Tue,  8 Sep 2015 15:57:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908155755.0131952A02@arago-project.org>
Date: Tue,  8 Sep 2015 15:57:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omap5-sgx-ddk-um-linux: Bump SRCREV for am4/k4.1 branch
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
X-List-Received-Date: Tue, 08 Sep 2015 15:58:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 45f4403d2c8fd0da02da24f78bebbb216f994a8e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=45f4403d2c8fd0da02da24f78bebbb216f994a8e

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Tue Sep  8 20:32:40 2015 +0000

omap5-sgx-ddk-um-linux: Bump SRCREV for am4/k4.1 branch

* Get changes for adding softlinks for libGLES_CM.so.1 and libGLESv2.so.1

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index a97f88b..55fa33a 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -11,15 +11,15 @@ BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
-SRCREV_ti33x    = "c30d4b35701e1b88d58a9ae713b2e679298d1a37"
-SRCREV_ti43x    = "c30d4b35701e1b88d58a9ae713b2e679298d1a37"
+SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
+SRCREV_ti43x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
 
 INITSCRIPT_NAME = "pvr-init"
 INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r10"
+PR = "r11"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"


