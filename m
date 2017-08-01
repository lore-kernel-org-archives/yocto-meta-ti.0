Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E29CAE00CA6; Mon, 31 Jul 2017 22:45:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D375E00C6D
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 22:45:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v715j7WM025991
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 00:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501566307;
	bh=y3cGSxNwjXkGqdDDDjvkH1vOdJS4GUsgq780ZjnxyIg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P2GM/n8wjE9VqDqWQ2K7oEcHoPThS63Oa6QoObYJ0R0yyAUv9KSHNQmFNyNk7299I
	ZBIrhDMma8vFz0v5vXqqh/jVc8cQqe/9YI1dIRoqxuC07QreTuwIQZLLPUTl8bOjRC
	P3qAAvsSy/m2NxtdaPmKcZ5RUDhm2ui86YRkO63c=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v715j7NY026784
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 00:45:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 00:45:06 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v715j6fQ011035	for <meta-ti@yoctoproject.org>;
	Tue, 1 Aug 2017 00:45:06 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Aug 2017 00:45:06 -0500
Message-ID: <1501566306-14838-4-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501566306-14838-1-git-send-email-i-pang@ti.com>
References: <1501566306-14838-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH v4 4/4] ibl-boot-rtos: added recipe for RTOS IBL
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
X-List-Received-Date: Tue, 01 Aug 2017 05:45:09 -0000
Content-Type: text/plain

This recipe adds the Intermediate Bootloader (IBL) for c665x-evm
and c667x-evm.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb

diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
new file mode 100644
index 0000000..ed30ef4
--- /dev/null
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Second stage bootloader for c66x"
+DESCRIPTION = "The Intermediate Bootloader (IBL) is a second stage \
+bootloader for the c66x family of embedded processors. This second \
+stage bootloader takes care of additional initializations, advisory \
+setups, and errata workarounds that are not present in the first stage boot."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/ibl.h;beginline=1;endline=34;md5=ee7d7a3305d1e524955996d1c5e31cb9"
+
+require recipes-ti/includes/ti-paths.inc
+
+DEPENDS = "ti-cgt6x-7-native"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "c66x"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
+SRCREV = "f7ed32cc8911e3353dd01080da9b725b44a12285"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+PATH_prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
+
+IBLTARGETS = ""
+IBLTARGETS_c665x-evm = "evm_c6657_i2c"
+IBLTARGETS_c667x-evm = "evm_c6678_i2c"
+
+IBLENDIAN = ""
+IBLENDIAN_c665x-evm = "little big"
+IBLENDIAN_c667x-evm = "little big"
+
+export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
+export TOOLSC6X="${C6X_BASE_DIR}"
+export TOOLSC6XDOS="${C6X_BASE_DIR}"
+export TOOLSBIOSC6XDOS="${C6X_BASE_DIR}"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+
+do_compile() {
+    cd src/make
+    for t in ${IBLTARGETS}
+    do
+        for e in ${IBLENDIAN}
+        do
+            make ${t} ENDIAN=${e} I2C_BUS_ADDR=0x51
+        done
+    done
+    cd -
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+INSANE_SKIP_${PN} = "arch file-rdeps"
-- 
1.9.1


