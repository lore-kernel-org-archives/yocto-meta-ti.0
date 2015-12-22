Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F3D6E00CFA; Tue, 22 Dec 2015 08:34:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5715EE00825
	for <meta-ti@yoctoproject.org>; Tue, 22 Dec 2015 08:34:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 552BA52AD3; Tue, 22 Dec 2015 16:34:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151222163408.552BA52AD3@arago-project.org>
Date: Tue, 22 Dec 2015 16:34:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : serdes-fw: add SerDes firmware images for Keystone
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
X-List-Received-Date: Tue, 22 Dec 2015 16:34:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c5a3170d766cb4ea476171ee72d868242dcb6348
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5a3170d766cb4ea476171ee72d868242dcb6348

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Dec 18 16:20:48 2015 -0500

serdes-fw: add SerDes firmware images for Keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/serdes-fw/serdes-fw_git.bb |   36 ++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
new file mode 100644
index 0000000..2564cec
--- /dev/null
+++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "SerDes firmware for Keystone PCIe and 1/10GigE"
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
+SRCREV = "8756d98081e1011a1334b0769f13ffb31d3b41bd"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+ORIGINPCIE = "ks2_pcie_serdes_1.0.0.bin"
+ORIGINGBE = "ks2_gbe_serdes_1.0.0.bin"
+ORIGINXGBE = "ks2_xgbe_serdes_1.0.0.bin"
+
+TARGETPCIE = "ks2_pcie_serdes.bin"
+TARGETGBE = "ks2_gbe_serdes.bin"
+TARGETXGBE = "ks2_xgbe_serdes.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 ${S}/ti-keystone/${ORIGINPCIE} ${D}${base_libdir}/firmware/${TARGETPCIE}
+	install -m 0644 ${S}/ti-keystone/${ORIGINGBE} ${D}${base_libdir}/firmware/${TARGETGBE}
+	install -m 0644 ${S}/ti-keystone/${ORIGINXGBE} ${D}${base_libdir}/firmware/${TARGETXGBE}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"


