Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 305A4E01376
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:34:26 -0700 (PDT)
Received: by wyf19 with SMTP id 19so8332233wyf.35
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:34:25 -0700 (PDT)
Received: by 10.227.155.204 with SMTP id t12mr971209wbw.46.1319438065757;
	Sun, 23 Oct 2011 23:34:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n21sm37080610wbp.2.2011.10.23.23.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 23:34:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <083BC63EECB6FD41B8E81CF7FD87CC0F040A57@DLEE09.ent.ti.com>
Date: Mon, 24 Oct 2011 08:34:18 +0200
Message-Id: <1CDFBEE6-D267-40AE-A00D-5D3DB19A0490@dominion.thruhere.net>
References: <083BC63EECB6FD41B8E81CF7FD87CC0F040A57@DLEE09.ent.ti.com>
To: "Fernandes, Joel A" <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: linux-ti33x-psp_3.0+3.1rc SRCREV
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
X-List-Received-Date: Mon, 24 Oct 2011 06:34:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 23 okt. 2011, om 23:27 heeft Fernandes, Joel A het volgende =
geschreven:

> Dear Koen,
> =20
> In the last update to SRCREV,
> =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/commit/?id=3Dab07a0ea4be961a7e8c7b8b64a56ce6c730cd6e0
> =20
> The Commit: c7fc664a6a36a4721b43dc287e410a2453f0b782 doesn=92t exist =
anymore in arago. Due to this the fetch breaks.
> =20
> joel@minted ~/repo/linux-omap-2.6 $ git show =
c7fc664a6a36a4721b43dc287e410a2453f0b782
> fatal: bad object c7fc664a6a36a4721b43dc287e410a2453f0b782
> =20
> Either the Arago tree was rebased or the commit ID is not valid.

It was rebased:

commit c7fc664a6a36a4721b43dc287e410a2453f0b782
Author: Ajay Kumar Gupta <ajay.gupta@ti.com>
Date:   Fri Oct 21 14:18:25 2011 +0530

    am335xevm: defconfig: usb setup
   =20
    Made one gadget (DBGP) as builtin for USB1 port and other gadget =
driver as
    modules for USB0 port.

commit 7a68182e84ec58909a31a37d3c21619ed8ab2111
Author: Ajay Kumar Gupta <ajay.gupta@ti.com>
Date:   Fri Oct 21 10:32:12 2011 +0530

    usb: ether_gadget: fix insmod panic after fsg rmmod
   =20
    Fixes kernel panic seen during g_ether.ko module insertion performed
    after the FSG gadget rmmod.
   =20
    Ether gadget doesn't reset the usb_ep(s) during initialization and
    so was getting the previous gadget's usb_ep->desc data.

commit 4be081bbeab0973ae2021622af828be215a3c0ca
Author: Ravi B <ravibabu@ti.com>
Date:   Wed Oct 19 21:26:55 2011 +0530

    usb: am335x: gadget: add option for dbgp as one builtin gadget
   =20
    DBGP is added as only gadget option to be selected for a port as
    builtin driver. The gadget driver for other ports can be compiled
    as module and inserted after the bootups.



