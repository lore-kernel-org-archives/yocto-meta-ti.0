Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 945FFE00EE2; Mon, 22 Aug 2016 11:15:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA9CDE00ECF
	for <meta-ti@yoctoproject.org>; Mon, 22 Aug 2016 11:15:44 -0700 (PDT)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCB00GICPDPYJ90@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Aug 2016 13:15:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=SDxQuzefdekkt2T0m7AA:9
Received: by 100.15.86.14 with SMTP id 4c7085da; Mon, 22 Aug 2016 18:15:26 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 6B5F8162102;	Mon, 22 Aug 2016 14:15:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 22 Aug 2016 14:14:58 -0400
Message-id: <1471889699-5948-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] ti-gc320-driver: recipe for gc320 kernel mode driver
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
X-List-Received-Date: Mon, 22 Aug 2016 18:15:46 -0000

From: Gowtham Tammana <g-tammana@ti.com>

Kernel drivers for the Vivante GC320 chipset found in TI SoCs

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
new file mode 100644
index 0000000..9344e30
--- /dev/null
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Kernel drivers for the Vivante GC320 chipset found in TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-driver"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+# Need to branch out with ${PV} var
+BRANCH = "ti-${PV}-k4.4"
+
+SRCREV = "7a2b06ad1df46a274336f7ae0e24a9d67e72cd66"
+
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git/src"
+
+EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
+
+do_install() {
+    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+    install -m 644 ${S}/galcore.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+}
-- 
2.7.4


