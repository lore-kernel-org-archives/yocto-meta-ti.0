Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E44FE00D14; Sun,  3 Dec 2017 02:35:43 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0302EE00B54
	for <meta-ti@yoctoproject.org>; Sun,  3 Dec 2017 02:35:42 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AZWFs008006
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:35:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297332;
	bh=6od71zNzK3zRrdaIh/jRxNCURcP9vrGEM2lXLY7qTiI=;
	h=From:To:CC:Subject:Date;
	b=SDjCE3zGfvMXLnDuEC2ToCHgxmLDyZzTcW0jrJmtTyzGVJjD5MCpcE3BSFiTwziPl
	Zebll3+1yPTBM4xxRRTZ+bn/XeOAFb9tvkrQgxMKOQiRqXlMuq0YhPgAS2w2I7zfHL
	LaU0fBMEQUIV4k+tbJiIlhR3MdV2JHw1+2oz6QeA=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AZRQX029419
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:35:27 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:35:26 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 2/4] wl18xx-calibrator: add recipe for version R8.7_SP3
Thread-Index: AdNsImpE25lEPPK4T76IzLxigsF0wA==
Date: Sun, 3 Dec 2017 10:35:25 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A8569@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 2/4] wl18xx-calibrator: add recipe for version R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:35:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb   | 24 ++++++++++++++++++=
++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrato=
r_8.7.3.bb

diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3=
.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
new file mode 100644
index 0000000..8a759ed
--- /dev/null
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "The calibrator utility for TI wireless solution based on =
wl18xx driver"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683=
d"
+
+DEPENDS =3D "libnl"
+RDEPENDS_${PN} =3D "wl18xx-fw"
+
+#Tag: R8.7_SP3 (8.7.3)
+SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
+SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+
+S =3D "${WORKDIR}/git"
+
+export CROSS_COMPILE =3D "${TARGET_PREFIX}"
+
+EXTRA_OEMAKE =3D "CFLAGS=3D"${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG=
_LIBNL32 " \
+		LDFLAGS=3D"${LDFLAGS} -L${STAGING_LIBDIR}" \
+		CC=3D"${CC}" \
+		NLVER=3D3"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
--=20
2.7.4


