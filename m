Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37226E003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 07:15:37 -0800 (PST)
Received: by wibhq12 with SMTP id hq12so2734685wib.35
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 07:15:37 -0800 (PST)
Received: by 10.180.86.9 with SMTP id l9mr9899086wiz.15.1328886936732;
	Fri, 10 Feb 2012 07:15:36 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eq5sm18840953wib.2.2012.02.10.07.15.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 07:15:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
Date: Fri, 10 Feb 2012 16:15:32 +0100
Message-Id: <35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQmYw7D3hpmVy4rlD86tyoLZaGChMnuqu5CFUJCB/ayUcpK2mJyVCO4bfVebU6Vr6n4vcPYm
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
X-List-Received-Date: Fri, 10 Feb 2012 15:15:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 10 feb. 2012, om 16:05 heeft Maupin, Chase het volgende geschreven:

> Koen,
>=20
> Which recipe are you going to update here?  I assume this is not the =
linux-ti33x-psp_3.2.bb recipe but something else?

Exactly that recipe: =
https://github.com/Angstrom-distribution/meta-ti/commit/a77ccb569019bba7ce=
fc72e598504d26a72fa596

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
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>> Sent: Friday, February 10, 2012 8:08 AM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] Merging in linux-stable updates, git send-email
>>=20
>> Hi,
>>=20
>> The update to 3.2.5 for the bone kernel is almost done, but it
>> involves adding ~275 patches. Does it make sense to git-send-email
>> that megapatch for review? The difficulty is rooted in the origin
>> of the TI kernel: linux-omap instead of Linus' tree, so we can't
>> (easily) rebase all the patches on top of 3.2.5, so it's actually
>> 3.2.5 rebased onto TI v3.2-staging and then the extra beaglebone
>> patches added.
>>=20
>> Git am -3 takes care of duplicate patches and automerging conflicts
>> but I'd still like to find out what the best way to review this is.
>>=20
>> regards,
>>=20
>> Koen
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


