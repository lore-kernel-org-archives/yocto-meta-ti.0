Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1404.1608062112223461832
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 11:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=miOVfaOw;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5120338C13E9
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 19:55:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJtAJ1075375
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608062110;
	bh=DxMNqYc/g3zYXXfDppZJwVN9wmUAphuKq4oUsGC1ZKs=;
	h=From:To:CC:Subject:Date;
	b=miOVfaOwfflIHeAB7nx6k7O0v/XuF7TQQVlcBF/rOnniYTyEdN0TpwOrRk+rdD+Ks
	 7k3BoDS6YXQuAw6r3mtqnVzOdLIKhCDMvM9OkhXXc8GRYNaf2auG+Gg2CakcaEfrZB
	 uMchb8RXF0VU+oJCFmsV/ivDUpNEc337O4P4KdIo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFJtAPc073435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2020 13:55:10 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 13:55:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 13:55:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFJt9Or095254;
	Tue, 15 Dec 2020 13:55:10 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH 1/4] linux-ti-staging: Update kernel to latest commit sha
Date: Tue, 15 Dec 2020 13:55:05 -0600
Message-ID: <20201215195508.22483-1-dmurphy@ti.com>
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
index 2f8fe2bfec9d..3fc37f01a7d3 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "a59ca20fbcdc436be90ca38c199f9b640671fdb7"
-PV =3D "5.4.78+git${SRCPV}"
+SRCREV =3D "6a28f3bdf16a8dda913d1544d093780a95f25fc2"
+PV =3D "5.4.82+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 8275988bb1a7..813a58a198e4 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"
-PV =3D "5.4.78+git${SRCPV}"
+SRCREV =3D "a859b16c71c3fc11b43ac895c7ec830f9d9f932a"
+PV =3D "5.4.82+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

