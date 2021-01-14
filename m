Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.3854.1610640742795237476
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 08:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GwhSnPjB;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0657038C13A5
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 16:12:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EGCLg7028756
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 10:12:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610640741;
	bh=Yk87i1xPj8dVslixqgS4ERCgvjM6DTSs0rlXSvEjGF0=;
	h=From:To:CC:Subject:Date;
	b=GwhSnPjBGbm5YJe19h14fzSbd24T31/mlnpb4Ds52CCqH+AdbTEZ3F24LyS7q+CIr
	 XkokUDMxBwH2AtMi8eAc1ajy3Jfhl3NN1tBynjk0ZaljzAlKvmun1OmMzCWAleS/d6
	 3iwBs94RhuAPRgc0f4pmRSZxjYjz8hzyfeA0z5zk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EGCL7D030599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Jan 2021 10:12:21 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 Jan 2021 10:12:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 Jan 2021 10:12:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EGCKI5114478;
	Thu, 14 Jan 2021 10:12:20 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: Update 5.4 kernel to the latest 5.4.87
Date: Thu, 14 Jan 2021 10:12:15 -0600
Message-ID: <20210114161215.28421-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-ke=
rnel/linux/linux-ti-staging-rt_5.4.bb
index cc39bc784eaf..7786fbd0b706 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "cfa321c18ddfc08dc4f4417c93fe607dadd9cdee"
-PV =3D "5.4.84+git${SRCPV}"
+SRCREV =3D "7e059d122f1e1cdcf2452f69fb6fd42a51ba899b"
+PV =3D "5.4.87+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 8d37dd48c911..da2e0d8eab65 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "7c35f0b11b13cfbc7af25c772c77bc24eef40204"
-PV =3D "5.4.84+git${SRCPV}"
+SRCREV =3D "c02b2da68c63deb35dc5a7c1b0bbc68e4ee38632"
+PV =3D "5.4.87+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

