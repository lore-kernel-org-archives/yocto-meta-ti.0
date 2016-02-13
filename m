Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6207E00CD1; Sat, 13 Feb 2016 06:29:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDB21E00CD1
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 06:29:01 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1DET11E009279
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 08:29:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1DET1jQ018924
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 08:29:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 13 Feb 2016 08:29:00 -0600
Received: from uda0876520.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1DESrmA009329;	Sat, 13 Feb 2016 08:29:00 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 13 Feb 2016 20:00:37 +0530
Message-ID: <1455373837-15354-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455373837-15354-1-git-send-email-anandb@ti.com>
References: <1455373837-15354-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] omap5-sgx-ddk-um-linux: SGX user mode driver v1.14 for all TI SoCs
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
X-List-Received-Date: Sat, 13 Feb 2016 14:29:02 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
new file mode 100644
index 0000000..1d0f09f
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRCREV = "0e98623e944864f080cd886906b46ea9a5d830e5"
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+PR = "r2"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    mkdir -p ${D}${libdir}/gbm
+    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
+}
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/*"
+FILES_${PN} +=  "${sysconfdir}/*"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+
+CLEANBROKEN = "1"
-- 
1.9.1


