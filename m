Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9ECE1E00A30; Tue,  7 Jul 2015 05:44:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48A75E009FD
	for <meta-ti@yoctoproject.org>; Tue,  7 Jul 2015 05:44:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67CiXI5000806
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:44:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67CiX2a006608
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:44:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 07:44:19 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67CiVTw030702;	Tue, 7 Jul 2015 07:44:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Jul 2015 08:44:28 -0400
Message-ID: <1436273068-28669-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1436273068-28669-1-git-send-email-j-stiffler@ti.com>
References: <1436273068-28669-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-cgt6x: Remove version 8.0.0
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
X-List-Received-Date: Tue, 07 Jul 2015 12:44:38 -0000
Content-Type: text/plain

* This has been superseded by version 8.0.3

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt6x_8.0.0.bb |  113 ---------------------------------
 1 file changed, 113 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
deleted file mode 100644
index 2353ebd..0000000
--- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
+++ /dev/null
@@ -1,113 +0,0 @@
-DESCRIPTION = "TI DSP Code Generation Tools"
-HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
-
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
-
-PE = "1"
-PR = "r1"
-
-require ../includes/ti-unpack.inc
-
-COMPATIBLE_HOST_class-target = "arm.*-linux"
-
-# For now we only have hardfp version for target class
-python __anonymous() {
-    c = bb.data.getVar("CLASSOVERRIDE", d, 1)
-
-    if c == "class-target":
-        tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
-        if not tunes:
-            return
-        pkgn = bb.data.getVar("PN", d, 1)
-        pkgv = bb.data.getVar("PV", d, 1)
-        if "callconvention-hard" not in tunes:
-            bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
-            raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
-}
-
-
-BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
-BINFILE_NAME = "cgt6x_x86_installer"
-TI_BIN_UNPK_ARGS = "--prefix ${S}"
-TI_BIN_UNPK_CMDS = ""
-
-BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
-BINFILE_NAME_class-target = "cgt6x_arm_installer"
-
-SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};name=${BINFILE_NAME}"
-
-SRC_URI[cgt6x_x86_installer.md5sum] = "ff83845672090bf0a669bba7b0cadf56"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709"
-
-SRC_URI[cgt6x_arm_installer.md5sum] = "13961e5a1da4c310ea8c8707ab981fff"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb"
-
-do_install() {
-    install -d ${D}${bindir}
-    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
-        install -m 755 ${binfile} ${D}${bindir}
-    done
-
-    install -d ${D}${datadir}/ti/cgt-c6x/bin
-    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
-        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
-    done
-
-    install -d ${D}${datadir}/ti/cgt-c6x/include
-    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
-        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
-    done
-
-    install -d ${D}${datadir}/ti/cgt-c6x/lib
-    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
-        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
-    done
-
-    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
-        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
-    done
-
-    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
-        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
-    done
-
-    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
-    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
-        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
-    done
-
-    install -d ${D}${datadir}/man/man1
-    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
-        install -m 644 ${manfile} ${D}${datadir}/man/man1
-    done
-
-    install -d ${D}${datadir}/doc/ti/cgt-c6x
-    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
-        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
-    done
-
-    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
-        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
-    done
-
-    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
-        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
-    done
-
-    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
-        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
-    done
-
-}
-
-do_install_class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
-}
-
-FILES_${PN} += "${datadir}/ti/*"
-
-FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


