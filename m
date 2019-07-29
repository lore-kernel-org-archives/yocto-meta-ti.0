Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4827BE00CD5; Mon, 29 Jul 2019 10:54:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A4BBE00C94
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 10:54:09 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6THs8Lo091689
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564422848;
	bh=GlooBGtFbocmmJkCStUdTcQxHXvPYE6/+SVmluPOCHk=;
	h=From:To:CC:Subject:Date;
	b=q6m9fj2lfC5dT9j60ay3fsN9j7kC7in0DOS6LWDRUILxTRlM8VETChySjgo+PI5/1
	j5BJPF0kwt1J5N5qYuDThQKKtDKZFJCuaUXqw3nm5bC56OtcggBJ6pagAtGPMslyAK
	vm6ZgnGJa3tkxabduu5bAJgUgpV/fXV88g+/hGoQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6THs8Tg098058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Jul 2019 12:54:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Jul 2019 12:54:08 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6THs8Tm029802;
	Mon, 29 Jul 2019 12:54:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Jul 2019 13:37:25 -0400
Message-ID: <1564421847-25948-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/3] ti-cgt6x-7: extend to nativesdk
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
X-List-Received-Date: Mon, 29 Jul 2019 17:54:11 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../{ti-cgt6x-7-native_7.4.16.bb => ti-cgt6x-7_7.4.16.bb}        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x-7-native_7.4.16.bb => ti-cgt6x-7_7.4.16.bb} (89%)

diff --git a/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
similarity index 89%
rename from recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
rename to recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
index 7bb4c75..a67a2d8 100644
--- a/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
+++ b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 
 S = "${WORKDIR}/c6000_7.4.16"
 
-inherit native
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
 
@@ -27,6 +26,10 @@ SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
 SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] = "21ca55c5b1f6b2d8d4fb7570d5eb5513"
 SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160963a01419d42fbbb851263b54c91df82f"
 
+# only x86_64 is supported
+COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST_class-target = "null"
+
 do_install() {
     install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
     cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
@@ -34,8 +37,10 @@ do_install() {
 
 FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
 
-INSANE_SKIP_${PN} += "arch staticdev"
+INSANE_SKIP_${PN} += "arch staticdev textrel"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


