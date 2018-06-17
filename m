Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0AF2E00E15; Sun, 17 Jun 2018 12:37:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98FE4E00CB2
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:37:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E942B20C15;
	Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NUHPqtTpqS0r; Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B08B20BBF;
	Sun, 17 Jun 2018 19:37:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BB9631634AD;
	Sun, 17 Jun 2018 15:37:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 17 Jun 2018 15:37:21 -0400
Message-Id: <1529264243-32781-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264243-32781-1-git-send-email-denys@ti.com>
References: <1529264243-32781-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 3/5] arm-trusted-firmware: add version 1.5 of ATF with K3 support
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:30 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../arm-trusted-firmware_1.5.bb                    | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
new file mode 100644
index 0000000..5a7fd21
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
@@ -0,0 +1,61 @@
+SUMMARY = "ARM Trusted Firmware"
+DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
+Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
+It provides implementations of various ARM interface standards such as the \
+Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
+(TBBR) and Secure monitor code."
+HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
+
+inherit deploy
+
+DEPENDS += "dtc-native"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+PV_append = "+git${SRCPV}"
+
+BRANCH = "ti-atf"
+SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
+
+SRCREV ?= "5a0daebab6bf72b27cc74151d4e596247f804e44"
+
+# Make ATF "aware" of OPTEE, no build dependency
+PACKAGECONFIG[optee] = "SPD=opteed"
+
+COMPATIBLE_MACHINE = "k3"
+ATFPLATFORM_k3 = "k3"
+ATFBOARD_k3 = "generic"
+
+PACKAGECONFIG_k3 = "optee"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" PLAT="${ATFPLATFORM}" TARGET_BOARD="${ATFBOARD}" ${PACKAGECONFIG_CONFARGS}'
+
+do_compile() {
+	oe_runmake all
+}
+
+do_install() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${D}/boot/
+}
+
+do_deploy() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${DEPLOYDIR}/
+}
+addtask deploy before do_build after do_compile
+
+FILES_${PN} = "/boot"
+SYSROOT_DIRS += "/boot"
-- 
2.7.4


