Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71E93E00D14; Sun,  3 Dec 2017 02:36:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9A04E00B54
	for <meta-ti@yoctoproject.org>; Sun,  3 Dec 2017 02:36:16 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AaF54022017
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:36:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297375;
	bh=7l4/9eCSqZTa83DHxsfctcLSNRt3qz1cjF1187SI9WI=;
	h=From:To:CC:Subject:Date;
	b=azVxkWsLr+4xLCuyI2I04dEOxtCbINBgv0fg8sY05RPprkCrL+/duaOsP/nx3QzgU
	qP/FRCY5WdSN7gjTxdogIbazwJKjAAW7E86+PRnNu/E5/hhY7OM0E7AXJjbJU6jQti
	0SEJqqY2w0kNjxorAZosi+E/7vEJGGGdbow0f4e4=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AaFih030552
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:36:15 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:36:14 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 3/4] wl18xx-target-scripts: add recipe for version
	R8.7_SP3
Thread-Index: AdNsIoNcXnXukO0qSkGyhVyvu+zfDw==
Date: Sun, 3 Dec 2017 10:36:14 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A857E@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 3/4] wl18xx-target-scripts: add recipe for version R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:36:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl18xx-target-scripts_8.7.3.bb                 | 22 ++++++++++++++++++=
++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-targe=
t-scripts_8.7.3.bb

diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scrip=
ts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scri=
pts_8.7.3.bb
new file mode 100644
index 0000000..b9492b2
--- /dev/null
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.=
3.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Scripts and configuration files for TI wireless drivers"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Db8d6a=
0865f50159bf5c0d175d1f4a705"
+
+# Tag: R8.7_SP3 (8.7.3)
+SRCREV =3D "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
+BRANCH =3D "sitara-scripts"
+SRC_URI =3D "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;proto=
col=3Dgit;branch=3D${BRANCH}"
+
+S =3D "${WORKDIR}/git"
+
+FILES_${PN} +=3D "${datadir}/wl18xx/"
+
+do_install() {
+	install -d ${D}${datadir}/wl18xx/
+
+	scripts=3D`find ./ -type f -name "*.*"`
+	for s in $scripts
+	do
+		install -m 0755 $s ${D}${datadir}/wl18xx/
+	done
+}
--=20
2.7.4


