Return-Path: <prvs=442568cee5=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE197E013BA
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 06:21:36 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=442568cee5=christian.schulenberg@bmw.de>)
	id 1S4Yn8-000067-Ac; Mon, 05 Mar 2012 15:21:34 +0100
Received: from [160.46.252.50] (helo=cmtamx4b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S4Yn6-0006zC-V8; Mon, 05 Mar 2012 15:21:33 +0100
Received: from cmtabb6a.muc (cmtabb6a.muc [160.50.100.27])
	by cmtamx4a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q25ELHTQ016017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 Mar 2012 15:21:24 +0100
Received: from SMUCH01A.europe.bmw.corp (smuch01a.muc [160.50.20.68])
	by cmtabb6a.muc (8.13.8/8.13.8) with ESMTP id q25ELDfT017692;
	Mon, 5 Mar 2012 15:21:13 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH01A.europe.bmw.corp ([160.50.20.68]) with mapi;
	Mon, 5 Mar 2012 15:21:08 +0100
From: <Christian.Schulenberg@bmw.de>
To: <rpjday@crashcourse.ca>
Date: Mon, 5 Mar 2012 15:21:07 +0100
Thread-Topic: [meta-ti] Building Yocto for Pandaboard
Thread-Index: Acz60JcBcReQcrNiQ6y0ao6GmDKUJgACGnhw
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203050730440.30632@oneiric>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-938205
X-purgate-sourceid: 1S4Yn6-0006zC-V8
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330957293-00004A46-CC2653E5/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-5443cb
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 05 Mar 2012 14:21:37 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.

You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda=
.conf:

#EXTRA_IMAGEDEPENDS =3D "x-load u-boot-sakoman " -> remove or comment this =
line out
EXTRA_IMAGEDEPENDS +=3D "u-boot" -> I used this line, but because omap4430-=
panda.conf includes omap3.inc, it should be obsolete. Same definition is in=
 there. X-Load can be removed from omap3.inc from my point of view, because=
 it's not necessary.

#PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-sakoman"  -> remove or c=
omment this line out
PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"

Your question about gcc4.7: I haven't used this version yet.

I have build core-image-base as well as core-image-basic successfully for P=
andaboard. I connect to the board via the serial interface, so I don't need=
 a configured eth0 yet.

Thanks for your suggestion about systemd. I will try to pull in system in t=
he next days.

BR,
Christian




-----Urspr=FCngliche Nachricht-----
Von: Robert P. J. Day [mailto:rpjday@crashcourse.ca]=20
Gesendet: Montag, 5. M=E4rz 2012 14:05
An: Schulenberg Christian, EI-42
Cc: meta-ti mailing list
Betreff: Re: [meta-ti] Building Yocto for Pandaboard


  i'd like to try to reproduce what's below, so a few questions first.
is this for a regular panda, or a 4460-based panda ES?  i'm
specifically interested in the ES, but there's a good chance a regular
build will still at least boot and i'll worry about any weirdness
later.  and i don't see anything in the meta-ti layer yet
*specifically* for the 4460.

  FYI, my setup is 64-bit ubuntu 11.10 with fully pulled

  * yocto
  * meta-ti
  * meta-openembedded (with underlying meta-oe layer, of course)

  and now, the stupid questions ...

On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:

> Hi,
>
> finally, I managed to bring up the Pandaboard with the meta-ti layer
> by myself. For all of you, who are facing the same problems and who
> don't want to use Angstrom, here are some hints, how to do this just
> using Yocto Poky:
>
> Remove systemd in local.conf as mentioned above.

  i remember that issue and, rather than remove systemd, i followed
someone else's suggestion and just added the meta-oe layer to pull it
in.  here's my layers info, does it look sane?  (is that the correct
order to get the right precedence?)

BBLAYERS ?=3D " \
  /home/rpjday/yocto/git/meta \
  /home/rpjday/yocto/git/meta-yocto \
  /home/rpjday/yocto/git/meta-openembedded/meta-oe \
  /home/rpjday/yocto/git/meta-ti \
  "

if systemd is truly a problem, i can take it out.

> I used machine configuration for "omap4430-panda", because machine
> "pandaboard" did not build the kernel.  i suspect the "pandaboard"
> file will be disappearing given its superfluity.

i noticed that already, that's what i'll be using as well.

> Because this configuration use the sakoman bootloader, which caused
> some trouble for me, I switched over to (denx) u-boot.

  and you did that how?

> Use gcc4.5 instead of gcc4.6. The reason for this is a compiler
> error that came up when compiling the u-boot bootloader. You can
> change the compiler in ./meta/conf/distro/include/tcmode-default.inc
> , variable GCCVERSION. Another alternative might be patching the
> gcc4.6, because there is already a fix for this compiler error.

  based on what i read here:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24=
283.html

can i just add that line

GCCVERSION =3D "4.7%"

to my local.conf?  might as well jump up to gcc 4.7.

  and i currently get a fetch error for udev 173, so i set the
PREFERRED_VERSION to 181.  did you not get such an error?  more later.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

