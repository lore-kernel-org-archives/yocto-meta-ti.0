Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.94])
 by mx.groups.io with SMTP id smtpd.web12.22122.1593446717777297986
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 09:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=DzuuBYO4;
 spf=pass (domain: gallagher.com, ip: 40.107.137.94, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDq1T0yIBhOfFhxukHLnfZ4ixnSErMON0DugZ9P9eCHY2p3X18oKDG8TOmhX1X6fCx6RvYMBIbMdzFF4dJC/F0+5iWc6+d7Gi4r8S0RU8mXzfEibHxuhrJ3uzLYr+qsiRvj2cFRrqY1DkbTqGQIFbbNRW0TbGJapXT9GA4h16H/nbq7jnZ0ZdnsXF7c86R/D5QWZDxwBlYQ+2YACJE56fqcwEu68DvPXDdV4O1IV5HYg1zRu2EKHbTVj4aCcIUhXSdPnZ694TeWN2vBRizqT0SDMq7TyeKVVbRYrMPgT/XYYaYvSB7kNOB/GKfDWPAtQ7naziY40MRcGmNitYT51MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFnK5Txv/6Q6gm7R4PM8gzJX3Mid5jdBxaCF5wLtz58=;
 b=eoVGOCVSM9J+ITKQbs6Ohi68dvr8uOW03MwZLZ0mqKThmUfvbYqmS36tajDPv/7XtuQ7UebSVR8b++nc3iFHkCzRLJLDCdILWrgoWpWzfjWwj+s7NQgkmkmKvXlCOcUAMEQsw9HkMp5E7WWhDM3tglF8ACGZl4tL5BFLdhpkaHJmG/tc2PvT9ExRXw+fHSdPiIqKG+KH+r9eIy5iF1GeDlJyREGqpitWHjKidTNRRYYngoVpUVSNF0CJiM8fnPIpRW0KpTOXo/0HObsEuko/mHrOelDQLgfXD8oMHXv7E/H2tmWudwB+sk65qAJ8cEcLSwymSBZ7uyaOJPtDFIe90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFnK5Txv/6Q6gm7R4PM8gzJX3Mid5jdBxaCF5wLtz58=;
 b=DzuuBYO4K41kQJzN2nXlVGJjBGDitph5yDgMmr7gvEXEa8l84MMaPa9NeqzCpEwnJXHbLQ5qCJu6cVvlYON00CdDzVHZC8owroxR8rpZ8nnYhiz6bjYsKmk4ZNEId9fvL6s4VV0ecmuJGvXMR5Mhql010aFKL0/ZSmdrNQTiCKg=
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com (2603:10c6:0:20::22) by
 SYCPR01MB3327.ausprd01.prod.outlook.com (2603:10c6:10:b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.24; Mon, 29 Jun 2020 16:05:13 +0000
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com
 ([fe80::835:455c:1cc5:2a48]) by SY3PR01MB1931.ausprd01.prod.outlook.com
 ([fe80::835:455c:1cc5:2a48%5]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 16:05:13 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: 
 AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0ggAHTYDCAAZdIgIAACpPwgAANYACAAClrwIASF11A
Date: Mon, 29 Jun 2020 16:05:13 +0000
Message-ID: 
 <SY3PR01MB19310CF89A41E9466FE17146E56E0@SY3PR01MB1931.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200617235343.GA9923@beryl>
 <SY3PR01MB08097CC6172881D8261275DCE59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200618011926.GB9923@beryl> <1619871A2E16E3B4.23753@lists.yoctoproject.org>
In-Reply-To: <1619871A2E16E3B4.23753@lists.yoctoproject.org>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2396d93c-6d85-4fbb-5360-08d81c463500
x-ms-traffictypediagnostic: SYCPR01MB3327:
x-microsoft-antispam-prvs: 
 <SYCPR01MB3327F837DCEACCAB4BE69EB6E56E0@SYCPR01MB3327.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jSCRZJS+hPSd5FhySqKGCw5aulePNKlMyeL6oXn4npH40+fAMu1Je7Xy3W/M9GwpNYR5kUjhSGdACz6WncCqrDOQJX4mkiajKPLXun9Vd4YYLDbigMZywKm5zR+COh14DX86vYhO7fucA3/ZXYcORv0DmDS61AeJG+2KMMQuj19TE6Bn437d6O5OvwJZscOjNeYSfCds0Mpp+LGg8Aug1/Kjdw1nPAX3nX7WqsRN4wcTN19keB1ePlWlMU5Mbzj7a1K/HO3b9RRwYpX33u4AuoI8tp6uJj1KCU1ts5GY1pWTscvCqnejbLPtZZUWY6BLbdETx8AObdfimWM7XR0VIiAmP2rG7+jPmsWI9yKKGvw7qRmCPUQsMyzzaLysB3NYIRjJ4faOIg2uVKHGQPP5EA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB1931.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(8936002)(478600001)(52536014)(26005)(186003)(6506007)(5660300002)(4326008)(316002)(6916009)(53546011)(7696005)(71200400001)(66556008)(2906002)(966005)(33656002)(55016002)(66476007)(86362001)(9686003)(76116006)(64756008)(66946007)(8676002)(66446008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 nZ/LT6O1r1Dhl24+Aku9qyr8gFyGLmMQQ3hsiqCpCkQgYbXTnge8y3V9gdergn15kMmkbpdla0xbaIk4OeN0+sVoapFqEz9Z+Cxr/C2Q8V3WrhgaLULNBM++uXKGVzq6jK9IZ87ysDkikPB1meyWBnAoYkatbjxebtq3TzTuZtTEL+0WBE7NTbNjk5CnlRWae9zFdozK4DZbG34n4B/KS0jHXAU3/NdzowTtZ98p9aakRxPV1ZCQHJO8Wzw01YEIaUQYiwWAhjnAtsd6uEIm0hz7ZwDUWF2n2OxEbETqqZvW8HMMwF/lo9X330dAxDL6cpe2X/tr0oDLuKTqfU6LTxe4F8XnJv06KBQeWuGlh5zqFBh+63GvkVzrqofc1NXTOW+LWxRVJavmvCyzGnVAq1dlH30T+LwWLMqaQtX8L/vmvVIi3pFOK1HqB0vpEycd2xKx0gDyMj16KXbv72HqEoeWSVG/LXlaizA0MX6HISFmVOrHC8pHCS7Ii7w70m1J
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY3PR01MB1931.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2396d93c-6d85-4fbb-5360-08d81c463500
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 16:05:13.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1H8xG2VRf3kADmEYu4sui0S1AtqMTeFHyKrT8fTLt9zjiWcuv4MNe/QaUOpaYMIdkC85wINBG6mAb+IKB1/Mmo0bEQeAAbUMqu3dO7Mg0oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB3327
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Didn't got your feedback so does that mean my reason doesn't stack up?

Regards
Ankur

-----Original Message-----
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Ankur Tyagi
Sent: Thursday, 18 June 2020 3:55 PM
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

Apologies, my bad

> The idea is that if you are creating a custom board based on am335x-evm a=
nd
> adding new config to U-boot, you should consider adding a new OE machine.=
 Even
> if your machine includes ti33x.inc for common SoC definitions, you can st=
ill
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
From: Denys Dmytriyenko <denys@ti.com>
Sent: Thursday, 18 June 2020 1:19 PM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

On Thu, Jun 18, 2020 at 12:40:23AM +0000, Ankur Tyagi wrote:
> Hi Denys,
>
> Yes, I did sent the patch again on mailing list and once the patch appear=
ed,
> then only I sent reminder.
>
> To begin with, this is what I think happened:
> - Sent a patch to the list but somehow it failed
> - without realizing that failure, I sent reminder for the failed one
> https://lists.yoctoproject.org/g/meta-ti/message/12990
> - you identified the problem and suggested to send it again
> https://lists.yoctoproject.org/g/meta-ti/message/12991

And also there ^^^ I commented on feasibility of the change, which you seem=
 to
have missed...


> - I did sent the patch again and it made it to mailing list
> https://lists.yoctoproject.org/g/meta-ti/message/12992
> - and then reminder for the successful sent patch
> https://lists.yoctoproject.org/g/meta-ti/message/12993
>
> I sent the patch again with the same subject, somehow it got merged in th=
e same topic
> and doesn't appear as a separate patch?
> Should I do slight change in the subject so that it appears as a separate=
 topic in the list?
>
> Not sure what's the best way to proceed here.
>
> Regards
> Ankur
>
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Thursday, 18 June 2020 11:54 AM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>
> On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >
> > Do you want me to send another patch?
> > Maybe with an updated subject to differentiate?
> >
> > Let me know what's the best way to proceed
>
> Have you considered what I said here:
> https://lists.yoctoproject.org/g/meta-ti/topic/74828692
>
>
> > Regards
> > Ankur
> >
> > -----Original Message-----
> > From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> O=
n Behalf Of Ankur Tyagi
> > Sent: Tuesday, 16 June 2020 7:45 AM
> > To: Denys Dmytriyenko <denys@ti.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assign=
ment for uboot board config
> >
> > Hi Denys,
> >
> > I did received your response and resent the patch.
> > This is the reminder for the second patch.
> >
> > Regards
> > Ankur
> >
> > -----Original Message-----
> > From: Denys Dmytriyenko <denys@ti.com>
> > Sent: Tuesday, 16 June 2020 7:42 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assign=
ment for uboot board config
> >
> > On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > > Hi Denys,
> > >
> > > Gentle reminder as this patch has been in the mailing list (#12992)
> > > for some time now but I haven't heard anything.
> >
> > Is your subscription working properly? I did reply here:
> > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> >
> >
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: Ankur Tyagi
> > > Sent: Friday, 12 June 2020 10:49 AM
> > > To: meta-ti@lists.yoctoproject.org
> > > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak
> > > assignment for uboot board config
> > >
> > > When using meta-ti BSP layer, user should be able to override default
> > > uboot board config with their custom board config as it is common for
> > > customers to design custom board based upon am335x-evm dev kit.
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > > ---
> > >  conf/machine/include/ti33x.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/conf/machine/include/ti33x.inc
> > > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > > --- a/conf/machine/include/ti33x.inc
> > > +++ b/conf/machine/include/ti33x.inc
> > > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \  KERNEL_DEVICETREE +=3D
> > > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-=
pru-excl-uio.dtb', '', d)}"
> > >
> > >  UBOOT_ARCH =3D "arm"
> > > -UBOOT_MACHINE =3D "am335x_evm_config"
> > > +UBOOT_MACHINE ?=3D "am335x_evm_config"
> > >
> > >  UBOOT_ENTRYPOINT =3D "0x80008000"
> > >  UBOOT_LOADADDRESS =3D "0x80008000"
> > > --
> > > 2.17.1
> > >
________________________________
 This email is confidential and may contain information subject to legal pr=
ivilege. If you are not the intended recipient please advise us of our erro=
r by return e-mail then delete this email and any attached files. You may n=
ot copy, disclose or use the contents in any way. The views expressed in th=
is email may not be those of Gallagher Group Ltd or subsidiary companies th=
ereof.
________________________________
