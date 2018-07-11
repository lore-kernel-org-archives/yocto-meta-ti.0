Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBE8DE00D25; Wed, 11 Jul 2018 08:45:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F910E0044F
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 08:45:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BFjZPh026784
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531323935;
	bh=4a3bbLx6Kjy4DQkg9Oqmo6vVhA91Y7mUcQ1qGTaXaec=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z2AUUDBH0NGEJVbRq1PlAYNA5sXGmxSy4ity/Y/RC17lghyz8DFdokhmj+SPOTI9P
	lCZx7nKBy8dnMk5gM+u+c2Ar3kn/Gun+5FMZmDMKevH6qc0f2a/azP6OqqLT0VY32l
	/w+kAUnuw7gAmtbe4+tBCu7tOa6luHEovRHL4UFQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjZw4008132
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 10:45:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 10:45:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjYCL031016
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Jul 2018 11:45:31 -0400
Message-ID: <1531323931-31875-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
References: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
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
X-List-Received-Date: Wed, 11 Jul 2018 15:45:38 -0000
Content-Type: text/plain

- add K3 (AM654x) support based on SGX DDK 1.17

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
new file mode 100644
index 0000000..3ce9105
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -0,0 +1,41 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+
+inherit module
+
+COMPATIBLE_MACHINE = "k3"
+
+MACHINE_KERNEL_PR_append = "o"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "virtual/kernel"
+
+PROVIDES = "omapdrm-pvr"
+
+RPROVIDES_${PN} = "omapdrm-pvr"
+RREPLACES_${PN} = "omapdrm-pvr"
+RCONFLICTS_${PN} = "omapdrm-pvr"
+
+BRANCH = "ti-img-sgx/${PV}/k4.14"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "b630d462f5fbb86e5f98965ba1af35da1207822f"
+
+TARGET_PRODUCT_k3 = "ti654x"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
+
+do_compile_prepend() {
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
+}
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+}
-- 
1.9.1


