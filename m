Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EE8BE00BFD; Tue, 26 Jan 2016 10:34:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3603 seconds by postgrey-1.32 at yocto-www;
	Tue, 26 Jan 2016 10:33:57 PST
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7542E00973
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 10:33:57 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K004XWM3WG0C0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Jan 2016 11:33:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=pNzdCsW42RBuckps54EA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CDF35161E08;	Tue,
	26 Jan 2016 12:33:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 26 Jan 2016 12:33:32 -0500
Message-id: <1453829612-1634-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] netcp-pa-fw: add initial version 1.0.0
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
X-List-Received-Date: Tue, 26 Jan 2016 18:34:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb

diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
new file mode 100644
index 0000000..9fd2541
--- /dev/null
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "NETCP PA firmware for Keystone"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PV = "1.0.0"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "55c708e391c5663a9ef0bb13970f2153f82fba36"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+FWBASENAME = " \
+ks2_pa_eg0_pdsp0 \
+ks2_pa_eg0_pdsp1 \
+ks2_pa_eg0_pdsp2 \
+ks2_pa_eg1_pdsp0 \
+ks2_pa_eg2_pdsp0 \
+ks2_pa_in0_pdsp0 \
+ks2_pa_in0_pdsp1 \
+ks2_pa_in1_pdsp0 \
+ks2_pa_in1_pdsp1 \
+ks2_pa_in2_pdsp0 \
+ks2_pa_in3_pdsp0 \
+ks2_pa_in4_pdsp0 \
+ks2_pa_in4_pdsp1 \
+ks2_pa_post_pdsp0 \
+ks2_pa_post_pdsp1 \
+"
+
+FWBASENAME_k2hk-evm = " \
+ks2_pa_pdsp0_classify1 \
+ks2_pa_pdsp1_classify1 \
+ks2_pa_pdsp2_classify1 \
+ks2_pa_pdsp3_classify2 \
+ks2_pa_pdsp4_pam \
+ks2_pa_pdsp5_pam \
+"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	for f in ${FWBASENAME}; do
+		install -m 0644 ${S}/ti-keystone/$f-${PV}.bin ${D}${base_libdir}/firmware/$f.bin
+	done
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
-- 
2.2.0


