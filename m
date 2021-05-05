Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.11016.1620231182445615167
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 May 2021 09:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=gdMuWv86;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3512E38C04C2
	for <meta-ti@yoctoproject.org>; Wed,  5 May 2021 16:13:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 145GCxof003290;
	Wed, 5 May 2021 11:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620231179;
	bh=Qdmu8/cdX4TraeyKwPkUyHoYvfbsc7YE3vzxJSfKFcs=;
	h=From:To:CC:Subject:Date;
	b=gdMuWv86aEWbLMZPzJ76U9RQYUqBYQMUMgL2qYHgVC22f9BsG8zKagJ+zjs+rZ91w
	 56OBHQHCuDeNJlY6rgOvxtfcCN2zbiVP/pICrBiYyNFHroEjlxC01IYph7hCUeTYH1
	 slYio+RPN3SfQjRikYQAY7iPztlf1wpRWOztnvy0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 145GCxrO028700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 11:12:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 5 May
 2021 11:12:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 5 May 2021 11:12:59 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 145GCxvO004882;
	Wed, 5 May 2021 11:12:59 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 145GCxve015794;
	Wed, 5 May 2021 11:12:59 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-sgx-ddk-km: Update srcrev to pick rt kernel build fix
Date: Wed, 5 May 2021 11:12:58 -0500
Message-ID: <20210505161258.18960-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 26c17459..a5160fdc 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-MACHINE_KERNEL_PR_append =3D "w"
+MACHINE_KERNEL_PR_append =3D "x"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -26,7 +26,7 @@ SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-li=
nux.git;protocol=3Dgit;branch
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "9d1358eaf3a416ec5c1f4830fba0ffc3d61192a5"
+SRCREV =3D "62f31de3ceed156bff32abb3dd03693a02df117e"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--=20
2.31.1

