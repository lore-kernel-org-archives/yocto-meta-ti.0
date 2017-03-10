Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1C3BE00A26; Fri, 10 Mar 2017 11:09:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84CF9E00A16
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 11:09:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A6D320BAF;
	Fri, 10 Mar 2017 19:09:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mjQSeeTGPC_c; Fri, 10 Mar 2017 19:09:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DFE3B20BA7;
	Fri, 10 Mar 2017 19:09:09 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 65B5C16238F;
	Fri, 10 Mar 2017 14:09:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Mar 2017 14:09:09 -0500
Message-Id: <1489172949-15918-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] wlconf: add version 8.7.1 (R8.7_SP1)
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
X-List-Received-Date: Fri, 10 Mar 2017 19:09:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous versions were provided by meta-arago-extras, moving to meta-ti now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-connectivity/wlconf/wlconf.bb | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-connectivity/wlconf/wlconf.bb

diff --git a/recipes-connectivity/wlconf/wlconf.bb b/recipes-connectivity/wlconf/wlconf.bb
new file mode 100644
index 0000000..3313584
--- /dev/null
+++ b/recipes-connectivity/wlconf/wlconf.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Configuration utility for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
+
+PV = "8.7.1+git${SRCPV}"
+
+# Tag: R8.7_SP1+fix
+SRCREV = "ee653d2845b0029c14f49ca83a2f6c02037ec239"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+
+S = "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE = "CC="${CC}""
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${bindir}/wlconf/
+	install -d ${D}${bindir}/wlconf/official_inis
+	install -d ${D}/lib/firmware/ti-connectivity
+
+	install -m 0755 wlconf ${D}${bindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
+	install -m 0755 struct.bin ${D}${bindir}/wlconf/
+	install -m 0755 default.conf ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
+	install -m 0755 README ${D}${bindir}/wlconf/
+	install -m 0755 example.conf ${D}${bindir}/wlconf/
+	install -m 0755 example.ini ${D}${bindir}/wlconf/
+	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
+	install -m 0755 ${S}/official_inis/* \
+			${D}${bindir}/wlconf/official_inis/
+}
+
+FILES_${PN} += " \
+	${bindir}/wlconf \
+	${bindir}/wlconf/official_inis \
+	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
+"
+
+FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
2.7.4


