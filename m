Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5727.1605194345108052479
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 07:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=i+QSa8tu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7A3F138C110B
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 15:19:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACFJ1EP125012
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 09:19:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605194341;
	bh=KscUs2JoA6zGEaJuJDXOOzbQwvaJIN+P2BQ7prW6e4E=;
	h=From:To:CC:Subject:Date;
	b=i+QSa8tuYzqSipAIiAZqNBzka3ylCx7feXSUgXTiVLii5hX4d2q9uKBhiofwp0za0
	 1isyLEjsjc1ze8A+YCKqMRbieqQPhZXXUwjUkaMIENC1El7NuYCQOeaOsFG0dfd5Ph
	 Zy8vEGqdoR/6vKPQCGEdpiXuut6QFE3ITaJNv8Qg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACFJ1CD013274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 09:19:01 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 09:19:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 09:19:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACFJ1FR015960;
	Thu, 12 Nov 2020 09:19:01 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH] linux-ti-staging: Update RT kernel hash to pick up a few fixes
Date: Thu, 12 Nov 2020 09:18:55 -0600
Message-ID: <20201112151855.1674-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-ke=
rnel/linux/linux-ti-staging-rt_5.4.bb
index de1b4b7d9c27..4f3390624cfe 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "d4b0f63810a64c5f5c9876ba3492b647553d385d"
+SRCREV =3D "9002faf1c069e1b0d435199a80a89268e69aeecf"
 PV =3D "5.4.74+git${SRCPV}"
--=20
2.29.2

