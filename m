Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B9C5E00C4F; Mon, 12 Sep 2016 19:27:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38CDAE00BE0
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AB2CB529DB; Tue, 13 Sep 2016 02:27:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022703.AB2CB529DB@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: update and bump version due to image format change
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
X-List-Received-Date: Tue, 13 Sep 2016 02:27:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: eda7c92117cfdba0bb44a13e85bf676a836b481a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=eda7c92117cfdba0bb44a13e85bf676a836b481a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:54 2016 +0000

boot-monitor: update and bump version due to image format change

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index baefed4..04165b4 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -5,16 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+DEPENDS = "u-boot-mkimage-native"
+
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
 
-PV = "3.0+git${SRCPV}"
-PR = "r1"
+PV = "4.0+git${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "035329caed63abe7193c855ad5d561ae783b19d7"
+SRCREV = "cf8b431e8b3b2ee4a4aa08964d56d3ce1b11da24"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 


