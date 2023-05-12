Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF21DC77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 05:44:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.17507.1683870271020697729
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 22:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aVbBLJ4M;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34C5iRF7103034;
	Fri, 12 May 2023 00:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683870267;
	bh=agqH02PrDuuIR+WHX0xYuWbuUhxOy9zS9w4lH/kwp5I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aVbBLJ4Mg0BPNdwpyzu0WF9KQlruuVk2XzX5nZzwCuXBpT7/8gyhi0ZP6UYODYCAd
	 DhI3neyQVoyRCy2jI8xnNu+5pPHUuEWR00CSjH7saQXbBra6y2i6mSfeMy98vRrZsf
	 TV5rrLyuvSBxY/M8kJ9JU36YpqbhaLW1oXGT1Lqk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34C5iRq0022747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 May 2023 00:44:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 May 2023 00:44:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 May 2023 00:44:26 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34C5iQ7T118453;
	Fri, 12 May 2023 00:44:26 -0500
Date: Fri, 12 May 2023 11:14:25 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Ricardo Salveti <ricardo@foundries.io>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar
	<u-kumar1@ti.com>,
        Andrew Davis <afd@ti.com>, Kamlesh Gurudasani
	<kamlesh@ti.com>
Subject: Re: [meta-ti][master/kirkstone][RFC PATCH] conf: machine: include:
 k3 enable fit signing for uboot
Message-ID: <20230512054425.wkpydyi6cqgufvmf@ula0497581>
References: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
 <20230511154739.GZ9226@denix.org>
 <CAAaKDhGanojzgOsA3Bz4OJmqVQpLD_Jnns6C+jpryDt+DbpXFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAAaKDhGanojzgOsA3Bz4OJmqVQpLD_Jnns6C+jpryDt+DbpXFA@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 34C5iRF7103034
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 May 2023 05:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16527

On 13:20-20230511, Ricardo Salveti wrote:
> On Thu, May 11, 2023 at 12:48=E2=80=AFPM Denys Dmytriyenko <denis@denix=
.org> wrote:
> >
> > On Thu, May 11, 2023 at 11:54:00AM +0530, Manorit Chawdhry via lists.=
yoctoproject.org wrote:
> > > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > > ---
> > > To: Ryan Eatmon <reatmon@ti.com>
> > > To: Denys Dmytriyenko <denys@ti.com>
> > > Cc: meta-ti@lists.yoctoproject.org
> > > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > > Cc: Praneeth Bajjuri <praneeth@ti.com>
> > > Cc: Udit Kumar <u-kumar1@ti.com>
> > > Cc: Andrew Davis <afd@ti.com>
> > > Cc: Kamlesh Gurudasani <kamlesh@ti.com>
> > > ---
> > >  meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/=
conf/machine/include/k3.inc
> > > index fff1550564b3..ab7e45a8016f 100644
> > > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > > @@ -31,6 +31,12 @@ SPL_BINARY =3D "tispl.bin"
> > >  SPL_BINARYNAME =3D "tispl.bin"
> > >  UBOOT_SUFFIX =3D "img"
> > >
> > > +UBOOT_SIGN_ENABLE =3D "1"
> > > +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> > > +UBOOT_SIGN_KEYNAME =3D "uboot_signing_dev_key"
> > > +UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/u-boot-keys"
> >
> > How are the keys get into there? Are there extra docs/instructions?
>=20
> FIT_GENERATE_KEYS set to 1 forces the key to be automatically
> generated by openembedded-core/meta/classes/uboot-sign.bbclass, so
> they are created during build time.
>=20

Sure, would update the same, thanks!

Regards,
Manorit

> Cheers,
> --=20
> Ricardo Salveti

