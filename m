Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB62AE00712; Mon, 23 Feb 2015 07:53:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86DFBE006E9
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:53:10 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NFrAJL019168
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 09:53:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NFr97P001093
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 09:53:09 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 09:53:09 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1NFr95X025616;	Mon, 23 Feb 2015 09:53:09 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Feb 2015 10:52:59 -0500
Message-ID: <1424706779-19562-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3] ti-cgt6x: Add verion 8.0.0
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
X-List-Received-Date: Mon, 23 Feb 2015 15:53:21 -0000
Content-Type: text/plain

* Supports native and nativesdk classes as well as target.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |   86 +++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
new file mode 100644
index 0000000..4e6c6e3
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
@@ -0,0 +1,86 @@
+DESCRIPTION = "TI DSP Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "TI TSPA with portions under Thai Open Source Software Center & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & Public Domain & other similar"
+
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+
+require ../includes/ti-unpack.inc
+
+BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt6x_x86_installer"
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME_class-target = "cgt6x_arm_installer"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt6x_x86_installer.md5sum] = "ff83845672090bf0a669bba7b0cadf56"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709"
+
+SRC_URI[cgt6x_arm_installer.md5sum] = "13961e5a1da4c310ea8c8707ab981fff"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb"
+
+do_install() {
+    install -d ${D}${bindir}
+    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
+        install -m 755 ${binfile} ${D}${bindir}
+    done
+
+    install -d ${D}${datadir}/ti/cgt-c6x/include
+    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
+        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
+    done
+
+    install -d ${D}${datadir}/ti/cgt-c6x/lib
+    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
+        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
+    done
+
+    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
+        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
+    done
+
+    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
+        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
+    done
+
+    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
+    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
+        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
+    done
+
+    install -d ${D}${datadir}/man/man1
+    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
+        install -m 644 ${manfile} ${D}${datadir}/man/man1
+    done
+
+    install -d ${D}${datadir}/doc/ti/cgt-c6x
+    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
+        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
+    done
+
+    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
+        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
+    done
+
+    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
+        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
+    done
+
+    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
+        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
+    done
+
+}
+
+do_install_class-target() {
+    ${WORKDIR}/${BINFILE} --prefix ${D}
+}
+
+FILES_${PN} += "${datadir}/ti/*"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.9.5


