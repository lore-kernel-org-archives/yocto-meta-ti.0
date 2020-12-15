Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1467.1608062112225914434
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 11:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Ne/EUPG/;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CDEE238C140F
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 19:55:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJtBvb082255
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608062111;
	bh=lszNvdeAyi7jkjENPMU3xuyZo8Jev8VXSfJJuuMBxrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ne/EUPG/46yO8u3OKVATQcLFjrR4DTLh83OuySnRj86+tpDXRrAxUFefIk/P8cOvA
	 m2bAF1tOHeHvwPsR3yNebfe1ZUaokg1oahnd+ulbdP5xnBTkzFq5JnHgR9eSLo11T3
	 W7HKzqB377YLOEsxK5feBzsOO6eF4KBAeuimeUcA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFJtBhG024029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:11 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 13:55:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 13:55:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJtAbK064648;
	Tue, 15 Dec 2020 13:55:11 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH 3/4] machine: am64xx-evm.conf: Remove commented code and update PDK values
Date: Tue, 15 Dec 2020 13:55:07 -0600
Message-ID: <20201215195508.22483-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215195508.22483-1-dmurphy@ti.com>
References: <20201215195508.22483-1-dmurphy@ti.com>
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

