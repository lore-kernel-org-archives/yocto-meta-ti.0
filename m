Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EC91E00566; Tue, 14 Aug 2018 07:32:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2DB2E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 07:31:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EEVwTJ056729
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534257118;
	bh=EcDpM6bE2gil8+J0G9b5PKRGZg6NJqgTM1ANmuuPE+U=;
	h=From:To:CC:Subject:Date;
	b=hMRXWfH3yxFEPGv+sm+DzYza7F3hzjAEln3KOkhNx8dK6WFmjVO12ZzK1PflFRgGA
	6et79x3SgyBP54A9fg2D3vwvMNToUxBBJ/Cie95bw8dQk1Vinm1AHelg3G/T+syF1v
	S41qWYWOGV1ENpxSz+oF/qxpki58UkRZrn73RRNg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EEVw7E024839
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:31:58 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 09:31:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 09:31:57 -0500
Received: from hao-Ubuntu16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EEVvY3012090;
	Tue, 14 Aug 2018 09:31:57 -0500
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 14 Aug 2018 05:29:45 -0400
Message-ID: <1534238985-17254-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] recipes-ti: devtools: add GCC Linaro baremetal toolchain 2017.11 v7.2.1
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
X-List-Received-Date: Tue, 14 Aug 2018 14:32:00 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../gcc-linaro-baremetal-aarch64-native.bb         | 24 ++++++++++++++++++++++
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 24 ++++++++++++++++++++++
 recipes-ti/devtools/gcc-linaro.inc                 | 12 +++++++++++
 recipes-ti/includes/ti-paths.inc                   |  2 ++
 4 files changed, 62 insertions(+)
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
 create mode 100644 recipes-ti/devtools/gcc-linaro.inc

diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
new file mode 100644
index 0000000..5e3e3b6
--- /dev/null
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
@@ -0,0 +1,24 @@
+include recipes-ti/devtools/gcc-linaro.inc
+
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
+S = "${WORKDIR}/${PACKAGE_DIR}"
+
+LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
+
+SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
+SRC_URI[gcc-linaro-aarch64.sha256sum] = "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
+
+do_install() {
+    install -d ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
+
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
new file mode 100644
index 0000000..07a6f49
--- /dev/null
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
@@ -0,0 +1,24 @@
+include recipes-ti/devtools/gcc-linaro.inc
+
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
+S = "${WORKDIR}/${PACKAGE_DIR}"
+
+LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
+
+SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
+SRC_URI[gcc-linaro.sha256sum] = "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
+
+do_install() {
+    install -d ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
+
diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc-linaro.inc
new file mode 100644
index 0000000..6575fc5
--- /dev/null
+++ b/recipes-ti/devtools/gcc-linaro.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Linaro GCC for ARM"
+HOMEPAGE = "https://launchpad.net/gcc-arm-embedded"
+SECTION = "devel"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=${LIC_CHKSUM}"
+
+PV = "7.2.1"
+PR = "r0"
+
+GCC_ARM_YEAR = "2017.11"
+
+
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 4f99d5e..b6c15d7 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -56,6 +56,8 @@ export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
+export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
+export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
-- 
2.7.4


