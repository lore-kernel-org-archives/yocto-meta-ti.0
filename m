Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.127])
 by mx.groups.io with SMTP id smtpd.web11.26721.1592250315020654688
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=Ih70/wPO;
 spf=pass (domain: gallagher.com, ip: 40.107.137.127, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQvhNVPzlfHB2cL9BsYrKHfzmDYChK2nDeaIhw/eDa81ovDPPTrDUbX6hYNHHooSCkMf49nd0l4oFR7oInibXdOkgik0XztrlFwEc13T2KMrQGSQ0h0NUb04cixXFvHLllWAAV+yPUIC7pB3jQpiiR+VwQGmdJNkvkDmTGHlxUwQesFBTqtIHh4NiSIRGLFGwHBC1Xn8AJka1MWGkmj9e2Y44URm2jlApw9d55ZcllGFBwYv7ZX9RL+a3OjNYfHYeo6R4YFaEoE8FFc56a48FdqoL76QUgKN9jgNwDH5yiVphx8SeqtjwJOHXxQmxHuQOXmn1hvitzfF0vWuSqJu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojIwloC8d4HPwKa+LWenpE6el2O3rJIanzaWNrLp+Io=;
 b=YjJO45bVADniaVRj+Ag36XN7P2qYDf5tmc3ur9rUqvtNt6HUVa2ThwRmm2pxJPlfRTW8BxqZsrTaM+vHZwy8m3U067oR/0dcyD3S1tsvllMDgR0ihFOzr1K2w6X++qmwdiRP1LeIhO68mKtY8W1nfposOxDuh9PK5rfxnoS8OtTqzd5Dww91ZAS3Q0m+Ke6JeBeu7xiC0K5a8S7HCYxijsJUdJVnLVa7IRfQmkhUBbar2eDYew4xq+YzN4DvLaNVyAj2MSC8ptTiO8ESvTTe5TU9i8QITqVd1veyEO16ZhzMKNqd4ntC3dQaKvydnwwjv/Q9hEn4XtXGB0lPHYG4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojIwloC8d4HPwKa+LWenpE6el2O3rJIanzaWNrLp+Io=;
 b=Ih70/wPOKx4uX2gaYpgA9d3AbRq/AtMTMzG6E8WKO46ulG7UuGz78EX7EKkKFkqz4uvKSGMw4lW+ciniEkZDgscTY56Y7/z0lOPqxDYvgRlVoC9aLk5GZ60rKvSUNJjY6zqLomZzmwyoOdzATqCYOqTWzCcoYs1MFHFJgOPhvak=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
 SY3PR01MB0924.ausprd01.prod.outlook.com (2603:10c6:0:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Mon, 15 Jun 2020 19:45:10 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 19:45:10 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0g
Date: Mon, 15 Jun 2020 19:45:10 +0000
Message-ID: 
 <SY3PR01MB080939C1031BA0E045699D07E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
In-Reply-To: <20200615194140.GB10991@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6474d2c-0eb5-4fc7-a282-08d811649d16
x-ms-traffictypediagnostic: SY3PR01MB0924:
x-microsoft-antispam-prvs: 
 <SY3PR01MB0924DAD5CDFCB07F3B4B1B62E59C0@SY3PR01MB0924.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6/lFESxR1eSPtREaVWpvpPxHbdkcRpikKsdkJlgkzvhZU2hzODKvgyS0mbCz8+RFmJQfmSAJ2DytrG5BtjaWVpSXElbKAFXhqQtoBP8SA7pXJAspESB3ZLP4ela4Bduqne0bBaezfu6XoY+3eKh7qxdDUCZa0X0+H3wvr/XR4JzZW29CeqGAsiWFbBLpQ82FAGmy/w39Us8sptFaGXw0PD4H5jZQtR3XyE7QEHe8d60KCdeULrEvRv47id9i34wJi/Peai6wwIIMtaqpkMHcS6+cGv6VW57QSN1zsTiUFOzRTIETjebA8mFvqkYICJ3m8l2pBpszLAQvn7rrhOSj8udSyiM7VTkKu0GpWyWqbhMjxu7w2/9VMqmXb0YvcuZMd6elqxJ5pKFIFvN6yMG3uw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB0809.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(8676002)(52536014)(186003)(316002)(26005)(64756008)(66446008)(66556008)(7696005)(66946007)(6506007)(66476007)(53546011)(76116006)(71200400001)(8936002)(86362001)(55016002)(9686003)(966005)(33656002)(2906002)(5660300002)(4326008)(6916009)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 8jwaqw0KBmUYOn0BwWkn6i9cVdsbZ/EthUpg2KF2/fo+zHueG5LecKPYCEZSfvtw4etsTiTlf3N/CKJuP72L9mRqCpcJQAeymxRrOyZFEAoBNqZNlAI/yU2S334e2ijwMLOhF021nTQz2MO/5QMYZrpjvftSXmDmY9SZZ8TEaJTGga3qREf7aTrz7GNh3VuqE2PtOuDi3PJAQsksmeN/6eorwDpChlAdJVwz/Bo9iiE73zvG433jH1DXN1y2O05uqqYglo4KbVUaU3qo/2ykkzJVtAfexK5Tm6j4HXgf3OGqGS5upaE138JsYpmhV358g7Lu3hh8Zcg/kYml2fe5RH4yLc6btMBNd9P9wrcpUONsS+P0H8sWlzB2K0WSpECBjJiYqlhcTN8mNFGeioQqr6+/BFmNJy3Xf0NJnE7w3+Jx7NoGRvfp890olwt5wMzx+3Vu7OwzXPi3qia/Aj5N9u9G3lcK5SWzq2H4yTOqiP+a72urSozNCqX3sLei98yF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6474d2c-0eb5-4fc7-a282-08d811649d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 19:45:10.2043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iV8dLPlDtiV9lePlTNcNfJM1p0EQL5tpKu/FIdEzK/Q9kVdI0R+HCAv6+lbHUjTtmBOkjk6XA1EqketPnsKUZ5gD26Og0OBNH5dQvNidaxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB0924
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I did received your response and resent the patch.
This is the reminder for the second patch.

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Tuesday, 16 June 2020 7:42 AM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Gentle reminder as this patch has been in the mailing list (#12992) for s=
ome=20
> time now but I haven't heard anything.

Is your subscription working properly? I did reply here:
https://lists.yoctoproject.org/g/meta-ti/topic/74828692


> Regards
> Ankur
>=20
> -----Original Message-----
> From: Ankur Tyagi=20
> Sent: Friday, 12 June 2020 10:49 AM
> To: meta-ti@lists.yoctoproject.org
> Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment f=
or uboot board config
>=20
> When using meta-ti BSP layer, user should be able to override default ubo=
ot
> board config with their custom board config as it is common for customers
> to design custom board based upon am335x-evm dev kit.
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  conf/machine/include/ti33x.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.=
inc
> index abfd7ec7..ff72a382 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \
>  KERNEL_DEVICETREE +=3D "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES',=
 '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
> =20
>  UBOOT_ARCH =3D "arm"
> -UBOOT_MACHINE =3D "am335x_evm_config"
> +UBOOT_MACHINE ?=3D "am335x_evm_config"
> =20
>  UBOOT_ENTRYPOINT =3D "0x80008000"
>  UBOOT_LOADADDRESS =3D "0x80008000"
> --=20
> 2.17.1
>=20
