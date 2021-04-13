Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4263.1618350877146716475
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 14:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=LM1uNafx;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5863F38C06AD
	for <meta-ti@yoctoproject.org>; Tue, 13 Apr 2021 21:54:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DLsYB3008113;
	Tue, 13 Apr 2021 16:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618350874;
	bh=7vaoU/SJ6w2yL2NyxHYiCRNGUFjSi5lOn80kNPCdUKo=;
	h=From:To:CC:Subject:Date;
	b=LM1uNafxZjlRsuqi+f1RNg+yp3QRmI+kuoClU3QMCHmRPbGrNqtWZYQSULxTNmX1N
	 IdTIGisuQc3+l+HdlZQOaqfKKGDk3b4hsIcb1cijjDsopNkq5C5MOl4NVJubrRkSzK
	 FGv9f87+uU5PHc3ZppCCu8In+1I5n9yfuq6JXPUQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DLsYaZ023383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 16:54:34 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 16:54:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 16:54:33 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DLsXDg064963;
	Tue, 13 Apr 2021 16:54:33 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 13DLsX8i034867;
	Tue, 13 Apr 2021 16:54:33 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 1/2] ti-sgx-ddk-km: update srcrev to pick 5.10
Date: Tue, 13 Apr 2021 16:54:30 -0500
Message-ID: <20210413215431.1809-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the srcrev to pick the k5.10 development branch sources.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 734e780e..26c17459 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-MACHINE_KERNEL_PR_append =3D "v"
+MACHINE_KERNEL_PR_append =3D "w"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -18,7 +18,7 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "ti-img-sgx/${PV}/k5.4"
+BRANCH =3D "ti-img-sgx/${PV}/k5.10"
=20
 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=3D=
git;branch=3D${BRANCH} \
     file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.pat=
ch \
@@ -26,7 +26,7 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-li=
nux.git;protocol=3Dgit;branch
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "50c1ec2308b9f64488d252ac55d65b51a0dfe287"
+SRCREV =3D "9d1358eaf3a416ec5c1f4830fba0ffc3d61192a5"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--=20
2.31.1

