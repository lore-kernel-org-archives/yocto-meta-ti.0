Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1496.1608062112216127506
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 11:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hXkblwxK;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id AC6C338C1404
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 19:55:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJtBce082251
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608062111;
	bh=QKZEWp9U/jimYVuGPRUPNTS+S1/Sf+rWvPC5gRw98wk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hXkblwxKhTZxnhgGpHxgtmvDLD1X5pNtE96MfzYG0pCa7wyZ+D8DoSMH1uwzLeKuT
	 GpMpjb9toNz98lNsg3bG9cPvMb1MLzoOp6DDE/ArD1uBfXPQAcIzQQh/GY3CUAfCgT
	 TDZqVjHBE0a8CP3IYgHc2IE6PcSDpjfTBcA2rcgo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFJtBVf024023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:11 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 13:55:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 13:55:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJtAhg064632;
	Tue, 15 Dec 2020 13:55:10 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH 2/4] u-boot-ti: Remove unneeded variable for am64xx
Date: Tue, 15 Dec 2020 13:55:06 -0600
Message-ID: <20201215195508.22483-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215195508.22483-1-dmurphy@ti.com>
References: <20201215195508.22483-1-dmurphy@ti.com>
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

