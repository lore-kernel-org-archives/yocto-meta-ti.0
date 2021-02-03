Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2245.1612383770276786650
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Feb 2021 12:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=NzNuxR0V;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9EC4F38C050A
	for <meta-ti@yoctoproject.org>; Wed,  3 Feb 2021 20:22:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 113KMmsb071508
	for <meta-ti@yoctoproject.org>; Wed, 3 Feb 2021 14:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612383768;
	bh=d/UDGvJUGqks6oHIqgh1/7mC8ln8Akw/Qa/ZOUURT6w=;
	h=From:To:CC:Subject:Date;
	b=NzNuxR0VasoGW9HjIGv9Yryw+wbShfvuz1vPWjlobba+0cLrPt+E2UdVaQZ0NHEAl
	 s1l6Ad98fhH/yGulcfcERRFKTeldl1u/erLE/M+0LO+RSOpYBqZadIjBZlt19w8bNs
	 KTdbNMHlPh1UEhBl8LwVNmyN7cUCQEt+9b2uQN1Q=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 113KMm7X078306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 3 Feb 2021 14:22:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Feb
 2021 14:22:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Feb 2021 14:22:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 113KMmQC044119;
	Wed, 3 Feb 2021 14:22:48 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2] linux-ti-staging_5.4: Update to 5.4.93 kernel revision
Date: Wed, 3 Feb 2021 14:22:42 -0600
Message-ID: <20210203202242.29281-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-ke=
rnel/linux/linux-ti-staging-rt_5.4.bb
index 094a20781a7f..65ebe97aa684 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "5120077c1d853051bb03629a8b74f0f5da508687"
-PV =3D "5.4.91+git${SRCPV}"
+SRCREV =3D "ff85c3d7a19f2d67e89da0cf44c7a7820f37f498"
+PV =3D "5.4.93+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index d8f7211750ad..1f4801fe7de6 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "4f9a563c39fa95af40d8f3119a64c347cbca3b45"
-PV =3D "5.4.91+git${SRCPV}"
+SRCREV =3D "43efeed4be285196d5376949b82bb18411ca7a53"
+PV =3D "5.4.93+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

