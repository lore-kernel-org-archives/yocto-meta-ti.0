Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BDC9E0059A
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 13:42:58 -0800 (PST)
Received: by werj55 with SMTP id j55so1295757wer.35
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 13:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.68 as permitted sender)
	client-ip=10.180.107.68; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.68 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.68])
	by 10.180.107.68 with SMTP id ha4mr319336wib.9.1330033377754 (num_hops
	= 1); Thu, 23 Feb 2012 13:42:57 -0800 (PST)
Received: by 10.180.107.68 with SMTP id ha4mr260328wib.9.1330033377646;
	Thu, 23 Feb 2012 13:42:57 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm7138103wic.0.2012.02.23.13.42.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 13:42:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <A8B6A03B-FEE1-4C95-9EB0-2710585A7BA4@ti.com>
Date: Thu, 23 Feb 2012 22:42:57 +0100
Message-Id: <5F14BB04-6C8A-49A4-ACA3-F0A5EAE05541@dominion.thruhere.net>
References: <CAFZh4h_jZENnZzytV6Jw0FD_7MWQUE=WuUgV2Syv7QMSY-YV=Q@mail.gmail.com>
	<A8B6A03B-FEE1-4C95-9EB0-2710585A7BA4@ti.com>
To: "Monk, Roger" <r-monk@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkklsJGxfGenLoqQj5cdERhntCIAOAQP+4rFzH2n1NGJvJwyO3Ci863Zh5TieC99jZUak6o
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: bitbake of syslink fails
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
X-List-Received-Date: Thu, 23 Feb 2012 21:42:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 feb. 2012, om 22:27 heeft Monk, Roger het volgende geschreven:

> On 23 Feb 2012, at 21:22, "Brian Hutchinson" <b.hutchman@gmail.com> =
wrote:
>=20
>> Hi,
>>=20
>> Hopefully this is the appropriate place to ask this ... I'm trying to
>> build syslink in meta-ti with Angstrom/OE Core.
>>=20
>> I've downloaded ti_cgt_tms470_4.6.6_setup_linux_x86.bin and
>> ti_cgt_c6000_7.2.7_setup_linux_x86.bin and placed this in my
>> source/downloads directory.
>>=20
>> When I do a bitbake ti-syslink I get lots of messages like these:
>>=20
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/csignal
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/numeric
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ostream
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/xlocnum
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdiostream.h
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/xstddef
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdexcept
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/iosfwd
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/cfloat
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/cpp_inline_math.h
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdlib.h
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/clocale
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/fstream
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ciso646
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/Std_Types.h
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/iterator
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/strstream.h
>> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ios
>> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
>> --remove-section=3D.comment --remove-section=3D.note
>> =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/lnk6x''
>> strip command failed
>> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
>> --remove-section=3D.comment --remove-section=3D.note
>> =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/clist6x''
>> strip command failed
>> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
>> --remove-section=3D.comment --remove-section=3D.note
>> =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/abs6x''
>> strip command failed
>> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
>> --remove-section=3D.comment --remove-section=3D.note
>> =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/cmp6x''
>> strip command failed
>>=20
>>=20
>>=20
>>=20
>> .. and these go on for a while and then the build fails with this =
context below:
>>=20
>>=20
>>=20
>> NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: =
Started
>> ERROR: Function failed: do_prepsources (see
>> =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/b=
eagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
>> for further information)
>> ERROR: Logfile of failure stored in:
>> =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/b=
eagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
>> Log data follows:
>> | + cd =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/b=
eagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/syslink_2_00=
_00_78
>> | + do_prepsources
>> | + cd =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/b=
eagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/syslink_2_00=
_00_78/packages//ti/syslink
>> | + =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/beagleboard/usr/share/ti/ti-xdctools-tree/xdc
>> --jobs=3D12 .make -PR .
>> | making .make: Thu Feb 23 14:25:57 EST 2012 ...
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make =
[./ipc/rtos/syslinkMemMgr/tilerMemMgr] =3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make =
[./ipc/rtos/syslinkMemMgr/nullMemMgr] =3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of
>> =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/beagleboard/usr/share/ti/ti-xdctools-tree/packages/xdc/bld/bld.js)
>> ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package
>> path.Warning: no config.bld file was found along the package path.
>> |
>> |          The config.bld file specifies the location of the
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>>    compiler tool-chains required to compile runtime content.
>> |
>> |          Without this file, the XDC tools assume no targets are to
>> be         Without this file, the XDC tools assume no targets are to
>> be
>> |
>> |          used.         used.
>> |
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.Warning: no config.bld file was found along the =
package path.
>> |
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to
>> beWarning: no config.bld file was found along the package path.
>> |          used.
>> |
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | js: "./package.bld", line 76: xdc.services.global.XDCException:
>> xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' =
along
>> the path: =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/angstrom/set=
up-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share=
/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/build/tmp-=
angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-tree/=
packages;../../../../..;'.
>> Ensure that the package path is set correctly.
>> | make[1]: *** Deleting file `package.mak'
>> | making package.mak (because of package.bld) ...
>> | makefiles are up to date.
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/frameq] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapBufMP] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/gateMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapMemMP] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> | makefiles are up to date.
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/knlNotify] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> | making package.mak (because of package.bld) ...
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/listMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/notify] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make =
[./samples/rtos/platforms/evm6472/core0] =3D=3D=3D=3D=3D=3D=3D=3D
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/messageQ] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make =
[./samples/rtos/platforms/evm6472/core1] =3D=3D=3D=3D=3D=3D=3D=3D
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | =3D=3D=3D=3D=3D=3D=3D=3D .make =
[./samples/rtos/platforms/evm6472/core2] =3D=3D=3D=3D=3D=3D=3D=3D
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | making package.mak (because of package.bld) ...
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | js: "./package.bld", line 76: xdc.services.global.XDCException:
>> xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' =
along
>> the path: =
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/angstrom/set=
up-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share=
/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/build/tmp-=
angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-tree/=
packages;../../../../..;'.
>> Ensure that the package path is set correctly.
>> | make[1]: *** Deleting file `package.mak'
>> | make[1]: *** No rule to make target `package.mak', neededERROR:
>> Function failed: do_prepsources (see
>> =
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/b=
eagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
>> for further information)
>> |  by `.make'.  Stop.
>> | gmake: *** [samples/hlos/tilerDaemon,.make] Error 2
>> | gmake: *** Waiting for unfinished jobs....
>> | Warning: Target specification 'ti.targets.C64P' does not match any
>> loaded target module.
>> | No target modules were loaded.
>> |
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | makefiles are up to date.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | makefiles are up to date.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: Target specification 'ti.targets.C64P' does not match any
>> loaded target module.
>> | No target modules were loaded.
>> |
>> | Warning: Target specification 'ti.targets.C64P' does not match any
>> loaded target module.
>> | No target modules were loaded.
>> |
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | makefiles are up to date.
>> | Warning: no config.bld file was found along the package path.
>> |          The config.bld file specifies the location of the
>> |          compiler tool-chains required to compile runtime content.
>> |          Without this file, the XDC tools assume no targets are to =
be
>> |          used.
>> | makefiles are up to date.
>> NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: =
Failed
>> ERROR: Task 7 =
(/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-=
syslink_2.00.00.78.bb,
>> do_prepsources) failed with exit code '1'
>> Waiting for 2 active tasks to finish:
>> 0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
>> 1: ti-syslink-2_00_00_78-r115a do_make_scripts (pid 28678)
>> Waiting for 1 active tasks to finish:
>> 0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
>> NOTE: package ti-syslink-2_00_00_78-r115a: task do_make_scripts: =
Succeeded
>> NOTE: package ti-ipc-1_24_00_16-r0: task do_package: Succeeded
>> NOTE: Tasks Summary: Attempted 1188 tasks of which 1156 didn't need =
to
>> be rerun and 1 failed.
>>=20
>> Summary: 1 task failed:
>> =
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-s=
yslink_2.00.00.78.bb,
>> do_prepsources
>> Summary: There were 4520 WARNING messages shown.
>> Summary: There were 57 ERROR messages shown, returning a non-zero =
exit code.
>> hutch@neo:~/angstrom/setup-scripts$
>>=20
>>=20
>>=20
>> Any idea what steps I've missed or what the problem is?
>>=20
>=20
> Hi Brian,
>=20
> Syslink isn't supported on omap3 targets like beagleboard.  For IPC on =
beagleboard we use dsplink instead.

Brian has a 816x evm to try as well :)

regards,

Koen=

