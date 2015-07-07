Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26B36E00A30; Tue,  7 Jul 2015 05:44:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8DD0E009F0
	for <meta-ti@yoctoproject.org>; Tue,  7 Jul 2015 05:44:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67CiVpW007606
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:44:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67CiV4Y006576
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:44:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 07:44:18 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67CiVTv030702;	Tue, 7 Jul 2015 07:44:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Jul 2015 08:44:27 -0400
Message-ID: <1436273068-28669-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-cgt6x: Add version 8.0.3
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
X-List-Received-Date: Tue, 07 Jul 2015 12:44:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt6x_8.0.3.bb |  114 +++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.3.bb

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.3.bb b/recipes-ti/devtools/ti-cgt6x_8.0.3.bb
new file mode 100644
index 0000000..23866d1
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.3.bb
@@ -0,0 +1,114 @@
+DESCRIPTION = "TI DSP Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+
+PE = "1"
+
+require ../includes/ti-unpack.inc
+
+COMPATIBLE_HOST_class-target = "arm.*-linux"
+
+# For now we only have hardfp version for target class
+python __anonymous() {
+    c = bb.data.getVar("CLASSOVERRIDE", d, 1)
+
+    if c == "class-target":
+        tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+        if not tunes:
+            return
+        pkgn = bb.data.getVar("PN", d, 1)
+        pkgv = bb.data.getVar("PV", d, 1)
+        if "callconvention-hard" not in tunes:
+            bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+            raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+
+BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt6x_x86_installer"
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME_class-target = "cgt6x_arm_installer"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt6x_x86_installer.md5sum] = "cac177c3b94bf308d5198230739639b4"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "9c9ebab9f29cfd55f7df1df888ede66da3c2ccc0440d602ef34564305f02b9fb"
+
+SRC_URI[cgt6x_arm_installer.md5sum] = "7966f5ad2f055c3462ac6c3c13453ed7"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "f435f886610fc7df585a6ef898494e621b3bfa17f20658436f5e63af86a9a987"
+
+do_install() {
+    install -d ${D}${bindir}
+    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
+        install -m 755 ${binfile} ${D}${bindir}
+    done
+
+    install -d ${D}${datadir}/ti/cgt-c6x/bin
+    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
+        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
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
+FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
+
+INSANE_SKIP_${PN} += "staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


