Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8700.1614926528132548099
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 22:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=RtxhfCUs;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0BA5F38C064F
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 06:42:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1256g32t110564;
	Fri, 5 Mar 2021 00:42:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614926523;
	bh=OteY8IFO5DW9nafz1dyAy9n58GXTEi4vRFJjvMaPXso=;
	h=From:To:CC:Subject:Date;
	b=RtxhfCUsFj/nxzRPRZJsNzu4y3CKtEahtPJSrjLlrzr7I/l65pH2ldV3aF0pjyLsL
	 N+RZbjvs75SeuTDmV2TUw36l0ml1AAojeobOiw3i2YmXwqUaeRRIFpnE5xcyjZj8Md
	 cZpAwhA43iv06V7HBBKGbMzOTvkSmrajzS/LlbQI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1256g3GT029103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 00:42:03 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 00:42:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 00:42:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1256g2I0033270;
	Fri, 5 Mar 2021 00:42:02 -0600
From: "Nishanth Menon" <nm@ti.com>
To: meta-ti <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH dunfell] ti-rtos: Fix J7200 builds by dropping evm
Date: Fri, 5 Mar 2021 00:41:55 -0600
Message-ID: <20210305064155.5125-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"evm" prefix messes up the pattern matchup for J7200 and falls back into
default, as a result, we attempt to pull [1] instead of [2].

[1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/f=
irmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
[2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/f=
irmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz

Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firm=
ware")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index ed62b876e4db..dffd51abda66 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -31,7 +31,7 @@ DEFAULT_RTOS_VERSION_DOT_am65xx =3D "07.03.00.10"
=20
 DEFAULT_RTOS_SOC =3D "undefined"
 DEFAULT_RTOS_SOC_j7 =3D "j721e"
-DEFAULT_RTOS_SOC_j7200-evm =3D "j7200"
+DEFAULT_RTOS_SOC_j7200 =3D "j7200"
 DEFAULT_RTOS_SOC_am65xx =3D "am65xx"
 DEFAULT_RTOS_SOC_am64xx =3D "am64x"
=20
@@ -47,7 +47,7 @@ DEFAULT_FIRMWARE_URL_k3 =3D "${CORESDK_RTOS_WEBLINK}/${=
DEFAULT_FIRMWARE_FILE}"
=20
 DEFAULT_FIRMWARE_SHA256SUM =3D "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 =3D "69cc16c30c895fe813002bd7bdb3d30e6ca62=
2d86b008a6bf6e2a24b86550969"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm =3D "a16865d928b2b00bfca64e0c41b02d=
cfc0ac8ec1ce125fbfd3581a1c610847f8"
+DEFAULT_FIRMWARE_SHA256SUM_j7200 =3D "a16865d928b2b00bfca64e0c41b02dcfc0=
ac8ec1ce125fbfd3581a1c610847f8"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx =3D "aa121c10d3099dd61ef898717245ecee2=
5b501170607c9a95afd741e05783a5d"
 DEFAULT_FIRMWARE_SHA256SUM_am64xx =3D "9e9efeef0b1dbb101de97e58cfda8bf05=
2a697f2ea635fdf6ca5158fffdc212b"
=20
--=20
2.25.1.377.g2d2118b814c1

