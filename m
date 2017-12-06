Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2821EE00D6A; Tue,  5 Dec 2017 17:18:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCD68E00D00
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 17:18:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB61IlFY009409
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512523127;
	bh=y2InL7l0tIdWcWzwBa2f0Ykm1L2of68NZNZzCCPS/Fg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wPpGyqphrhcG1h/6BKof6oypUeoVU/eDnF4ngpkVTlhSJo7/kUzODeNy5OCgOvlBh
	csByKBoBvr7Z93taja/CtFOCY4DmAIU5k7a1J+tjXkm1xkc6WEKDCl8UTndg5Eci2I
	B38SFjaX6QVL5Lk2z7NypeEN1TQ0FNkm934lI/Gg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61IkmZ009218
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:47 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 19:18:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 19:18:46 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61Ij4Y019630;
	Tue, 5 Dec 2017 19:18:46 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Dec 2017 20:18:39 -0500
Message-ID: <1512523119-12945-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1512523119-12945-1-git-send-email-denys@ti.com>
References: <1512523119-12945-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 4/4] wlconf: update recipe for version R8.7_SP3
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
X-List-Received-Date: Wed, 06 Dec 2017 01:18:50 -0000
Content-Type: text/plain

From: Eyal Reizer <eyalr@ti.com>

Signed-off-by: Eyal Reizer <eyalr@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wlconf/{wlconf_8.7.1.bb => wlconf_8.7.3.bb}    |   36 ++++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)
 rename recipes-connectivity/wlconf/{wlconf_8.7.1.bb => wlconf_8.7.3.bb} (40%)

diff --git a/recipes-connectivity/wlconf/wlconf_8.7.1.bb b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
similarity index 40%
rename from recipes-connectivity/wlconf/wlconf_8.7.1.bb
rename to recipes-connectivity/wlconf/wlconf_8.7.3.bb
index fdff614..19f28b7 100644
--- a/recipes-connectivity/wlconf/wlconf_8.7.1.bb
+++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-# Tag: R8.7_SP1 (8.7.1) +fix
-SRCREV = "ee653d2845b0029c14f49ca83a2f6c02037ec239"
+# Tag: R8.7_SP3 (8.7.3)
+SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
 SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
@@ -11,29 +11,29 @@ S = "${WORKDIR}/git/wlconf"
 EXTRA_OEMAKE = "CC="${CC}""
 
 do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/wlconf/
-	install -d ${D}${bindir}/wlconf/official_inis
+	install -d ${D}${sbindir}
+	install -d ${D}${sbindir}/wlconf/
+	install -d ${D}${sbindir}/wlconf/official_inis
 	install -d ${D}/lib/firmware/ti-connectivity
 
-	install -m 0755 wlconf ${D}${bindir}/wlconf/
-	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
-	install -m 0755 struct.bin ${D}${bindir}/wlconf/
-	install -m 0755 default.conf ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 wlconf ${D}${sbindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${sbindir}/wlconf/
+	install -m 0755 struct.bin ${D}${sbindir}/wlconf/
+	install -m 0755 default.conf ${D}${sbindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${sbindir}/wlconf/
 	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
-	install -m 0755 README ${D}${bindir}/wlconf/
-	install -m 0755 example.conf ${D}${bindir}/wlconf/
-	install -m 0755 example.ini ${D}${bindir}/wlconf/
-	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
+	install -m 0755 README ${D}${sbindir}/wlconf/
+	install -m 0755 example.conf ${D}${sbindir}/wlconf/
+	install -m 0755 example.ini ${D}${sbindir}/wlconf/
+	install -m 0755 configure-device.sh ${D}${sbindir}/wlconf/
 	install -m 0755 ${S}/official_inis/* \
-			${D}${bindir}/wlconf/official_inis/
+			${D}${sbindir}/wlconf/official_inis/
 }
 
 FILES_${PN} += " \
-	${bindir}/wlconf \
-	${bindir}/wlconf/official_inis \
+	${sbindir}/wlconf \
+	${sbindir}/wlconf/official_inis \
 	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
 "
 
-FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
+FILES_${PN}-dbg += "${sbindir}/wlconf/.debug"
-- 
1.7.9.5


