Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.7142.1611751943537182830
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Jan 2021 04:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=VbPMFmYn;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8C00D38C084A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 12:52:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RCqLGi002508
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 06:52:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611751941;
	bh=6n+RYJmMF9rNK56Ff1lw0wENgxGtdHmrhFH38Rqkk9U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VbPMFmYnt8RV3aFtr2DiCnwzeCiGXcuLjgHmFClXMYD2JMA+y0J/dWIqYgr9nwCwI
	 Mikgxq70MQEC7fE273+neZhiwel+zXuxILjyeBWnKT5eLiPoWJM0XVyTxcR97CLlJi
	 qTMnTvdpREhx0wJxxV10vCAHQZnnEcjNtYl0FanM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RCqL4G103550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 06:52:21 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 06:52:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 06:52:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RCqLIr045597;
	Wed, 27 Jan 2021 06:52:21 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH 2/2] u-boot-ti-staging: Override the LIC_FILE_CHKSUM for 2021
Date: Wed, 27 Jan 2021 06:52:20 -0600
Message-ID: <20210127125220.10224-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127125220.10224-1-dmurphy@ti.com>
References: <20210127125220.10224-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2021.01.bb
index d5b7fd52e072..299a6cd878b6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -1,5 +1,8 @@
 require u-boot-ti.inc
=20
+#Temporarily add this as the checksum has changed in 2021
+LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450c57ffe5ae63fd73=
2446b988025"
+
 PR =3D "r1"
=20
 BRANCH =3D "ti-u-boot-2021.01"
--=20
2.29.2

