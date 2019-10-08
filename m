Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0C51E00942; Tue,  8 Oct 2019 13:07:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FF03E003E1
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 13:07:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1FDE40BDE;
	Tue,  8 Oct 2019 20:07:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jFZq_tekr4c5; Tue,  8 Oct 2019 20:07:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDB7B40A2D;
	Tue,  8 Oct 2019 20:07:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A249D174221;
	Tue,  8 Oct 2019 16:07:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue,  8 Oct 2019 16:07:15 -0400
Message-Id: <1570565235-11804-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] pru-pwm-fw: add PRU PWM Firmware recipe
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
X-List-Received-Date: Tue, 08 Oct 2019 20:07:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pru/pru-pwm-fw_git.bb | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-pwm-fw_git.bb

diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb
new file mode 100644
index 0000000..0fe7987
--- /dev/null
+++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Programmable Real-time Unit PWM Firmware"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=32;md5=893d6a0cf1644338ea96642c0db97f59"
+
+require recipes-ti/includes/ti-paths.inc
+
+COMPATIBLE_MACHINE = "am65xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
+SRCREV = "989f802266d52f50a6db8f2be6967eacd9d2b409"
+
+PV = "01.00.00.15B"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git;protocol=git;branch=${BRANCH}"
+
+DEPENDS = "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
+
+S = "${WORKDIR}/git/example/apps/icssg_pwm/firmware/src"
+
+EXTRA_OEMAKE += " \
+    PRU_CGT="${TI_CGT_PRU_INSTALL_DIR}" \
+    PRU_SSP="${STAGING_DIR_TARGET}/usr" \
+    PDK_INSTALL_DIR="${STAGING_DATADIR}/ti/ti-pdk-tree/packages" \
+"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}/lib/firmware/ti-pruss
+	install -m 0644 ${S}/gen/pwm.out ${D}/lib/firmware/ti-pruss/am65x-pru0-pwm-fw.elf
+}
+
+FILES_${PN} = "/lib/firmware"
+
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


