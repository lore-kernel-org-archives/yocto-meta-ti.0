Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D3FC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 19:46:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8681.1675885575016320767
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 11:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=DzXuD2Qj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318Jk7Ic062930;
	Wed, 8 Feb 2023 13:46:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675885567;
	bh=x83p1oThek1J58PrMVDY41nKHrj+4ExyEqRgtp1EUOc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=DzXuD2QjGUVbAReM61SKHdnMvR+W5VKZE3syYfRBN6B3Fy/X39dYjgahHZsPk17Wi
	 RuBvjcDyulZRbkTvvLQiskL062Bam7djyuNvVfcQ5K+eaMmairPjvTC2gfPjaxoHbN
	 6bggDSzveTTHe2SLQJ19Sc0+aA/qUobSpztIgQTc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318Jk75n022451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 13:46:07 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 13:46:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 13:46:07 -0600
Received: from [10.247.18.194] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318Jk7jC001785;
	Wed, 8 Feb 2023 13:46:07 -0600
Message-ID: <272036f8-9958-09eb-302e-430dad1e5b06@ti.com>
Date: Wed, 8 Feb 2023 13:46:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti] MDIO driver bug (U-Boot:drivers/net/ti/cpsw_mdio.c)
To: Ulf Samuelsson <meta-ti@emagii.com>, <meta-ti@lists.yoctoproject.org>,
        "Govindarajan, Sriramakrishnan" <srk@ti.com>,
        Kevin Hilman
	<khilman@baylibre.com>
References: <1ac128b2-0f38-dff7-19ee-ff7d91620431@emagii.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <1ac128b2-0f38-dff7-19ee-ff7d91620431@emagii.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 318Jk7Ic062930
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 19:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15758

+Sriram,kevin

On 2/8/2023 12:45 PM, Ulf Samuelsson wrote:
> Hi guys,
>=20
> I think I found a bug in the U-Boot drivers/net/ti/cpsw_mdio.c driver
>=20
> Sent the patch below to the u-boot mailing list with no response.
>=20
> It has only been a day though, but I thought to highlight it here.
>=20

Thanks for notifying us,

I see the patch
https://patchwork.ozlabs.org/project/uboot/patch/20230207082527.2319-1-ul=
f@emagii.com/

Will monitor and handle accordingly with uboot and kirkstone update when=20
it happens.


> Best Regards
> Ulf Samuelsson
>=20
>=20
>=20
> cpsw_mdio_get_alive reads the wrong register.
> See page 2316 in SPRUH73Q AM335x TRM
>=20
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> ---
>  =C2=A0drivers/net/ti/cpsw_mdio.c | 6 +++---
>  =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ti/cpsw_mdio.c b/drivers/net/ti/cpsw_mdio.c
> index a5ba73b739..ac791faa81 100644
> --- a/drivers/net/ti/cpsw_mdio.c
> +++ b/drivers/net/ti/cpsw_mdio.c
> @@ -51,7 +51,7 @@ struct cpsw_mdio_regs {
>  =C2=A0#define USERACCESS_PHY_REG_SHIFT=C2=A0=C2=A0=C2=A0 (21)
>  =C2=A0#define USERACCESS_PHY_ADDR_SHIFT=C2=A0=C2=A0=C2=A0 (16)
>  =C2=A0#define USERACCESS_DATA=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 GEN=
MASK(15, 0)
> -=C2=A0=C2=A0=C2=A0 } user[0];
> +=C2=A0=C2=A0=C2=A0 } user[2];
>  =C2=A0};
>=20
>  =C2=A0#define CPSW_MDIO_DIV_DEF=C2=A0=C2=A0=C2=A0 0xff
> @@ -366,8 +366,8 @@ u32 cpsw_mdio_get_alive(struct mii_dev *bus)
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct cpsw_mdio *mdio =3D bus->priv;
>  =C2=A0=C2=A0=C2=A0=C2=A0 u32 val;
>=20
> -=C2=A0=C2=A0=C2=A0 val =3D readl(&mdio->regs->control);
> -=C2=A0=C2=A0=C2=A0 return val & GENMASK(15, 0);
> +=C2=A0=C2=A0=C2=A0 val =3D readl(&mdio->regs->alive);
> +=C2=A0=C2=A0=C2=A0 return val & GENMASK(7, 0);
>  =C2=A0}
>=20
>  =C2=A0struct mii_dev *cpsw_mdio_init(const char *name, phys_addr_t mdi=
o_base,
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15755): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15755
> Mute This Topic: https://lists.yoctoproject.org/mt/96837011/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

