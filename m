Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B66DDE0059B
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:04:09 -0800 (PST)
Received: by wgbdq12 with SMTP id dq12so962339wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 14:04:08 -0800 (PST)
Received: by 10.180.96.8 with SMTP id do8mr28761731wib.21.1328738648122;
	Wed, 08 Feb 2012 14:04:08 -0800 (PST)
Received: from [172.20.1.20] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y6sm2750711wix.10.2012.02.08.14.04.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 14:04:07 -0800 (PST)
References: <4F32F016.4020008@gmail.com>
In-Reply-To: <4F32F016.4020008@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <FB5B1FDD-43CA-4F8B-B6AD-E9288B165C4D@dominion.thruhere.net>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 8 Feb 2012 23:04:01 +0100
To: jfabernathy <jfabernathy@gmail.com>
X-Gm-Message-State: ALoCoQk/P3gQ1bNoP9O5HoJE8jVGZKYlm0gVGe+40ZuU+k9+SFtZjipquHPFrAiQO6e9R/H5lfWN
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Wed, 08 Feb 2012 22:04:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

There's a README in the layer, read it and follow the instructions

Op 8 feb. 2012 om 22:58 heeft jfabernathy <jfabernathy@gmail.com> het volgen=
de geschreven:

> I'm trying to build the pandaboard BSP for Yocto.  I cloned the meta-ti re=
pository in the poky directory and tried to build core-image-sato for both m=
achine pandaboard and omap4430-panda. However, I immediately get an error be=
cause bitbake is looking for recipes-images/angstrom/systemd-image.bb, which=
 is required in the ti-hw-bringup-image.bb image recipe.
>=20
> All I really included was the machine name change in local.conf and added t=
he meta-ti layer in bblayers.conf.
>=20
> Did I miss a step?
>=20
> Jim A
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

