Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7080.1611751943508591613
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Jan 2021 04:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SRQnRLiF;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 893DD38C07D7
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 12:52:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10RCqLVn002500
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 06:52:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611751941;
	bh=yYkKCtEiwuTieCusjOmPk8RiIXbdGE4Sge02NX0TEto=;
	h=From:To:CC:Subject:Date;
	b=SRQnRLiFuX/bQ605rf6k2dXNcFQ/+oW6yh8GySALPW42Ub0dgZRnVhrc5nc21S2UF
	 ICRlALAPKOb5+IWQSIbAvWWgkGRVWfHbmtJK5fIsMkp9UJ+HJRkrUAPq9q8pLstyit
	 2jxeT4uXLHefWNLQMqe0PdW1KZldUOVdFpnMtUCo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10RCqLfr103547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2021 06:52:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 Jan 2021 06:52:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 Jan 2021 06:52:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10RCqLU6100407;
	Wed, 27 Jan 2021 06:52:21 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH 1/2] linux-ti-staging-5.10: With the kernel being AUTOREV'd remove the minor version
Date: Wed, 27 Jan 2021 06:52:19 -0600
Message-ID: <20210127125220.10224-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kern=
el/linux/linux-ti-staging_5.10.bb
index e317e3a44181..fc115958eda5 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
 BRANCH =3D "ti-linux-5.10.y"
=20
 SRCREV =3D "44fb363f878fa80d5b502291954bb83d9cae842b"
-PV =3D "5.10.7+git${SRCPV}"
+PV =3D "5.10+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

