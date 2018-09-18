Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57EBDE00AF4; Tue, 18 Sep 2018 06:11:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D33F2E00566
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 06:11:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IDBbVL091575
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 08:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537276298;
	bh=PaEe/aDjPxqQOgIGy16GXO6Bp3n9DcpyvCzOuNifnCY=;
	h=From:To:CC:Subject:Date;
	b=PBmBzl7KbHTzbY5WQgWewSEOYg4MTtfM/vnAdHU+qM9xVrpgonOg4+3Dq0GWQXVBP
	zqnTLcCSYaCV83jTZI23EohHmbEfGJKUDPnDVII/0gdVjkhv/+kVV5G8xbsCVFN0b2
	7oyjIHxUFx/yxKYkRxWx4KAfEjQA3xNViVDRNYoU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IDBbDk018853
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 08:11:37 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 08:11:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 08:11:37 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IDBbU5027519;
	Tue, 18 Sep 2018 08:11:37 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Sep 2018 09:11:28 -0400
Message-ID: <1537276288-12593-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] swtools: common tools for xdc-based component build
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
X-List-Received-Date: Tue, 18 Sep 2018 13:11:39 -0000
Content-Type: text/plain

swtools: common tools for xdc-based component build

Add SWTOOLS which is needed to build xdc-based processor libs such as
DSPLIB, MATHLIB, etc from source.

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/includes/ti-paths.inc  |  2 ++
 recipes-ti/swtools/swtools_git.bb | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-ti/swtools/swtools_git.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a401264..f797a2d 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -39,6 +39,7 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
 export SYSBIOS_INSTALL_DIR_RECIPE    = "${installdir}/ti-sysbios-tree"
 export SYSLINK_INSTALL_DIR_RECIPE    = "${installdir}/ti-syslink-tree"
+export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
 export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
 export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
 export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
@@ -97,6 +98,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
+export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
new file mode 100644
index 0000000..425a069
--- /dev/null
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "TI Software Tools"
+HOMEPAGE = "https://git.ti.com/ep-processor-libraries/swtools"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d"
+
+require ../includes/ti-paths.inc
+
+DEPENDS = "ti-cgt6x-native \
+           ti-sysbios \
+           ti-xdctools-native"
+
+PV = "5_0_8"
+PR = "r0"
+S = "${WORKDIR}/git"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
+SRCREV = "881267836907de650edadc56b8e57ab45428021d"
+
+export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL  = "${CGTOOLS_INSTALL_DIR}"
+
+PATH_append = ":${XDC_INSTALL_DIR}"
+
+XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+
+export XDCPATH
+
+do_compile() {
+	cd ${S}/ti/mas/swtools
+	xdc
+}
+
+do_install() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+	cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch staticdev"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


