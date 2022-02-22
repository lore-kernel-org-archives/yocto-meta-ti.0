Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8880.1645503245101542967
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D00240C90
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgCQPkiYHoQd for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A38440C85
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2E7EE174771
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 06/17] wl18xx-calibrator: explicitly specify source branch
Date: Tue, 22 Feb 2022 04:13:50 +0000
Message-Id: <20220222041401.2840172-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

bitbake now requires it, as default master is no longer deterministic.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx=
-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibra=
tor/wl18xx-calibrator_8.7.3.bb
index 2888b95a..50eaa1c1 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} =3D "wl18xx-fw"
=20
 #Tag: R8.7_SP3 (8.7.3)
 SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
+SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=3Dma=
ster \
            file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-typ=
e-e.patch \ =20
           "
=20
--=20
2.25.1

