Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1467EE00D6B; Tue,  5 Dec 2017 01:29:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 659E0E00C97
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 01:29:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB59TSDM020032
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:29:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512466168;
	bh=o/7VIwNmYfdEcXCykqzAuPF4RaSCBztBgJmhCjXC4HE=;
	h=From:To:CC:Subject:Date;
	b=SYO8dJ8UJcfhPtOSwOmtxLwx9kDQvqa1aZ7Zh0IwjXgmfWHON9i2CR54eQBTFBH/a
	OLJbo3WQbl/HJAx8qah4sRjiBK04c/k0ojPrnWI3l4lor4Xf4YnoUu49Q/hyM75y4q
	u8GbywwxQ99RFHW1NdtzFf94zDXmzWEQRdrm3M4k=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB59TS07018800
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:29:28 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Tue, 5 Dec 2017 10:29:27 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [v2 4/4] wlconf: update recipe for version R8.7_SP3
Thread-Index: AdNtq4XnN08ZwGFrSh24fT+l7Ys8tw==
Date: Tue, 5 Dec 2017 09:29:27 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364AAEC3@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.93]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [v2 4/4] wlconf: update recipe for version R8.7_SP3
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
X-List-Received-Date: Tue, 05 Dec 2017 09:29:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes-connectivity/wlconf/wlconf_8.7.1.bb | 39 -------------------------=
----
 recipes-connectivity/wlconf/wlconf_8.7.3.bb | 39 +++++++++++++++++++++++++=
++++
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 recipes-connectivity/wlconf/wlconf_8.7.1.bb
 create mode 100644 recipes-connectivity/wlconf/wlconf_8.7.3.bb

diff --git a/recipes-connectivity/wlconf/wlconf_8.7.1.bb b/recipes-connecti=
vity/wlconf/wlconf_8.7.1.bb
deleted file mode 100644
index fdff614..0000000
--- a/recipes-connectivity/wlconf/wlconf_8.7.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION =3D "Configuration utility for TI wireless drivers"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Dadc05=
a1903d3f107f85c90328e3a9438"
-
-# Tag: R8.7_SP1 (8.7.1) +fix
-SRCREV =3D "ee653d2845b0029c14f49ca83a2f6c02037ec239"
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
-
-S =3D "${WORKDIR}/git/wlconf"
-
-EXTRA_OEMAKE =3D "CC=3D"${CC}""
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/wlconf/
-	install -d ${D}${bindir}/wlconf/official_inis
-	install -d ${D}/lib/firmware/ti-connectivity
-
-	install -m 0755 wlconf ${D}${bindir}/wlconf/
-	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
-	install -m 0755 struct.bin ${D}${bindir}/wlconf/
-	install -m 0755 default.conf ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity=
/wl18xx-conf.bin
-	install -m 0755 README ${D}${bindir}/wlconf/
-	install -m 0755 example.conf ${D}${bindir}/wlconf/
-	install -m 0755 example.ini ${D}${bindir}/wlconf/
-	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
-	install -m 0755 ${S}/official_inis/* \
-			${D}${bindir}/wlconf/official_inis/
-}
-
-FILES_${PN} +=3D " \
-	${bindir}/wlconf \
-	${bindir}/wlconf/official_inis \
-	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
-"
-
-FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
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


