Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E63E3E00744
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 04:22:36 -0800 (PST)
Received: by werm10 with SMTP id m10so8539705wer.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 04:22:35 -0800 (PST)
Received: by 10.216.137.148 with SMTP id y20mr1227533wei.32.1325074955595;
	Wed, 28 Dec 2011 04:22:35 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ez4sm19143133wbb.5.2011.12.28.04.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 04:22:34 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
Date: Wed, 28 Dec 2011 13:22:32 +0100
Message-Id: <E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
To: Peter Bigot <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/5] linux 3.0: put back support for graphics on ULCD7
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
X-List-Received-Date: Wed, 28 Dec 2011 12:22:37 -0000
X-Groupsio-MsgNum: 305
Content-Type: multipart/signed;
	boundary="Apple-Mail=_67144156-35E8-440C-8FFF-56C97C1FEAFB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_67144156-35E8-440C-8FFF-56C97C1FEAFB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende geschreven:

> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende =
geschreven:
>>=20
>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>=20
>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>> ---
>>> .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
>>> recipes-kernel/linux/linux_3.0.bb                  |    2 +-
>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig =
b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>> index 5f2a7eb..7938236 100644
>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>> CONFIG_FB_OMAP2=3Dy
>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>=20
>> NAK, we need one to be available for v4l
>=20
> Is there some other solution that lets the ULCD7 work like it used to,
> or is it no longer a supported BeagleBoard accessory?

http://www.flickr.com/photos/koenkooi/6527657487

That's with 3.0.12, but 3.0.14 works the same.=

--Apple-Mail=_67144156-35E8-440C-8FFF-56C97C1FEAFB
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk77CgoACgkQMkyGM64RGpHJVwCeIAd6WpSGi+5ACrc969ImJL59
uT0AnRaccTls0n5bg1dvUx8U1+P66SfJ
=eYJ0
-----END PGP SIGNATURE-----

--Apple-Mail=_67144156-35E8-440C-8FFF-56C97C1FEAFB--
