Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8040.1608211954359695465
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=PGbhF76p;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 24E3C38C117C
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWU0f042451;
	Thu, 17 Dec 2020 07:32:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211950;
	bh=xoDwPlwel5MZQECereCmSDqzM/vZ+T1m0ZeOrXpJuwc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PGbhF76psC2gY1ff7xCbqD25Ap31+m5RMOFqFRkZNw6LYRyWHQ88xfx0+xl8INsGC
	 pP3bG+9wxO0L16Kbe7e1upufs0Gfkk1zxqqvGZJCvLlOzUDYfPN46K13lfC3g8mm3F
	 8OV8ziPy1wGSFE06KuGO3uJuwBCZXV2oCM7iluos=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWUb4124622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Dec 2020 07:32:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWUOi080202;
	Thu, 17 Dec 2020 07:32:30 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 05/10] trusted-firmware-a: Update SRCREV for AM64X support
Date: Thu, 17 Dec 2020 07:32:23 -0600
Message-ID: <20201217133228.22886-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Praneeth Bajjuri <praneeth@ti.com>

Update SRCREV to pick latest that includes AM64X support

commit 65dd16b4e ("ti: k3: Introduce lite device board support")
adds support of AM64X platform in ti-atf branch.

This patch updates the SRCREV and also updates the BOARD to "lite" to
build for the mentioned platform.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/include/am64xx.inc                              | 2 ++
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64x=
x.inc
index 5a04a4388665..20441d8a757f 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -9,6 +9,8 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm.dtb \
 "
+
+TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am65x"
 OPTEEOUTPUTMACHINE =3D "k3"
=20
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend=
 b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 4942bf46d8a3..4852c5608598 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -2,7 +2,7 @@ PV_k3 =3D "2.4"
 LIC_FILES_CHKSUM_k3 =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd=
938729b031"
 BRANCH_k3 =3D "ti-atf"
 SRC_URI_k3 =3D "git://git.ti.com/atf/arm-trusted-firmware.git;branch=3D$=
{BRANCH};name=3Dtfa"
-SRCREV_tfa_k3 =3D "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
+SRCREV_tfa_k3 =3D "65dd16b4ea5032752af62e94ca64cff41733a123"
 COMPATIBLE_MACHINE_k3 =3D "k3"
 TFA_BUILD_TARGET_k3 =3D "all"
 TFA_INSTALL_TARGET_k3 =3D "bl31"
--=20
2.29.2

