Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C71DBE00AD8; Mon, 12 Sep 2016 15:42:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF69CE00B3D
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:41:15 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE00LJEXOEJOC0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Sep 2016 17:41:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=eIhxMilvRf8A:10 a=GW1xBdLrtEIA:10	a=sozttTNsAAAA:8
	a=RctBJbQCmSvCRw-lg5gA:9
Received: by 100.15.86.14 with SMTP id 284689e0; Mon, 12 Sep 2016 22:41:03 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id B16E216212E;	Mon, 12 Sep 2016 18:41:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Sep 2016 18:40:59 -0400
Message-id: <1473720059-26466-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1473720059-26466-1-git-send-email-denis@denix.org>
References: <1473720059-26466-1-git-send-email-denis@denix.org>
Subject: [PATCH 8/8] serdes-fw: update to 3.3.0.2c version
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
X-List-Received-Date: Mon, 12 Sep 2016 22:42:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/serdes-fw/serdes-fw_git.bb | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

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
-- 
2.7.4


