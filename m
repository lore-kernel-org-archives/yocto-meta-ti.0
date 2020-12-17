Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1275.1608230972824244875
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=KABQ5iTN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id F0DB838C1180
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInVxD059845
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230971;
	bh=QKZEWp9U/jimYVuGPRUPNTS+S1/Sf+rWvPC5gRw98wk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KABQ5iTNu0GsaoitJf9VP6mZQSGQPauM5yhHsWylrQd8c0CtW1RTwHjigV9S//+gf
	 LolUXVunxj0b9l8RP8LGtJ8BAzuX1oifCYJ/NV0wzu5FpnN3nRzlQVIojML+p+ojWI
	 qZYLNOFNiS0sTbPObcDeKodgqf4Xlc01+gN4vdx8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInVb2105946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:31 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInUdI051953;
	Thu, 17 Dec 2020 12:49:31 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 02/10] u-boot-ti: Remove unneeded variable for am64xx
Date: Thu, 17 Dec 2020 12:49:21 -0600
Message-ID: <20201217184929.18031-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot=
-ti.inc
index 1770c3a1bda8..b7fd246aca6c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,7 +65,6 @@ SPL_UART_BINARY_keystone =3D ""
 SPL_UART_BINARY_k3r5 =3D ""
 SPL_UART_BINARY_lego-ev3 =3D ""
 SPL_UART_BINARY_j7200-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY_am64xx-evm =3D ""
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
--=20
2.29.2

