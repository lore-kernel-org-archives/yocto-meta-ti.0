Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3A68E00805; Tue,  7 Aug 2018 07:45:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AA7FE007D1
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2018 07:45:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77Ejrk0029869
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 09:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533653153;
	bh=/TPdGd+T+OLFDQAt/W3DpkxseyQSvbubTEsTyTE22Mc=;
	h=From:To:CC:Subject:Date;
	b=thfwKcTHPSW1LBW9irUfU66idoS3osWyMl6emQtAlf/txjjxPAh2sLIN7+UyT/Xr0
	A37RciZZL6ldpAlBKjIcHD4xzqypIFjW2s266eiR0Xh1AozaVIPHTCd3Jf1Rn5kKZo
	7as5W1F2VETUzaSbfKJKCUf7j1balK0rkremuHck=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77Ejrfb027255
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 09:45:53 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 09:45:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 09:45:53 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77EjrZ6027637;
	Tue, 7 Aug 2018 09:45:53 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Aug 2018 10:45:44 -0400
Message-ID: <1533653146-29074-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] Added SWTOOLS which is needed to build processor libs (DSPLIB, MATHLIB, etc) from source.
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
X-List-Received-Date: Tue, 07 Aug 2018 14:45:55 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/swtools/swtools_git.bb | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 recipes-ti/swtools/swtools_git.bb

diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
new file mode 100644
index 0000000..bd4c005
--- /dev/null
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "TI Software Tools"
+HOMEPAGE = "https://bitbucket.itg.ti.com/projects/PROC_LIBS/repos/swtools/browse"
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
+export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
+
+PATH_append = ":${XDC_INSTALL_DIR}"
+
+XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+
+export XDCPATH
+
+do_compile() {
+	cd ${S}/ti/mas/swtools
+	xdc
+}
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch staticdev"
+ALLOW_EMPTY_${PN} = "1"
+
-- 
1.9.1


