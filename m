Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7886.1624972921489636108
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 06:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wagzrOwu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TDM0A9037514
	for <meta-ti@lists.yoctoproject.org>; Tue, 29 Jun 2021 08:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624972920;
	bh=NqFXrhiy0kjk+kxgGX4FzK9BPcnyNVhcT9/Dc16Ue28=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=wagzrOwuounIZU+ETzlxkN3xlsffYcCBAwGBnaD6TW+fekx//GGAHd7/5pGWu2teZ
	 5Xg5MCcfqf/YssHQJWvxMjxMZfds68pWyysLlhBJ/2e79HsDU59fF0fwX9H2J2s12Q
	 iG5g7JQ/8iUAxmmX6oqCfm13YoTf+1veDliALXvk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TDM0VZ047273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 29 Jun 2021 08:22:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 08:22:00 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Tue, 29 Jun 2021 08:22:00 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: "Strashko, Grygorii" <grygorii.strashko@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
CC: "Vutla, Lokesh" <lokeshvutla@ti.com>
Subject: Re: [PATCH dunfell/master] prueth-fw-am65x-sr2: Updating firmware to 02.02.09.02
Thread-Topic: [PATCH dunfell/master] prueth-fw-am65x-sr2: Updating firmware to
 02.02.09.02
Thread-Index: AQHXacMd5AQ5KojjY0ez7klA+eS5F6sq/+yw
Date: Tue, 29 Jun 2021 13:22:00 +0000
Message-ID: <47b79107cef346a99622ba264d5159ad@ti.com>
References: <20210625130743.16823-1-grygorii.strashko@ti.com>
In-Reply-To: <20210625130743.16823-1-grygorii.strashko@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Applied to dunfell.

-----Original Message-----
From: Strashko, Grygorii=20
Sent: Friday, June 25, 2021 8:08 AM
To: meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>; Ra=
ghavendra, Vignesh <vigneshr@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>
Cc: Vutla, Lokesh <lokeshvutla@ti.com>; Strashko, Grygorii <grygorii.strash=
ko@ti.com>
Subject: [PATCH dunfell/master] prueth-fw-am65x-sr2: Updating firmware to 0=
2.02.09.02

Update AM65x SR2.0 prueth firmware to 02.02.09.02

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp=
/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 9d579fa4..9ab40536 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4a4=
6d76"
=20
-PV =3D "02.02.08.02"
+PV =3D "02.02.09.02"
=20
 CLEANBROKEN =3D "1"
=20
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx-evm"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-SRCREV =3D "31e626d84a3f8a5dc7175b79440972ce90a23de0"
+SRCREV =3D "c0bbbc44fee68f2a3eba1ca98c340e34e759624d"
 BRANCH ?=3D "ti-linux-firmware"
=20
 SRC_URI =3D "git://git.ti.com/processor-firmware/ti-linux-firmware.git;pro=
tocol=3Dgit;branch=3D${BRANCH}"
--=20
2.17.1

