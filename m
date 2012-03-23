Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44469E0044D
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:53:16 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so3551126obb.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=mUivht5a0VkS3Hk4gSibozj1tFa5IktZlg7QmC39xOo=;
	b=AlXdpnt/ZjTuAbDGz/7o+TH4UihwAeXyC+ksUR7N1scecs+L/ig4QLS3dhHytMO665
	FxZ/kMx8a0yo7qVNrrWp4UpGLhqXokTBSFmzRP82aU55cqHhkU2Iwrw1FRZrnw1ppRJW
	NXOo6Q4aKnhUI0jgQaUrEPecKSxPrHBbvPuo7yomGjmqgUPD5Q3ya+YzQRo78A8cpQa2
	B7rFwjYDyJvHo2O/+4rIRjOCMeWXU6Z5dgF2LsjkXi6pMe9tSrGeoZCyrSJ39DumEl8k
	i5qwqpjHJgjpLaUW26YZwbeemaP3zmecGtcbrasmZFnhVcxSZaG3KbvXAXAJhg0FXPUv
	re0A==
Received: by 10.182.188.38 with SMTP id fx6mr5938079obc.77.1332525195908;
	Fri, 23 Mar 2012 10:53:15 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id il8sm8345431obc.18.2012.03.23.10.53.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:53:15 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Fri, 23 Mar 2012 10:53:16 -0700
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20120323175316.GI9551@bill-the-cat>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1332524217-27534-3-git-send-email-trini@ti.com>
	<20120323173802.GH9551@bill-the-cat>
	<20120323175146.GF13495@denix.org>
MIME-Version: 1.0
In-Reply-To: <20120323175146.GF13495@denix.org>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:53:16 -0000
X-Groupsio-MsgNum: 853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mhOzvPhkurUs4vA9"
Content-Disposition: inline

--mhOzvPhkurUs4vA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 01:51:46PM -0400, Denys Dmytriyenko wrote:
> On Fri, Mar 23, 2012 at 10:38:02AM -0700, Tom Rini wrote:
> > On Fri, Mar 23, 2012 at 10:36:56AM -0700, Tom Rini wrote:
> >=20
> > > Signed-off-by: Tom Rini <trini@ti.com>
> > > ---
> > >  conf/machine/omap3evm.conf |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > Code is correct, commit message wasn't updated.  v3 or can someone just
> > fix before pushing?  Thanks!
>=20
> I'm not sure the discussion at OE-Core is over... The way I read it, Rich=
ard=20
> would rather see MACHINE_IMAGES_FSTYPES implemented, instead of using=20
> overrides in local.conf.

Yes, this series assumes the direction for today is just to do as
documented (being so close to release) and tomorrow do something more
complicated.

--=20
Tom

--mhOzvPhkurUs4vA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPbLiMAAoJENk4IS6UOR1WzroP/Arlxssmj2M4LE2PhuIykbt0
N2Nu+5mX8v21Sk8/EA+eaZ7+phViMJGt511FbkXJoggi70s0U9j8HqugOsock6z/
/kfLVfCycibpl4PYM4vtiET/VeBDObm/gysLTpoE67E4SEpeRiWV3HkehRdR8HeM
N7DL43WVy4p9rFDPPHSwoRjlws14FvFmp/50zAMz55xXjl7wXrr1xTZa44eFHT0/
mPY918+X2huxpI6uOx5Y80kz/Au9DM6oKBRtzqTvKYedj+I8DDUOjPjzEDu5rQNX
xA7AXKBnx2liYAqrdwZ1Ee2PE1sxpul8EmlAsSmbsbq2NpNsgArdY9q2qikcuBvR
FhB+4VAKcp8qiy3KPL/RrmW6tQIAiMRU5kUnn2E14kYtZ+GbSebqyirvOx+SR1JX
FNyz7xeFhPpVWSX8hjG80o/+svyPBY583E6wboDfcKsfqkzl0F2YHB2g/RJzKy6W
lZ3D6HXbsraSFbp/XeJ/JAViYtrL+z3JMzKmiFG9HUxjrVY+VHBFHuNsNMsaIjSh
kbx4ha94vv6Tsi1ANumRflX/7pVdq0dhr0q2aCb7917tf75xw3Qkwoa5u7PAC18b
jhzpFPIXHPIR5kBum5a1y9Y/Z1jV5BaXfxAbmcr6a1dGCvNY4zoKo6YvZR8JYhc6
imMsIRthCG4yQNdm/+I5
=r3jg
-----END PGP SIGNATURE-----

--mhOzvPhkurUs4vA9--
