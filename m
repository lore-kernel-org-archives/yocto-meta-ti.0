Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8EDCE00E8C; Tue, 13 Feb 2018 10:27:32 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FB98E00E83
	for <meta-ti@yoctoproject.org>; Tue, 13 Feb 2018 10:27:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1DIRDCc013523
	for <meta-ti@yoctoproject.org>; Tue, 13 Feb 2018 12:27:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518546433;
	bh=NdiK2MVEaq7UiQpL7gCqAQ9agEoW4teUEoQtPkYhieQ=;
	h=From:To:CC:Subject:Date;
	b=pTgHVlzNwftkRZ0RRTkJJDYUoRvRqrqMyrnd71XoszmArx2AJb5mwkofRfLgYqtpA
	0eJEUCResFhzT8Ru4fDLL1toE6V3uo7DPfJsjBxgt8bWYYLseH4eABXC7Hmer5k91b
	soVaGAF57yQGE+oIdMBApfiQLQRcZox1yzwgrMzw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1DIRDJH028287
	for <meta-ti@yoctoproject.org>; Tue, 13 Feb 2018 12:27:13 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 13 Feb 2018 12:27:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 13 Feb 2018 12:27:13 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1DIRD0x013682;
	Tue, 13 Feb 2018 12:27:13 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Feb 2018 13:18:47 -0500
Message-ID: <1518545927-11717-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] ti-xdctools: do not create target package
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
X-List-Received-Date: Tue, 13 Feb 2018 18:27:32 -0000
Content-Type: text/plain

* ti-xdctools is a host development package, but the target recipe is
  needed to create the sourceipk used in SDKs.
* And move class extension to common include.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-xdctools-common.inc    | 6 +++++-
 recipes-ti/devtools/ti-xdctools_3.50.03.33.bb | 4 ----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index 17166ca..d2d0df4 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -7,10 +7,14 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
 do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }
 
+BBCLASSEXTEND = "native nativesdk"
+
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
index 6ab2b94..73ab3bd 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
@@ -7,7 +7,3 @@ LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endli
 
 SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
 SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
-
-FILES_${PN} += "${XDC_INSTALL_DIR_RECIPE}"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


