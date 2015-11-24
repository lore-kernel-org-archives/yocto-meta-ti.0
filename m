Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A69FE00B46; Tue, 24 Nov 2015 12:38:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6418E00B44
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 12:38:00 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYC0056R6N0FJ11@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 24 Nov 2015 14:37:53 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=45lXSepng3jDXxENVaAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E0427161D26;	Tue,
	24 Nov 2015 15:37:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 24 Nov 2015 15:37:45 -0500
Message-id: <1448397465-8702-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] pmmc-fw: add initial PMMC firmware binary
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
X-List-Received-Date: Tue, 24 Nov 2015 20:38:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also deploy binary to DEPLOYDIR

 recipes-bsp/pmmc-fw/pmmc-fw_git.bb | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-bsp/pmmc-fw/pmmc-fw_git.bb

diff --git a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
new file mode 100644
index 0000000..206ac82
--- /dev/null
+++ b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "PMMC firmware"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "k2g-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+TARGET = "pmmc-firmware.bin"
+
+do_install() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
+}
+
+FILES_${PN} = "/boot"
+
+inherit deploy
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/ti-keystone/${TARGET} ${DEPLOYDIR}/${TARGET}
+}
+
+addtask deploy before do_build after do_compile
-- 
2.2.0


