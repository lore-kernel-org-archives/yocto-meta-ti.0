Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AD49E00303
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:20:37 -0800 (PST)
Received: by wwi36 with SMTP id 36so6025715wwi.11
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:20:36 -0800 (PST)
Received: by 10.180.100.34 with SMTP id ev2mr25373174wib.41.1321280436785;
	Mon, 14 Nov 2011 06:20:36 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id i8sm12366727wie.11.2011.11.14.06.20.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 06:20:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXno8T=v61frO1eRvS0t+NMfR2JufALRimCsgUJJ3wWTdw@mail.gmail.com>
Date: Mon, 14 Nov 2011 15:20:30 +0100
Message-Id: <3FD3E4DD-ED39-4FF0-9AE3-182464089A74@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
	<CA+M6bXntXWXNwuMEes=hXx7ECUwDUbjnHvLZuJC4c0oU2at6kQ@mail.gmail.com>
	<0EC00F0A-F11C-46D7-9AA8-7519EC67A211@dominion.thruhere.net>
	<CA+M6bXno8T=v61frO1eRvS0t+NMfR2JufALRimCsgUJJ3wWTdw@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
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
X-List-Received-Date: Mon, 14 Nov 2011 14:20:38 -0000
X-Groupsio-MsgNum: 130
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4BB09236-28CA-4340-B40B-4698301F2D23";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4BB09236-28CA-4340-B40B-4698301F2D23
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 14 nov. 2011, om 15:19 heeft Tom Rini het volgende geschreven:

> On Mon, Nov 14, 2011 at 3:15 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 13 nov. 2011, om 22:06 heeft Tom Rini het volgende geschreven:
>>=20
>>> On Sun, Nov 13, 2011 at 11:57 AM, Peter Bigot <bigotp@acm.org> =
wrote:
>>>> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>=20
>>>>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende =
geschreven:
>>>>>=20
>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>=20
>>>>>> Generalize the search for MLO to install to have correct path for =
copies
>>>>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for =
SPL builds
>>>>>> where there is no MLO.
>>>>>>=20
>>>>>> Allow user to override the loop mount point as well as the loop =
device, for
>>>>>> folks who don't want long paths to temporary directories in their =
fstabs.
>>>>>>=20
>>>>>> Add noauto to example fstab entries so systems will boot without =
attempting
>>>>>> to mount an unconfigured loopback device.
>>>>>>=20
>>>>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>>>>=20
>>>>> I like the fstab changes, but not the others, could you please =
split this patch?
>>>>=20
>>>> Sure, next time I have to sync with meta-ti.  Without the MLO fixes
>>>> I'd end up with something that doesn't work, and I don't want to =
blow
>>>> another half hour testing a script I can't use.
>>>=20
>>> I guess I need to hurry up and bug Koen about switching beagleboard =
to
>>> the SPL tree then :)
>>=20
>> Does your v3 work when applied on top of 2011.09?
>=20
> Won't apply, no.  But my 05.03.01.00 branch is good for beagleboard,
> am3517* and omap3evm.


How much non-beagle and non-SPL patches does that have in there? For =
beagle we *really* want as little patches on top of upstream as =
possible. If that means moving to latest denx git, so be it.

regards,

Koen=

--Apple-Mail=_4BB09236-28CA-4340-B40B-4698301F2D23
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BI7EACgkQMkyGM64RGpFIHQCfZ/oF8ONg/TXTUQ3zk7V7EPGs
4TgAoIpkoPaA3HkgsIEoVLP3zhR2EayL
=xAJW
-----END PGP SIGNATURE-----

--Apple-Mail=_4BB09236-28CA-4340-B40B-4698301F2D23--
