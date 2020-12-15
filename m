Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.4724.1608070631050188184
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 14:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9CA6040BEA;
	Tue, 15 Dec 2020 22:17:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLneMmgXBIN5; Tue, 15 Dec 2020 22:17:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C6D940A0B;
	Tue, 15 Dec 2020 22:17:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 79BB917450F; Tue, 15 Dec 2020 17:17:03 -0500 (EST)
Date: Tue, 15 Dec 2020 17:17:03 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: dmurphy@ti.com, Suman Anna <s-anna@ti.com>,
	meta-ti@lists.yoctoproject.org, Dave Gerlach <d-gerlach@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [meta-ti] [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
Message-ID: <20201215221703.GN24670@denix.org>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
 <20201215205138.27986-1-praneeth@ti.com>
 <b5a69301-1b9b-c549-9426-f568bccff39d@ti.com>
 <bf4ed182-3c78-7c63-052d-014da1f4f680@ti.com>
 <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
 <20201215212931.GM24670@denix.org>
 <e2c68c41-ddb6-097f-7c90-9145afe77037@ti.com>
MIME-Version: 1.0
In-Reply-To: <e2c68c41-ddb6-097f-7c90-9145afe77037@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:07:47PM -0600, Bajjuri, Praneeth wrote:
>=20
>=20
> On 12/15/2020 3:29 PM, Denys Dmytriyenko wrote:
> >On Tue, Dec 15, 2020 at 03:04:16PM -0600, Dan Murphy via lists.yoctopr=
oject.org wrote:
> >>Praneeth
> >>
> >>On 12/15/20 2:59 PM, Bajjuri, Praneeth wrote:
> >>>
> >>>
> >>>On 12/15/2020 2:53 PM, Dan Murphy wrote:
> >>>>Praneeth
> >>>>
> >>>>On 12/15/20 2:51 PM, praneeth@ti.com wrote:
> >>>>>From: Praneeth Bajjuri <praneeth@ti.com>
> >>>>>
> >>>>>Update SRCREV to pick latest that includes AM64 support
> >>>>
> >>>>You are doing just a bit more then this.=A0 What is the "lite" for =
now?
> >>>
> >>>Thats the new target name for AM64
> >>>
> >>>Ref: https://git.ti.com/cgit/atf/arm-trusted-firmware/commit/?h=3Dti=
-atf&id=3D65dd16b4ea5032752af62e94ca64cff41733a123
> >>>
> >>>
> >>>TARGET_BOARD=3Dlite for AM64
> >>>TARGET_BOARD=3Dgeneric (default for other devices)
> >>>defined at conf/machine/include/k3.inc
> >>>
> >>Thanks.=A0 Now if we can just get that in the commit message except
> >>for the URL target
> >
> >Probably better to set TFA_BOARD =3D "lite" in the corresponding am64x=
x-evm.conf
> >machine config...
>=20
> Can i move it to conf/machine/include/am64xx.inc instead ? please advis=
e.
>=20
> Will submit v4 accordingly

Sure, am64xx.inc should be fine, even better for when/if possible HS or a=
ny=20
other variants in the same SoC family come out.

--=20
Denys
