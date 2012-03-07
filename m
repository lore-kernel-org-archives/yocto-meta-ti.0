Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0B62E013A2
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 07:22:21 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so4735749wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 07:22:20 -0800 (PST)
Received: by 10.180.83.42 with SMTP id n10mr4717606wiy.9.1331133740627;
	Wed, 07 Mar 2012 07:22:20 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fa9sm36566137wib.5.2012.03.07.07.22.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 07:22:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+T6QP=hTW9YPMVwoQvqi+TgOrMJWXrC9ePH2trGbajCV4=6-Q@mail.gmail.com>
Date: Wed, 7 Mar 2012 16:22:18 +0100
Message-Id: <AFDEF0D3-01E3-4A50-889C-CB6748B488E5@dominion.thruhere.net>
References: <1331111487-21170-1-git-send-email-koen@dominion.thruhere.net>
	<CA+T6QP=hTW9YPMVwoQvqi+TgOrMJWXrC9ePH2trGbajCV4=6-Q@mail.gmail.com>
To: Jason Kridner <jkridner@beagleboard.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkirAUb8K9sISVjLsQz17W0CRGkiXb7irtE1DRhezwFqqxdYQiYFbHnXxRO/E8tVcGvlKnc
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] gadget init: don't dump info to info.txt on boot
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
X-List-Received-Date: Wed, 07 Mar 2012 15:22:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 7 mrt. 2012, om 16:20 heeft Jason Kridner het volgende geschreven:

> On Wednesday, March 7, 2012, Koen Kooi wrote:
> This script adds ~10s to the boot time, doesn't have error checking =
and prevents loading the storage gadget 3 out of 10 times.
>=20
> What is the root cause?  Would it be better to add error checking?

I'm not going to add error checking, so chances are slim it will get =
fixed in time for the release.

>  Remove it from ExecStartPre to get a fast, consistent boot. The =
functionality should be moved to bone101.
>=20
> If the drive is already mounted, is it valid to edit this file?  (I =
would think not.)

It wouldn't touch the drive, it would show the info on the webpage.

regards,

Koen=

