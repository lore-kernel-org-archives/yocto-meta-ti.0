Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1468.1646425485682891378
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 12:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACFFF40C22;
	Fri,  4 Mar 2022 20:24:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuKHUEUaVsSm; Fri,  4 Mar 2022 20:24:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7358D40BE6;
	Fri,  4 Mar 2022 20:24:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 216A41747CB; Fri,  4 Mar 2022 15:24:37 -0500 (EST)
Date: Fri, 4 Mar 2022 15:24:37 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org,
	Priya N S <priya.ns@mistralsolutions.com>,
	Kishon Vijay Abraham <kishon@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [dunfell/master PATCH] pruss-fw: am57xx: Update hsr/prp/sw/dual-emac firmware
Message-ID: <20220304202437.GT1766@denix.org>
References: <20220304191540.8578-1-praneeth@ti.com>
 <20e409f2-7eaa-ef7b-06df-ef1fcbab1309@ti.com>
 <3ec5372a-d727-d88b-a996-8594a0e61f97@ti.com>
 <d02c287a-fe2d-0288-a159-cbc5275a3147@ti.com>
MIME-Version: 1.0
In-Reply-To: <d02c287a-fe2d-0288-a159-cbc5275a3147@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 02:06:47PM -0600, Ryan Eatmon wrote:
>=20
>=20
> On 3/4/2022 13:40, Bajjuri, Praneeth wrote:
> >
> >
> >On 3/4/2022 1:25 PM, Ryan Eatmon wrote:
> >>>diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> >>>b/recipes-bsp/prueth-fw/prueth-fw.bb
> >>>similarity index 88%
> >>>rename from recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> >>>rename to recipes-bsp/prueth-fw/prueth-fw.bb
> >>>index f7336fb1..e41bb3c0 100644
> >>>--- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> >>>+++ b/recipes-bsp/prueth-fw/prueth-fw.bb
> >>>@@ -2,6 +2,9 @@ SUMMARY =3D "PRU Ethernet firmware for AM57xx,
> >>>AM437x and AM335x"
> >>>=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>+PV =3D "${PRUETH_FW_AM335X_VERSION}"
> >>>+PV =3D "${PRUETH_FW_AM437X_VERSION}"
> >>>+PV =3D "${PRUETH_FW_AM57XX_VERSION}"
> >>>=A0 PR =3D "${INC_PR}.0"
> >>
> >>I think you need to uniquify the PV variable for each platform.=A0
> >>Right now you are just resetting each time and not overriding
> >>it.
> >>
> >>PV_am335x-evm =3D "${PRUETH_FW_AM335X_VERSION}"
> >>etc...
> >
> >Thanks for the quick review,
> >Does this work instead? PV_ti-soc?
> >
> >The FW version for each platform could be different as the
> >mentioned commit in commitmessage points to updating the firmware
> >only for am57xx but not for am335x/am437x.
>=20
> While I think that might technically work, there are only three
> machines that come into these recipes.  I think it would be more
> confusing for someone reading the recipe to wonder what all makes up
> ti-soc, rather than just seeing the three specific variables called
> out.  Plus you created three variables in the ti-linux-fw.inc.  It
> would fit more in line with other things in the same recipe to just
> list them out:
>=20
>=20
> TARGET =3D ""
> TARGET_ti33x =3D "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
> TARGET_ti43x =3D "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
> TARGET_am57xx-evm =3D "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.=
elf"
> TARGET_am57xx-hs-evm =3D "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-=
fw.elf"
>=20
> and
>=20
> PV =3D ""
> PV_ti33x =3D "${PRUETH_FW_AM335X_VERSION}"
> PV_ti43x =3D "${PRUETH_FW_AM437X_VERSION}"
> PV_am57xx-evm =3D "${PRUETH_FW_AM57XX_VERSION}"
> PV_am57xx-hs-evm =3D "${PRUETH_FW_AM57XX_VERSION}"

No, PV_ti-soc won't work, it will be the same as plain PV and won't use t=
he=20
correct value per platform.

What Ryan explains is correct - need an override per platform.

BTW, master uses a different override syntax, so this won't apply to mast=
er or=20
kirkstone and would need to be updated...

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
