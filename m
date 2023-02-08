Return-Path: <meta-ti@emagii.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F51EC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:45:46 +0000 (UTC)
Received: from emagii.se (emagii.se [185.133.207.17])
 by mx.groups.io with SMTP id smtpd.web10.6797.1675881935615666230
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 10:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@emagii.com header.s=default header.b=m7BIVEBA;
 spf=pass (domain: emagii.com, ip: 185.133.207.17, mailfrom: meta-ti@emagii.com)
Received: from [10.175.196.145] (84-55-68-216.customers.ownit.se [84.55.68.216])
	by emagii.se (Postfix) with ESMTPSA id 6E9EB12020A
	for <meta-ti@lists.yoctoproject.org>; Wed,  8 Feb 2023 19:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emagii.com;
	s=default; t=1675881932;
	bh=PPGI1szkCr6YJgIcKc9mRQs3QIWxS27lEy7BdvizGAY=; h=To:From:Subject;
	b=m7BIVEBAVVvxhHbNPplHMqBxgo2M6Ht/y/FPYQJ8uUfyiPDxEDD6ipDAMzW32IhNr
	 k1pxmFKkroauVQyz8lPdxjEnv7HxSi133YRDler3xTobmoFOkefajRkHA2Wq/hYc0U
	 JiaILaFOsl/sEBHf3gf6qMhXOAhKvex6+TLtg5cc=
Authentication-Results: emagii.beebytevps.io;
        spf=pass (sender IP is 84.55.68.216) smtp.mailfrom=meta-ti@emagii.com smtp.helo=[10.175.196.145]
Received-SPF: pass (emagii.beebytevps.io: connection is authenticated)
Message-ID: <1ac128b2-0f38-dff7-19ee-ff7d91620431@emagii.com>
Date: Wed, 8 Feb 2023 19:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: meta-ti@lists.yoctoproject.org
Content-Language: sv-FI
From: Ulf Samuelsson <meta-ti@emagii.com>
Subject: MDIO driver bug (U-Boot:drivers/net/ti/cpsw_mdio.c)
Content-Type: text/plain; charset=UTF-8; format=flowed
X-PPP-Message-ID: 
 <167588193268.3522441.6141621503880941983@localhost.localdomain>
X-PPP-Vhost: emagii.com
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 18:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15755

Hi guys,

I think I found a bug in the U-Boot drivers/net/ti/cpsw_mdio.c driver

Sent the patch below to the u-boot mailing list with no response.

It has only been a day though, but I thought to highlight it here.

Best Regards
Ulf Samuelsson



cpsw_mdio_get_alive reads the wrong register.
See page 2316 in SPRUH73Q AM335x TRM

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
---
 =C2=A0drivers/net/ti/cpsw_mdio.c | 6 +++---
 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ti/cpsw_mdio.c b/drivers/net/ti/cpsw_mdio.c
index a5ba73b739..ac791faa81 100644
--- a/drivers/net/ti/cpsw_mdio.c
+++ b/drivers/net/ti/cpsw_mdio.c
@@ -51,7 +51,7 @@ struct cpsw_mdio_regs {
 =C2=A0#define USERACCESS_PHY_REG_SHIFT=C2=A0=C2=A0=C2=A0 (21)
 =C2=A0#define USERACCESS_PHY_ADDR_SHIFT=C2=A0=C2=A0=C2=A0 (16)
 =C2=A0#define USERACCESS_DATA=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 GENMA=
SK(15, 0)
-=C2=A0=C2=A0=C2=A0 } user[0];
+=C2=A0=C2=A0=C2=A0 } user[2];
 =C2=A0};

 =C2=A0#define CPSW_MDIO_DIV_DEF=C2=A0=C2=A0=C2=A0 0xff
@@ -366,8 +366,8 @@ u32 cpsw_mdio_get_alive(struct mii_dev *bus)
 =C2=A0=C2=A0=C2=A0=C2=A0 struct cpsw_mdio *mdio =3D bus->priv;
 =C2=A0=C2=A0=C2=A0=C2=A0 u32 val;

-=C2=A0=C2=A0=C2=A0 val =3D readl(&mdio->regs->control);
-=C2=A0=C2=A0=C2=A0 return val & GENMASK(15, 0);
+=C2=A0=C2=A0=C2=A0 val =3D readl(&mdio->regs->alive);
+=C2=A0=C2=A0=C2=A0 return val & GENMASK(7, 0);
 =C2=A0}

 =C2=A0struct mii_dev *cpsw_mdio_init(const char *name, phys_addr_t mdio_=
base,
--=20


