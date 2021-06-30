Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.3044.1625087117730456771
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 14:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PpI9RYGY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15UL5ABN034290;
	Wed, 30 Jun 2021 16:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625087110;
	bh=zeLSOYVZmAouahlFBeB9BxqdlcWgCpDDy7tzLlsDGEQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PpI9RYGY1fPhyqR1OOVPJAT1HDcAaKElyLQaTTCUCYgHK4kJqjLdV+Z3sdjP5TN1W
	 aH+QBGssGx42CfkoJb539pn9wefuH0TLeL4ytBdwbsoClMKRIRAv9zXuww2a0kPaIG
	 kFLgmTy6V21Qf3DGpbn9Q+aDGYsKSaZETQj+VoFo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15UL5AEW072952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Jun 2021 16:05:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 16:05:09 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Wed, 30 Jun 2021 16:05:09 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Menon, Nishanth" <nm@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "denys@konsulko.com"
	<denys@konsulko.com>,
        Tom Rini <trini@konsulko.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell PATCH] ti-sci-fw: Update linux firmware repo to 08.00.00.001
Thread-Topic: [EXTERNAL] Re: [meta-ti] [dunfell PATCH] ti-sci-fw: Update linux
 firmware repo to 08.00.00.001
Thread-Index: AQHXbdn0Q6COPkctok+S/x2VI7dstqstPdkA///NG+A=
Date: Wed, 30 Jun 2021 21:05:09 +0000
Message-ID: <e611f86da3d0405480efab6fd26c3386@ti.com>
References: <20210630180128.13766-1-nm@ti.com>
 <20210630190518.GH1528@denix.org>
In-Reply-To: <20210630190518.GH1528@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.38.131]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Accepted and applied to dunfell-next.

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Wednesday, June 30, 2021 2:05 PM
To: Menon, Nishanth <nm@ti.com>
Cc: Bajjuri, Praneeth <praneeth@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>;=
 denys@konsulko.com; Tom Rini <trini@konsulko.com>; meta-ti@lists.yoctoproj=
ect.org
Subject: [EXTERNAL] Re: [meta-ti] [dunfell PATCH] ti-sci-fw: Update linux f=
irmware repo to 08.00.00.001

On Wed, Jun 30, 2021 at 01:01:28PM -0500, Nishanth Menon via lists.yoctopro=
ject.org wrote:
> Just updating imggen to a configuration compatible with latest=20
> firmware should not have been accepted, we should have ensured that=20
> firmware commit has moved correspondingly as well. Fix the same, else=20
> we get a broken system.
>=20
> Fixes: 406f5998227e ("ti-sci-fw: Update imggen to release 08.00.00.001=20
> tag")
>=20
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>=20
> NOTE: NOTHING has gotten into master for the last 6 weeks, so I might=20
> as well not tag master - This is just going to creep back at us.
>=20
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc=20
> b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 9e22e461354d..966042820aac 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668b=
df95621259288c4a46d76"
> =20
>  PV =3D "2021.05"
> =20
> -SRCREV =3D "0468c7a78cd26f9190d374e198e37c63c7660ba9"
> +SRCREV =3D "1e73d9387980f4d425742738968e55395c19e26c"
>  BRANCH ?=3D "ti-linux-firmware"
>  SRCREV_imggen =3D "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>  SRCREV_FORMAT =3D "imggen"
> --
> 2.32.0
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
