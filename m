Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 116D3E00E13; Thu,  7 Nov 2019 10:10:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D380BE00E22
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:59 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9wOq020159
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150198;
	bh=6Un1uNwkUV5Xf2SZ6IZr3m1DAOl/IA9eI1w7ZTkDlSA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bhokU+EgZq7NhmE1m0vHLBcXw+1ni3Bzh6Mvx8MKYMGQCvr0XV1DqWqn8+0G4ehKD
	qc+r1xXzyr98FYvdTFMrMkOE0GDNJQyIpkQMEaXTnZARgkvNZUK0aVfInMwLifky19
	j8gZRDz1rMJyybh2AbFVHEiSYYLegfokOYdNbTEo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9wH7004266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:58 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:43 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIl067418;
	Thu, 7 Nov 2019 12:09:58 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:36 -0500
Message-ID: <1573149037-762-42-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 41/42] fvid2: TI RTOS Video Driver Interface
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/fvid2/fvid2-rtos_git.bb | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 recipes-bsp/fvid2/fvid2-rtos_git.bb

diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-rtos_git.bb
new file mode 100755
index 0000000..491e6b2
--- /dev/null
+++ b/recipes-bsp/fvid2/fvid2-rtos_git.bb
@@ -0,0 +1,68 @@
+SUMMARY = "TI RTOS Video Driver Interface"
+
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
+
+require recipes-ti/includes/ti-paths-append.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://fvid2.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+FVID2_PACKAGE_BASE   = "${WORKDIR}/fvid2_base"
+FVID2_ROOTPATH = "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/fvid2"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export PDK_FVID2_ROOT_PATH = "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages"
+
+
+BOARD_PACKAGE = ""
+BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
+BOARD_PACKAGE_am65xx-hs-evm = "am65xx_evm"
+BOARD_PACKAGE_j7-evm = "j721e_evm"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FVID2"
+
+do_configure() {
+    rm -rf ${FVID2_PACKAGE_BASE}
+    cd ${S}
+
+    # remove any previous package
+    rm -f ${FVID2_PACKAGE_BASE}
+
+    # make the release package before building it
+    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${FVID2_PACKAGE_BASE} PDK_FVID2_COMP_PATH=${S}
+}
+
+do_compile() {
+    echo "fvid2 root path is ${FVID2_ROOTPATH}"
+    cd ${FVID2_ROOTPATH}
+
+    # Build am65xx libraries
+    make clean lib xdc_meta LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"  LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
+
+    #archive
+    tar -cf fvid2.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    cd ${FVID2_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2 \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags"
+TI_PDK_COMP = "ti.drv.fvid2"
-- 
2.7.4


