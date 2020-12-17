Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1284.1608230972811599740
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=NwXxsfy0;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2D2E538C1285
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInVjm059861
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230971;
	bh=lszNvdeAyi7jkjENPMU3xuyZo8Jev8VXSfJJuuMBxrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NwXxsfy00maA1cX4yIAvX5MkdVk50e0rd8c58lVTNQ/8/jlQhqP9j07PmP1XDgiYd
	 AtkG5n9FoFp3/xox4kZTLvvgt2evF1rssa4/S9z0AOrUe0sH+ditDQyvhFQm8aitJq
	 Ua+VE8eMgzB/w8RkpTsitypnhReF4wkbPAuSafOI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInV7n105953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:31 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInV8N001914;
	Thu, 17 Dec 2020 12:49:31 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 03/10] machine: am64xx-evm.conf: Remove commented code and update PDK values
Date: Thu, 17 Dec 2020 12:49:22 -0600
Message-ID: <20201217184929.18031-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/include/am64xx.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64x=
x.inc
index 79a403a93937..5a04a4388665 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY_append =3D ":am64xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen gpu"
+MACHINE_FEATURES +=3D "screen touchscreen"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
@@ -9,13 +9,10 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm.dtb \
 "
-
-#IMAGE_BOOT_FILES +=3D "sysfw-am64x-evm.itb"
-
 OPTEEMACHINE =3D "k3-am65x"
 OPTEEOUTPUTMACHINE =3D "k3"
=20
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS =3D "am64x"
-TI_PDK_LIMIT_BOARDS =3D "am64xx_evm"
-TI_PDK_LIMIT_CORES =3D "mcu1_0 mpu1_0"
+TI_PDK_LIMIT_BOARDS =3D "am64x_evm"
+TI_PDK_LIMIT_CORES =3D "mcu1_0 mpu1_0 mcu1_1 mcu2_0 mcu2_1"
--=20
2.29.2

