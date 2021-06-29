Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.7956.1624972799572903399
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 06:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ensv+bwt;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TDJv1p036604;
	Tue, 29 Jun 2021 08:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624972797;
	bh=gY52qKYVDX47eDnTXSrwIuJeyGLIylA/oIU6nHqY2m4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ensv+bwtQiWCnLTmzC7Zp1NQHQRh1MTNAYk9jwISHLzxrQ6AZ9wx0vl/HQ49TcYRT
	 dEffZ7d6tfF4YALjJi7095z+Y63SmnPwoWBgpXFbOO0EISzg5emzxvzWdpgM8IEtQh
	 uUMMTxBD+8ulL/uc+BXyhsb1k/W5xY2RHU8SFuYo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TDJv7X025421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 08:19:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 08:19:56 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Tue, 29 Jun 2021 08:19:56 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH] trusted-firmware-a: Update to v2.5
Thread-Topic: [dunfell/master PATCH] trusted-firmware-a: Update to v2.5
Thread-Index: AQHXZJ6ZF9KNa/6yQEKJuu53hVm7gasrCNwQ
Date: Tue, 29 Jun 2021 13:19:56 +0000
Message-ID: <86d5cb06875b469986b5c8f7c4094035@ti.com>
References: <20210619000356.15051-1-praneeth@ti.com>
In-Reply-To: <20210619000356.15051-1-praneeth@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Applied to dunfell. Thanks



-----Original Message-----
From: Bajjuri, Praneeth=20
Sent: Friday, June 18, 2021 7:04 PM
To: Bajjuri, Praneeth <praneeth@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>; meta-ti@lists.yoctoproject.org
Subject: [dunfell/master PATCH] trusted-firmware-a: Update to v2.5

From: Praneeth Bajjuri <praneeth@ti.com>

Update to v2.5 tag merge from upstream to keep TF-A in sync.

For major changes in trusted-firmware-a, See:
https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-=
2-5

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b=
/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 4852c560..eb6f2fd1 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,8 +1,8 @@
-PV_k3 =3D "2.4"
+PV_k3 =3D "2.5"
 LIC_FILES_CHKSUM_k3 =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd93=
8729b031"
 BRANCH_k3 =3D "ti-atf"
 SRC_URI_k3 =3D "git://git.ti.com/atf/arm-trusted-firmware.git;branch=3D${B=
RANCH};name=3Dtfa"
-SRCREV_tfa_k3 =3D "65dd16b4ea5032752af62e94ca64cff41733a123"
+SRCREV_tfa_k3 =3D "0693f356eb2a25adf8758d98058120bed082cc73"
 COMPATIBLE_MACHINE_k3 =3D "k3"
 TFA_BUILD_TARGET_k3 =3D "all"
 TFA_INSTALL_TARGET_k3 =3D "bl31"
--=20
2.17.1

