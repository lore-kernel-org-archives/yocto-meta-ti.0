Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF53BE00A16; Thu, 13 Sep 2018 14:02:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D7C4E006AF
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 14:02:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DL20km011899
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536872520;
	bh=xgYb2cw+zh10wE4EhnOiTuq1hmWlaOATeIui/L9X314=;
	h=From:To:CC:Subject:Date;
	b=HV4vkFWBDi4WqQFKeO2IAKEfFWZOhR+kjcGnp/C49BI7B0QwvwFNXdg/pBT1DsKk7
	tsov49f5bkHPdnlZyeojnnZgVbxBENinF0XfPJ+5TQsu8F8hqW6qYD9Hw0oyytTJvr
	fT7jPtupSIpL5C1c5IbBkSoqVTIClSmMwX6hC4yw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DL1xRQ028036
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:02:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 16:02:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 16:02:00 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DL1xLo004190;
	Thu, 13 Sep 2018 16:01:59 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 13 Sep 2018 17:01:56 -0400
Message-ID: <1536872516-40226-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3 v3] Added SWTOOLS which is needed to build processor libs (DSPLIB, MATHLIB, etc) from source.
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
X-List-Received-Date: Thu, 13 Sep 2018 21:02:01 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
Change from previous version of patch:
Corrected incorrect white spaces, indentations, blank lines.
---
---
 recipes-ti/swtools/swtools_git.bb | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-ti/swtools/swtools_git.bb

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


