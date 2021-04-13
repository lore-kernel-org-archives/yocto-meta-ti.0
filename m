Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4307.1618350878066947946
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 14:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SroMwBOm;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4A84338C085C
	for <meta-ti@yoctoproject.org>; Tue, 13 Apr 2021 21:54:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DLsZNO046672;
	Tue, 13 Apr 2021 16:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618350875;
	bh=Gyy0nhiwm/YkSk8H3PUgYLBP5RIhLii7V1b2aUC9y7E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SroMwBOm5FDMByrzTsobi9x2YR1j8rhDMXEdUCl0TJ6yasyvP49nAi1qrHvUW91Ue
	 dXjbyaOOHDZkxRQ5kljlszldlp28fqqeMQeaqBHzf89CGOGCPW8//zy/dTAjBSrKwf
	 0n/hU/ecpZHB/NnXFkJ8buzq831wL/g0axD2lOLg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DLsZtS023396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 16:54:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 16:54:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 16:54:35 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DLsZFf123846;
	Tue, 13 Apr 2021 16:54:35 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 13DLsX8j034867;
	Tue, 13 Apr 2021 16:54:35 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 2/2] ti-sgx-ddk-um: update branch name
Date: Tue, 13 Apr 2021 16:54:31 -0500
Message-ID: <20210413215431.1809-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413215431.1809-1-g-tammana@ti.com>
References: <20210413215431.1809-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update branch name to pick dunfell branch for kernel 5.10 migration.
Srcrev remains the same at this point.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 47e9820b..db4e24e9 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,9 +10,9 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-PR =3D "r36"
+PR =3D "r37"
=20
-BRANCH =3D "ti-img-sgx/zeus/${PV}"
+BRANCH =3D "ti-img-sgx/dunfell/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
 SRCREV =3D "7519eda203308c4356e68fd6af67a0900ed09cb4"
--=20
2.31.1

