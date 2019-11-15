Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 920DBE00E97; Fri, 15 Nov 2019 07:34:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48F21E00EB9
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:24 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYN6H067981
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832064;
	bh=yorDD0Tm+uKkmGj9HezyE0LgEq1cIj3hSp/srw0upZ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tk40TJDJjl/Z9bLPvFnVNxWKMu1JvKbH4JLabHUJtGlAaLABYt+xGfgta48MGFebj
	7yopI0EFxMSi2VizSJshfmz3VLshj+XddK6JFs9sUyKTSyYUlkKtYOVaHa/MneH/0W
	4KLSIsynhNmZzKIeRHec6ZjTuhY68tvpxcw3xb+o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYNE0095275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:23 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:23 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBg2041975;
	Fri, 15 Nov 2019 09:34:23 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:15:00 -0500
Message-ID: <1573830902-17409-41-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 40/42] cal-lld: TI RTOS low level driver for CAL
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:27 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb | 78 +++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 recipes-bsp/cal-lld/cal-lld-rtos_git.bb

diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
new file mode 100644
index 0000000..9a34cd2
--- /dev/null
+++ b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
@@ -0,0 +1,78 @@
+SUMMARY = "TI RTOS low level driver for CAL"
+
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.cal"
+
+PE = "1"
+
+require recipes-ti/includes/ti-paths.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cal.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+                   fvid2-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+CAL_PACKAGE_BASE   = "${WORKDIR}/cal_base"
+CAL_LLD_ROOTPATH = "${CAL_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/cal"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export PDK_CAL_ROOT_PATH = "${CAL_PACKAGE_BASE}/package/all/pdk_/packages"
+
+LIMSOCS = ""
+LIMSOCS_am65xx-evm = "am65xx"
+LIMSOCS_am65xx-hs-evm = "am65xx"
+
+LIMBOARDS = ""
+LIMBOARDS_am65xx-evm = "am65xx_evm"
+LIMBOARDS_am65xx-hs-evm = "am65xx_evm"
+
+BOARD_PACKAGE = ""
+BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
+BOARD_PACKAGE_am65xx-hs-evm = "am65xx_evm"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "CAL"
+
+do_configure() {
+    rm -rf ${CAL_PACKAGE_BASE}
+    cd ${S}
+
+    # remove any previous package
+    rm -f ${CAL_PACKAGE_BASE}
+
+    # make the release package before building it
+    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${CAL_PACKAGE_BASE} PDK_CAL_COMP_PATH=${S}
+}
+
+do_compile() {
+    echo "cal lld root path is ${CAL_LLD_ROOTPATH}"
+    cd ${CAL_LLD_ROOTPATH}
+
+    # Build am65xx libraries
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+
+    #archive
+    tar -cf cal_lld.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    cd ${CAL_LLD_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/cal \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags"
-- 
2.7.4


