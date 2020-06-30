Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.128])
 by mx.groups.io with SMTP id smtpd.web10.5612.1593478523795616574
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 17:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=BjdbWd35;
 spf=pass (domain: gallagher.com, ip: 40.107.137.128, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBNhLxdOlAD3WGUnNuFUtCivAatTIXagHV7kUX49/k3fvfwsc+EhLf98X0h/RE6VS9hsoq/OqyuFUGNAyCSzSOJUx83GxK8lJJywHIxYVxSASgPFvrKqVIVCnCbJB3nWNjv3LMsnCYpa+7uLZOeXefaBp8ExXFe7mZDTUWCexxSsyu6b2dLtpYDMwB/gD6roKnTp6+4b1bed15NPPMGUqAKqpxOrWXgR7k9+lZBhglo0IOmcqrI62mXOmz/ytbO5omBLha9PTMzqjUsfrScb2mS4rc2pO88cp+yujpkMUWoCW19HYESmcSm+PXDUMrMa7K/n8ZAxsmN6xF5wiNStQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaGiUrU+6SE1Zq9ZlfTw3z3znxemGHm7t6R6TvTcYps=;
 b=KXcji8U+FaKjTOBi3xyjWR8EJ+R3AHTrECobIDcfDXiPGwrJPizDXVVfIep0Y/KgKGh3yljtr/EwsbgzqiNLaiGM1zZuR+xwgsNczrZglmIKz6J4dloq5fIwtcYuIJQ1lA5oHnyV1CrUUc+in9QIKXc6yRWoGRdfv4fVXNmzqNlzBgvXv4fs6nKFil36523nEv9EcRpsgrQ3eYoggU7RnvjisCGc03A6G4xHtz+FeaPhnxakwvebJo0qjyU9Z/213onYCOfLDIF8F/5xOZfdduLmAaHgrBNNfpcG0gKx4VLrUlzrUbcT4LyUrCZULwlFbLUPeQN/8+8x4ewgjr6Ovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaGiUrU+6SE1Zq9ZlfTw3z3znxemGHm7t6R6TvTcYps=;
 b=BjdbWd35PpPORidkaVYJYf+5BEiFSbkCJVfcvmxLlykXAKg0f6KBInsONIchjtjptCIgf2F1nSo2R1UCxY9LGPCB5XaRTOnaLqMFQxfjzgTu2huP5KmBQSx6SBovYUP/1DcwqVdifeCupE9x+NjxY7AzEIbtjQ852mS/0KNAW3Q=
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com (2603:10c6:0:20::22) by
 SYAPR01MB3119.ausprd01.prod.outlook.com (2603:10c6:1:3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Tue, 30 Jun 2020 00:55:20 +0000
Received: from SY3PR01MB1931.ausprd01.prod.outlook.com
 ([fe80::835:455c:1cc5:2a48]) by SY3PR01MB1931.ausprd01.prod.outlook.com
 ([fe80::835:455c:1cc5:2a48%5]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 00:55:20 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: 
 AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsCAAAJPgIAAAG0ggAHTYDCAAZdIgIAACpPwgAANYACAAClrwIASF11AgABYrgCAADmDkA==
Date: Tue, 30 Jun 2020 00:55:13 +0000
Message-ID: 
 <SY3PR01MB193181450A98C5800E3FC1D0E56F0@SY3PR01MB1931.ausprd01.prod.outlook.com>
References: 
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200617235343.GA9923@beryl>
 <SY3PR01MB08097CC6172881D8261275DCE59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200618011926.GB9923@beryl> <1619871A2E16E3B4.23753@lists.yoctoproject.org>
 <SY3PR01MB19310CF89A41E9466FE17146E56E0@SY3PR01MB1931.ausprd01.prod.outlook.com>
 <20200629212122.GB6525@beryl>
In-Reply-To: <20200629212122.GB6525@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70425b50-db84-4d85-9800-08d81c90437d
x-ms-traffictypediagnostic: SYAPR01MB3119:
x-microsoft-antispam-prvs: 
 <SYAPR01MB3119D2B41D5B12BD2656DC11E56F0@SYAPR01MB3119.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bIrQL9IFLABMmuxxyobDnk0gbHh4dZO+gltVJ7t5nzPpQOMAGH0BEIIA/YuUtro1OzijR0L2PLrrS7mh7wwOAGwO9BEG0QN+/f2dPzDjcvYpOjbGB2o7+piYYTIwb9xUDtsnX7XpCagEiA+DTDe6T4hz7Bs5t4l9CsFOf/cX/pYalXaMPTyfdnrwRlssLEsIXO21s3T3uaQaV6MeRUMIpnUPl2W7x/A2bg/JeuwVRLjvyd/MOCxsMPDlQvJMxzphGZK0jUbWrVThKFeGgG7rx7csER/YnblFWmPHxbHnS06Jb5GRrRdh2E1IYJ7MZcAoVUErjBdz2ekVj1ZgPr9rgKjXMZ3NKkjIz78XBmrylFuq6a7CZHov6Lbrw5z9AtdGZ/IoItoupAUzSFHJ5oeqEg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB1931.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39850400004)(76116006)(966005)(52536014)(66446008)(71200400001)(2906002)(6506007)(66556008)(4326008)(6916009)(66476007)(478600001)(64756008)(66946007)(6666004)(83380400001)(8676002)(53546011)(8936002)(86362001)(186003)(33656002)(7696005)(55016002)(9686003)(26005)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 WYb5siKUdvGzSGStGVuleDuJPFAIDdo2kLIDuYNuDWRBPUI3zKguVUvB1uOAQdLFBDaczWTpkvw8kerzbVXSRbiyWj6gd302SW8LidZyhoG1buGxjm4ONMOh0J69K/8lxt2O8gXl28gjFKiQDyKbExV57fXJqzGPpTogPzRMov2dcBwUYxavWgZupAiftKz5StHg83Y7ty3nx5pb0aRM1fOFLpI487ziOB6dnZSzw1eCOvmo9zgvn6PpLIbDCnm94ItKZdPZ5WMQ9SNLrangd+xJITRrhU2NoaTnPIpYVSVvSqMk2inFRWpsRS0nbLhNRR8FV5pMLJNHCOJ/zE3g46nyrRrwmWkwf36ni1XCkecN0DwJtJvqvS+0NdfjZANnaQkuprr4KLwgeYK8T5MkzBzUD8vZ/abf41gf9ocdroo5qquKaR2S8UElOzcbrSTz5vUq6fPuSMvMAjXGHqRDVSz0YmVQ5/3xiJrU0nQBuYNITUWOyGgoYgDmzOQROqWr
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY3PR01MB1931.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70425b50-db84-4d85-9800-08d81c90437d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 00:55:13.9697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGx+XAdLQWib1JINg/ddL2OzviZj042CDa/KUa/aY1f23niTN64p8KubPiQZjAjd8fb0D4Z5GNhFFQu907AAucDC8grhXSfbFOsD+W6PFWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYAPR01MB3119
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

meta-arago seems good now (dunfell), not much usage of am335x-evm

./meta-arago-distro/conf/distro/include/branding-amsdk.inc
./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-add=
ons.bb
./meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.=
1.28.bb
./meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.=
bb

My response was biased with previous (old)branches experience.

I had another look in meta-ti machines and I think I should follow the patt=
ern
used in am335x-hs-evm.conf.

This way I can add my board conf that can reside with default machine conf'=
s
What is your opinion about it?

Regards
Ankur

-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com>=20
Sent: Tuesday, 30 June 2020 9:21 AM
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment=
 for uboot board config

Sorry, was away for a bit. Can you please identify where in meta-arago=20
"am335x-evm" machine is used directly where it should be "ti33x" family=20
instead? Or you can send patches to fix those places. Thanks.

--=20
Denys


On Mon, Jun 29, 2020 at 04:05:13PM +0000, Ankur Tyagi wrote:
> Hi Denys,
>=20
> Didn't got your feedback so does that mean my reason doesn't stack up?
>=20
> Regards
> Ankur
>=20
> -----Original Message-----
> From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On =
Behalf Of Ankur Tyagi
> Sent: Thursday, 18 June 2020 3:55 PM
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>=20
> Apologies, my bad
>=20
> > The idea is that if you are creating a custom board based on am335x-evm=
 and
> > adding new config to U-boot, you should consider adding a new OE machin=
e. Even
> > if your machine includes ti33x.inc for common SoC definitions, you can =
still
> > overwrite UBOOT_MACHINE in your <custom-machine>.conf file...
>=20
> I did started with this idea but meta-arago has lot of "am335x-evm" machi=
ne usage throughout.
> That would mean to add new machine override in lot of meta-arago recipes.
>=20
> Keeping a new board config in u-boot is desired to allow easy upgrading o=
f u-boot from sitara-u-boot git repo.
> Modifying am335x board specific in u-boot doesn't scale well.
>=20
> Hence came up with this approach to allow uboot config override in bsp la=
yer but still use most of distro layer
> as it is.
>=20
> But I am open to new ideas/suggestions as well.
>=20
> Regards
> Ankur
>=20
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Thursday, 18 June 2020 1:19 PM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignme=
nt for uboot board config
>=20
> On Thu, Jun 18, 2020 at 12:40:23AM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >
> > Yes, I did sent the patch again on mailing list and once the patch appe=
ared,
> > then only I sent reminder.
> >
> > To begin with, this is what I think happened:
> > - Sent a patch to the list but somehow it failed
> > - without realizing that failure, I sent reminder for the failed one
> > https://lists.yoctoproject.org/g/meta-ti/message/12990
> > - you identified the problem and suggested to send it again
> > https://lists.yoctoproject.org/g/meta-ti/message/12991
>=20
> And also there ^^^ I commented on feasibility of the change, which you se=
em to
> have missed...
>=20
>=20
> > - I did sent the patch again and it made it to mailing list
> > https://lists.yoctoproject.org/g/meta-ti/message/12992
> > - and then reminder for the successful sent patch
> > https://lists.yoctoproject.org/g/meta-ti/message/12993
> >
> > I sent the patch again with the same subject, somehow it got merged in =
the same topic
> > and doesn't appear as a separate patch?
> > Should I do slight change in the subject so that it appears as a separa=
te topic in the list?
> >
> > Not sure what's the best way to proceed here.
> >
> > Regards
> > Ankur
> >
> > -----Original Message-----
> > From: Denys Dmytriyenko <denys@ti.com>
> > Sent: Thursday, 18 June 2020 11:54 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assign=
ment for uboot board config
> >
> > On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> > > Hi Denys,
> > >
> > > Do you want me to send another patch?
> > > Maybe with an updated subject to differentiate?
> > >
> > > Let me know what's the best way to proceed
> >
> > Have you considered what I said here:
> > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> >
> >
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org>=
 On Behalf Of Ankur Tyagi
> > > Sent: Tuesday, 16 June 2020 7:45 AM
> > > To: Denys Dmytriyenko <denys@ti.com>
> > > Cc: meta-ti@lists.yoctoproject.org
> > > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assi=
gnment for uboot board config
> > >
> > > Hi Denys,
> > >
> > > I did received your response and resent the patch.
> > > This is the reminder for the second patch.
> > >
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > Sent: Tuesday, 16 June 2020 7:42 AM
> > > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > > Cc: meta-ti@lists.yoctoproject.org
> > > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assi=
gnment for uboot board config
> > >
> > > On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > > > Hi Denys,
> > > >
> > > > Gentle reminder as this patch has been in the mailing list (#12992)
> > > > for some time now but I haven't heard anything.
> > >
> > > Is your subscription working properly? I did reply here:
> > > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> > >
> > >
> > > > Regards
> > > > Ankur
> > > >
> > > > -----Original Message-----
> > > > From: Ankur Tyagi
> > > > Sent: Friday, 12 June 2020 10:49 AM
> > > > To: meta-ti@lists.yoctoproject.org
> > > > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak
> > > > assignment for uboot board config
> > > >
> > > > When using meta-ti BSP layer, user should be able to override defau=
lt
> > > > uboot board config with their custom board config as it is common f=
or
> > > > customers to design custom board based upon am335x-evm dev kit.
> > > >
> > > > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > > > ---
> > > >  conf/machine/include/ti33x.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/conf/machine/include/ti33x.inc
> > > > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > > > --- a/conf/machine/include/ti33x.inc
> > > > +++ b/conf/machine/include/ti33x.inc
> > > > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \  KERNEL_DEVICETREE +=3D
> > > > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev=
2-pru-excl-uio.dtb', '', d)}"
> > > >
> > > >  UBOOT_ARCH =3D "arm"
> > > > -UBOOT_MACHINE =3D "am335x_evm_config"
> > > > +UBOOT_MACHINE ?=3D "am335x_evm_config"
> > > >
> > > >  UBOOT_ENTRYPOINT =3D "0x80008000"
> > > >  UBOOT_LOADADDRESS =3D "0x80008000"
> > > > --
> > > > 2.17.1
> > > >
> ________________________________
>  This email is confidential and may contain information subject to legal =
privilege. If you are not the intended recipient please advise us of our er=
ror by return e-mail then delete this email and any attached files. You may=
 not copy, disclose or use the contents in any way. The views expressed in =
this email may not be those of Gallagher Group Ltd or subsidiary companies =
thereof.
> ________________________________
