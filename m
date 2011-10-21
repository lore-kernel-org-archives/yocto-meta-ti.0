Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2A01E01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 02:14:50 -0700 (PDT)
Received: by eyh5 with SMTP id 5so5012612eyh.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 02:14:49 -0700 (PDT)
Received: by 10.14.10.225 with SMTP id 73mr1767289eev.110.1319188488904;
	Fri, 21 Oct 2011 02:14:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z58sm33142990eea.3.2011.10.21.02.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 02:14:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EA1364A.8000605@ts.fujitsu.com>
Date: Fri, 21 Oct 2011 11:14:46 +0200
Message-Id: <2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
References: <4EA1364A.8000605@ts.fujitsu.com>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building for TI 8148 EVM
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
X-List-Received-Date: Fri, 21 Oct 2011 09:14:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 11:07 heeft Rainer Koenig het volgende geschreven:

> Hi,
>=20
> I'm currently trying to build an image for the TI 8148 EVM board. For
> that I added the meta-ti layer to the standard Yocto/Edison =
environment.

Please follow the instructions detailed in the meta-ti README: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/tree/README

Yocto/Poky lacks support for various meta-ti (and OE-classic) constructs =
needed for a successfull build. Following the instructions above you =
will get a proper setup.

regards,

Koen=

