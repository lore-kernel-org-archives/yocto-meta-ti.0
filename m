Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39152E01373
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:20:06 -0800 (PST)
Received: by werb10 with SMTP id b10so2487689wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:20:06 -0800 (PST)
Received: by 10.216.137.4 with SMTP id x4mr3501490wei.15.1327328406146;
	Mon, 23 Jan 2012 06:20:06 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fr8sm32202733wib.10.2012.01.23.06.20.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:20:05 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 23 Jan 2012 15:20:05 +0100
Message-Id: <3E3A330E-A821-4CD4-A983-EE798CEF58DF@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQn5Wl99MmQ4LmuaHGDquHULvR0Dlr8KuAc007K0SRcYWkOgIf2xU+LBVjqAn1HmU8Ur0nlI
Subject: Re: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 14:20:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 jan. 2012, om 15:18 heeft Koen Kooi het volgende geschreven:

> This series reworks the packaging of the sgx recipes in the following =
ways:
>=20
> 1) all the es 'versions' are now subpackaged in to PN-foo-es<version =
and PN-foo RRECOMMENDS all of them
> 2) the DRI WS is now packaged as well
> 3) For recent SDKs the X11 WS is packaged, but nothing is done to =
shuffle the base libraries around
> 4) all the PN-foo subpackages remove /etc/powervr-esrev to trigger the =
relocation code
> 5) the initscript doesn't depend in the the 'initscripts' package =
anymore making use work in a systemd world as well as a sysvinit world.=20=

>=20
> The most noticable effect is that user can now deinstall (e.g. using =
BAD_RECOMMENDATIONS) all the es 'versions' they don't need saving a few =
megabytes of space.
>=20
> Koen Kooi (7):
>  libgles-omap3: split support for ES revisions into subpackages where
>    possible
>  libgles-omap3: merge in updates from arago
>  libgles-omap3: package DRI windowing system as well
>  libgles-omap3: install X11 windowing system for newer SDK releases as
>    well
>  libgles-omap3: adjust packaging for all windowing systems to remove
>    the magic esrev file
>  omap3-sgx-modules: add 4.05.00.03
>  libgles-omap3: add 4.05.00.03

And you can find it as a git branch at =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/log/?h=3Dsgx-rework=

