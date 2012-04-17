Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77715E0044A
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 06:10:33 -0700 (PDT)
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 72A574B015E;
	Tue, 17 Apr 2012 15:10:27 +0200 (CEST)
Date: Tue, 17 Apr 2012 15:10:26 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120417151026.735c3d4e@eb-e6520>
In-Reply-To: <55674C9F-D066-4072-BCBB-DF2574127E33@dominion.thruhere.net>
References: <20120417142129.42cd2a67@eb-e6520>
	<55674C9F-D066-4072-BCBB-DF2574127E33@dominion.thruhere.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: Pandaboard & meta-ti
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
X-List-Received-Date: Tue, 17 Apr 2012 13:10:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Tue, 17 Apr 2012 14:36:49 +0200,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
> Op 17 apr. 2012, om 14:21 heeft Eric B=E9nard het volgende geschreven:
> > I've tried to build a xfce-nm-image for a Pandaboard (ES in the present
> > case) and it boots fine with the generated MLO, u-boot & uImage but I
> > don't manage to get a video output on both HDMI connectors : is there
> > something special to do here ?
> > (Same thing with systemd-image : I don't get any framebuffer output)
>=20
> Try booting with a monitor attached to a port, the EDID probe should pick=
 it up.
>=20
from memory that's what I did, the monitor is a standard TFT. I'll try
to provide more info when I try again as this is a home project ;-)

Thanks,
Eric

