Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B92BE00C17; Mon, 12 Sep 2016 19:27:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA4EAE00C17
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2CA9552AB0; Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022704.2CA9552AB0@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : serdes-fw: update to 3.3.0.2c version
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
X-List-Received-Date: Tue, 13 Sep 2016 02:27:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 33f12de8050b024b321b14b6f255fc01de89a913
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=33f12de8050b024b321b14b6f255fc01de89a913

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:59 2016 +0000

serdes-fw: update to 3.3.0.2c version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/serdes-fw/serdes-fw_git.bb |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
index 2564cec..69e1e97 100644
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "SerDes firmware for Keystone PCIe and 1/10GigE"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "1.0.0"
-PR = "r0"
+PV = "3.3.0.2c"
 
 CLEANBROKEN = "1"
 
@@ -12,25 +11,19 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "8756d98081e1011a1334b0769f13ffb31d3b41bd"
+SRCREV = "8d861bd8f8f792df60b6873989ff208766fbebae"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-ORIGINPCIE = "ks2_pcie_serdes_1.0.0.bin"
-ORIGINGBE = "ks2_gbe_serdes_1.0.0.bin"
-ORIGINXGBE = "ks2_xgbe_serdes_1.0.0.bin"
-
-TARGETPCIE = "ks2_pcie_serdes.bin"
-TARGETGBE = "ks2_gbe_serdes.bin"
-TARGETXGBE = "ks2_xgbe_serdes.bin"
+TARGET = "ks2_pcie_serdes.bin ks2_gbe_serdes.bin ks2_xgbe_serdes.bin"
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-keystone/${ORIGINPCIE} ${D}${base_libdir}/firmware/${TARGETPCIE}
-	install -m 0644 ${S}/ti-keystone/${ORIGINGBE} ${D}${base_libdir}/firmware/${TARGETGBE}
-	install -m 0644 ${S}/ti-keystone/${ORIGINXGBE} ${D}${base_libdir}/firmware/${TARGETXGBE}
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-keystone/$f ${D}${base_libdir}/firmware/$f
+	done
 }
 
 FILES_${PN} = "${base_libdir}/firmware"


