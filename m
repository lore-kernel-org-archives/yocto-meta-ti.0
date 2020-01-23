Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.272.1579799312876698745
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 09:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NHYsl5Hn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: d-huang@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NH8W4N080708
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:08:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579799312;
	bh=OqyFQs662EPYWEhW5fj85JpsJlaHw1XTDrnzhUl+XIM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=NHYsl5Hnlm4Y9i8WLPeVYboEgtWcorVGTku299cTHeWsPT4vsY1fxZLCO1QDxXzxe
	 Ycjk4M1d4AjbxssJkFsYSUjb9hd1A9TLS3oAMmCOpcXWDBX1wlBWT8n6FuDLZt/Bnc
	 J75c7Ly9qdYU6CIg6SqAl5Xe6tUT3IeWNkzZon+8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NH8V9t050922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:08:32 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 11:08:31 -0600
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
 DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
 15.01.1847.003; Thu, 23 Jan 2020 11:08:31 -0600
From: "David Huang" <d-huang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Hernandez, Alejandro" <ajhernandez@ti.com>
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Thread-Topic: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to
 latest
Thread-Index: AQHV0g53FEf2aE2UQECPD3FWZ3nwNKf43wkA//+cFQA=
Date: Thu, 23 Jan 2020 17:08:31 +0000
Message-ID: <c3b4990d4ef6439caa8b638f884fdaf7@ti.com>
References: <20200123165856.26907-1-d-huang@ti.com>
 <20200123170515.GN3658@beryl>
In-Reply-To: <20200123170515.GN3658@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.77.16]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Yes, I think I tried to enter it as $(CROSS_COMPILE) and that got interpre=
ted away. Please go ahead and fix this while merging.

Thanks,
David

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, January 23, 2020 11:05 AM
To: Huang, David
Cc: meta-ti@lists.yoctoproject.org; Hernandez, Alejandro
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to=
 latest

Thanks!

On Thu, Jan 23, 2020 at 10:58:56AM -0600, David Huang via Lists.Yoctoproje=
ct.Org wrote:
> From: David Huang <d-huang@ti.com>
>=20
> Pick up latest version of ti-img-encode-decode recipe
> with Makefiles using instead of hard coding

Is this message incomplete? Did you miss "using CROSS_COMPILE"? If that's =
the=20
case and you have tested the recipe update, I can fix the commit message w=
hile=20
merging. Please let me know. Thanks.

Denys


> aarch64-linux-gnu as the cross compiler.
>=20
> Signed-off-by: David Huang <d-huang@ti.com>
> ---
>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0=
.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> index 86d954756600..a1da9585e368 100644
> --- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM =3D "file://driver/common/dq.c;beginl=
ine=3D1;endline=3D16;md5=3De015e28
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append =3D "f"
> +MACHINE_KERNEL_PR_append =3D "g"
>  PR =3D "${MACHINE_KERNEL_PR}"
>  
>  COMPATIBLE_MACHINE =3D "j7-evm"
>  
> -SRCREV =3D "030e50dd0c53ec8e7825c85479ac3208925bb58d"
> +SRCREV =3D "0eba3678300f649e49f03d92d1b624cf0e008008"
>  
>  EXTRA_OEMAKE =3D "KPATH=3D${STAGING_KERNEL_DIR} KCONF=3D${STAGING_KERNE=
L_BUILDDIR}"
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --=20
> 2.17.1
>=20

>=20

