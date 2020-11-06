Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12850.1604675626984784865
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 07:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=snrvLVjj;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B5FD738C128F
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 07:13:46 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6FDksL006463
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 09:13:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604675626;
	bh=bKoXnu4e3FULWHMW8+s4e+chHGFYPjlrNsViy4tH75g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=snrvLVjjbWy3Iqk2dw5JehcWoUQc3f4viDofjIS/f010NFrLLDWHM0Gj0wSngYg5d
	 ofaOnPcmrcYN1Mp2o+ZAsbgVFjqMUXBS9bz7ibQk+0UzuOA1Qnlui8GEXr8nbB2EI1
	 awQymBtA+dsyqBdgYo4t3PMK6CLnZO20vPFUbAAg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6FDkK8003428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 09:13:46 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 09:13:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 09:13:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6FDj3u060246;
	Fri, 6 Nov 2020 09:13:45 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH 2/2] ti-sci-fw: Update to 2020.08b system firmware
Date: Fri, 6 Nov 2020 09:13:41 -0600
Message-ID: <20201106151341.29928-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201106151341.29928-1-dmurphy@ti.com>
References: <20201106151341.29928-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc    | 6 +++---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/=
ti-sci-fw.inc
index 00e611876733..24de33d67008 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY =3D "TI SCI firmware (SYSFW)"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
-PV =3D "2020.08-rc3"
+PV =3D "2020.08b"
=20
-SRCREV =3D "8a22979dc944f6f4f867e2ac637c51a317efaacd"
+SRCREV =3D "f5685b5980d93709e20466ffa19145ffd83b4ca4"
 BRANCH ?=3D "ti-linux-firmware"
-SRCREV_imggen =3D "36fe2d183a734f65b9adbd3097e5d51a6f931521"
+SRCREV_imggen =3D "7b4fe13d642d69a559724349aede4817891008a7"
 SRCREV_FORMAT =3D "imggen"
=20
 SRC_URI =3D " \
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
index 1239b278a1a7..92992440c352 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -19,6 +19,7 @@ SYSFW_SOC ?=3D "unknown"
 SYSFW_CONFIG ?=3D "unknown"
=20
 SYSFW_PREFIX =3D "ti-sci-firmware"
+SYSFW_PREFIX_append_j7 =3D "ti-fs-firmware"
 SYSFW_SUFFIX ?=3D "unknown"
=20
 SYSFW_BASE =3D "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
--=20
2.29.2

