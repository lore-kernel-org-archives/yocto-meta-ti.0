Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5901.1575313538302496861
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uQDRw2RN;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D5F8E010FD; Mon,  2 Dec 2019 11:05:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C147E008DB
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2019 11:05:37 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2J5bHn039530
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:05:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575313537;
	bh=yuc2kq3yuLgqlU0Zhj1LIY5xdgcxCaikanrmLYvBzO0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uQDRw2RNx/9atryE9XxYp/8DwEll6eXdsJDqz9Fr+rvRpJmttDEMYXbcdfIQrG+ur
	 xaQ1XAkc27Q32j3URZowI5lITJeCa/7IjOAW4qN3ldXaIbNiS4ngfKF+kTWS3vt5DS
	 +es9L/knjaXVr5jZWjJ69BB/touuYajWHzrnZnmE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB2J5beu100043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:05:37 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 13:05:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 13:05:36 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2J4rli070019;
	Mon, 2 Dec 2019 13:05:36 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud][PATCH v2 41/42] fvid2: TI RTOS Video Driver Interface
Date: Mon, 2 Dec 2019 13:45:45 -0500
Message-ID: <1575312346-16973-41-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575312346-16973-1-git-send-email-j-stiffler@ti.com>
References: <1575312346-16973-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Remove inclusion of ti-path as this is already handled by
  ti-pdk.bbclass.

 recipes-bsp/fvid2/fvid2-rtos_git.bb | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 recipes-bsp/fvid2/fvid2-rtos_git.bb

diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-rtos_git.bb
new file mode 100755
index 0000000..db1f9e1
--- /dev/null
+++ b/recipes-bsp/fvid2/fvid2-rtos_git.bb
@@ -0,0 +1,68 @@
+SUMMARY = "TI RTOS Video Driver Interface"
+
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.fvid2"
+
+PE = "1"
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
-- 
2.7.4

