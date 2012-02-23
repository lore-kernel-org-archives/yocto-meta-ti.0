Return-Path: <r-monk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBAF3E0059A
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 13:27:43 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1NLRgHj007612;
	Thu, 23 Feb 2012 15:27:42 -0600
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1NLRfIB023384;
	Thu, 23 Feb 2012 15:27:42 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Thu, 23 Feb 2012 22:27:41 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Thread-Topic: [meta-ti] bitbake of syslink fails
Thread-Index: AQHM8nE8QwobYzNQG0SDhwGauJ6Z85ZK/w/j
Date: Thu, 23 Feb 2012 21:27:41 +0000
Message-ID: <A8B6A03B-FEE1-4C95-9EB0-2710585A7BA4@ti.com>
References: <CAFZh4h_jZENnZzytV6Jw0FD_7MWQUE=WuUgV2Syv7QMSY-YV=Q@mail.gmail.com>
In-Reply-To: <CAFZh4h_jZENnZzytV6Jw0FD_7MWQUE=WuUgV2Syv7QMSY-YV=Q@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 23 Feb 2012 21:27:44 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 23 Feb 2012, at 21:22, "Brian Hutchinson" <b.hutchman@gmail.com> wrote:

> Hi,
>
> Hopefully this is the appropriate place to ask this ... I'm trying to
> build syslink in meta-ti with Angstrom/OE Core.
>
> I've downloaded ti_cgt_tms470_4.6.6_setup_linux_x86.bin and
> ti_cgt_c6000_7.2.7_setup_linux_x86.bin and placed this in my
> source/downloads directory.
>
> When I do a bitbake ti-syslink I get lots of messages like these:
>
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/csignal
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/numeric
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ostream
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/xlocnum
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdiostream.h
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/xstddef
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdexcept
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/iosfwd
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/cfloat
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/cpp_inline_math.h
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdlib.h
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/clocale
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/fstream
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ciso646
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/Std_Types.h
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/iterator
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/strstream.h
> WARNING:   /usr/share/ti/ti-cgt470-tree/include/ios
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=3D.comment --remove-section=3D.note
> '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work=
/armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/lnk6x''
> strip command failed
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=3D.comment --remove-section=3D.note
> '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work=
/armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/clist6x''
> strip command failed
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=3D.comment --remove-section=3D.note
> '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work=
/armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/abs6x''
> strip command failed
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=3D.comment --remove-section=3D.note
> '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work=
/armv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-=
cgt6x-tree/bin/cmp6x''
> strip command failed
>
>
>
>
> .. and these go on for a while and then the build fails with this context=
 below:
>
>
>
> NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: Started
> ERROR: Function failed: do_prepsources (see
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
> for further information)
> ERROR: Logfile of failure stored in:
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
> Log data follows:
> | + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/sysli=
nk_2_00_00_78
> | + do_prepsources
> | + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglib=
c/work/beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/sysli=
nk_2_00_00_78/packages//ti/syslink
> | + /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/beagleboard/usr/share/ti/ti-xdctools-tree/xdc
> --jobs=3D12 .make -PR .
> | making .make: Thu Feb 23 14:25:57 EST 2012 ...
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =3D=3D=
=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =3D=3D=3D=
=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/tilerMemMgr] =
=3D=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/nullMemMgr] =
=3D=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =3D=3D=3D=
=3D=3D=3D=3D=3D
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/beagleboard/usr/share/ti/ti-xdctools-tree/packages/xdc/bld/bld.js)
> ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package
> path.Warning: no config.bld file was found along the package path.
> |
> |          The config.bld file specifies the location of the
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
>     compiler tool-chains required to compile runtime content.
> |
> |          Without this file, the XDC tools assume no targets are to
> be         Without this file, the XDC tools assume no targets are to
> be
> |
> |          used.         used.
> |
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.Warning: no config.bld file was found along the package p=
ath.
> |
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to
> beWarning: no config.bld file was found along the package path.
> |          used.
> |
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | js: "./package.bld", line 76: xdc.services.global.XDCException:
> xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' along
> the path: '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-e=
glibc/sysroots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/an=
gstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/=
usr/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/bu=
ild/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctool=
s-tree/packages;../../../../..;'.
> Ensure that the package path is set correctly.
> | make[1]: *** Deleting file `package.mak'
> | making package.mak (because of package.bld) ...
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/frameq] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapBufMP] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/gateMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapMemMP] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/knlNotify] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | making package.mak (because of package.bld) ...
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/listMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/notify] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core0]=
 =3D=3D=3D=3D=3D=3D=3D=3D
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/messageQ] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | makefiles are up to date.
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core1]=
 =3D=3D=3D=3D=3D=3D=3D=3D
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core2]=
 =3D=3D=3D=3D=3D=3D=3D=3D
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | making package.mak (because of package.bld) ...
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | js: "./package.bld", line 76: xdc.services.global.XDCException:
> xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' along
> the path: '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-e=
glibc/sysroots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/an=
gstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/=
usr/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/bu=
ild/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctool=
s-tree/packages;../../../../..;'.
> Ensure that the package path is set correctly.
> | make[1]: *** Deleting file `package.mak'
> | make[1]: *** No rule to make target `package.mak', neededERROR:
> Function failed: do_prepsources (see
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_=
prepsources.28692
> for further information)
> |  by `.make'.  Stop.
> | gmake: *** [samples/hlos/tilerDaemon,.make] Error 2
> | gmake: *** Waiting for unfinished jobs....
> | Warning: Target specification 'ti.targets.C64P' does not match any
> loaded target module.
> | No target modules were loaded.
> |
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | makefiles are up to date.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | makefiles are up to date.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: Target specification 'ti.targets.C64P' does not match any
> loaded target module.
> | No target modules were loaded.
> |
> | Warning: Target specification 'ti.targets.C64P' does not match any
> loaded target module.
> | No target modules were loaded.
> |
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | makefiles are up to date.
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | makefiles are up to date.
> NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: Failed
> ERROR: Task 7 (/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes=
-ti/syslink/ti-syslink_2.00.00.78.bb,
> do_prepsources) failed with exit code '1'
> Waiting for 2 active tasks to finish:
> 0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
> 1: ti-syslink-2_00_00_78-r115a do_make_scripts (pid 28678)
> Waiting for 1 active tasks to finish:
> 0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
> NOTE: package ti-syslink-2_00_00_78-r115a: task do_make_scripts: Succeede=
d
> NOTE: package ti-ipc-1_24_00_16-r0: task do_package: Succeeded
> NOTE: Tasks Summary: Attempted 1188 tasks of which 1156 didn't need to
> be rerun and 1 failed.
>
> Summary: 1 task failed:
> /home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-=
syslink_2.00.00.78.bb,
> do_prepsources
> Summary: There were 4520 WARNING messages shown.
> Summary: There were 57 ERROR messages shown, returning a non-zero exit co=
de.
> hutch@neo:~/angstrom/setup-scripts$
>
>
>
> Any idea what steps I've missed or what the problem is?
>

Hi Brian,

Syslink isn't supported on omap3 targets like beagleboard.  For IPC on beag=
leboard we use dsplink instead.

~roger

> Regards,
>
> Brian
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


