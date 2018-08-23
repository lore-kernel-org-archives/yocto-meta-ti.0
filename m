Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 713BDE007B5; Wed, 22 Aug 2018 17:09:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52792E005B1
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:09:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N09Swt005524
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534982968;
	bh=62c/FrBRTz454aygIRacG5Hi6dfI7O6/rG081plT2Wo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fe9m1Z+iZi1UWVWUogHg91DuV03ga6g316/iCr7YQoKONg3VM7VqNsbo3Sn9ziDAQ
	xwRoGtF7OrxYjmPrr+8PQvXr2N4rkaMXvpCOGFBe6mqOuFUlYx17lw8Xj+9rSIEYDI
	dlJKoMPo2j0NViuV8ZIqbH1M68xF3chIzjdfoc0U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N09S4s020530
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:09:28 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 19:09:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 19:09:28 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N09Pbo020890;
	Wed, 22 Aug 2018 19:09:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <hzhang@ti.com>
Date: Wed, 22 Aug 2018 20:09:24 -0400
Message-ID: <1534982964-11887-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534982964-11887-1-git-send-email-sam.nelson@ti.com>
References: <1534982964-11887-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v2 4/4] sciclient: Add recipe for SCI client driver
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
X-List-Received-Date: Thu, 23 Aug 2018 00:09:30 -0000
Content-Type: text/plain

Sci client provides API to communicate with the core running System
firmware

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- Update URL
---
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
new file mode 100644
index 0000000..7be0add
--- /dev/null
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -0,0 +1,89 @@
+SUMMARY = "TI RTOS low level driver for SCICLIENT"
+DESCRIPTION = "TI RTOS low level driver for SCICLIENT "
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
+
+COMPATIBLE_MACHINE = "am65xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
+SCICLIENT_GIT_PROTOCOL = "git"
+SCICLIENT_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
+SCICLIENT_SRCREV = "4ac052a70764c5fcf9dd18d521fe3b631bfcd875"
+
+BRANCH = "${SCICLIENT_GIT_BRANCH}"
+SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${SCICLIENT_SRCREV}"
+PV = "01.00.00.00"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos common-csl-ip-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+SCICLIENT_PACKAGE_BASE   = "${S}/../sciclient_base"
+SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
+
+#export PDK_SCICLIENT_ROOT_PATH ="${WORKDIR}/build"
+#export DEST_ROOT="${S}"
+
+LIMSOCS = "am65xx"
+LIMSOCS_am65xx-evm = "am65xx"
+
+LIMBOARDS = "am65xx_evm"
+LIMBOARDS_am65xx-evm = "am65xx_evm"
+
+BOARD_PACKAGE = ""
+BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "SCICLIENT"
+
+do_configure() {
+
+    rm -rf ${SCICLIENT_PACKAGE_BASE}
+    cd ${S}
+
+    # remove any previous package
+    rm -f ${SCICLIENT_PACKAGE_BASE}
+
+    # make the release package before building it
+    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${SCICLIENT_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=${S}
+
+   # This is to ensure the make package completed successfully
+    cat  ${SCICLIENT_ROOTPATH}/makefile
+}
+
+do_compile() {
+
+    cd ${SCICLIENT_ROOTPATH}
+
+    # Clean
+    # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+
+    # Build am65xx libraries
+    make lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+
+    #archive
+    tar -cf sciclient.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    cd ${SCICLIENT_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
-- 
1.9.1


