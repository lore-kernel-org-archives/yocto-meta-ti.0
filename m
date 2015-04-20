Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF5CBE00952; Mon, 20 Apr 2015 13:20:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57909E00998
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 13:20:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B261952A86; Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150420202002.B261952A86@arago-project.org>
Date: Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mmap-lld: Update to new version 2.0.0.4
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
X-List-Received-Date: Mon, 20 Apr 2015 20:20:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3a38871f3cd81fa30023767f9105c7aea2a371f5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a38871f3cd81fa30023767f9105c7aea2a371f5

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 05:35:30 2015 +0000

mmap-lld: Update to new version 2.0.0.4

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld.inc |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index b8a5b32..a5158d5 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -4,13 +4,12 @@ COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
-
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
-# Commit correspond to DEV.MMAP.02.00.00.03
-SRCREV = "601f9284c392f67bb7f69ed1a5df5231a43c3137"
+# Commit correspond to DEV.MMAP.02.00.00.04
+SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
 
-PV="2.0.0"
-PR = "r0"
+PV = "2.0.0.4"
+PR = "r1"
 
-S = "${WORKDIR}/git/ti/runtime/mmap"
\ No newline at end of file
+S = "${WORKDIR}/git/ti/runtime/mmap"


