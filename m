Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1246FE00D6C; Sun,  3 Dec 2017 02:34:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A370E00BED
	for <meta-ti@yoctoproject.org>; Sun,  3 Dec 2017 02:34:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AYpCR000451
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:34:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297291;
	bh=qcv6JpCuqUbqezQfcjIOTe6i6dDnD/rB9EmTmRGosCc=;
	h=From:To:CC:Subject:Date;
	b=FdzHoA1nHgAUDOojVzMx6lPHhNystRayRJj80DRYLunghooocf3EzjtUirDa+ov0P
	FXswLJLmTQLNHKbdy9Is3IhoMuRfcNAvdnCnzKdMLZyyK2moalzzoApuZCM2LJfzOb
	fWvAFay5faQ+QDJ00MYC/stBjA2lrNaA+/P6AVRY=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AYpkS007914
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:34:51 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:34:50 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
Thread-Index: AdNsIlhTKSD/9EgsSGOv7JMdgVwCmQ==
Date: Sun, 3 Dec 2017 10:34:49 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A8553@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:34:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-=
fw/wl18xx-fw_8.7.3.bb
new file mode 100644
index 0000000..a52ec89
--- /dev/null
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "Firmware files for use with TI wl18xx"
+LICENSE =3D "TI-TSPA"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32a9=
e"
+
+SRC_URI =3D " \
+	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=3D${BRA=
NCH} \
+	file://0001-Add-Makefile-to-install-firmware-files.patch \
+"
+
+# Tag: R8.7-SP3 (8.7.3)
+SRCREV =3D "f659be25473e4bde8dc790bff703ecacde6e21da"
+BRANCH =3D "master"
+
+S =3D "${WORKDIR}/git"
+
+CLEANBROKEN =3D "1"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=3D${D}' install
+}
+
+FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
--=20
2.7.4


