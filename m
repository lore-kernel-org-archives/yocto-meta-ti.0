Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E33FBE00744
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 05:11:43 -0800 (PST)
Received: by wibhq4 with SMTP id hq4so7910687wib.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 05:11:43 -0800 (PST)
Received: by 10.180.20.18 with SMTP id j18mr69652973wie.20.1325077902913;
	Wed, 28 Dec 2011 05:11:42 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g12sm7406079wiw.10.2011.12.28.05.11.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 05:11:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
Date: Wed, 28 Dec 2011 14:11:39 +0100
Message-Id: <FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
	<E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
	<CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Dec 2011 13:11:45 -0000
X-Groupsio-MsgNum: 307
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E81F84E4-2F3D-40F9-9D52-B5E009C785FF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E81F84E4-2F3D-40F9-9D52-B5E009C785FF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 28 dec. 2011, om 13:33 heeft Peter Bigot het volgende geschreven:

> On Wed, Dec 28, 2011 at 6:22 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende geschreven:
>>=20
>>> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>=20
>>>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende =
geschreven:
>>>>=20
>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>=20
>>>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>>>> ---
>>>>> .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
>>>>> recipes-kernel/linux/linux_3.0.bb                  |    2 +-
>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>=20
>>>>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig =
b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>> index 5f2a7eb..7938236 100644
>>>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>>>> CONFIG_FB_OMAP2=3Dy
>>>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>>>=20
>>>> NAK, we need one to be available for v4l
>>>=20
>>> Is there some other solution that lets the ULCD7 work like it used =
to,
>>> or is it no longer a supported BeagleBoard accessory?
>>=20
>> http://www.flickr.com/photos/koenkooi/6527657487
>>=20
>> That's with 3.0.12, but 3.0.14 works the same.
>=20
> I need a customizable touchpad UI.  I got "/dev/fb2 not found" and an
> abort when trying to run Xserver (which, as I said, used to work).
>=20
> What image recipe and related software did you install to get the
> result you show on flickr?

systemd-image with the gnome and xfce tasks installed. The image was =
built months ago and updated with opkg. I don't remember changing =
anything, but it is a while ago since I set it up.=

--Apple-Mail=_E81F84E4-2F3D-40F9-9D52-B5E009C785FF
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk77FY0ACgkQMkyGM64RGpF84ACfQfWRK4DAosXYnFe8dqUfDqlb
aroAnR+hoyEVfryZLUoTPrRR0Dsf1WP0
=YcCY
-----END PGP SIGNATURE-----

--Apple-Mail=_E81F84E4-2F3D-40F9-9D52-B5E009C785FF--
