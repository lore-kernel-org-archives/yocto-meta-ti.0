Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.117])
 by mx.groups.io with SMTP id smtpd.web12.1319.1592350852318362858
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 16:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=xAJx+ujX;
 spf=pass (domain: gallagher.com, ip: 40.107.137.117, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSv36tchmnN8Eh2bBktb6T8smjemkaXeMDyMQ6Dv6KEp2qDLa68z0pVLYyicdtHS7rjZy6nHfNjcMpeazxx+iEt8uR75Qpz6cA+NoL4z51mtWkjX0UDdCdyr7WHqF9+LwZM6lFqlIIlR73b4fNsqqktp7QXpS45TEM5Pj2eMH1matoKkqOWw94xU+Re5MTd6ZLjBfTmkRZsU6MCO9HqAiZ/uJUK0MKKvH0mzw1oowZ76rkLYMohpLImFLCWDt4XKD1Qr1QW8snT49VMMd88lh138gnpnGECiYNXbU/Iuhv12yCkBcVlXKesy9Ajo5oNXXZiR2GSzCqp3rORpSQq2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyPHIGDYHuch2a3SjyoseNGb0zoOx0LkMHdnO0cdK1Q=;
 b=ei9/pUnwCLGuMu1ynLyWT19UBxpxtMNpomfRrYOLVYn5KaXCzBXOdbiMbpOHTxtadm8uFilPTiVtuqyWmpoyoJyJBSrUsnlUAaoFN4wl+rPc2OTA1SiwqWn0Lp/BYSWDmvR7eMkdyTxwinIsFJ0BNLrFXF5WxCYcgFpaFQJih/b4e2gAp9MZoPt+LGeDgqEqs61GpBjNWTuOlpgFucVxLUavnxbzLfdyaCsS9Eb2SCSMtEDyaElmeYQferKbOHE9ToPrVJ5wsdhGI6x6DRyJRF3hubcztvy+IrhjdgEPCfVJ07vpX8pe8m+ieX07+OvwmJPfKAIV3UCT8lvPnSuaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyPHIGDYHuch2a3SjyoseNGb0zoOx0LkMHdnO0cdK1Q=;
 b=xAJx+ujXXI7o2PLfrhtlst1W8oXYtWhBDJvurkbSjsp6JjJv7yQl4Jpqu60DLPhjSJA+zPSFd0oFnFbtCIqF9q2K5FuRMbGRGVbcYeLsU5BJmpXi+9f5sB+wkCOUhWAsifC7L0Ohi6ZjR4zeWKa/X6lZElsyUYAOXgFj9j4NfqU=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
 SY3PR01MB1579.ausprd01.prod.outlook.com (2603:10c6:0:22::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Tue, 16 Jun 2020 23:40:48 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3109.021; Tue, 16 Jun 2020
 23:40:48 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0ggAHTYDA=
Date: Tue, 16 Jun 2020 23:40:47 +0000
Message-ID: 
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
In-Reply-To: <1618CF3A292A2864.29686@lists.yoctoproject.org>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [2406:5a00:f83f:3700:a4d5:8a94:9b91:1d9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe6adb11-6283-45c1-b4cd-08d8124eb24c
x-ms-traffictypediagnostic: SY3PR01MB1579:
x-microsoft-antispam-prvs: 
 <SY3PR01MB1579232145F5458DB20EF378E59D0@SY3PR01MB1579.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1YtDFCJn7fiog/hUehV4doWCWf/8kol2lcajAOOFnz904e0Lx8WpDTj/JeokiAvL0zqpvb63cKcJbVXIe/hXWG3y2bok5pWDeWu+3HFX6+qMpkhvoPrOdktpab+uiGiBlG1ieebIMjfJdkNTCKZS6iZavJPtRk0/pMuKjk0CldpAluXBLlPIH8jdngvRc4L6JEiOROX+R4SMOCa/6r90oThS61wzdOade7Ku2EHFAD7dNYXoY0/YhjJmM2bPzlKaAhSASoBTOAosjEpvS15DIfCbfGWaTj9M0YyPc4gVIKT61AbwK810n5JPinWahoGbaD0iJzEMZhuhpQoftDvSrq8QXy70lEfsoIF8ggqPZDFk4kKUQ1+xVDnDmn31xdAq46kgsh5AOqRUxzdPL3LA0w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB0809.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(316002)(7696005)(2906002)(53546011)(6506007)(71200400001)(6916009)(66556008)(64756008)(66446008)(5660300002)(478600001)(186003)(76116006)(55016002)(66476007)(66946007)(86362001)(83380400001)(966005)(8676002)(4326008)(8936002)(33656002)(9686003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 YdFRprc88Z5WAQ4AJGzmTCpwvQwWgMquJX13fejbszvAppejz+KlJMIJBlR9a60SCSjjbTwcHaPP31o6BUvn3/T5RlLvwfqKLr+wlIXH/mXcfjjLqGs9UelHYK5LrxU9NVJlXq5E5j71Y8MEd3+xr99owxAS6z+tgRBKe54Li3a8ELECruVyktjF6ijBC+YZQ2IqjfnZzmfU3D6NxztS9w/YGKPYJgm0J8ywIwmS/WKSRnSk84RgZfK9YTtBJ6anS/CEnpoRP2AAcruiUF13I7qUlIpl4LjARLbVhlUcWqZhUr1R7ZXUVhYc20Cyhqur3c2i3lISATrv9WfwsrzNdb9bxKrHxc4SBDO0jjrVGBjv3UEHS5fg7JgJsECS6CeNfpgSJlgpCH4YlANwptHLsEZ6/vu3wo07ZGgYXzwfpDTHdAOraC6mn/4hG99hKu3jL0mcLDvGzWuufu9pDLN8vMXTP/ruc+QoG/LekdnnIMBhuyC7D4an68Kn1vBFp37L0/m3yrdYHrp0LtHZAKPLUbdyHiGEw+SY9oZqHN2JavQUX/6tCIX1EJwjZ45I3X1+
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6adb11-6283-45c1-b4cd-08d8124eb24c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 23:40:48.0316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmKBnaL+04asrb3ia/dMsQb9ISI52d1RT2GqRDTKCrZP+Bt0/RGl4dH1CMx38WBPwVvnYBznUTvrqArd+IxGYttcNXcnOaLMB9oIkAcHhfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB1579
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Do you want me to send another patch?
Maybe with an updated subject to differentiate?

Let me know what's the best way to proceed

Regards
Ankur

-----Original Message-----
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Ankur Tyagi
Sent: Tuesday, 16 June 2020 7:45 AM
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

Hi Denys,

I did received your response and resent the patch.
This is the reminder for the second patch.

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>
Sent: Tuesday, 16 June 2020 7:42 AM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Gentle reminder as this patch has been in the mailing list (#12992)=20
> for some time now but I haven't heard anything.

Is your subscription working properly? I did reply here:
https://lists.yoctoproject.org/g/meta-ti/topic/74828692


> Regards
> Ankur
>=20
> -----Original Message-----
> From: Ankur Tyagi
> Sent: Friday, 12 June 2020 10:49 AM
> To: meta-ti@lists.yoctoproject.org
> Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak=20
> assignment for uboot board config
>=20
> When using meta-ti BSP layer, user should be able to override default=20
> uboot board config with their custom board config as it is common for=20
> customers to design custom board based upon am335x-evm dev kit.
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  conf/machine/include/ti33x.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/machine/include/ti33x.inc=20
> b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \  KERNEL_DEVICETREE +=3D=20
> "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-=
excl-uio.dtb', '', d)}"
> =20
>  UBOOT_ARCH =3D "arm"
> -UBOOT_MACHINE =3D "am335x_evm_config"
> +UBOOT_MACHINE ?=3D "am335x_evm_config"
> =20
>  UBOOT_ENTRYPOINT =3D "0x80008000"
>  UBOOT_LOADADDRESS =3D "0x80008000"
> --
> 2.17.1
>=20
