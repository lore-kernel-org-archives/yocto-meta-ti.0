Return-Path: <sjha@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D73DE0096F; Fri, 20 Sep 2019 10:16:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73D17E008D9
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 10:16:34 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KHGXxV011920
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 12:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568999793;
	bh=geuuM4VNckOCpxu/RbeQr4RTBQu473j1lTMETYxc0hk=;
	h=From:To:CC:Subject:Date;
	b=HrSA9Ha6sfTHglrr4fmoSe3HfBfXR3+fU06wFXWI2nQYRjZBx7ByOxT+fEUANieiq
	3Gbe3Ct2LNI4T0e/h3AxszjwipTzkkf3iLfu5eFxya+lO5xVHLgV8hrU/iRiwvNy0f
	mP2cVA09Me1eb4Nzwrspn3b+D1rnS2xJkAOuOQN0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KHGXEn120544
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 12:16:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 12:16:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 12:16:33 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KHGXSo023524;
	Fri, 20 Sep 2019 12:16:33 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 20 Sep 2019 12:16:10 -0500
Message-ID: <20190920171610.32176-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ipc-lld: Adding recipe for IPC low-level driver and examples
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
X-List-Received-Date: Fri, 20 Sep 2019 17:16:35 -0000
Content-Type: text/plain

IPC-LLD provides the low-level RPMSG based
communication interface between various cores

Signed-off-by: Santosh Jha <sjha@ti.com>
---
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 51 +++++++++++++++++++
 recipes-ti/ipc-lld/ipc-lld-rtos_git.bb        | 45 ++++++++++++++++
 recipes-ti/ipc-lld/ipc-lld.inc                | 38 ++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 recipes-ti/ipc-lld/ipc-lld-examples-rtos_git.bb
 create mode 100644 recipes-ti/ipc-lld/ipc-lld-rtos_git.bb
 create mode 100644 recipes-ti/ipc-lld/ipc-lld.inc

diff --git a/recipes-ti/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-ti/ipc-lld/ipc-lld-examples-rtos_git.bb
new file mode 100644
index 00000000..cadde4d2
--- /dev/null
+++ b/recipes-ti/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -0,0 +1,51 @@
+SUMMARY = "echo_test for IPC-LLD"
+
+require ipc-lld.inc
+
+DEPENDS_append = " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos"
+
+REMOTE_FW_DIR = "${S}/examples/echo_test/yocto_bin"
+REMOTE_FW_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_test/bin"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} += "${base_libdir}/firmware"
+
+DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc/"
+
+do_configure() {
+    #Nothing to configure
+    :
+}
+
+do_compile() {
+    cd ${S}
+
+    for board in ${TI_PDK_LIMIT_BOARDS}
+    do
+        for core in ${TI_PDK_LIMIT_CORES}
+        do
+            oe_runmake examples BOARD="${board}" CORE="${core}" DEST_ROOT=${REMOTE_FW_DIR}
+        done
+    done
+}
+
+do_install() {
+    install -d ${D}${DST_BIN_PATH}
+
+    for board in ${TI_PDK_LIMIT_BOARDS}
+    do
+        for core in ${TI_PDK_LIMIT_CORES}
+        do
+            install -m 0644 ${REMOTE_FW_BIN_DIR}/${board}/ipc_echo_test_${core}_release.x* ${D}${DST_BIN_PATH}
+
+            #removing map files copied in previous line
+            rm ${D}${DST_BIN_PATH}/*.map
+        done
+    done
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
+
+INSANE_SKIP_${PN}-dbg = "arch"
diff --git a/recipes-ti/ipc-lld/ipc-lld-rtos_git.bb b/recipes-ti/ipc-lld/ipc-lld-rtos_git.bb
new file mode 100644
index 00000000..eff3cea1
--- /dev/null
+++ b/recipes-ti/ipc-lld/ipc-lld-rtos_git.bb
@@ -0,0 +1,45 @@
+SUMMARY = "TI RTOS low level driver for IPC"
+
+require ipc-lld.inc
+
+DEPENDS_append = " osal-rtos common-csl-ip-rtos sciclient-rtos"
+
+do_configure() {
+    # remove any previous package
+    rm -rf ${IPCLLD_PACKAGE_BASE}
+    cd ${S}
+
+    mkdir -p ${IPCLLD_ROOTPATH}
+
+    for board in ${TI_PDK_LIMIT_BOARDS}
+    do
+        # make the release package before building it
+        oe_runmake package BOARD=${board} DEST_ROOT=${IPCLLD_PACKAGE_BASE} PDK_IPC_COMP_PATH=${S}
+    done
+
+}
+
+do_compile() {
+    cd ${IPCLLD_ROOTPATH}
+
+    oe_runmake lib LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" PDK_IPC_COMP_PATH=${IPCLLD_ROOTPATH}
+}
+
+do_install() {
+    cd ${IPCLLD_ROOTPATH}
+
+    #remove prebuilt binaries
+    rm -rf examples/echo_test/binaries
+
+    #archive
+    tar -cf ipc-lld.tar --exclude='*.tar' ./*
+
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/ipc \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
+
+INSANE_SKIP_${PN}-dbg = "arch"
diff --git a/recipes-ti/ipc-lld/ipc-lld.inc b/recipes-ti/ipc-lld/ipc-lld.inc
new file mode 100644
index 00000000..7a0ebec8
--- /dev/null
+++ b/recipes-ti/ipc-lld/ipc-lld.inc
@@ -0,0 +1,38 @@
+SUMMARY = "TI RTOS low level driver for IPC"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+IPCLLD_GIT_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git"
+IPCLLD_GIT_PROTOCOL = "git"
+IPCLLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "01.00.00.00"
+IPCLLD_SRCREV = "c695ca99aa4b7242e808889cfeacf848f14112c7"
+
+BRANCH = "${IPCLLD_GIT_BRANCH}"
+SRC_URI = "${IPCLLD_GIT_URI};protocol=${IPCLLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${IPCLLD_SRCREV}"
+PV = "01.00.00.00"
+PR = "r0"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+IPCLLD_PACKAGE_BASE   = "${S}/../ipclld_base"
+IPCLLD_ROOTPATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/ipc"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export PDK_IPC_ROOT_PATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "IPCLLD"
+
+EXTRA_OEMAKE = "PDK_INSTALL_PATH=${PDK_INSTALL_PATH} "
+
-- 
2.17.1


