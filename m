Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2786.1619557850768518414
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 14:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ZWxd7ixu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E1F9338C06A7
	for <meta-ti@yoctoproject.org>; Tue, 27 Apr 2021 21:10:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13RLAmrI077932;
	Tue, 27 Apr 2021 16:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619557848;
	bh=zLz6ClHrCcJrnH2KlRDOvCAnjCg1vu0siKujNNvtieg=;
	h=From:To:CC:Subject:Date;
	b=ZWxd7ixulzYRFx33VKccNcxQSxw52Db3IuGl3x/g5obL4rmlfKtv8XMvnjYkQ3+WL
	 dCB6mUMmoz+T80Z5+aDQrJBa1ksK1ARTz6wIm545mtnNwTHJGQYKnVD+p/XgRYyHV3
	 jfQ7GdBfmJVWLooxblEzJvl2pl8UbTFQJZGmPk9c=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13RLAmiV070702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 16:10:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 16:10:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 16:10:48 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13RLAmAW078287;
	Tue, 27 Apr 2021 16:10:48 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13RLAmKG087884;
	Tue, 27 Apr 2021 16:10:48 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-gc320-driver: update branch for 5.10
Date: Tue, 27 Apr 2021 16:10:46 -0500
Message-ID: <20210427211046.22567-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update branch and srcrev for picking up 5.10 branch.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/rec=
ipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 77bb0926..d36bcd56 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -7,13 +7,13 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gc320"
=20
-MACHINE_KERNEL_PR_append =3D "h"
+MACHINE_KERNEL_PR_append =3D "i"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 # Need to branch out with ${PV} var
-BRANCH =3D "ti-${PV}-k5.4"
+BRANCH =3D "ti-${PV}-k5.10"
=20
-SRCREV =3D "2a4fbe8353fa56011a613aeeaf69e274cd07a825"
+SRCREV =3D "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
=20
--=20
2.31.1

