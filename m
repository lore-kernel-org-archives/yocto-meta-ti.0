Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2AB32E008DC; Thu, 26 Feb 2015 09:11:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF94CE0088A
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:11:42 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BF6F6529E0; Thu, 26 Feb 2015 17:11:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150226171141.BF6F6529E0@arago-project.org>
Date: Thu, 26 Feb 2015 17:11:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt6x: Add verion 8.0.0
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
X-List-Received-Date: Thu, 26 Feb 2015 17:11:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 6a130efc74d20ac5b436feaf58cc69e1315b9676
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6a130efc74d20ac5b436feaf58cc69e1315b9676

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Feb 25 22:54:04 2015 +0000

ti-cgt6x: Add verion 8.0.0

* Supports native and nativesdk classes as well as target.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |  105 +++++++++++++++++++++++++++++++++
 1 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
new file mode 100644
index 0000000..d297930
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
@@ -0,0 +1,105 @@
+DESCRIPTION = "TI DSP Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "TI TSPA with portions under Thai Open Source Software Center & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & Public Domain & other similar"
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


