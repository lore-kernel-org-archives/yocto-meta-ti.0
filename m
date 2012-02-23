Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 314C0E0059A
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 13:22:17 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so2188200bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 13:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.204.156.217 as permitted sender) client-ip=10.204.156.217; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.204.156.217 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.204.156.217])
	by 10.204.156.217 with SMTP id y25mr1563103bkw.22.1330032135832
	(num_hops = 1); Thu, 23 Feb 2012 13:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=U1J9fw00v7Es5BTsEqhkeWZJgtgPKEdNM4edBvy8vWM=;
	b=bjuXpkiI1PcwwgzCDbyFNBllLAxUGQpFdWlyIkR+fRlzSIWteXZRkmfr+0LwSjjKPG
	L/6xb4tdrOHRUnSM8/RU23JnWQ8c2w7NQW3fS1WzE2vb+DCiK52FwxH6f+FKu214MKP+
	wtl2q831X07o2dXp+qKlp2Nau/jvVdHrZXtOE=
MIME-Version: 1.0
Received: by 10.204.156.217 with SMTP id y25mr1300791bkw.22.1330032135524;
	Thu, 23 Feb 2012 13:22:15 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Thu, 23 Feb 2012 13:22:15 -0800 (PST)
Date: Thu, 23 Feb 2012 16:22:15 -0500
Message-ID: <CAFZh4h_jZENnZzytV6Jw0FD_7MWQUE=WuUgV2Syv7QMSY-YV=Q@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: bitbake of syslink fails
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
X-List-Received-Date: Thu, 23 Feb 2012 21:22:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Hopefully this is the appropriate place to ask this ... I'm trying to
build syslink in meta-ti with Angstrom/OE Core.

I've downloaded ti_cgt_tms470_4.6.6_setup_linux_x86.bin and
ti_cgt_c6000_7.2.7_setup_linux_x86.bin and placed this in my
source/downloads directory.

When I do a bitbake ti-syslink I get lots of messages like these:

WARNING:   /usr/share/ti/ti-cgt470-tree/include/csignal
WARNING:   /usr/share/ti/ti-cgt470-tree/include/numeric
WARNING:   /usr/share/ti/ti-cgt470-tree/include/ostream
WARNING:   /usr/share/ti/ti-cgt470-tree/include/xlocnum
WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdiostream.h
WARNING:   /usr/share/ti/ti-cgt470-tree/include/xstddef
WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdexcept
WARNING:   /usr/share/ti/ti-cgt470-tree/include/iosfwd
WARNING:   /usr/share/ti/ti-cgt470-tree/include/cfloat
WARNING:   /usr/share/ti/ti-cgt470-tree/include/cpp_inline_math.h
WARNING:   /usr/share/ti/ti-cgt470-tree/include/stdlib.h
WARNING:   /usr/share/ti/ti-cgt470-tree/include/clocale
WARNING:   /usr/share/ti/ti-cgt470-tree/include/fstream
WARNING:   /usr/share/ti/ti-cgt470-tree/include/ciso646
WARNING:   /usr/share/ti/ti-cgt470-tree/include/Std_Types.h
WARNING:   /usr/share/ti/ti-cgt470-tree/include/iterator
WARNING:   /usr/share/ti/ti-cgt470-tree/include/strstream.h
WARNING:   /usr/share/ti/ti-cgt470-tree/include/ios
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=3D.comment --remove-section=3D.note
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/a=
rmv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-cg=
t6x-tree/bin/lnk6x''
strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=3D.comment --remove-section=3D.note
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/a=
rmv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-cg=
t6x-tree/bin/clist6x''
strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=3D.comment --remove-section=3D.note
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/a=
rmv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-cg=
t6x-tree/bin/abs6x''
strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=3D.comment --remove-section=3D.note
'/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/a=
rmv7a-angstrom-linux-gnueabi/ti-cgt6x-1_7_2_7-r4/package/usr/share/ti/ti-cg=
t6x-tree/bin/cmp6x''
strip command failed




.. and these go on for a while and then the build fails with this context b=
elow:



NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: Started
ERROR: Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/be=
agleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_pr=
epsources.28692
for further information)
ERROR: Logfile of failure stored in:
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/be=
agleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_pr=
epsources.28692
Log data follows:
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/syslink=
_2_00_00_78
| + do_prepsources
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/beagleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/syslink=
_2_00_00_78/packages//ti/syslink
| + /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/share/ti/ti-xdctools-tree/xdc
--jobs=3D12 .make -PR .
| making .make: Thu Feb 23 14:25:57 EST 2012 ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =3D=3D=3D=
=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =3D=3D=3D=3D=
=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=3D=
=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =3D=3D=
=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/tilerMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/nullMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =3D=3D=3D=3D=
=3D=3D=3D=3D
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroot=
s/beagleboard/usr/share/ti/ti-xdctools-tree/packages/xdc/bld/bld.js)
...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package
path.Warning: no config.bld file was found along the package path.
|
|          The config.bld file specifies the location of the
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
     compiler tool-chains required to compile runtime content.
|
|          Without this file, the XDC tools assume no targets are to
be         Without this file, the XDC tools assume no targets are to
be
|
|          used.         used.
|
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.Warning: no config.bld file was found along the package pat=
h.
|
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to
beWarning: no config.bld file was found along the package path.
|          used.
|
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| js: "./package.bld", line 76: xdc.services.global.XDCException:
xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' along
the path: '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/angs=
trom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/us=
r/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/buil=
d/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-=
tree/packages;../../../../..;'.
Ensure that the package path is set correctly.
| make[1]: *** Deleting file `package.mak'
| making package.mak (because of package.bld) ...
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/frameq] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapBufMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/gateMP] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapMemMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/knlNotify] =3D=3D=3D=3D=3D=
=3D=3D=3D
| making package.mak (because of package.bld) ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/listMP] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/notify] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core0] =
=3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/messageQ] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core1] =
=3D=3D=3D=3D=3D=3D=3D=3D
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core2] =
=3D=3D=3D=3D=3D=3D=3D=3D
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| making package.mak (because of package.bld) ...
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| js: "./package.bld", line 76: xdc.services.global.XDCException:
xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' along
the path: '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/beagleboard/usr/share/ti/ti-ipc-tree/packages;/home/hutch/angs=
trom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/us=
r/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/buil=
d/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/share/ti/ti-xdctools-=
tree/packages;../../../../..;'.
Ensure that the package path is set correctly.
| make[1]: *** Deleting file `package.mak'
| make[1]: *** No rule to make target `package.mak', neededERROR:
Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/be=
agleboard-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r115a/temp/log.do_pr=
epsources.28692
for further information)
|  by `.make'.  Stop.
| gmake: *** [samples/hlos/tilerDaemon,.make] Error 2
| gmake: *** Waiting for unfinished jobs....
| Warning: Target specification 'ti.targets.C64P' does not match any
loaded target module.
| No target modules were loaded.
|
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| makefiles are up to date.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| makefiles are up to date.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: Target specification 'ti.targets.C64P' does not match any
loaded target module.
| No target modules were loaded.
|
| Warning: Target specification 'ti.targets.C64P' does not match any
loaded target module.
| No target modules were loaded.
|
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| Warning: no config.bld file was found along the package path.
|          The config.bld file specifies the location of the
|          compiler tool-chains required to compile runtime content.
|          Without this file, the XDC tools assume no targets are to be
|          used.
| makefiles are up to date.
NOTE: package ti-syslink-2_00_00_78-r115a: task do_prepsources: Failed
ERROR: Task 7 (/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-t=
i/syslink/ti-syslink_2.00.00.78.bb,
do_prepsources) failed with exit code '1'
Waiting for 2 active tasks to finish:
0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
1: ti-syslink-2_00_00_78-r115a do_make_scripts (pid 28678)
Waiting for 1 active tasks to finish:
0: ti-ipc-1_24_00_16-r0 do_package (pid 28318)
NOTE: package ti-syslink-2_00_00_78-r115a: task do_make_scripts: Succeeded
NOTE: package ti-ipc-1_24_00_16-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1188 tasks of which 1156 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
 /home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-s=
yslink_2.00.00.78.bb,
do_prepsources
Summary: There were 4520 WARNING messages shown.
Summary: There were 57 ERROR messages shown, returning a non-zero exit code=
.
hutch@neo:~/angstrom/setup-scripts$



Any idea what steps I've missed or what the problem is?

Regards,

Brian

