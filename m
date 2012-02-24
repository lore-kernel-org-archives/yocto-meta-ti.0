Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D266E011D1
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 20:55:27 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so2486710bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 23 Feb 2012 20:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.204.129.203 as permitted sender) client-ip=10.204.129.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.204.129.203 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.204.129.203])
	by 10.204.129.203 with SMTP id p11mr314346bks.58.1330059326034
	(num_hops = 1); Thu, 23 Feb 2012 20:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bJYXeiXz936GZXGdsNvZJE1Ft6DSQhEV2uCcCI+X24M=;
	b=bz+FXuzpPv41r0XBFOBfupntrpemAoo5aG3KIk81o+PcYYOMLMujy2zWapTmENMGxI
	tTaVXwkVlwuWMBu+0UjMXG6nbPi6IGjSmAODRD6TtEn0bHbB9t8uyxGWc4oL/udFyvV5
	J+kHfOnrb//pMYAUTe4k+jnn5RMBEYh4PvcZE=
MIME-Version: 1.0
Received: by 10.204.129.203 with SMTP id p11mr271314bks.58.1330059325654; Thu,
	23 Feb 2012 20:55:25 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Thu, 23 Feb 2012 20:55:25 -0800 (PST)
Date: Thu, 23 Feb 2012 23:55:25 -0500
Message-ID: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: bitbake ti-syslink fails for MACHINE=c6a816x
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
X-List-Received-Date: Fri, 24 Feb 2012 04:55:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OK, I'll try this again.  I did a git pull this evening and changed
the MACHINE to c6a816x (last time I tried was beagleboard and I
understand now that syslink doesn't support that platform).

The build failed with tons of output so I started it again and here is
a shorter list of the output with the errors below ... any idea what
is going on?

hutch@neo:~/angstrom/setup-scripts$ bitbake ti-syslink
Loading cache: 100%
|######################################################################|
ETA:  00:00:00
Loaded 2078 entries from dependency cache.

OE Build Configuration:
BB_VERSION        =3D "1.15.1"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "c6a816x-evm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2012.02-core"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D "master:6a15c077963c6ffce8da1c5d2518fb06274112d2"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    =3D "master:3c50d83184d58eba36f72c7e2e7116d2a8e92a71"
meta-java         =3D "master:e2cb8c6fe2942061283c766a9ed2cfac22be3c43"
meta-ti           =3D "master:1471bbad1740635ea55b3cfeb0e942de2fa272be"
meta-efikamx      =3D "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        =3D "master:befb1397440846546d511a55f512f0950c14093e"
meta-htc
meta-nokia
meta-openmoko
meta-palm         =3D "master:62a572c4498e3cd08f770a31d4af61d8fcd74bd3"
meta-handheld     =3D "master:8e568e525e97befa2d74937c344a3578a252d97c"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-jasperforest
meta-n450         =3D "master:1ca68394faf33416f2aabee27323da7510ad6609"
meta              =3D "master:6a74c2050de4540deaf4e855bdf7aec4518f648a"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running noexec task 1625 of 1775 (ID: 196,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/devtools/ti-x=
dctools_3.23.00.32.bb,
do_package_write)
NOTE: Running noexec task 1626 of 1775 (ID: 193,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/devtools/ti-x=
dctools_3.23.00.32.bb,
do_build)
NOTE: Running task 1627 of 1775 (ID: 198,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/devtools/ti-x=
dctools_3.23.00.32.bb,
do_rm_work)
NOTE: Running task 1722 of 1775 (ID: 226,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/ipc/ti-ipc_1.=
24.00.16.bb,
do_package_write_ipk)
NOTE: Running task 1762 of 1775 (ID: 7,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-sy=
slink_2.00.00.78.bb,
do_prepsources)
NOTE: package ti-xdctools-3_23_00_32-r0: task do_rm_work: Started
NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Started
NOTE: package ti-ipc-1_24_00_16-r0: task do_package_write_ipk: Started
NOTE: package ti-ipc-1_24_00_16-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1764 of 1775 (ID: 222,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/ipc/ti-ipc_1.=
24.00.16.bb,
do_package_write)
NOTE: Running noexec task 1765 of 1775 (ID: 219,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/ipc/ti-ipc_1.=
24.00.16.bb,
do_build)
NOTE: Running task 1766 of 1775 (ID: 224,
/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/ipc/ti-ipc_1.=
24.00.16.bb,
do_rm_work)
NOTE: package ti-ipc-1_24_00_16-r0: task do_rm_work: Started
ERROR: Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.21399
for further information)
ERROR: Logfile of failure stored in:
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.21399
Log data follows:
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink_2=
_00_00_78
| + do_prepsources
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink_2=
_00_00_78/packages//ti/syslink
| + /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/c6a816x-evm/usr/share/ti/ti-xdctools-tree/xdc
--jobs=3D12 .make -PR .
| making .make: Thu Feb 23 23:47:43 EST 2012 ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =3D=3D=3D=3D=
=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =3D=3D=3D=
=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/nullMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =3D=3D=
=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/tilerMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =3D=3D=3D=3D=
=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/frameq] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/gateMP] =3D=3D=3D=3D=3D=3D=
=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapBufMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/heapMemMP] =3D=3D=3D=3D=3D=
=3D=3D=3D
| making package.mak (because of package.bld) ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/knlNotify] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/listMP] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/messageQ] =3D=3D=3D=3D=3D=
=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core0] =
=3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/notify] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core1] =
=3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core3] =
=3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core2] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6472/core4] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6474/core0] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/evm6474/core1] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti814x/arm] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti814x/dsp] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti814x/videom3] =
=3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti814x/vpssm3] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti816x/dsp] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti816x/videom3] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/platforms/ti816x/vpssm3] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/procMgr] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ringIO] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ringIO_gpp] =3D=3D=3D=3D=
=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/sharedRegion] =3D=3D=3D=3D=
=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/frameq_multiQ_ti81x=
x] =3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/frameq_ti814x] =3D=
=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/frameq_ti814x/slave=
Build] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/frameq_ti81xx] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/ringIO_ti814x] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/ringIO_ti814x/slave=
Build] =3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3DERROR: Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.21399
for further information)
|  .make [./samples/rtos/ti81xx/ringIO_ti81xx] =3D=3D=3D=3D=3D=3D=3D=3D
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/singlecore/frameq] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/rtos/ti81xx/singlecore/ringio] =
=3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./utils/rtos/bios6] =3D=3D=3D=3D=3D=3D=3D=
=3D
| makefiles are up to date.
| makefiles are up to date.
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
ibc/sysroots/c6a816x-evm/usr/share/ti/ti-ipc-tree/packages;/home/hutch/angs=
trom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/c6a816x-evm/us=
r/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/buil=
d/tmp-angstrom_2010_x-eglibc/sysroots/c6a816x-evm/usr/share/ti/ti-xdctools-=
tree/packages;../../../../..;'.
Ensure that the package path is set correctly.
| make[1]: *** Deleting file `package.mak'
| make[1]: *** No rule to make target `package.mak', needed by `.make'.  St=
op.
| gmake: *** [samples/hlos/tilerDaemon,.make] Error 2
| gmake: *** Waiting for unfinished jobs....
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
| makefiles are up to date.
| makefiles are up to date.
| makefiles are up to date.
NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Failed
ERROR: Task 7 (/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-t=
i/syslink/ti-syslink_2.00.00.78.bb,
do_prepsources) failed with exit code '1'
Waiting for 2 active tasks to finish:
0: ti-ipc-1_24_00_16-r0 do_rm_work (pid 21913)
1: ti-xdctools-3_23_00_32-r0 do_rm_work (pid 21393)
Waiting for 1 active tasks to finish:
0: ti-xdctools-3_23_00_32-r0 do_rm_work (pid 21393)
NOTE: package ti-ipc-1_24_00_16-r0: task do_rm_work: Succeeded
NOTE: package ti-xdctools-3_23_00_32-r0: task do_rm_work: Succeeded
NOTE: Tasks Summary: Attempted 1766 tasks of which 1758 didn't need to
be rerun and 1 failed.
+ cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/wo=
rk/armv7a-angstrom-linux-gnueabi/bblayers-1.0-r0/bblayers-1.0
+ buildhistory_commit
+ '[' '!' -d /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-e=
glibc/buildhistory
']'
+ cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/bu=
ildhistory/
+ '[' '!' -d .git ']'
++ git status --porcelain
+ repostatus=3D
+ '[' '' '!=3D' '' ']'

Summary: 1 task failed:
  /home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti-=
syslink_2.00.00.78.bb,
do_prepsources
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
hutch@neo:~/angstrom/setup-scripts$

