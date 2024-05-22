Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D63C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:12:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4790.1716365543188011189
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 01:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=x92dirJ3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44M8CLwW034118;
	Wed, 22 May 2024 03:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716365541;
	bh=5dlt7PeuQZJgjc5+mJgrbCOWJdDdjth3Da3TuNXhnzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=x92dirJ3ayExIDznToXxZbHApE28Vy2X2oET8i7eCmLh+oCvszHBKeN0qTYNNmw8f
	 8wPnO9px5bzircZJOxYNTUNyiq5S6n17Guqb5ki0+HgsT4M0E2+RTXuxwjoEUpS/n9
	 QTT8hf5W2Yl34DwuH9uxYtVIxZLy5PKOoHuS5ejU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44M8CLxg061328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 03:12:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 03:12:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 03:12:21 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44M8CIbF006054;
	Wed, 22 May 2024 03:12:18 -0500
Message-ID: <b7988f82-0e79-44d2-aa6a-06564849ce03@ti.com>
Date: Wed, 22 May 2024 13:42:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti] [PATCH [Scarthgap/Master]] optee: Update
 to upstream 4.2.0
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <denys@konsulko.com>,
        <reatmon@ti.com>, <praneeth@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com>
 <17D1C0CE89FB086D.11581@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17D1C0CE89FB086D.11581@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 44M8CLwW034118
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 08:12:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17667

A nitpick which should be handled in v2,

Format for Subject : [meta-ti][list of branches][PATCH]

Eg: [meta-ti][master/scarthgap][PATCH v2] in your case

On 22/05/24 13:32, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi Kamlesh, On 22/05/24 12:=E2=80=8A13, Kamlesh Gurudasani wrote: > Upd=
ate all=20
> of the optee components to the upstream 4.=E2=80=8A2.=E2=80=8A0 version=
. > >=20
> Signed-off-by: Kamlesh Gurudasani <kamlesh@=E2=80=8Ati.=E2=80=8Acom> > =
--- >=20
> meta-ti-bsp/recipes-security/optee/optee-client-ti-version.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> Hi Kamlesh,
>
> On 22/05/24 12:13, Kamlesh Gurudasani wrote:
> > Update all of the optee components to the upstream 4.2.0 version.
> >
> > Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> > ---
> >   meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | =
4 ++--
> >   meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | =
2 +-
> >   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | =
4 ++--
> >   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | =
5 ++---
> >   4 files changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-versi=
on.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> > index 16fbd6c5..31d59be8 100644
> > --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> > @@ -1,2 +1,2 @@
> > -PV =3D "4.1.0+git"
> > -SRCREV =3D "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
> > +PV =3D "4.2.0+git${SRCPV}"
>
>
> A change in oe-core has dropped setting SRCPV [1]
> Since it's now empty, we shouldn't use it when setting PV.
>
> [1]:
> https://urldefense.com/v3/__https://git.openembedded.org/openembedded-c=
ore/commit/?id=3Da8e7b0f932b9ea69b3a218fca18041676c65aba0__;!!G3vK!RkRM24=
E_A5xZzfiwR9tF5u3KG5JYaRDzKOeP3YZ8VgmBN3m0GDKgqb_uNOGJ8DBW6WRHX4Pdy7pOZ_h=
t52OFre1iLRI-yH_GGw0N$
>
>
> > +SRCREV =3D "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-ver=
sion.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc
> > index 23cd7580..03e93c3c 100644
> > --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.in=
c
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.in=
c
> > @@ -1,2 +1,2 @@
> > -PV =3D "4.0.0+git"
> > +PV =3D "4.2.0+git${SRCPV}"
> >   SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> > index 9db67567..bfafff3c 100644
> > --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> > @@ -1,5 +1,5 @@
> > -PV =3D "4.1.0+git"
> > -SRCREV =3D "012cdca49db398693903e05c42a254a3a0c0d8f2"
> > +PV =3D "4.2.0+git${SRCPV}"
>
>
> Same comment as above
>
>
> > +SRCREV =3D "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
> >  =20
> >   # Fixes for pointing to 4.0.0 before upstream meta-arm
> >   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-4.0.0:"
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version=
.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> > index 16b2dfc3..a7d048f6 100644
> > --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> > @@ -1,6 +1,5 @@
> > -PV =3D "4.1.0+git"
> > -SRCREV =3D "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
> > +PV =3D "4.2.0+git${SRCPV}"
>
>
>
> Same comment as above
>
>
> > +SRCREV =3D "526d5bac1b65f907f67c05cd07beca72fbab88dd"
> >  =20
> >   # Fixes for pointing to 4.0.0 before upstream meta-arm
> >   SRC_URI:remove =3D "file://0001-xtest-regression_1000-remove-unneed=
ed-stat.h-include.patch"
> > -
> >
> > ---
> > base-commit: de73fc7fe4e81196d4e4ee9054bb805c967bb73e
> > change-id: 20240521-sg-optee-4-2-update-185fd5dc31d0
> >
> > Best regards,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17666): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17666__;!!G3vK!RkRM24E_A5xZzfiwR9tF5u3K=
G5JYaRDzKOeP3YZ8VgmBN3m0GDKgqb_uNOGJ8DBW6WRHX4Pdy7pOZ_ht52OFre1iLRI-yG2YA=
6dH$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106238606/7030289__;!!G3vK!RkRM24E_A5xZzfiwR9tF5u3KG5JYaRDzKOeP3Y=
Z8VgmBN3m0GDKgqb_uNOGJ8DBW6WRHX4Pdy7pOZ_ht52OFre1iLRI-yLoEuoVe$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!RkRM24E_A5xZzfiwR9tF5u3KG5JYaRDzKOeP3YZ8VgmBN3m=
0GDKgqb_uNOGJ8DBW6WRHX4Pdy7pOZ_ht52OFre1iLRI-yF1XVyPv$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

