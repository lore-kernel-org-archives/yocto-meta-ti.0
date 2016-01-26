Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54D67E00C06; Tue, 26 Jan 2016 12:18:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29F75E00BFE
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 12:18:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 66E09529CF; Tue, 26 Jan 2016 20:18:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160126201849.66E09529CF@arago-project.org>
Date: Tue, 26 Jan 2016 20:18:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netcp-pa-fw: add initial version 1.0.0
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
X-List-Received-Date: Tue, 26 Jan 2016 20:18:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 237e708d0504b13073a2db5ae6b4a6c6877d07b1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=237e708d0504b13073a2db5ae6b4a6c6877d07b1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jan 26 23:33:32 2016 +0000

netcp-pa-fw: add initial version 1.0.0

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb |   56 ++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

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


