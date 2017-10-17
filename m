Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC927E00C89; Mon, 16 Oct 2017 20:19:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAA46E00B67
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 20:19:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9H3Jt6g027041
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508210395;
	bh=oXZxTm+Dst4CVHg2V2E3EVcLpeqCMHY9VZJAU+MprJo=;
	h=From:To:CC:Subject:Date;
	b=nh5j9G+bGgNu13Bfz4/JhDoNZke9dhyRbv6qBGVLMQtlpAIDEufXjCYyqHXvPgqGQ
	De9al0Vcl6yb2QRpdJkvKhvDjXH93DD85TZCxpn+5SQwO8kXwcxZEEcttgvC74EjAo
	3kchsRY5dEiyaLKdmqzJQlFne+c+RKwcMQ85xd+Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3JtTg030586
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:19:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 22:19:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 22:19:55 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3Js4K023854;
	Mon, 16 Oct 2017 22:19:55 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Oct 2017 23:19:49 -0400
Message-ID: <1508210393-54841-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2 1/5] gcc-arm-none-eabi-native: Add recipe for new version 6-2017-q1-update
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
X-List-Received-Date: Tue, 17 Oct 2017 03:19:57 -0000
Content-Type: text/plain

The source location changed to developer.arm.com compared to previous
version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../gcc-arm-none-eabi-native_6-2017-q1-update.bb   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
new file mode 100644
index 0000000..1140f27
--- /dev/null
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Baremetal GCC for ARM"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
+
+SRC_URI[gcc-arm-none.md5sum] = "30004c24f4632bc594952462bb0cd1c9"
+SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6abd868da849d416c2eb"
+
+S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
+
+do_install() {
+    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
-- 
1.9.1


