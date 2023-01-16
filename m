Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BCFC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 18:48:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.175821.1673894897331335455
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 10:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=rTdSlOtH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30GImDmh086866;
	Mon, 16 Jan 2023 12:48:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673894893;
	bh=dUbQl1GwONx+ypesJ/BRnyNtO2kDOCzsDWyrhhNcfgU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rTdSlOtHT9Yd6diRp06jgv933CsCc+M1agEykEzp3TzrJLCa9TgqcEHr8EpIqGzIM
	 xFpRsmgUlxSinsilFi3eabk3TK4J52V1DLbHhPn6J20Oam+8bTU2Lpnsazge5J5wmS
	 kREGjV9pm3OoFA/wPKGcoRx+8196+4St7HVD85DM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30GImDYh031652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Jan 2023 12:48:13 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 16
 Jan 2023 12:48:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 16 Jan 2023 12:48:12 -0600
Received: from [10.250.34.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30GImCVh083345;
	Mon, 16 Jan 2023 12:48:12 -0600
Message-ID: <0c4d914f-8586-da93-4505-6ea769e6d3ce@ti.com>
Date: Mon, 16 Jan 2023 12:48:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][PATCH 2/3] ti-k3-secdev: sets
 TI_K3_SECDEV_INSTALL_DIR_RECIPE default value
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <ricardo@foundries.io>,
        Jose Quaresma
	<jose.quaresma@foundries.io>
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
 <20230116121626.885219-2-jose.quaresma@foundries.io>
 <4ca62111-f173-ea41-7b9c-e6dc9182f69f@ti.com>
 <CANPvuRns2KOQpYqO6jJGABz1joC3ebZW2w=dv1kCOiekTRmObA@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CANPvuRns2KOQpYqO6jJGABz1joC3ebZW2w=dv1kCOiekTRmObA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 30GImDmh086866
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 18:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15573

On 1/16/23 11:41 AM, Jose Quaresma wrote:
> Hi Andrew,
>=20
> Thanks for your comment.
>=20
> Andrew Davis <afd@ti.com <mailto:afd@ti.com>> escreveu no dia segunda, =
16/01/2023 =C3=A0(s) 17:08:
>=20
>     On 1/16/23 6:16 AM, Jose Quaresma wrote:
>      > The TI_K3_SECDEV_INSTALL_DIR_RECIPE is defined on the meta-ti-ex=
tras layer
>      > so when the layer is not used the variable is undefined.
>      > For such cases we can use default value that is the same defined
>      > on the recipes-ti/includes/ti-paths.inc
>      >
>      > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io <mailto=
:jose.quaresma@foundries.io>>
>      > ---
>      >=C2=A0 =C2=A0meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <h=
ttp://ti-k3-secdev_git.bb> | 2 ++
>      >=C2=A0 =C2=A01 file changed, 2 insertions(+)
>      >
>      > diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <=
http://ti-k3-secdev_git.bb> b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_=
git.bb <http://ti-k3-secdev_git.bb>
>      > index fd3bd120..6a28add7 100644
>      > --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <http://=
ti-k3-secdev_git.bb>
>      > +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <http://=
ti-k3-secdev_git.bb>
>      > @@ -4,6 +4,8 @@ SECTION =3D "devel"
>      >=C2=A0 =C2=A0LICENSE =3D "BSD-3-Clause"
>      >=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D "file://manifest/k3-secdev-0.2-=
manifest.html;md5=3Df632a78870cc64550078d7b3cbac0892"
>      >
>      > +# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
>      > +export TI_K3_SECDEV_INSTALL_DIR_RECIPE =3D "${datadir}/ti/ti-k3=
-secdev"
>      >=C2=A0 =C2=A0include recipes-ti/includes/ti-paths.inc
>      >
>=20
>     Using ti-paths.inc was not really right to begin with, I only did t=
hat as I was in a time
>     crunch, should be just removed (all of the file actually, but we ca=
n fix that later). Like
>     other -native tool recipes, the output should end up in a standard =
place that can be accessed
>     by recipes that depend on it. If -native packages could set env var=
s that would be nice, but
>     without that, lets just assume location and drop the include on ti-=
paths.inc.
>=20
>=20
> I think this can be done in a follow up=C2=A0patch, in this series I am=
 trying to make it simple
> changing=C2=A0only the strictly required to remove the dependencies=C2=A0=
of meta-ti-extras.
>=20

That's fine, just giving future ideas/plans, for this current series,

Acked-by: Andrew Davis <afd@ti.com>

>=20
>     For ti-k3-secdev_git.bb <http://ti-k3-secdev_git.bb> I'm thinking s=
omething like:
>=20
>=20
>     --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <http://ti-=
k3-secdev_git.bb>
>     +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb <http://ti-=
k3-secdev_git.bb>
>     @@ -4,8 +4,6 @@ SECTION =3D "devel"
>      =C2=A0 LICENSE =3D "BSD-3-Clause"
>      =C2=A0 LIC_FILES_CHKSUM =3D "file://manifest/k3-secdev-0.2-manifes=
t.html;md5=3Df632a78870cc64550078d7b3cbac0892"
>=20
>     -require recipes-ti/includes/ti-paths.inc
>     -
>      =C2=A0 # Native host tool only
>      =C2=A0 COMPATIBLE_MACHINE =3D "null"
>      =C2=A0 COMPATIBLE_MACHINE:class-native =3D "(.*)"
>     @@ -23,11 +21,11 @@ S =3D "${WORKDIR}/git"
>=20
>      =C2=A0 do_install() {
>      =C2=A0 =C2=A0 =C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,links,times=
tamps --no-preserve=3Downership"
>     -=C2=A0 =C2=A0 install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
>     -=C2=A0 =C2=A0 cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_=
RECIPE}
>     +=C2=A0 =C2=A0 install -d ${D}${datadir}/ti/ti-k3-secdev
>     +=C2=A0 =C2=A0 cp ${CP_ARGS} ${S}/* ${D}${datadir}/ti/ti-k3-secdev
>      =C2=A0 }
>=20
>     -FILES:${PN} +=3D "${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
>     +FILES:${PN} +=3D "${D}${datadir}/ti/ti-k3-secdev"
>=20
>=20
> I agree=C2=A0with this approach=C2=A0and if any additional change is ne=
eded it can be done on the distro layer with a bbappend
> or something else.
>=20
> Jose
>=20
>=20
>      =C2=A0 INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
>=20
>=20
>=20
> --=20
> Best regards,
>=20
> Jos=C3=A9 Quaresma

