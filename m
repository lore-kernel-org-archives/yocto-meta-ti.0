Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8062.1608211951793347645
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=KatPDQ8j;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 88F7838C117C
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWVxA042455
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211951;
	bh=R0OCCIJsyZAQvshu+FM6+V0azGNbszkpggtA2D6cosc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KatPDQ8jtnHsEnE/EYO/2b0W2+Hp/6cYUKKkY6RxT+PCi1VjU2/2DJmuDjjmklIDQ
	 Yz1O6/lgxqas4gksb4kWxoumvaHBfneGuU8/p49FkbZwMWNCSj+yDSrKmTO780RVm9
	 8A9/uzkLEJ28CisPuk5ZmWV6NELZNwcMt9wZmxQU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWVNc066298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:31 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWUaw047695;
	Thu, 17 Dec 2020 07:32:30 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 06/10] ti-uboot-staging: Update to the latest commit
Date: Thu, 17 Dec 2020 07:32:24 -0600
Message-ID: <20201217133228.22886-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2020.01.bb
index 15dd32da66f2..1cf20c9096bc 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
=20
-PR =3D "r25"
+PR =3D "r26"
=20
 BRANCH =3D "ti-u-boot-2020.01"
=20
-SRCREV =3D "10dad9df6a0eb00f45bed48c9df0c9effb4fbae5"
+SRCREV =3D "2df0015ffde76aad8fad6348e0ddf2b814068036"
--=20
2.29.2

