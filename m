Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF4EC282D0
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 18:34:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1601.1740767689002861561
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 10:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Tt0bYskm;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: bb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SIYkMC2720086
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 12:34:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740767686;
	bh=1oy0lV4iVPegf/NmSmGRei0qGRAkVSfapYN2AxNhAdc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Tt0bYskmBG/2z6Bgu1JQJruJifn0gQhiSRFtG5w+ro4hsPssZPTgWJfooA8yoepJo
	 Yrf+cznLVwrE7i+5JVfsUy1KtHijxkj3n0n16I4Au1V0xWMQ2WjdFS/ehx37atqAJA
	 bDs+6ECUzA/0n1hnRLwh60SbkBV9vImpNQH0KMJ8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51SIYkLm003421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 12:34:46 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 12:34:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 12:34:45 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SIYjw3050920;
	Fri, 28 Feb 2025 12:34:45 -0600
Date: Fri, 28 Feb 2025 12:34:45 -0600
From: Bryan Brattlof <bb@ti.com>
To: Jon Cormier <jcormier@criticallink.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Meta-TI <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH master/scarthgap] conf: machine: k3: disable
 all fit signing for uboot
Message-ID: <20250228183445.d2zrg27xlrb6zjgu@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250228-uboot-cleanup-v1-1-3f7d3f2a4ee2@ti.com>
 <CADL8D3bcRNpg2TqsgMzW9nvUBp+FTfxzbNgOer9+4J6GGzmSuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CADL8D3bcRNpg2TqsgMzW9nvUBp+FTfxzbNgOer9+4J6GGzmSuQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 51SIYkMC2720086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 18:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18343

On February 28, 2025 thus sayeth Jon Cormier:
> On Fri, Feb 28, 2025 at 1:12=E2=80=AFPM Bryan Brattlof via
> lists.yoctoproject.org <bb=3Dti.com@lists.yoctoproject.org> wrote:
> >
> > All K3 SoCs utilize the binman packaging tools in U-Boot to package
> > and sign the different boot firmware components needed to boot the
> > various security variants of K3 platform. Disable UBOOT_SIGN_ENABLE
> > to simplify the build
> Are you trying to say that because binman does the signing, the
> UBOOT_SIGN_ENABLE isn't needed?  Or does removing UBOOT_SIGN_ENABLE
> disable the binman signing?

Hey! yep because binman is signing these binaries during the=20
do_compile() step we do not need the UBOOT_SIGN_ENABLE here

~Bryan

> >
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  meta-ti-bsp/conf/machine/include/k3.inc | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/co=
nf/machine/include/k3.inc
> > index dd3cbecab3d51..b98b45802bc76 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -25,10 +25,6 @@ SPL_BINARY =3D "tispl.bin"
> >  SPL_BINARYNAME =3D "tispl.bin"
> >  UBOOT_SUFFIX =3D "img"
> >
> > -UBOOT_SIGN_ENABLE =3D "1"
> > -UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> > -UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> > -UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
> >  FIT_HASH_ALG ?=3D "sha512"
> >  FIT_SIGN_ALG ?=3D "rsa4096"
> >
> >
> > ---
> > base-commit: c3d050c2c9db34e250b4b61e90a67bacbfa45066
> > change-id: 20250228-uboot-cleanup-35cb26c61905
> >
> > Best regards,
> > --
> > Bryan Brattlof <bb@ti.com>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18341): https://lists.yoctoproject.org/g/meta-ti/=
message/18341
> > Mute This Topic: https://lists.yoctoproject.org/mt/111439202/7902621
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier=
@criticallink.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --=20
> Jonathan Cormier
> Senior Software Engineer
>=20
> Voice:  315.425.4045 x222
>=20
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>=20

