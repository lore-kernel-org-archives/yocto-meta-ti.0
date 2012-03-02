Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1073E003E1
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2012 12:29:50 -0800 (PST)
Received: by werc1 with SMTP id c1so1783539wer.35
	for <meta-ti@yoctoproject.org>; Fri, 02 Mar 2012 12:29:49 -0800 (PST)
Received: by 10.180.100.196 with SMTP id fa4mr7927058wib.0.1330720189438;
	Fri, 02 Mar 2012 12:29:49 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hn8sm15258489wib.11.2012.03.02.12.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 12:29:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>
Date: Fri, 2 Mar 2012 21:29:50 +0100
Message-Id: <351DB87E-545E-479E-8183-C5072355906C@dominion.thruhere.net>
References: <20120301212837.C08F852A8A@arago-project.org>
	<50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQklodBdQL5c0EBqMzlHbxaR1J4jVNUoYQFfWChQu1V5AG031L5I0Cn2+k0t1FVtv1v8GfoM
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Fri, 02 Mar 2012 20:29:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Any ETA on a fix? If it will take a few days I suggest reverting the =
cset that moved the configs/ dir so I won't have to deal with the =
weekend workers hitting this bug :)

regards,

Koen

Op 2 mrt. 2012, om 16:49 heeft Maupin, Chase het volgende geschreven:

> Koen,
>=20
> Looks like my build was not clean.  I see now that when I clean =
everything even the am335x-evm build will fail to find the configs.  So =
now the question is why this happens.  I'm used to if the configs wasn't =
found in the beaglebone or am335x-evm directory, you would fall back to =
looking in the base linux-ti33x-psp-3.2 directory.  However, it looks =
like this fallback does not happen.  My reading of FILESPATH is that the =
linux/linux-ti33x-psp-3.2 directory is in the FILESPATH.
>=20
> Sincerely,
> Chase Maupin
> Software Applications
> ARM MPU
>=20
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/=20
>=20
>=20
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Friday, March 02, 2012 8:58 AM
>> To: Maupin, Chase
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] Chase Maupin : linux-ti33x-psp: add am335x-
>> evm support
>>=20
>>=20
>> Op 1 mrt. 2012, om 22:28 heeft Arago Project git het volgende
>> geschreven:
>>=20
>>> Module: meta-ti
>>> Branch: master
>>> Commit: 8172b803e73126c2e336050d43251538bdc4d09b
>>> URL:    http://arago-project.org/git/meta-
>> ti.git?a=3Dcommit;h=3D8172b803e73126c2e336050d43251538bdc4d09b
>>>=20
>>> Author: Chase Maupin <Chase.Maupin@ti.com>
>>> Date:   Tue Feb 28 17:28:14 2012 -0600
>>>=20
>>> linux-ti33x-psp: add am335x-evm support
>>>=20
>>> * Added a defconfig file for the am335x-evm and moved the common
>>> configs directory from the beaglebone directory to the top
>>> of the kernel files tree.
>>>=20
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>=20
>>> ---
>>>=20
>>> .../linux/linux-ti33x-psp-3.2/am335x-evm/defconfig | 2640
>> ++++++++++++++++++++
>>> .../{beaglebone =3D> }/configs/empty                 |    0
>>> 2 files changed, 2640 insertions(+), 0 deletions(-)
>>=20
>> As Gary points out, this breaks the beaglebone kernel build
>>=20
>> regards,
>>=20
>> Koen


