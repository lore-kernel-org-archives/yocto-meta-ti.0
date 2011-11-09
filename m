Return-Path: <jkridner@beagleboard.org>
Received: from mail-qy0-f169.google.com (mail-qy0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEF8FE00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:52:06 -0800 (PST)
Received: by qyk31 with SMTP id 31so6366804qyk.14
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:52:05 -0800 (PST)
Received: by 10.229.48.213 with SMTP id s21mr366530qcf.5.1320857525411;
	Wed, 09 Nov 2011 08:52:05 -0800 (PST)
Received: from mail-vx0-f176.google.com (mail-vx0-f176.google.com
	[209.85.220.176])
	by mx.google.com with ESMTPS id dk1sm5541572qab.22.2011.11.09.08.52.04
	(version=SSLv3 cipher=OTHER); Wed, 09 Nov 2011 08:52:04 -0800 (PST)
Received: by vcbfk14 with SMTP id fk14so3449288vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:52:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.51.66 with SMTP id i2mr1041402obo.5.1320857523819; Wed, 09
	Nov 2011 08:52:03 -0800 (PST)
Received: by 10.182.188.98 with HTTP; Wed, 9 Nov 2011 08:52:03 -0800 (PST)
In-Reply-To: <333D792C-41CE-45E3-A358-46EC329BC830@dominion.thruhere.net>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
	<E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
	<083BC63EECB6FD41B8E81CF7FD87CC0F0444FD@DLEE09.ent.ti.com>
	<CA+T6QPmhDgFFgOr3tAmkfV6DasPj8ec5vrDyiGL55R12Z4_4uA@mail.gmail.com>
	<083BC63EECB6FD41B8E81CF7FD87CC0F04451C@DLEE09.ent.ti.com>
	<333D792C-41CE-45E3-A358-46EC329BC830@dominion.thruhere.net>
Date: Wed, 9 Nov 2011 11:52:03 -0500
Message-ID: <CA+T6QPmHwiR3xmboo4rDSdhiZhq-YAsd+GF2_NmX7P+B_No8OQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>
Subject: Re: [PATCH] gadget-init: Add network-gadget services and other fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 16:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 9, 2011 at 11:43 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 9 nov. 2011, om 17:32 heeft Fernandes, Joel A het volgende geschreven:
>>>
>>> This isn't a generic udhcp recipe. =A0It should probably just be
>>> renamed. =A0It is specifically for the point of providing addresses to
>>> the other end of the USB network gadget.
>>
>> Can we avoid making a new create for udhcpc then? I just feel it is over=
kill and this simple service/conf can go in this same recipe. I am ok with =
renaming the config and service files to gether-dhcp or the like. Let us kn=
ow your opinion so we can collectively take a call on how to go about doing=
 it.
>
> Think of what happens when you want to install a package with another udh=
cpc config, do you want to wipe out the gstorage setting as well in that ca=
se? All this needs to be modularized so people can mix&match, having a sing=
le big blob is not going to give a nice user experience. And as you might h=
ave guessed, I'm not too sold on including both the g_ether and gstorage in=
 on package (they can share the same recipe, though).
>
> In the end it's Jasons call how nice things need to be before we apply th=
e patch. I must warn that anytime we said "we'll fix it after the deadline"=
 for beagle stuff we never managed to fix it, the most recent example being=
 uLCD support.

I'll call Gerald and try to buy more time, but we need some more
concrete suggestions on how to make it clean.  I think this whole
g_ether --> g_storage experience is rather Bone specific and rather
integrated.  The best thing from my perspective is to be able to
easily replace it with more generic parts by disabling this whole
experience easily.

I'm DOA on Cloud9 right now anyway.  The one guy who was responding
has now stopped responding, so I'm going to e-mail a couple of
contacts there.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk66rcsACgkQMkyGM64RGpF2NQCfRVbFeUrFPGaJmaVVC/W/GQvh
> 9w0An0JpZmO4e0dQjOjeCJqvK5Q5deAh
> =3DaYbJ
> -----END PGP SIGNATURE-----
>
>

