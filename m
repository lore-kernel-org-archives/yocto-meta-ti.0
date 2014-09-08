Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB6E2E00786; Mon,  8 Sep 2014 15:19:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E88DE0056A
	for <meta-ti@yoctoproject.org>; Mon,  8 Sep 2014 15:19:44 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 53B0852A87; Mon,  8 Sep 2014 22:19:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140908221944.53B0852A87@arago-project.org>
Date: Mon,  8 Sep 2014 22:19:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: add voltage scaling binaries
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
X-List-Received-Date: Mon, 08 Sep 2014 22:19:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: b236fc5ea32ff5fac9e78171bff408ac7d7c8570
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b236fc5ea32ff5fac9e78171bff408ac7d7c8570

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep  9 03:21:43 2014 +0000

am33x-cm3: add voltage scaling binaries

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-bsp/am33x-cm3/am33x-cm3_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index 7731992..e5728ab 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.8.7"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
-SRCREV = "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
+SRCREV = "fffeab4236d4129ab046bb7081a8ac244134ad89"
 BRANCH ?= "next"
 
 SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
@@ -23,6 +23,7 @@ do_compile() {
 do_install() {
 	install -d ${D}${base_libdir}/firmware
 	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
+	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
 }
 
 FILES_${PN} += "${base_libdir}/firmware"


