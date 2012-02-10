Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BA0EE003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:15:05 -0800 (PST)
Received: by werf1 with SMTP id f1so2763504wer.35
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:15:04 -0800 (PST)
Received: by 10.216.133.18 with SMTP id p18mr1078243wei.1.1328890504697;
	Fri, 10 Feb 2012 08:15:04 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q7sm4211356wix.5.2012.02.10.08.15.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 08:15:04 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
Date: Fri, 10 Feb 2012 17:15:00 +0100
Message-Id: <3ED328D4-BA57-41C2-8044-2C09617E5C32@dominion.thruhere.net>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
	<35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQkGmETsEMk5N7gQtEUpuHSPVnDdqXr72AClrz8YX1Uj9uB6eMUa4IYy1A5X8YMEMzY52qEU
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Merging in linux-stable updates, git send-email
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
X-List-Received-Date: Fri, 10 Feb 2012 16:15:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 10 feb. 2012, om 17:05 heeft Maupin, Chase het volgende geschreven:

> So you changed the recipe name to use 3.2.5 for the PV.  But when I =
set the DISTRO_FEATURES to include tipspkernel I don't get all the =
patches you added to update to 3.2.5.  So can you maybe do a logic =
similar to how the patches are handled to set the PV based on whether =
tipspkernel is set in DISTRO_FEATURES?

I have updated the patch locally to keep PV at 3.2. I can live with PV =
being "wrong" for the patched kernel till we figure out the python =
magic. Using gitpkgv would get us around all this, but that's a story =
for another day :)

regards,

Koen

>=20
> Sincerely,
> Chase Maupin
> Software Applications
> ARM MPU
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
>=20
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/=20
>=20
>=20
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Friday, February 10, 2012 9:16 AM
>> To: Maupin, Chase
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] Merging in linux-stable updates, git send-
>> email
>>=20
>>=20
>> Op 10 feb. 2012, om 16:05 heeft Maupin, Chase het volgende
>> geschreven:
>>=20
>>> Koen,
>>>=20
>>> Which recipe are you going to update here?  I assume this is not
>> the linux-ti33x-psp_3.2.bb recipe but something else?
>>=20
>> Exactly that recipe: https://github.com/Angstrom-distribution/meta-
>> ti/commit/a77ccb569019bba7cefc72e598504d26a72fa596
>>=20
>> regards,
>>=20
>> Koen
>>=20
>>>=20
>>> Sincerely,
>>> Chase Maupin
>>> Software Applications
>>> ARM MPU
>>> e-mail: chase.maupin@ti.com
>>> phone: (214) 567-2950
>>>=20
>>> For support:
>>> Forums - http://community.ti.com/forums/
>>> Wiki - http://wiki.davincidsp.com/
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>>>> Sent: Friday, February 10, 2012 8:08 AM
>>>> To: meta-ti@yoctoproject.org
>>>> Subject: [meta-ti] Merging in linux-stable updates, git send-
>> email
>>>>=20
>>>> Hi,
>>>>=20
>>>> The update to 3.2.5 for the bone kernel is almost done, but it
>>>> involves adding ~275 patches. Does it make sense to git-send-
>> email
>>>> that megapatch for review? The difficulty is rooted in the
>> origin
>>>> of the TI kernel: linux-omap instead of Linus' tree, so we can't
>>>> (easily) rebase all the patches on top of 3.2.5, so it's
>> actually
>>>> 3.2.5 rebased onto TI v3.2-staging and then the extra beaglebone
>>>> patches added.
>>>>=20
>>>> Git am -3 takes care of duplicate patches and automerging
>> conflicts
>>>> but I'd still like to find out what the best way to review this
>> is.
>>>>=20
>>>> regards,
>>>>=20
>>>> Koen
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>=20


