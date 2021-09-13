Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.421.1631563857711543302
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 13:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=a16IdlM8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18DKAu2X074617;
	Mon, 13 Sep 2021 15:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1631563856;
	bh=/gJJyTohiVT6xYRic8ZVp11+A29Kqek3fivCpniz3Ww=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=a16IdlM8tJwSIXAAMxpiJqgQ2h8G2+kCCek6MuFev6ql8j572IuY4WmDcmdInlNoD
	 yF0+ykXr937wQn+LGpb0qLvqEIDi/cVNkbMgggynff5KJXrBUvrIBJekLOLHadjvxT
	 U6Ond6gPSyxFCOQOa/6dug5rwDJAZKDNdBw+utkY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18DKAu0N127486
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Sep 2021 15:10:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 13
 Sep 2021 15:10:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 13 Sep 2021 15:10:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18DKAt3q001489;
	Mon, 13 Sep 2021 15:10:55 -0500
Date: Mon, 13 Sep 2021 15:10:55 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <asif.malek@deltaww.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] ROOT LOGIN ISSUE of K2g (Yocto- meta-TI (version : ROCKO))
Message-ID: <20210913201055.mi37ffanfnowzxhv@pantyhose>
References: <xqAQ.1631511977629423168.1TIQ@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <xqAQ.1631511977629423168.1TIQ@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 18DKAu2X074617
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22:46-20210912, asif.malek@deltaww.com wrote:
> Hi,
>=20
> I have used meta-ti layer (Version :Rocko ) to generate core-image-mini=
mal for my 66ak2g12 board from TI. I=E2=80=99m able to boot up my board p=
roperly=C2=A0 but after booting up =C2=A0not able to login.
>=20
> I=E2=80=99ve tried =E2=80=9Croot=E2=80=9D or blank password but still i=
t=E2=80=99s throwing wrong password.
>=20
> When I=E2=80=99m using =E2=80=9Croot=E2=80=9D as a user then it throws =
=E2=80=9Ccan=E2=80=99t set root user=E2=80=9D.
>=20
> In local.conf =C2=A0the variable is as default,
>=20
> EXTRA_IMAGE_FEATURES?=3D =E2=80=9Cdebug-tweaks=E2=80=9D

[1] I'd be guessing, but =3D instead of ?=3D

>=20
> Can you please help me to resolve this issue. Please refer the log also.
>=20
> =E2=80=9Ck2g-evm login: root
>=20
> login: can't set

^^ weird "can't set" message..

>=20
> Poky (Yocto Project Reference Distro) 3.3+snapshot-f2728d3ec8c0589e02e9=
a3ce7cf8aca902cae0a3 k2g-evm /dev/ttyS0 =E2=80=9C

meta-ti does'nt set the password for poky.

[1] https://www.yoctoproject.org/docs/2.4/ref-manual/ref-manual.html#var-=
EXTRA_IMAGE_FEATURES

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
