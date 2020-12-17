Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1276.1608230975433492078
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=EuH1DlM1;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 41ABA38C1142
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInW1h059865;
	Thu, 17 Dec 2020 12:49:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230972;
	bh=xoDwPlwel5MZQECereCmSDqzM/vZ+T1m0ZeOrXpJuwc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EuH1DlM1FmlX3lxSOaqIyCJho1c2rl9YxXrrNUGUPWPYXTQ1BRuMIlLhdCpIqkBMl
	 2FmG2u4nTJGVGb7zq5Y3+PbRw9aw7cHAYUhAUMhEH3zMRKHWw5tQkDk1XgkKG768qJ
	 Lq/Fez2vYJPmS9vaaeddJcP2P131Dxo1tYP5nfQM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInWQZ038476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Dec 2020 12:49:32 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInVHO001922;
	Thu, 17 Dec 2020 12:49:31 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 05/10] trusted-firmware-a: Update SRCREV for AM64X support
Date: Thu, 17 Dec 2020 12:49:24 -0600
Message-ID: <20201217184929.18031-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
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

