Received: from AUS01-ME1-obe.outbound.protection.outlook.com (AUS01-ME1-obe.outbound.protection.outlook.com [40.107.136.124])
 by mx.groups.io with SMTP id smtpd.web12.244.1592452487114663696
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 20:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=SdibtKIU;
 spf=pass (domain: gallagher.com, ip: 40.107.136.124, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7iNMYiQrxB9F7fTteINj65weI6zzoG6iLMECTPsFsykC/6dC1Y0DCx0FSlehb7NIwPWinI128M8DpcIUau86k2sdsdJYbJcvwUWvUw4X3kHChZKtS7TNNSJXiDxQObtVm9yR8ma6YQ6DD9rXvjJpiPR9/eib8SSR1eHsbCGdrdrtOT1H94PCAVUTuPLOEJPogqEgSwxpXlaF8QOba/u9LoLTSEyhNgRl7p+H+knmuofRBZm7KMXuqEq3/e4qO96OShqPeZssYpIlatNoo0sHxcU4i3uAPTudogKwfVgHA++5yzyJ1vrpM3IhmhTCG97HaRqpLxzy24OLSIgyl3A6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SwGyv+refsehrrJSoZCmu2KUFRRo9yH9NSKtfMewKA=;
 b=be4fK6+O7FV/cQqfMRaqzMKLELICqzRa0iCD3whc2biaK2B6NZRf8EF1xZhPebv/UU9vDx+hUhnPIlQUZKjkOAmDbam8OWXqYl0zqUFB17tv68h3sgFww2shHFmA1r9JUzFqv9BGAEgLlkqW5O3asyW2GPSJ8uwdiQtfQXva/YUKzkG89aKzLxep0vK8RBzJh3yFnyLOYycEYkPj0RTDZ5QTkWPQx6cu2m7FffmmEEqKSpUXFoElwvZcFdBtvlSiqn+Wv4zIJox2nWLISLNLfpMaRt6Kr5Ikr17lS+O08nlynbgll8UdT2UX7ZNP4OQ7DMHjgLLUobuyB840MQ0HGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SwGyv+refsehrrJSoZCmu2KUFRRo9yH9NSKtfMewKA=;
 b=SdibtKIUmZ9zMSICBHcPzMfqa//feR1ePp0X4pJu/SN/bvPWWUb+fBe8o1ipQ5mfRC69PyCKrftHOOFjuaFTuzdWDzwnmFR/BUb1swmaNDRArsjdX2MubkSIxHUPZKpec2iWeAdcKiHYeFFAaLQQRMUGs/CWZ2svLe2IypxAgxo=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
 SY3PR01MB0986.ausprd01.prod.outlook.com (2603:10c6:0:3::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.22; Thu, 18 Jun 2020 03:54:43 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 03:54:43 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: 
 AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0ggAHTYDCAAZdIgIAACpPwgAANYACAAClrwA==
Date: Thu, 18 Jun 2020 03:54:42 +0000
Message-ID: 
 <SY3PR01MB0809C68DD3E9379CA0A8EE39E59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200617235343.GA9923@beryl>
 <SY3PR01MB08097CC6172881D8261275DCE59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200618011926.GB9923@beryl>
In-Reply-To: <20200618011926.GB9923@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2b2916d-63b8-4c25-34bb-08d8133b556f
x-ms-traffictypediagnostic: SY3PR01MB0986:
x-microsoft-antispam-prvs: 
 <SY3PR01MB0986F6F7ABA51B48592307F6E59B0@SY3PR01MB0986.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g8cmyKKm1JIzA6SEsydZjgBflsfx8OLxTj8AS6+s9ZYoFPshdPZpaYacizgLKxDGx9LraCxpBKIVCVXmHkmn31SO1CLWZNMyl2qfBL5Q71Ad4W6Gc6/k58sPv6PZWeVjR5GbI8K6k+vW+5B64+hE3tn8pZ6mnuCaHXseDePXJpL6MvIvpymW29laaeCGIibVNfckcgVU01Bvp+fsjryppIv44pBETem5bCMy1CTI8qI9TmyEPlnEAAAlenn/6AcRHRBohWTx6DhIVlRF+Gp5rsiyTN2IE7pAMvr88yvMu3UVrVInAonrTJlLeJjoSYQn8IWqu4H5CxY1yX39fCEzGsP+WImIJzELwd/ZjRirtooOYTI4spM0XF/BYAzpybozsJkvvq0FIHszha0MbFtwfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB0809.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(478600001)(66556008)(66946007)(66476007)(64756008)(66446008)(4326008)(76116006)(55016002)(966005)(316002)(33656002)(71200400001)(9686003)(8936002)(52536014)(2906002)(83380400001)(26005)(186003)(6916009)(53546011)(8676002)(6506007)(86362001)(7696005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 iskyD7v/m1x1N7kosMPaEBRf3oJ1wQ93dVcsjD3S+EXgjg2hdchKJtieeg1gXlr6c4oy/gttBidp9CUHGQCL718pI2LY3J57Jl0KYlKV8vSY1A9Ec5Oo1yFDFe2F7DxJLBdxeeUlHjrqu2Zvv6Pw0At999OFplQnZyw3ezjAWQiNU1vAaFT2JactPwbttbyOjsgp9pw8esgRo82Z29RpSeyNsrFf0Os13jgzLNWxkaP/VzN1sF3SuHMDPcqmP8Z2WmN70ypNN6r2KeFrWPH9dPRTk7/wE6DvezZp/bU8HSC8dOLCEqAqhc5kK63QaTMBuewu4+M1LDfVCZHjwkKuwT+58knDtAzDonWICgvnv0DVYduMJ1H2xM+NxrUjRid+zFLyw2pTl3sT4/hiMEblwGOxfdb2N/5aPUjdGfr8BFOgYHkuzVljFF0tEevo+RAPB81RsNPkXjF46oKPN52Ixxx9HyrjM/ETlXhM7wgA1S6fQydWp8MtHbS9DgnWgrMh
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b2916d-63b8-4c25-34bb-08d8133b556f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 03:54:42.9375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDQZiBpPpsCDI4tgLl3cqZsy9NgoXxHNO5hXWf3BFUmluvLAPFzqLyKk2SGwdW0RJhs2adiCgnfpBdvOWgkVx0xLPo3Hs6YLTcDqW2Eo/2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB0986
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Apologies, my bad

> The idea is that if you are creating a custom board based on am335x-evm a=
nd=20
> adding new config to U-boot, you should consider adding a new OE machine.=
 Even=20
> if your machine includes ti33x.inc for common SoC definitions, you can st=
ill=20
> overwrite UBOOT_MACHINE in your <custom-machine>.conf file...

I did started with this idea but meta-arago has lot of "am335x-evm" machine=
 usage throughout.
That would mean to add new machine override in lot of meta-arago recipes.

Keeping a new board config in u-boot is desired to allow easy upgrading of =
u-boot from sitara-u-boot git repo.
Modifying am335x board specific in u-boot doesn't scale well.

Hence came up with this approach to allow uboot config override in bsp laye=
r but still use most of distro layer
as it is.

But I am open to new ideas/suggestions as well.

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Thursday, 18 June 2020 1:19 PM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

On Thu, Jun 18, 2020 at 12:40:23AM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Yes, I did sent the patch again on mailing list and once the patch appear=
ed,=20
> then only I sent reminder.
>=20
> To begin with, this is what I think happened:
> - Sent a patch to the list but somehow it failed
> - without realizing that failure, I sent reminder for the failed one
> https://lists.yoctoproject.org/g/meta-ti/message/12990
> - you identified the problem and suggested to send it again
> https://lists.yoctoproject.org/g/meta-ti/message/12991

And also there ^^^ I commented on feasibility of the change, which you seem=
 to=20
have missed...


> - I did sent the patch again and it made it to mailing list
> https://lists.yoctoproject.org/g/meta-ti/message/12992
> - and then reminder for the successful sent patch
> https://lists.yoctoproject.org/g/meta-ti/message/12993
>=20
> I sent the patch again with the same subject, somehow it got merged in th=
e same topic
> and doesn't appear as a separate patch?
> Should I do slight change in the subject so that it appears as a separate=
 topic in the list?
>=20
> Not sure what's the best way to proceed here.
>=20
> Regards
> Ankur
>=20
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>=20
> Sent: Thursday, 18 June 2020 11:54 AM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>=20
> On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >=20
> > Do you want me to send another patch?
> > Maybe with an updated subject to differentiate?
> >=20
> > Let me know what's the best way to proceed
>=20
> Have you considered what I said here:
> https://lists.yoctoproject.org/g/meta-ti/topic/74828692
>=20
>=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> O=
n Behalf Of Ankur Tyagi
> > Sent: Tuesday, 16 June 2020 7:45 AM
> > To: Denys Dmytriyenko <denys@ti.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assign=
ment for uboot board config
> >=20
> > Hi Denys,
> >=20
> > I did received your response and resent the patch.
> > This is the reminder for the second patch.
> >=20
> > Regards
> > Ankur
> >=20
> > -----Original Message-----
> > From: Denys Dmytriyenko <denys@ti.com>
> > Sent: Tuesday, 16 June 2020 7:42 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assign=
ment for uboot board config
> >=20
> > On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > > Hi Denys,
> > >=20
> > > Gentle reminder as this patch has been in the mailing list (#12992)=20
> > > for some time now but I haven't heard anything.
> >=20
> > Is your subscription working properly? I did reply here:
> > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> >=20
> >=20
> > > Regards
> > > Ankur
> > >=20
> > > -----Original Message-----
> > > From: Ankur Tyagi
> > > Sent: Friday, 12 June 2020 10:49 AM
> > > To: meta-ti@lists.yoctoproject.org
> > > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak=20
> > > assignment for uboot board config
> > >=20
> > > When using meta-ti BSP layer, user should be able to override default=
=20
> > > uboot board config with their custom board config as it is common for=
=20
> > > customers to design custom board based upon am335x-evm dev kit.
> > >=20
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > > ---
> > >  conf/machine/include/ti33x.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/conf/machine/include/ti33x.inc=20
> > > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > > --- a/conf/machine/include/ti33x.inc
> > > +++ b/conf/machine/include/ti33x.inc
> > > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \  KERNEL_DEVICETREE +=3D=20
> > > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-=
pru-excl-uio.dtb', '', d)}"
> > > =20
> > >  UBOOT_ARCH =3D "arm"
> > > -UBOOT_MACHINE =3D "am335x_evm_config"
> > > +UBOOT_MACHINE ?=3D "am335x_evm_config"
> > > =20
> > >  UBOOT_ENTRYPOINT =3D "0x80008000"
> > >  UBOOT_LOADADDRESS =3D "0x80008000"
> > > --
> > > 2.17.1
> > >=20
