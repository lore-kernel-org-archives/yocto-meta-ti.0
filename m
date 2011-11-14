Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5AEFE006B8
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 08:09:05 -0800 (PST)
Received: by wyg10 with SMTP id 10so1321791wyg.35
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 08:09:04 -0800 (PST)
Received: by 10.180.76.175 with SMTP id l15mr25766639wiw.67.1321286943724;
	Mon, 14 Nov 2011 08:09:03 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id en7sm12559123wib.0.2011.11.14.08.09.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 08:09:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94OKxPJKWy7eNxzMc-HXYJzpMh7pzKSjqotq38FcqWMTNA@mail.gmail.com>
Date: Mon, 14 Nov 2011 17:08:58 +0100
Message-Id: <4C8E7030-F3E3-4AD4-BB7E-291314C72531@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94OE+ALWZkov_w73bh4v2C85X-0MHg+RZDxFhOURqDsAYQ@mail.gmail.com>
	<DE33B98D-0A5F-4042-B821-DD8496B9AE59@dominion.thruhere.net>
	<CAPOJ94OKxPJKWy7eNxzMc-HXYJzpMh7pzKSjqotq38FcqWMTNA@mail.gmail.com>
To: Peter Bigot <bigotp@acm.org>
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
X-List-Received-Date: Mon, 14 Nov 2011 16:09:06 -0000
X-Groupsio-MsgNum: 135
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6E5F24FF-3006-4783-AA93-54533FC551A6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6E5F24FF-3006-4783-AA93-54533FC551A6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 14 nov. 2011, om 16:32 heeft Peter Bigot het volgende geschreven:

> On Mon, Nov 14, 2011 at 9:07 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 14 nov. 2011, om 15:57 heeft Peter Bigot het volgende geschreven:
>>=20
>>> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>=20
>>>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende =
geschreven:
>>>>=20
>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>=20
>>>>> Generalize the search for MLO to install to have correct path for =
copies
>>>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for =
SPL builds
>>>>> where there is no MLO.
>>>>>=20
>>>>> Allow user to override the loop mount point as well as the loop =
device, for
>>>>> folks who don't want long paths to temporary directories in their =
fstabs.
>>>>>=20
>>>>> Add noauto to example fstab entries so systems will boot without =
attempting
>>>>> to mount an unconfigured loopback device.
>>>>>=20
>>>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>>>=20
>>>> I like the fstab changes, but not the others, could you please =
split this patch?
>>>=20
>>> So I can prepare more appropriate patches now and in the future, =
please explain:
>>>=20
>>> * Why do you want to hard-code the MLO symlink paths in the install
>>> and deploy directories instead of using the bitbake variables that
>>> x-load.inc uses for those paths?
>>=20
>> Due to variable scoping those are only available inside those =
recipes, not the image class.
>=20
> Yes, but they're default-assigned, so an override in local.conf would
> apply to both, no?  Why does x-load allow them to be overridden?
> Maybe that'd be a clue as to the right way to change the point-of-use.
>=20
> What's the point of adding a nomachine symlink anyway?  A desire to
> avoid specifying the target filename in the cp command?  Consistently
> using MLO-${MACHINE} for the source and MLO for the target would be a
> lot more clear, since the target absolutely must be named "MLO".
>=20
> meta-ti now has two things that can create an MLO file (x-load and
> u-boot) and a third thing that uses it (sdcard_image), and they're
> inconsistent in how they name it.  Ick.

u-boot and x-load are now internally consistent with naming nowadays.



--Apple-Mail=_6E5F24FF-3006-4783-AA93-54533FC551A6
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BPR0ACgkQMkyGM64RGpEffQCfRZEp2xI2WKDzzhyn21fx23dz
OtoAn1TBbZD/bbsh7BhUHEZv9umHcBZ2
=GJIO
-----END PGP SIGNATURE-----

--Apple-Mail=_6E5F24FF-3006-4783-AA93-54533FC551A6--
