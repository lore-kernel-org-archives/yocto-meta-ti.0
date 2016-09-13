Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52F85E00C41; Mon, 12 Sep 2016 19:27:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D495E00C37
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A87B452AC1; Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022704.A87B452AC1@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: remove old CM3 PM FW recipe for 3.14 kernel
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
X-List-Received-Date: Tue, 13 Sep 2016 02:27:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c000a7f2302d08b26967243a10f8116218ba9093
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c000a7f2302d08b26967243a10f8116218ba9093

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:55 2016 +0000

am33x-cm3: remove old CM3 PM FW recipe for 3.14 kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb |   29 --------------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
deleted file mode 100644
index 62aebb9..0000000
--- a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
-
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
-
-PV = "1.9.0"
-PR = "r1"
-PE = "1"
-
-SRCREV = "d85e6a17da1025adac9ab7f97dd7aa2a58c517ce"
-BRANCH ?= "ti-v3.14.y"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-
-do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}"
-}
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
-	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
-}
-
-FILES_${PN} += "${base_libdir}/firmware"


