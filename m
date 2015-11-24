Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E871E00B58; Tue, 24 Nov 2015 14:45:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAFE5E00B46
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 14:44:56 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2FF5D52976; Tue, 24 Nov 2015 22:44:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151124224456.2FF5D52976@arago-project.org>
Date: Tue, 24 Nov 2015 22:44:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : qmss-pdsp-fw: add initial QMSS PDSP firmware
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
X-List-Received-Date: Tue, 24 Nov 2015 22:45:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4fd966bcd5c6feb05546c791ef2a6f27d60d82dd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4fd966bcd5c6feb05546c791ef2a6f27d60d82dd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Nov 25 03:17:23 2015 +0000

qmss-pdsp-fw: add initial QMSS PDSP firmware

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb |   29 ++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

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


