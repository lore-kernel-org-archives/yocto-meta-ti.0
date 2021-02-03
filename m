Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.852.1612378336924944461
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Feb 2021 10:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=gs9XHo0w;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3AAF638C050A
	for <meta-ti@yoctoproject.org>; Wed,  3 Feb 2021 18:52:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 113IqFfX052982
	for <meta-ti@yoctoproject.org>; Wed, 3 Feb 2021 12:52:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612378335;
	bh=RGJVmkvgw7IGp3J2ZsMXXyACvCmVQZgD5+IresUj5bo=;
	h=From:To:CC:Subject:Date;
	b=gs9XHo0wUKwEc3+bA64TP2PVkmmwjpETS3Mz7tI6XNc4kP/NBMe8hvRPcWWm37FCz
	 cLOuECwZbiZWzdPy30RGlBSIi4SjpCbW7u8mULSn/YB8jlwys+xvVNsTmpoJ2MMI4/
	 PzwJVqjMIwn3LhHTJ+NrSQ2OeJKEO4KcUlLRsyA8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 113IqFik023133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 3 Feb 2021 12:52:15 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Feb
 2021 12:52:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Feb 2021 12:52:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 113IqEbH044055;
	Wed, 3 Feb 2021 12:52:14 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] linux-ti-staging_5.4: Update to 5.4.93 kernel revision
Date: Wed, 3 Feb 2021 12:52:08 -0600
Message-ID: <20210203185208.9192-1-dmurphy@ti.com>
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
index 094a20781a7f..701bafdbbe28 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "5120077c1d853051bb03629a8b74f0f5da508687"
-PV =3D "5.4.91+git${SRCPV}"
+SRCREV =3D "a823659d8d8d7d3f254f42014e88387540c58c6e"
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

