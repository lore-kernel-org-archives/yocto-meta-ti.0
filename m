Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33970E00CD5; Mon, 29 Jul 2019 10:54:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96861E00CD2
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 10:54:11 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6THsBNi108676
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564422851;
	bh=HAE1lfZxZLuHLPFYophDmrusJvS8VC9+L0QlUk7XO5E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DXHzOCYaPFEqCVTwSlMG0b1XSJYYKwzgyyirkLRT4uI6FhwFjJzQA+9oRqlaiOXxZ
	dliulnrtsvXgHvKSGj5OeUUw6zRNls8ticeHpkOUUf5q16OrfiAkZq17crgneIagoj
	TC5yx88A97F19rDLqOuMHKs3KR/WDqXylxPKkJlE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6THsB14107979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:11 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Jul 2019 12:54:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Jul 2019 12:54:10 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6THs8To029802;
	Mon, 29 Jul 2019 12:54:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Jul 2019 13:37:27 -0400
Message-ID: <1564421847-25948-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564421847-25948-1-git-send-email-j-stiffler@ti.com>
References: <1564421847-25948-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 3/3] ti-cgt-arm: extend to nativesdk
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
X-List-Received-Date: Mon, 29 Jul 2019 17:54:12 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../{ti-cgt-arm-native_18.12.1.bb => ti-cgt-arm_18.12.1.bb}        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_18.12.1.bb => ti-cgt-arm_18.12.1.bb} (90%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
similarity index 90%
rename from recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
rename to recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
index 5d72406..eecde58 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
@@ -4,7 +4,6 @@ LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0
 
 LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
 
-inherit native
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
@@ -19,6 +18,10 @@ BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
+# only x86_64 is supported
+COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST_class-target = "null"
+
 do_install() {
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
@@ -36,3 +39,5 @@ INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 INSANE_SKIP_${PN} += "arch staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


