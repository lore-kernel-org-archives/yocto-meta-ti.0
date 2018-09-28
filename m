Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9988E00AAA; Fri, 28 Sep 2018 09:26:39 -0700 (PDT)
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
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E55D6E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQaTP058403
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151996;
	bh=xRyMvgpB77+RFRWJ5d96nBy2hsdtpCzAvog6PF+UBFg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KXkisbgjM6THepoOmUf6Rkf5qhzIFrqPgA7eGEliq1lRkgvxPonFfq4PgWNYupM7z
	Bs/fan/453ONlqq+WE+hjVeDAymrauZYZUQGWbJErojCw/jiOHOyq4Wd2rKndEiMMJ
	svyhrSlg2/fffSmWA8KsrtBLKgJrJnr4Df2qnYxM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQaM0000734
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMT011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:18 -0400
Message-ID: <1538151990-44823-18-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 17/29] udma-lld-rtos: Added support for udma-lld on rtos (initial version)
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 74 +++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bb

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
new file mode 100644
index 0000000..ad6be64
--- /dev/null
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -0,0 +1,74 @@
+SUMMARY = "TI RTOS low level driver for UDMA"
+DESCRIPTION = "TI RTOS low level driver for Universal DMA module "
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UDMA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/udma-lld.git"
+UDMA_LLD_GIT_PROTOCOL = "git"
+UDMA_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.00"
+UDMA_LLD_SRCREV = "745f7d3fa12cca6507821489451ffe0cfad4609e"
+
+BRANCH = "${UDMA_LLD_GIT_BRANCH}"
+SRC_URI = "${UDMA_LLD_GIT_URI};protocol=${UDMA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${UDMA_LLD_SRCREV}"
+PV = "01.00.00.00"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+                   sciclient-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+UDMA_PACKAGE_BASE   = "${S}/../udma_base"
+UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export PDK_UDMA_ROOT_PATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages"
+
+TI_PDK_LIMIT_BOARDS_k3 = "am65xx_evm"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "UDMA LLD"
+
+do_configure() {
+    
+   # remove any previous package
+    rm -rf ${UDMA_PACKAGE_BASE}
+
+    cd ${S}
+
+    # make the release package before building it
+    make package BOARD=${TI_PDK_LIMIT_BOARDS} DEST_ROOT=${UDMA_PACKAGE_BASE} PDK_UDMA_COMP_PATH=${S}
+}
+
+do_compile() {
+
+    cd ${UDMA_LLD_ROOTPATH}
+    
+    # Build am65xx libraries
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+
+    #archive
+    tar -cf udma_lld.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    cd ${UDMA_LLD_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags"
-- 
1.9.1


