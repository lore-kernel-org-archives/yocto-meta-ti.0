Return-Path: <tom.rini@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AFE0E013A3
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:06:02 -0700 (PDT)
Received: by ggcs6 with SMTP id s6so7544275ggc.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=FrjiaZIdwH718o6S86GpFOGgn5ynGDqaV1lryoWhIy4=;
	b=Z9nxK527oaNAZ5/AD0KCmM783omHAFwmSbxVcW0uWENuverIT7D8VhfuKFyZsmTpOF
	brvnQOe0mFryprw1fSVh2Jd4E8aEuXemSQKrMzVGm8/YR7+9/A0XK+sSR2QMK8iTiRIR
	z/VjSwKeaBOEo3QqpPBq4xPMcaPAxHN16LOk+KOgmtZ8JZEHmyvj/VYIfv/r1NWQ617M
	qVA5Xc1RyBoT5tFy8W3TzQUmx1BLW8X/mAid3US0Eot+Cqv36UyexAGyLgDNZDHdIqTR
	jMce5olgj0Bsw2B8aZ0A5r9kWhgQa49yCucRDZxpbyT5pUmhXeSyAUcIDU6INuaHBYWs
	qeCQ==
Received: by 10.60.4.134 with SMTP id k6mr9018148oek.19.1332191161844;
	Mon, 19 Mar 2012 14:06:01 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id b6sm14203268obe.12.2012.03.19.14.06.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 14:06:00 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 19 Mar 2012 14:05:57 -0700
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20120319210557.GF19810@bill-the-cat>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
	<20120319210247.GD15554@denix.org>
MIME-Version: 1.0
In-Reply-To: <20120319210247.GD15554@denix.org>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: release branch for meta-ti?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2012 21:06:02 -0000
X-Groupsio-MsgNum: 816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
> > On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
> > > Hi,
> > >=20
> > > Any volunteers for maintaining a releasebranch that matches the upcom=
ing oe-core release in ~4 weeks?
> >=20
> > If Denys or Chase don't step-up, I'll do it.  As qualification, I do
> > such a thing for oe-classic currently :)  But if either of them would
> > rather, I'll defer to them.
>=20
> We'll probably need to set meta-oe-maintenance up anyway for meta-arago t=
o=20
> work with, rather than chasing changes in the master...

Yes, meta-oe will also need a maintenance release to match, and
meta-arago too :)

> BTW, Tom, when are we planning to kill 2011.03 in oe-classic? It's 1 year=
 old=20
> now...

So long as there's interest has been my statement.  Given I was given a
pull request last week, there's still interest :)

--=20
Tom

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPZ5+1AAoJENk4IS6UOR1WZZwP/1JAxKCmPa1LrzJA0nght0qR
YQyKxVYcItzr9RkuZdTZzfX644okWq4ljYaFNJcP/PC6a0C4dtaG0/5+JmobNJpE
V6n+aFtU5nOqmGQV0cPyJF5DTnZuknXzcZvne8Un5npGaUUC+Uq3vg3P+EQ5Y0aF
P3flXauBgIL3x8Xqfvviw2hQS/iCNmfH7N+GnqViLIeGwyPekhc7ALRdGbEk3caA
VUs06atGAxlbqd9OWqxsZy2vVyEzKabjQULK+dg2hP/wOPEA6eeEiME0Pon/qz4m
uJ28YxxRCQrBN6HNPbEp1iroKLTWcX/EkU5uvbVSRzzR1FeLOpNdNVbWRXBgmO2T
y2TDj8rGvxsz+GQUTYDYXWveAvD16/gDafMk9UrxW8BN4mEoIvI3c7E5EhwCH7qk
CT8PqiyUVfuW5dI3dkDl54ayONUvvit2dEEHeCA5/QrehB0CcxCOdlyqYCplKGDK
yAx3uTtRNFUBQKV8YF4C8hglZINhm70zn+Yf7wt3OxxKc0lOwObvmmwHNKyj7xSM
KDd26V4wY59/y70x70s2Si08RfBbbMFa92qS6zMIKGpAf2kELhSDqP0H+y93YfSd
RIO6ye9+iBRurCAArdd0HlfjKBPLZPOnDSUrqJkEZia6SvGptquipsf5cpeVMSZL
U3l3f2xlNloyS7MLlAtN
=XNZd
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
