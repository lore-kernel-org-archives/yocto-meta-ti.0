Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DD22E00B36; Thu, 30 Jul 2015 08:26:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73477E00AEB
	for <meta-ti@yoctoproject.org>; Thu, 30 Jul 2015 08:26:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E792F52AA2; Thu, 30 Jul 2015 15:26:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150730152611.E792F52AA2@arago-project.org>
Date: Thu, 30 Jul 2015 15:26:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : amx3-cm3: add new PM firmware for 4.1 kernel
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
X-List-Received-Date: Thu, 30 Jul 2015 15:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 650aff73de019af5aba0ccc10b15c4df1b60312a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=650aff73de019af5aba0ccc10b15c4df1b60312a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul 30 09:15:41 2015 +0000

amx3-cm3: add new PM firmware for 4.1 kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb |   28 +++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
new file mode 100644
index 0000000..d322530
--- /dev/null
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
+
+PV = "1.9.1"
+PR = "r0"
+
+SRCREV = "277eef8611e260a5d73a9e3773fff8f767fe2b01"
+BRANCH ?= "next-upstream"
+
+SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
+do_compile() {
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}"
+}
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
+	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
+}
+
+FILES_${PN} += "${base_libdir}/firmware"


