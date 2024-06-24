Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C572AC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:30:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.152555.1719261013596644296
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 13:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EQwVZSOG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OKU76X047955;
	Mon, 24 Jun 2024 15:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719261007;
	bh=GwoBLvJtELQ1YaGZuev740BsVtms3Vskj1dmbAiCV6w=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=EQwVZSOG4qbTkIi93l0yUV+BE+tzp7g1GzW9jiEq0M9awx+b7Lt6oMWnGaE1On0Vy
	 Zkai44mktkhvdXRRfRiHaNX9VfClySkozbyjtNYM90qlaTx5tKMESWglazC2YkjZDM
	 GqyFX0XPnGlAMRO+T9F99lTu1Z23m+X1NtJUj+cs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OKU7rb070045
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 15:30:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 15:30:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 15:30:06 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OKU6Ps077403;
	Mon, 24 Jun 2024 15:30:06 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 24 Jun 2024 15:30:06 -0500
Message-ID: <D28J5UUM3ZDB.2ATEDL9XDCQCH@ti.com>
CC: <reatmon@ti.com>, <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        <detheridge@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 0/2] gcc 14 and bsp
 provider fixup
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.17.0
References: <20240624181714.1293865-1-rs@ti.com>
 <20240624200639.GH18231@denix.org>
In-Reply-To: <20240624200639.GH18231@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 20:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17806

On Mon Jun 24, 2024 at 3:06 PM CDT, Denys Dmytriyenko wrote:
> On Mon, Jun 24, 2024 at 01:17:12PM -0500, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Resolve some issues afer the new bsp-provider selection logic was added=
 and add
> > some patches to help with compilation flag checks in the KM.
>
> FWIW, the new bsp-provider selection logic was not causing any new issues=
.

Fair, a change to existing behavior technically isn't a bug. That being sai=
d,
the driver was rendered non-functional on AM62 as a result. Not a bug to yo=
u,
but still a bug to me.

> Anyone using meta-ti master and scarthgap from early February until late =
May=20
> were already exposed to this.
>
> While 6.1 LTS was still the default, this change to 23.3 got merged on Fe=
b 9:
> https://git.yoctoproject.org/meta-ti/commit/?id=3D737807fc4360b7fe3cbe493=
a6104558c4658a046
>
> Separate new 24.1 DDK for the 6.6 LTS was added on May 2, still disabled:
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dd89907ec2322f23271917d7=
5f052217dd8a2c27a
>
> And then 6.6 LTS got flipped to become the default on May 23:
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dd41d49cfdc6deee33a40ab4=
4d453167c36462c89
>
> When adding the BSP provider code and setting preferred versions, I did s=
ee=20
> the first commit that switched branches from 6.1 to 6.6, and I was consid=
ering=20
> reverting it (like you are proposing here with patch #1). But I didn't wa=
nt to=20
> upset anyone and figured since this was already the default config for al=
most=20
> 4 months (!) of using the updated 23.3 DDK with 6.1 LTS, I just left it a=
lone.
>
> So, the BSP provider logic just formalized all the existing defaults.

The dt breaking changes made to kernel 6.6 came after I was required to get=
 a
build of the module up and running on kernel 6.6. External modules are the =
first
things blamed during a kernel migration. For a little while that branch, de=
spite
being tagged 6.6, was actually cross compatible with 6.1 and 6.6.

I did not intend for people to use it on 6.1, nor did I intend for it to be=
 a
long term solution, assuming that when 6.6 was selected as the new default =
the
need for cross compatibility could be dropped and our proposed dt change fr=
om
last year could finally be introduced...

That assumption didn't play out as a new decision was made and this bsp log=
ic
was added post branch shuffling. Truly, there are no easy solutions.

- Randolph

> > This includes equivalent patches from the following post for GCC 14 com=
pat:
> > https://lists.yoctoproject.org/g/meta-ti/topic/106806264
> >=20
> > Randolph Sapp (2):
> >   ti-img-rogue-*_23.3: gcc 14 compat and branch sel
> >   ti-img-rogue-driver_24.1: gcc 14 compat
> >=20
> >  .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 4 ++--
> >  .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb       | 2 +-
> >  .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > --=20
> > 2.45.1
> >=20


