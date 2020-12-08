Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.8559.1607435045616054779
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 05:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=QgoRe+zM;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E626438C085C
	for <meta-ti@yoctoproject.org>; Tue,  8 Dec 2020 13:44:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8Di47h091169
	for <meta-ti@yoctoproject.org>; Tue, 8 Dec 2020 07:44:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607435044;
	bh=jIGTjyYTbxj5Olo7qtp61taf1gDY3g/lD5RPkTYAQe0=;
	h=From:To:CC:Subject:Date;
	b=QgoRe+zMLXpn9Viky4fEvQVqv3494dVEBa9s/xPdTwWymZfTuNqxL0vmTB7Bj5bwV
	 NWDr8nu6Ce6X1ABZzrRLKunoTlzsB4M4RPtvyJj4cl9k5siR+po9eUYZGmPQG786pi
	 ZekQ4eJj408vOv6FVzYTuYs4nR9YmfTRVn4yaYhA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8Di4FY121421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Dec 2020 07:44:04 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 07:44:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 07:44:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8Di3Qw083570;
	Tue, 8 Dec 2020 07:44:03 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] linux-ti-staging: Update kernel to 5.4.78
Date: Tue, 8 Dec 2020 07:44:02 -0600
Message-ID: <20201208134402.27851-1-dmurphy@ti.com>
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
index 4f3390624cfe..2f8fe2bfec9d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "9002faf1c069e1b0d435199a80a89268e69aeecf"
-PV =3D "5.4.74+git${SRCPV}"
+SRCREV =3D "a59ca20fbcdc436be90ca38c199f9b640671fdb7"
+PV =3D "5.4.78+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 416776abbd93..0e7fa2dff29c 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "9574bba32a1898794895ca3816e815154c80226d"
-PV =3D "5.4.74+git${SRCPV}"
+SRCREV =3D "673043a513673aaddded01f52124c37d0e28f4f9"
+PV =3D "5.4.78+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

