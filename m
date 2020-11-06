Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.13790.1604678539548578665
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 08:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xuXCge/Q;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1502E38C126C
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 08:02:19 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6G2I3E041521
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 10:02:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604678538;
	bh=AcTqp4dY0EWdGYtochU6y49RIcryaZ6Nf65/XyQU8Hg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xuXCge/QoMarWeFPtiC/7p5FS++mfL/ngBg2t1pqoXJ+uBUCroyXxce1ulY90MKgB
	 9ECnDbHXNON3K5rIVhskdl8WZgJV5iaseb2LYa1Jw8b5kFH8nvurhO5h5PZCWSWs80
	 d9oUED/I8+vBCj+iQBoQx2R38nUwF+QFy1w0J0e8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6G2IEM099128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 10:02:18 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 10:02:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 10:02:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6G2HC2098697;
	Fri, 6 Nov 2020 10:02:18 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH v2 2/3] ti-sci-fw: Update to 2020.08b system firmware
Date: Fri, 6 Nov 2020 10:02:14 -0600
Message-ID: <20201106160215.5800-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201106160215.5800-1-dmurphy@ti.com>
References: <20201106160215.5800-1-dmurphy@ti.com>
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
index 1239b278a1a7..49e37ff9ee87 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -19,6 +19,7 @@ SYSFW_SOC ?=3D "unknown"
 SYSFW_CONFIG ?=3D "unknown"
=20
 SYSFW_PREFIX =3D "ti-sci-firmware"
+SYSFW_PREFIX_j7 =3D "ti-fs-firmware"
 SYSFW_SUFFIX ?=3D "unknown"
=20
 SYSFW_BASE =3D "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
--=20
2.29.2

