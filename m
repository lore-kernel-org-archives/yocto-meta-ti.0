Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09F47E00C88; Mon, 28 Aug 2017 07:38:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CD70E00C7A
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 07:38:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SEcjFk006208
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 09:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503931125;
	bh=cGe8y2VK5ZPefxbZ3ESTK1+XpixzPJUOaSvGWMp5a+g=;
	h=From:To:CC:Subject:Date;
	b=jz42XOw/oq8jOEvW0pChvCRtlZvcva0fx6sfCYqtVDhuTQioMu9iR/h0xiBIv/dEx
	5I5yr2dUi/3FU+KVA0b2XfEp6bosPuOQ81ATNvNSiHIIcwxh4rU7ACtWYYgBR+TLbz
	u22wypn2jGhMkx7WqnjF9VT4dFfqrrGLh6CJdZtY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SEcjaj026209
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 09:38:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 09:38:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 09:38:44 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SEciTR020879;
	Mon, 28 Aug 2017 09:38:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Aug 2017 10:32:38 -0400
Message-ID: <1503930758-8828-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] libaet: TI Emulation CTools AET library
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
X-List-Received-Date: Mon, 28 Aug 2017 14:38:47 -0000
Content-Type: text/plain

From: "Zhao, Yuan" <yuanzhao@ti.com>

The AETLIB library in CToolsLib collection provides programmatic
access to the Advanced Event Triggering capability on C6x processor
cores.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ctoolslib/libaet_git.bb | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-ti/ctoolslib/libaet_git.bb

diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/libaet_git.bb
new file mode 100644
index 0000000..626ba92
--- /dev/null
+++ b/recipes-ti/ctoolslib/libaet_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "TI Emulation CTools AET library"
+DESCRIPTION = "The AETLIB library provides programmatic access to the Advanced Event Triggering capability on C6x processor cores"
+
+LICENSE = "BSD"
+
+PV = "4.19.0.0"
+
+LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
+
+SRC_URI = "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
+SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
+
+DEPENDS = "ti-cgt6x-native"
+PR = "r0"
+
+S = "${WORKDIR}/git/aet"
+
+DEVICE=""
+DEVICE_dra7xx = "DRA7xx"
+DEVICE_keystone = "C66AK2Hxx"
+
+EXTRA_OEMAKE = "C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include"
+
+do_install() {
+    install -d ${D}${datadir}/ti/ctoolslib/aet
+    install -d ${D}${datadir}/ti/ctoolslib/aet/include
+    install -d ${D}${datadir}/ti/ctoolslib/aet/lib
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${S}/include/* ${D}${datadir}/ti/ctoolslib/aet/include/
+    install -m 0644 ${S}/build/c66/libaet.ae66 ${D}${datadir}/ti/ctoolslib/aet/lib/
+}
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN}-dev += "\
+    ${datadir}/ti/ctoolslib/aet \
+"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


