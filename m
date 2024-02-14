Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6597C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:48:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.39423.1707911326127826389
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 03:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=oQkXg3aw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41EBmi85036056
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Feb 2024 05:48:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707911324;
	bh=3pc/M2zCaRJGHft+oJgrauhpIeQlUU1NwqCdg/GFZLY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oQkXg3awoUSQKk8MlCV35IGmLyJlACC9RWOBnDdJrq4sFE4Sc1tAMjLECT5DFybnm
	 7LKj1F6GUNGBfj+ZdEVmy1ITVTru9aB4ow/psG3uwY7JdwT3VQoc9KOW2OZfoYEx6G
	 bpdremR5dPRMSG+ciNkAqYbF9L7yApkSr0d4MTxo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41EBmioA040905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Feb 2024 05:48:44 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 05:48:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 05:48:44 -0600
Received: from localhost (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41EBmhgJ006627;
	Wed, 14 Feb 2024 05:48:44 -0600
Date: Wed, 14 Feb 2024 17:18:43 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Aniket
 Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh
 Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva
 Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
Subject: Re: [EXTERNAL] [meta-ti][kirkstone][PATCH 0/2] ATF/OP-TEE Upgrade
Message-ID: <20240214114843.hey5znxbg3bczh2j@uda0497581>
References: <20240212103737.4161809-1-m-chawdhry@ti.com>
 <495c7164-61a7-40b3-a1bf-c6c31561ed0c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <495c7164-61a7-40b3-a1bf-c6c31561ed0c@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 41EBmi85036056
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Feb 2024 11:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17479

Hi Chirag,

On 17:13-20240212, Chirag Shilwant wrote:
> Hi Manorit,
>=20
> On 12/02/24 16:07, Manorit Chawdhry via lists.yoctoproject.org wrote:
> > Forgot the prefixes last time so sending it again. Manorit Chawdhry (=
2):
> > meta-ti-bsp: optee: Upgrade to 4.=E2=80=8A1 meta-ti-bsp: trusted-firm=
ware-arm:
> > Update to master
> > ..=E2=80=8A.=E2=80=8A/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-ti.=E2=80=8Ainc | 4 ++--
> > ..=E2=80=8A.=E2=80=8A/recipes-security/optee/optee-client-ti-version.=
=E2=80=8Ainc
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the sourc=
e
> > of this email and know the content is safe.
> > ZjQcmQRYFpfptBannerEnd
> > Forgot the prefixes last time so sending it again.
>=20
> Next time ensure that the commit message title clearly mentions it as v=
2.
> This helps in discarding previous patch versions.
>=20

Sure, would keep that in mind next time. Thanks!

Regards,
Manorit

> Thanks,
> Chirag
>=20
> >=20
> > Manorit Chawdhry (2):
> >    meta-ti-bsp: optee: Upgrade to 4.1
> >    meta-ti-bsp: trusted-firmware-arm: Update to master
> >=20
> >   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 +=
+--
> >   .../recipes-security/optee/optee-client-ti-version.inc        | 4 +=
+--
> >   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 +=
+--
> >   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 +=
+--
> >   4 files changed, 8 insertions(+), 8 deletions(-)
> >=20
> > --=20
> > 2.43.0
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#17469): https://urldefense.com/v3/__https://lists=
.yoctoproject.org/g/meta-ti/message/17469__;!!G3vK!Slr2xISVuwrD6gpWIXvYry=
FkzMsV9lPKRDMOqdVmo5zLs39cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8FI=
_scFo$
> > Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproje=
ct.org/mt/104309030/7030289__;!!G3vK!Slr2xISVuwrD6gpWIXvYryFkzMsV9lPKRDMO=
qdVmo5zLs39cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8GXlaHWQ$
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.o=
rg/g/meta-ti/unsub__;!!G3vK!Slr2xISVuwrD6gpWIXvYryFkzMsV9lPKRDMOqdVmo5zLs=
39cVfQ-ab9mgdEiWKuLDOABEqNUWnWfnb8J5tSG_UB-jkdB8HP2jYQc$  [c-shilwant@ti.=
com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

