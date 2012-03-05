Return-Path: <prvs=442568cee5=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D5A2E0074A
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 07:29:45 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=442568cee5=christian.schulenberg@bmw.de>)
	id 1S4Zr5-0002qK-Vg; Mon, 05 Mar 2012 16:29:44 +0100
Received: from [160.46.252.50] (helo=cmtamx4b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S4Zr5-0006bZ-7f; Mon, 05 Mar 2012 16:29:43 +0100
Received: from cmtabb6a.muc (cmtabb6a.muc [160.50.100.27])
	by cmtamx4a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q25FTZ1q012021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 Mar 2012 16:29:36 +0100
Received: from SMUCH06B.europe.bmw.corp (smuch06b.muc [160.50.20.56])
	by cmtabb6a.muc (8.13.8/8.13.8) with ESMTP id q25FTYm5023033;
	Mon, 5 Mar 2012 16:29:34 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH06B.europe.bmw.corp ([160.50.20.56]) with mapi;
	Mon, 5 Mar 2012 16:29:34 +0100
From: <Christian.Schulenberg@bmw.de>
To: <rpjday@crashcourse.ca>
Date: Mon, 5 Mar 2012 16:29:32 +0100
Thread-Topic: AW: [meta-ti] Building Yocto for Pandaboard
Thread-Index: Acz64wXSikBLf1L3RYaevDguFJXcvQAAUw1A
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C2EB9CA@SMUCM08V.europe.bmw.corp>
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
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051014001.6054@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203051014001.6054@oneiric>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-938205
X-purgate-sourceid: 1S4Zr5-0006bZ-7f
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330961383-00001942-9514915B/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-1fca43
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
X-List-Received-Date: Mon, 05 Mar 2012 15:29:45 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

No, as I wrote previously, the compiler error I have belongs to the source =
code of the bootloader (seems to be a problem with structure aligning). The=
 problem you have is in the kernel.

-----Urspr=FCngliche Nachricht-----
Von: Robert P. J. Day [mailto:rpjday@crashcourse.ca]=20
Gesendet: Montag, 5. M=E4rz 2012 16:17
An: Schulenberg Christian, EI-42
Cc: meta-ti@yoctoproject.org
Betreff: Re: AW: [meta-ti] Building Yocto for Pandaboard

On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:

> Hi,
>
> I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
>
> You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-pan=
da.conf:
>
> #EXTRA_IMAGEDEPENDS =3D "x-load u-boot-sakoman " -> remove or comment thi=
s line out
> EXTRA_IMAGEDEPENDS +=3D "u-boot" -> I used this line, but because omap443=
0-panda.conf includes omap3.inc, it should be obsolete. Same definition is =
in there. X-Load can be removed from omap3.inc from my point of view, becau=
se it's not necessary.
>
> #PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-sakoman"  -> remove or=
 comment this line out
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>
> Your question about gcc4.7: I haven't used this version yet.
>
> I have build core-image-base as well as core-image-basic successfully for=
 Pandaboard. I connect to the board via the serial interface, so I don't ne=
ed a configured eth0 yet.
>
> Thanks for your suggestion about systemd. I will try to pull in system in=
 the next days.

  without making any of the above changes (since it doesn't appear it
would affect what i'm doing), i'm getting a build error that goes back
many months:

ERROR: Function failed: do_compile_perf (see /home/rpjday/yocto/builds/omap=
4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-=
r0/temp/log.do_compile_perf.29777 for further information)
NOTE: make -j 8 -C /home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap44=
30_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf CC=3Darm=
-poky-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-=
interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D=
/home/rpjday/yocto/builds/omap4430_panda/tmp/sysroots/omap4430-panda LD=3Da=
rm-poky-linux-gnueabi-ld --sysroot=3D/home/rpjday/yocto/builds/omap4430_pan=
da/tmp/sysroots/omap4430-panda  prefix=3D/usr NO_NEWT=3D1 NO_DWARF=3D1
make: Entering directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work=
/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
PERF_VERSION =3D ti.ubuntu.2.6.35.993.3
make: Leaving directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/=
omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
make: Entering directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work=
/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
    GEN common-cmds.h
    * new build flags or prefix
touch .perf.dev.null
    GEN perf-archive
    CC builtin-annotate.o
    CC builtin-bench.o
    CC bench/sched-messaging.o
    CC bench/sched-pipe.o
    CC bench/mem-memcpy.o
    CC builtin-diff.o
    CC builtin-sched.o
bench/sched-pipe.c: In function 'bench_sched_pipe':
bench/sched-pipe.c:58:6: error: variable 'ret' set but not used [-Werror=3D=
unused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [bench/sched-pipe.o] Error 1
make: *** Waiting for unfinished jobs....
    CC builtin-buildid-list.o
builtin-sched.c: In function 'process_sched_event':
builtin-sched.c:373:12: error: variable 'delta' set but not used [-Werror=
=3Dunused-but-set-variable]
builtin-sched.c: In function 'run_one_test':
builtin-sched.c:564:39: error: variable 'std_dev' set but not used [-Werror=
=3Dunused-but-set-variable]
builtin-sched.c: In function 'replay_switch_event':
builtin-sched.c:801:27: error: variable 'next' set but not used [-Werror=3D=
unused-but-set-variable]
builtin-sched.c: In function 'map_switch_event':
builtin-sched.c:1406:17: error: variable 'sched_out' set but not used [-Wer=
ror=3Dunused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [builtin-sched.o] Error 1
rm .perf.dev.null
make: Leaving directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/=
omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
ERROR: oe_runmake failed


  i'd thought that had been addressed some time back.  did you not see
that build error?  does that mean using a different version of gcc
would resolve it?

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

