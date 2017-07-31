Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 335C4E00C5F; Mon, 31 Jul 2017 15:05:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB7DFE00C58
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 15:05:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VM5gos028678
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 17:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501538742;
	bh=SHXHgyJJ/l1msQ9bEjNy4TpTXEPcfWkwxUM8KB1YrZ0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JAmXedb0ifBS+yOQqtvXhf5hnDoVsdb3UwxgfQpa5JrnVumKGivPexBZ605rmQWSe
	pzFeJLCKTZWMbm5qJbz15aN12QXb/NkSLh3/nep3cXPYri87bJX5tvwnvvNBrDTpVd
	2rCy7Ya/97yTb/4CRdDiXaoAbVKlbYfRyES9onng=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VM5gh6004213
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 17:05:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 17:05:42 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6VM5gTG009982	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 17:05:42
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Jul 2017 17:05:41 -0500
Message-ID: <1501538742-10101-3-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501538742-10101-1-git-send-email-i-pang@ti.com>
References: <1501538742-10101-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 3/4] mad-utils-rtos: added recipe for MAD utils
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
X-List-Received-Date: Mon, 31 Jul 2017 22:05:46 -0000
Content-Type: text/plain

This recipe adds the Multicore Application Deployment (MAD) utility
for c665x-evm and c667x-evm.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb

diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
new file mode 100644
index 0000000..0144aad
--- /dev/null
+++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Utility for loading and running multicore applications"
+DESCRIPTION = "Multicore Application Deployment (MAD) utility is used \
+for loading and running a multicore application on an embedded \
+processor with multiple cores. This utility package contains the \
+scripts to combine multiple applications for different cores into a \
+single binary as well as loadable application to parse and execute the applications on different cores."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://README.txt;md5=44b2180aec0657f6b0e42e5611c0bafb"
+
+require recipes-ti/includes/ti-paths.inc
+
+DEPENDS = "ti-cgt6x-7-native"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "c66x"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
+SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
+PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
+
+DEVICE = ""
+DEVICE_c665x-evm = "C6657"
+DEVICE_c667x-evm = "C6678"
+
+ENDIAN = ""
+ENDIAN_c665x-evm = "little big"
+ENDIAN_c667x-evm = "little big"
+
+do_compile() {
+    cd mad-loader
+    for e in ${ENDIAN}
+    do
+        mkdir -p bin/${DEVICE}/${e}
+        make -C mal/malLib/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
+        make -C mal/malApp/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
+        cp mal/malApp/build/mal_app.exe bin/${DEVICE}/${e}
+        make -C nmlLoader/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
+        cp nmlLoader/build/nml.exe bin/${DEVICE}/${e}
+    done
+    cd -
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
+
+INSANE_SKIP_${PN} += "arch staticdev ldflags file-rdeps"
-- 
1.9.1


