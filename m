Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CFCEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 04:47:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11265.1686804470303126103
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 21:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Le6b/Nxi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35F4ll3f085571;
	Wed, 14 Jun 2023 23:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686804467;
	bh=a8mpwXngesjApp2Za9gFiKa2waw7Qz/woEDuzKu9YhI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Le6b/NxiDz3IoSUwBBRRYtl+LABZm42B55ykZK+ZSd77uJQW/y3+V5S74I9WrcAAa
	 zUNTs8K2pvzIXD25CMujYwoZzNS1HdKP4g96bCAc9/uKoCtZRLXlwZ97Ty0obKtIIh
	 2kb7WQOXhzXL19AMicwqm79uV/KoRPRZ17hi63Q8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35F4lllB026038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 23:47:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 23:47:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 23:47:47 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35F4lkdQ019784;
	Wed, 14 Jun 2023 23:47:46 -0500
Date: Thu, 15 Jun 2023 10:17:45 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Ricardo Salveti <ricardo@foundries.io>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: include: k3
 enable fit signing for uboot
Message-ID: <20230615044745.qu7rxapm2x5ykeq2@ula0497581>
References: <20230613-b4-internal-core-secdev-fit-v1-1-c344639b5be1@ti.com>
 <CAAaKDhEHSsRE7rY75-Db7_eFfjfHmrA4awJXgpj0QW6Q2WWCgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAAaKDhEHSsRE7rY75-Db7_eFfjfHmrA4awJXgpj0QW6Q2WWCgQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35F4ll3f085571
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 04:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16729

Hi Ricardo,

On 12:13-20230614, Ricardo Salveti wrote:
> On Wed, Jun 14, 2023 at 4:41=E2=80=AFAM Manorit Chawdhry via
> lists.yoctoproject.org <m-chawdhry=3Dti.com@lists.yoctoproject.org>
> wrote:
> >
> > Enables FIT Image signing for K3 platforms
> >
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> >  meta-ti-bsp/conf/machine/include/k3.inc                  | 7 +++++++
> >  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/co=
nf/machine/include/k3.inc
> > index f8bfb3dbcafc..eb25fa780407 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -31,6 +31,13 @@ SPL_BINARY =3D "tispl.bin"
> >  SPL_BINARYNAME =3D "tispl.bin"
> >  UBOOT_SUFFIX =3D "img"
> >
> > +UBOOT_SIGN_ENABLE =3D "1"
> > +UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> > +UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> > +UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
>=20
> Did you verify that this won't cause a build failure when the key is
> not available at runtime (e.g. users not defining TI_SECURE_DEV_PKG)?
>=20
> Just because UBOOT_SIGN_ENABLE is being forced to 1.
>=20

TI_SECURE_DEV_PKG will always be set whenever we inherit ti-secdev
recipe and that is being done in the linux recipe in the same patch.
The kernel recipe internally uses this variable so no one should be=20
required to set this explicitely and the build had passed.

Though on the other hand, the build still passes even in we provide a
wrong folder if I understand correctly and the generate images don't
have the signature. Though I had validated this change on my local setup
and could see the things working as expected.

Regards,
Manorit

> Thanks,
> --=20
> Ricardo Salveti

