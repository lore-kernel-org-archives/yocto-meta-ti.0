Received: from AUS01-ME1-obe.outbound.protection.outlook.com (AUS01-ME1-obe.outbound.protection.outlook.com [40.107.136.115])
 by mx.groups.io with SMTP id smtpd.web10.2269.1592440828752926325
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 17:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=Y1wGy9ae;
 spf=pass (domain: gallagher.com, ip: 40.107.136.115, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExJLYIZXgJ7hPUNMhY9D6jv68eFdl7s0DyB5mu8iPfpuXPxapOa78YsdGGlqqiQaHlhF3yDmZIIrmPTFhUgi4LiVHIi2W0gNz52tX9RSUopt2IwMMhJA7WqhsdVLGsuaYADbExRIOaKmr7lXw1/BebVWSW/OJcjUO6h/Savhsk5ey8Awt5/UBlEy/bhW+H4Q9oXrUy1ejzeqcRpWGuTKwVt9rTihc6xnzNpQdHo0PEZB0OMBn2rCC9UgUfwgF8Rle7+mwk8WZSXMXW3Tk4feFI0YZT55jvE7n7PdKSUALvpqBC3C7JiyiuKDskVYE4/w/+kEBhfhZ2r6Ii6sPm0d3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz935gaFvDM/1MjodoaRZ6V0KWxTJAvNNee3QfklCUE=;
 b=NblYlBwHk7RnCapt5/TInieEPNmhv6rIrZ373yWjik8Kiw56HBbUdg2JK8oOn5gSDYih8LAwLMtTO0bB/BNWEtLx1e61Ef8eccaJAxDZISWSTMbP9jDVue+8ItKW4w+UHjDVfsAvflyMtEH0z4s2g1qb9P3pYGtwLnDAB8tQj8sI3TMg8UnV19WLB32evn89hMEhWIl4hLb4jVKqT6nuIbQHjwFuXLdjlrxS6ZPILIa2RovR5gcv+kDPn2bfoP95QW1B0Vxqf2MLmkjagKZdRl6fg+ESbfD+N7ejXQ1VQbAd6H01UaF0LuMOyd53wzPb2pngXrXI2n+d8+ok0kYq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz935gaFvDM/1MjodoaRZ6V0KWxTJAvNNee3QfklCUE=;
 b=Y1wGy9aeonvWc2xuLYY/Js2gH35SoNAUDv7ttGtbg/POymUXFdQpKAbEbpXJPsDcoKeux10CJkK3NbfFFmR7Htm2xOgokCANqYyAeVIlGRQBXiEBZBPc8aJredtP/ekaQeoaEMEkNjL5bSzaEIF6GSyT5HIcElqo4VPD83JdojA=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
 SY3PR01MB2009.ausprd01.prod.outlook.com (2603:10c6:0:21::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Thu, 18 Jun 2020 00:40:24 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 00:40:24 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: 
 AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0ggAHTYDCAAZdIgIAACpPw
Date: Thu, 18 Jun 2020 00:40:23 +0000
Message-ID: 
 <SY3PR01MB08097CC6172881D8261275DCE59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200617235343.GA9923@beryl>
In-Reply-To: <20200617235343.GA9923@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [203.167.229.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c5cec88-d8f7-4aac-e483-08d813203033
x-ms-traffictypediagnostic: SY3PR01MB2009:
x-microsoft-antispam-prvs: 
 <SY3PR01MB200920C445AEBC6F1EA12FA4E59B0@SY3PR01MB2009.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TBxLcePT/SQTSyDKjXn5Zi5eeS68VH89xVUuQl9C0xdNi6BzIrTiNFeg/x90O10GkCQUSSi+d1/Pp7t6yPi/NRk4FTEycfjL/xc7eQmUUgm/uxSCDTwrJQbRnwWq+0vzsN0oiaA1W+zr22BObNfzylAmQ6+CX0l45a5XDuklaeYbwMlZGpO5F/lWUdibmzKV3CJSze9KYUt/Q1RP5ltNoivKWObkhWl+GkoLl5mYdcAI03cnSa4E+5V0DD5e1SuikTAsdiCW33xzOJFW+aerXbotZHAYzHLLnP9Lrs77RLILpIL7A4CNROJu8FofW8VDQye4yHxgCc0wfITnxlCokv5E/yXRGhF1l9f8UC6xNaH2kV3nRtrX6SyyZOXqI+rTnwVZC4aw1Jej71yqMrNHvg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB0809.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39850400004)(366004)(396003)(376002)(346002)(71200400001)(5660300002)(8676002)(8936002)(83380400001)(4326008)(966005)(316002)(9686003)(55016002)(478600001)(186003)(2906002)(66946007)(66476007)(66556008)(6916009)(86362001)(53546011)(6506007)(64756008)(7696005)(76116006)(26005)(66446008)(52536014)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 EhHA0GS1otPWZ2XAqAq+oH8ZohijzJzYWqrhqiH1v/UFr4vkklE/GkemrrNojAGdY0+XRoLzOzBln0CuZK4jpYRmR8CzlEeLsafsVTJJ+g/b7lsIlCGvdovxKCwsKtPM2LAgq1M5ZufCCxOD1GKK7eNJCW/zCQdnYDnKyUpWqYg7Ed+ULW+Dt1bkNVzdSNMH5wmreun0L6LGJZKEwmN6pPQ+tCWoqmcn6CwO4fBi6iD4e29wbV5t9YbnpoaStdRouB6k3Ggk4U8//hUMK/x3Ta89R8wEMKX+OGtb4B1c3GcAb0UMa1+OhSatIBbrhw2qGadT1qX+oXDMQsQxKdWacVT0J+ZSQmQjg7kcQwhLfyBnxLXbBAjOYWkDUxXdQx0wWKo/Iz3T7EaFOt5QGAZ8H9g8+5/KRYimpFYd4yxF5S7A6FWiNqsc8G9bKCstDY/fY6jxdW6hfpp9OVOphbmFhfcGEhlF5THwAQkZ3nNbzWpv9fxS4aF8GcQ9SX4k2sEO
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5cec88-d8f7-4aac-e483-08d813203033
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 00:40:24.0114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I31L4trXqBueZOeWCn2WtzMlrnw4vZJD4Iy4M2kwQ3TAUklg1VKtuENuWbo2YnJEDJro4qX+2P2DyZu5ONnCbEaPeTFVTAEBiBeDotRNmM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB2009
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Yes, I did sent the patch again on mailing list and once the patch appeared=
, then only I sent reminder.

To begin with, this is what I think happened:
- Sent a patch to the list but somehow it failed
- without realizing that failure, I sent reminder for the failed one
https://lists.yoctoproject.org/g/meta-ti/message/12990
- you identified the problem and suggested to send it again
https://lists.yoctoproject.org/g/meta-ti/message/12991
- I did sent the patch again and it made it to mailing list
https://lists.yoctoproject.org/g/meta-ti/message/12992
- and then reminder for the successful sent patch
https://lists.yoctoproject.org/g/meta-ti/message/12993

I sent the patch again with the same subject, somehow it got merged in the =
same topic
and doesn't appear as a separate patch?
Should I do slight change in the subject so that it appears as a separate t=
opic in the list?

Not sure what's the best way to proceed here.

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Thursday, 18 June 2020 11:54 AM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Do you want me to send another patch?
> Maybe with an updated subject to differentiate?
>=20
> Let me know what's the best way to proceed

Have you considered what I said here:
https://lists.yoctoproject.org/g/meta-ti/topic/74828692


> Regards
> Ankur
>=20
> -----Original Message-----
> From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On =
Behalf Of Ankur Tyagi
> Sent: Tuesday, 16 June 2020 7:45 AM
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>=20
> Hi Denys,
>=20
> I did received your response and resent the patch.
> This is the reminder for the second patch.
>=20
> Regards
> Ankur
>=20
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Tuesday, 16 June 2020 7:42 AM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>=20
> On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >=20
> > Gentle reminder as this patch has been in the mailing list (#12992)=20
> > for some time now but I haven't heard anything.
>=20
> Is your subscription working properly? I did reply here:
> https://lists.yoctoproject.org/g/meta-ti/topic/74828692
>=20
>=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: Ankur Tyagi
> > Sent: Friday, 12 June 2020 10:49 AM
> > To: meta-ti@lists.yoctoproject.org
> > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak=20
> > assignment for uboot board config
> >=20
> > When using meta-ti BSP layer, user should be able to override default=20
> > uboot board config with their custom board config as it is common for=20
> > customers to design custom board based upon am335x-evm dev kit.
> >=20
> > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > ---
> >  conf/machine/include/ti33x.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/conf/machine/include/ti33x.inc=20
> > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \  KERNEL_DEVICETREE +=3D=20
> > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pr=
u-excl-uio.dtb', '', d)}"
> > =20
> >  UBOOT_ARCH =3D "arm"
> > -UBOOT_MACHINE =3D "am335x_evm_config"
> > +UBOOT_MACHINE ?=3D "am335x_evm_config"
> > =20
> >  UBOOT_ENTRYPOINT =3D "0x80008000"
> >  UBOOT_LOADADDRESS =3D "0x80008000"
> > --
> > 2.17.1
> >=20
