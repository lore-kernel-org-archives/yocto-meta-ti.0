Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB65EE003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 00:12:59 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so2045982wgb.11
	for <meta-ti@yoctoproject.org>; Sat, 03 Mar 2012 00:12:58 -0800 (PST)
Received: by 10.180.78.130 with SMTP id b2mr2117380wix.1.1330762378450;
	Sat, 03 Mar 2012 00:12:58 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bg3sm8115814wib.10.2012.03.03.00.12.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 00:12:57 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330721492-16982-1-git-send-email-Chase.Maupin@ti.com>
Date: Sat, 3 Mar 2012 09:13:00 +0100
Message-Id: <CC63D387-6DF4-4157-AA0D-601F43337F86@dominion.thruhere.net>
References: <1330721492-16982-1-git-send-email-Chase.Maupin@ti.com>
To: Chase Maupin <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmL0u3bh/tptJD5KrAmGq/Tfz3sS3XePuL/BYCq8Vz+Ftg1YM62FF0Ma8/oJNO5TYH7XQEG
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp: place configs in MACHINE directory
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
X-List-Received-Date: Sat, 03 Mar 2012 08:13:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 21:51 heeft Chase Maupin het volgende geschreven:

> * create a configs directory in the MACHINE directory for both
>  am335x-evm and beaglebone.  This resolves an issue with the
>  unpack step until a root cause for not finding the shared
>  configs diretory can be found.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> .../{ =3D> am335x-evm}/configs/empty                 |    0
> .../beaglebone}/configs/empty                      |    0
> 2 files changed, 0 insertions(+), 0 deletions(-)
> rename recipes-kernel/linux/linux-ti33x-psp-3.2/{ =3D> =
am335x-evm}/configs/empty (100%)
> copy recipes-kernel/linux/{files =3D> =
linux-ti33x-psp-3.2/beaglebone}/configs/empty (100%)
>=20
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty =
b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
> similarity index 100%
> rename from recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty
> rename to =
recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
> diff --git a/recipes-kernel/linux/files/configs/empty =
b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
> similarity index 100%
> copy from recipes-kernel/linux/files/configs/empty
> copy to =
recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


