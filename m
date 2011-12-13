Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4DA20E006DF
	for <meta-ti@yoctoproject.org>; Mon, 12 Dec 2011 16:54:34 -0800 (PST)
Received: (qmail invoked by alias); 13 Dec 2011 00:54:33 -0000
Received: from p5B0A2D4D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.45.77]
	by mail.gmx.net (mp006) with SMTP; 13 Dec 2011 01:54:33 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/nGLkxfIHnjCNIoG47RWxh0zqIK6F8gFQnt2JMro
	V7MXG4lUN0fVV8
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Dec 2011 01:54:52 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201112130154.53016.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Tue, 13 Dec 2011 00:54:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, December 08, 2011 03:49:47 PM Tom Rini wrote:
> On Wed, Dec 7, 2011 at 6:13 PM, Andreas M=FCller <schnitzeltony@gmx.de> w=
rote:
> > On Sunday, November 27, 2011 04:03:37 PM Koen Kooi wrote:
> >> Runtime tested on an xM rev C
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >>  ...-probe-DDC-bus-for-expansionboard-EEPROMS.patch |  165 ----------
> >>  ...p3-mem-Comment-enable_gpmc_cs_config-more.patch |   56 ++++
> >>  ...e-SDRC-dram_init-to-always-call-make_cs1_.patch |   66 ++++
> >>  ...-a-helper-function-to-set-timings-in-SDRC.patch |  172 +++++++++++
> >>  ...e-mem_ok-to-clear-again-after-reading-bac.patch |   30 ++
> >>  .../0005-OMAP3-Remove-get_mem_type-prototype.patch |   28 ++
> >>  .../0006-omap3-mem-Add-MCFG-helper-macro.patch     |   97 ++++++
> >>  ...d-optimal-SDRC-autorefresh-control-values.patch |   59 ++++
> >>  ...x-all-Micron-memory-timing-parts-with-the.patch |   55 ++++
> >>  ...ework-memory-initalization-and-devkit8000.patch |  174 +++++++++++
> >>  ...OMAP3-SPL-Add-identify_nand_chip-function.patch |  142 +++++++++
> >>  ...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch |  315
> >=20
> > Is anybody working on SPL support for gumstix overo?
>=20
> No, but in mainline U-Boot it should be very easy to do so and I'd be
> glad to help out with questions on the SPL specific side of things
> (basically overo needs to provide a function that returns the correct
> timings for the SDRC for the board rev in question).
Got overo board revisions 0 & 1 booting fine from SDcard ( revision 2 might=
 need=20
further alignment.. ) [1].=20

To prevent modifying multiple locations I left=20

CONFIG_SYS_TEXT_BASE           0x80080000

To test NAND I did on u-boot console ( based on [2] )

| nand erase.chip
| mmc rescan 0

| # write MLO
| fatload mmc 0 $loadaddr MLO
| nandecc hw
| nand write $loadaddr 0 ${filesize}

| # write u-boot
| fatload mmc 0 ${loadaddr} u-boot.bin
| nand write ${loadaddr} 80000 ${filesize}

| # write the kernel
| fatload mmc 0 ${loadaddr} uImage
| nand write ${loadaddr} 280000 ${filesize}

After power off / power on without SDcard I get

| Boot SPL 2011.09-01172-gfdbe8b9-dirty (Dec 13 2011 - 00:58:36)
| Texas Instruments Revision detection unimplemented
Is it correct that this is only implemented for OMAP4/5 so for OMAP3 this=20
message is OK?
| mkimage signature not found - ih_magic =3D ea000014
| Assuming u-boot.bin ..

Asking google for 'mkimage signature not found' showed me many pastebins bu=
t no=20
answer. Anybody out there with a hint?

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-
gumstix/blobs/master/recipes-bsp/u-boot/2011.09/0001-u-boot-add-SPL-
support.patch
[2] http://www.gumstix.org/how-to/70-writing-images-to-flash.html

