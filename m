Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41531E00D14; Sun,  3 Dec 2017 02:37:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9218DE00B54
	for <meta-ti@yoctoproject.org>; Sun,  3 Dec 2017 02:37:01 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AapKC008066
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:36:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297411;
	bh=RP5+LtBALHlTPUl2BUaocBVNZWzLEH1h6HuCPSFwdRk=;
	h=From:To:CC:Subject:Date;
	b=MhOkIuoP1yLzgETk+eA6VzUxtD6b71JQiPThZyK6w8CwohX86Elwp/t6BCSWj7LY+
	WPycAbaonQ5vbWDLaWpsPErDJw7FuY1K5MLOw0gsP1x49i8DuYHIouHq9DEbu9kHvV
	s4ZERtM3e89YmP92LVpvcpHbd0FdPAQHcyIOCDqo=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AajMX010390
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:36:46 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:36:45 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 4/4] wlconf: add recipe for version R8.7_SP3
Thread-Index: AdNsIpbIcmTqJ6p6QFiGlJAF0939sQ==
Date: Sun, 3 Dec 2017 10:36:44 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A8591@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 4/4] wlconf: add recipe for version R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:37:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes-connectivity/wlconf/wlconf_8.7.3.bb | 39 +++++++++++++++++++++++++=
++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-connectivity/wlconf/wlconf_8.7.3.bb

diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connecti=
vity/wlconf/wlconf_8.7.3.bb
new file mode 100644
index 0000000..19f28b7
--- /dev/null
+++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -0,0 +1,39 @@
+DESCRIPTION =3D "Configuration utility for TI wireless drivers"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Dadc05=
a1903d3f107f85c90328e3a9438"
+
+# Tag: R8.7_SP3 (8.7.3)
+SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
+SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+
+S =3D "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE =3D "CC=3D"${CC}""
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -d ${D}${sbindir}/wlconf/
+	install -d ${D}${sbindir}/wlconf/official_inis
+	install -d ${D}/lib/firmware/ti-connectivity
+
+	install -m 0755 wlconf ${D}${sbindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${sbindir}/wlconf/
+	install -m 0755 struct.bin ${D}${sbindir}/wlconf/
+	install -m 0755 default.conf ${D}${sbindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${sbindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity=
/wl18xx-conf.bin
+	install -m 0755 README ${D}${sbindir}/wlconf/
+	install -m 0755 example.conf ${D}${sbindir}/wlconf/
+	install -m 0755 example.ini ${D}${sbindir}/wlconf/
+	install -m 0755 configure-device.sh ${D}${sbindir}/wlconf/
+	install -m 0755 ${S}/official_inis/* \
+			${D}${sbindir}/wlconf/official_inis/
+}
+
+FILES_${PN} +=3D " \
+	${sbindir}/wlconf \
+	${sbindir}/wlconf/official_inis \
+	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
+"
+
+FILES_${PN}-dbg +=3D "${sbindir}/wlconf/.debug"
--=20
2.7.4


