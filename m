Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1ED3DE00306
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2011 01:05:35 -0800 (PST)
Received: (qmail invoked by alias); 19 Dec 2011 09:05:32 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp071) with SMTP; 19 Dec 2011 10:05:32 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+1d6xG6461K28IopCyPGEEnuBa6+P5/yKAxglaeU
	BLtQCprUhD6xI/
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Dec 2011 10:05:40 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.4-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <201112161021.49738.schnitzeltony@gmx.de>
In-Reply-To: <201112161021.49738.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201112191005.40699.schnitzeltony@gmx.de>
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
X-List-Received-Date: Mon, 19 Dec 2011 09:05:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, December 16, 2011 10:21:49 AM Andreas M=FCller wrote:
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
To avoid further efforts on this path:

* armv5 is intended by u-boot
* for test I modified the config.mk files to set up armv7-a and tested: Sam=
e mess=20
when calling i2c_init or i2c_set_bus_num.

Andreas

