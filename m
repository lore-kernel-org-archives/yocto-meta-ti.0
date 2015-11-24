Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F1E8E00B58; Tue, 24 Nov 2015 13:17:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9F97E00B45
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 13:17:49 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYC002UP8H0J660@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 24 Nov 2015 15:17:25 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=9DGSLV7ZZuGawUqVxiwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 76BD1161D26;	Tue,
	24 Nov 2015 16:17:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 24 Nov 2015 16:17:23 -0500
Message-id: <1448399843-23744-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] qmss-pdsp-fw: add initial QMSS PDSP firmware
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
X-List-Received-Date: Tue, 24 Nov 2015 21:17:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb

diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
new file mode 100644
index 0000000..dfff22e
--- /dev/null
+++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "QMSS PDSP firmware"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PV = "1.0.0.9"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+ORIGIN = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin"
+TARGET = "ks2_qmss_pdsp_acc48.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 ${S}/ti-keystone/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
-- 
2.2.0


