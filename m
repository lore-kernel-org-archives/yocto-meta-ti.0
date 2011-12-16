Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B15DFE00303
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2011 08:03:14 -0800 (PST)
Received: (qmail invoked by alias); 16 Dec 2011 16:03:12 -0000
Received: from p5B0A1AB8.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.26.184]
	by mail.gmx.net (mp003) with SMTP; 16 Dec 2011 17:03:12 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19Y8xI5n1ZY80iOdZA/3MRL1IjLlKKUE81mp7Az4F
	kD1Jf2jy0K8rSV
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Dec 2011 17:03:34 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201112161021.49738.schnitzeltony@gmx.de>
	<F61A9010E56D7F4C93A19FD36DAAC3592FF98E@DFLE34.ent.ti.com>
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3592FF98E@DFLE34.ent.ti.com>
MIME-Version: 1.0
Message-Id: <201112161703.34351.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Is it intended to build TI bootloaders with march=armv5?
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
X-List-Received-Date: Fri, 16 Dec 2011 16:03:15 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, December 16, 2011 02:44:07 PM you wrote:
> Do you have the disassembly around the access?
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]
> on behalf of Andreas M=FCller [schnitzeltony@gmx.de] Sent: Friday, Decemb=
er
> 16, 2011 4:21 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Is it intended to build TI bootloaders with march=3Dar=
mv5?
>=20
> Hi
>=20
> as some of you might know, I am desperately working on u-boot SPL support
> for gumstix overo and having very strange effects: as soon as a stacic
> integer variable is accessed, the bootloader hangs [1].
>=20
> In the compile logs I found ( checked also for beagleboard ) that
>=20
> march=3Darmv5
>=20
> is used ( x-load is build with march=3Darmv7-a ). Is this intended? Could
> this explain my trouble?
>=20
> Andreas
>=20
> [1] http://lists.denx.de/pipermail/u-boot/2011-December/113491.html
>=20
>=20
Please give me a hint how/where to get this.

Andreas

