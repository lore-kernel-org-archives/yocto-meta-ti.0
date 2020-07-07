Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21274.1594142460680448505
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TY1Tb5xs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: prasad.jondhale@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067HL0dw069465;
	Tue, 7 Jul 2020 12:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594142460;
	bh=JaLUqNH6DS/Yo27z2959kU+ta4Rqhl2FBP4uiLo/6TU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TY1Tb5xsdE5FGz75LgPjZLaLWCo0ZbTsz7RiJA2eG9WTfDVZjYvASVjRu9DX7jck+
	 KPDuH1mYDivz2VLu+SW33yDFYstW2zN8Nj513qZUrQwbllt0djWvNWXf3JCQGpnEex
	 6QAv8Zr8aftX1csQKVTF3iaGrhOi77x3KpROzQoM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067HL0P2059921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2020 12:21:00 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:20:59 -0500
Received: from DLEE115.ent.ti.com ([fe80::8876:1e51:7a2b:d4c6]) by
 DLEE115.ent.ti.com ([fe80::8876:1e51:7a2b:d4c6%20]) with mapi id
 15.01.1979.003; Tue, 7 Jul 2020 12:20:59 -0500
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "eth_fw_auto@list.ti.com - Auto Ethernet firmware development team"
	<eth_fw_auto@list.ti.com>
Subject: Re: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Thread-Topic: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw:
 Update SRCREV to latest
Thread-Index: AQHWVIJ7JYUfNvt8PUSsPE5ydoKrcaj8sDuA//+sVKA=
Date: Tue, 7 Jul 2020 17:20:59 +0000
Message-ID: <d95169b6c95a46e0a6002f3a291b7cc4@ti.com>
References: <20200707171721.10205-1-prasad.jondhale@ti.com>
 <20200707171904.GI22569@beryl>
In-Reply-To: <20200707171904.GI22569@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.234.12]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Actually this is what I have in my confluence instructions. Should this be =
removed? What should it be replaced with?
Is just " recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest" fine?

Regards,
Prasad


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, July 7, 2020 10:49 PM
To: Jondhale, Prasad
Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org; eth_fw_auto@l=
ist.ti.com - Auto Ethernet firmware development team
Subject: Re: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw=
: Update SRCREV to latest

[[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCR=
EV to latest

This is better, but what's with "[[meta-ti][Dunfell/master PATCH v1]"?


On Tue, Jul 07, 2020 at 10:47:21PM +0530, Prasad Jondhale wrote:
> Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
> ---
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp=
/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 37ba52d0..8cb62b2a 100755
> --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -11,7 +11,7 @@ inherit update-alternatives
> =20
>  PROTOCOL =3D "git"
>  BRANCH =3D "master"
> -SRCREV =3D "afe62ada2e91e2665f597ca16eb3888b752016de"
> +SRCREV =3D "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
> =20
>  SRC_URI =3D "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=3D${PROTOCOL}=
;branch=3D${BRANCH}"
> =20
> --=20
> 2.17.1
>=20
