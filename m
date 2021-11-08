Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4402.1636412931528369960
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 15:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 441BC40C3E;
	Mon,  8 Nov 2021 23:08:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwcnz1cZ3KYb; Mon,  8 Nov 2021 23:08:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A79140429;
	Mon,  8 Nov 2021 23:08:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DF35F1746B8; Mon,  8 Nov 2021 18:08:43 -0500 (EST)
Date: Mon, 8 Nov 2021 18:08:43 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: meta-ti@lists.yoctoproject.org, denys@konsulko.com,
	"Bajjuri, Praneeth" <praneeth@ti.com>, khilman@baylibre.com,
	dfustini@baylibre.com
Subject: Re: [meta-ti] [PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release
Message-ID: <20211108230843.GF10132@denix.org>
References: <20211108105214.34533-1-aouledameur@baylibre.com>
 <8f075a28-83ef-1062-faea-3e6a0603a81a@baylibre.com>
 <20c106dc-b76d-e94b-c69d-8dcfaf4de428@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20c106dc-b76d-e94b-c69d-8dcfaf4de428@baylibre.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thank you!

Can you please re-send the original to the list, so it gets captured by=20
Patchwork?


On Mon, Nov 08, 2021 at 10:15:18PM +0100, Amjad Ouled-Ameur wrote:
> This was not successfully sent to "meta-ti@lists.yoctoproject.org" sinc=
e
>=20
> I was not subscribed to it. Re-sending !
>=20
>=20
> Sorry for the noise,
>=20
> Amjad
>=20
> On 08/11/2021 12:01, Amjad Ouled-Ameur wrote:
> >Sending to maintainer Praneeth as well.
> >
> >On 08/11/2021 11:52, Amjad Ouled-Ameur wrote:
> >>This introduces a critical fix for both AM335X EVM and AM43XX EVM, wh=
ich
> >>can no longer boot because "uuid" is undefined.
> >>
> >>v2021.10 has these two fixes, one for each platform:
> >>- commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only")
> >>- commit e0c91ae24e5b ("ti: am43xx_evm: Switch to DISTRO_BOOT only")
> >>
> >>Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> >>---
> >>=A0 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
> >>=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> >>b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> >>index 2db9899609d0..76aaa4b24ac0 100644
> >>--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> >>+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> >>@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> >>"file://Licenses/README;md5=3D5a7450c57ffe5ae63fd732446b988025"
> >>=A0 =A0 PR =3D "r0"
> >>=A0 -PV =3D "2021.07"
> >>+PV =3D "2021.10"
> >>=A0 =A0 # For the un-initiated:
> >>=A0 # The actual URL you'd use with a git clone for example would be:
> >>@@ -15,4 +15,4 @@ PV =3D "2021.07"
> >>=A0 # b) and we want git fetcher to use https protocol, hence
> >>GIT_PROTOCOL as https
> >>=A0 UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
> >>=A0 UBOOT_GIT_PROTOCOL =3D "https"
> >>-SRCREV =3D "840658b093976390e9537724f802281c9c8439f5"
> >>+SRCREV =3D "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
