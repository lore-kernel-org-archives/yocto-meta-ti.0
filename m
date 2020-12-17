Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8037.1608211950786101878
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UuwdSwPu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3B0E438C118D
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTbL033002
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211949;
	bh=QKZEWp9U/jimYVuGPRUPNTS+S1/Sf+rWvPC5gRw98wk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UuwdSwPuTu4Hwk2myd/T79tqUEs1UmlDPoIndOX15rOAO/VTjSqIlDPKf/Kamwv68
	 twMYb1kmmtJVrpkh5iii+GjHPqwvzDJIo5D037c3Jld3ubNTqL9ATDgrg74yIiffCy
	 7tCWorERhr8yVpZjhLpZnZAlnzcHiWbIQeA5stJQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWTXl010854
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTQX047672;
	Thu, 17 Dec 2020 07:32:29 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 02/10] u-boot-ti: Remove unneeded variable for am64xx
Date: Thu, 17 Dec 2020 07:32:20 -0600
Message-ID: <20201217133228.22886-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
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

