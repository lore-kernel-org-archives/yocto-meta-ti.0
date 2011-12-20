Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 04894E01217
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 02:55:34 -0800 (PST)
Received: (qmail invoked by alias); 20 Dec 2011 10:55:30 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp026) with SMTP; 20 Dec 2011 11:55:30 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+rGIIdac+rmJeQ0+d3B157KVYDgqkvHG3FfLm81m
	pXRrWgHKGP62S6
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Dec 2011 11:55:39 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.4-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <201112201115.39033.schnitzeltony@gmx.de>
	<FEF0BC67-DB90-448F-B36A-F847037D4CBE@dominion.thruhere.net>
In-Reply-To: <FEF0BC67-DB90-448F-B36A-F847037D4CBE@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201112201155.39426.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: commit b72cb13fcf83b9d342808ea30379bfb6a1321b54 breaks parse
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
X-List-Received-Date: Tue, 20 Dec 2011 10:55:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 20, 2011 11:31:47 AM Koen Kooi wrote:
> Op 20 dec. 2011, om 11:15 heeft Andreas M=FCller het volgende geschreven:
> > On all my build machines  I get
> >=20
> > Loading cache: 100% |
> > #######################################################################=
##
> > #####################################################################|
> > ETA:  00:00:00
> > Loaded 1880 entries from dependency cache.
> > ERROR: Unable to parse
> > /home/andreas/data/oe-core/sources/meta-ti/recipes-
> > kernel/linux/linux_3.1.bb
>> ...
> > IOError: [Errno 2] No such file or directory:
> > '/home/andreas/data/Downloads/packets/dl/defconfig'
>=20
> I'm not seeing any of that, but I'm keeping an eye on it.
Hm.. can you try to set DL_DIR outside of OE_BASE?

Andreas

