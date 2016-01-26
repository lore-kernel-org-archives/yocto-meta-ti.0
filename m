Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71341E00C05; Tue, 26 Jan 2016 13:37:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A6D7E00BFD
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:37:26 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K00AYIXE8ZN10@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Jan 2016 15:37:21 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=PtCuOgt4nefMGVKkZlkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5F9C5161E32;	Tue,
	26 Jan 2016 16:37:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 26 Jan 2016 16:37:20 -0500
Message-id: <1453844240-15572-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] netcp-sa-fw: add initial version 1.0.0
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
X-List-Received-Date: Tue, 26 Jan 2016 21:37:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb

diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
new file mode 100644
index 0000000..5f07b92
--- /dev/null
+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "NETCP SA firmware for Keystone"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PV = "1.0.0"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = "sa_mci.fw"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
-- 
2.2.0


