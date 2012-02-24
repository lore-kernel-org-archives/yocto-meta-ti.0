Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F27E7E003E3
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 13:07:10 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1OL79tN012212;
	Fri, 24 Feb 2012 15:07:09 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1OL78Ks017093;
	Fri, 24 Feb 2012 15:07:09 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Fri, 24 Feb 2012 22:07:08 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Thread-Topic: [meta-ti] bitbake ti-syslink fails for MACHINE=c6a816x
Thread-Index: AQHM8rCKbclph4ZP30O3cbYa9OzheJZMc44AgAAXmYo=
Date: Fri, 24 Feb 2012 21:07:07 +0000
Message-ID: <E95BAB41-4F4A-4A90-A975-FFD882EB41F3@ti.com>
References: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>,
	<CAFZh4h_DZVM0-P6VjiZd4Czqiq5UGppS1qRhg2G7sKR5W2n5aw@mail.gmail.com>
In-Reply-To: <CAFZh4h_DZVM0-P6VjiZd4Czqiq5UGppS1qRhg2G7sKR5W2n5aw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: bitbake ti-syslink fails for MACHINE=c6a816x
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
X-List-Received-Date: Fri, 24 Feb 2012 21:07:11 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't think it is worth spending too much time debugging this, since this=
 version of syslink is pretty old now and there will likely be further issu=
es in this environment even if we can can get th build to complete, since t=
here are other related dependencies.  Best would be to look at adding the v=
ersion >=3D those versions that are used in DVSDK 5.03.  This is planned, b=
ut we don't have a schedule at the moment.  If you have some time to help i=
ntegrate these newer components it would be a big help.

Thanks,
~roger

On 24 Feb 2012, at 20:42, "Brian Hutchinson" <b.hutchman@gmail.com> wrote:

> Here is a single threaded output of the error.  I'm still trying to
> figure out what is going on.  I've seen hits on e2e of similar a
> similar problem when using CCS which looks like a path problem:
>
> NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Started
> ERROR: Function failed: do_prepsources (see
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_pr=
epsources.4254
> for further information)
> ERROR: Logfile of failure stored in:
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_pr=
epsources.4254
> Log data follows:
> | ERROR: Function failed: do_prepsources (see
> /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/=
c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_pr=
epsources.4254
> for further information)
> | + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglib=
c/work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink=
_2_00_00_78
> | + do_prepsources
> | + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglib=
c/work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink=
_2_00_00_78/packages//ti/syslink
> | + /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/c6a816x-evm/usr/share/ti/ti-xdctools-tree/xdc
> --jobs=3D1 .make -PR .
> | making .make: Fri Feb 24 15:30:20 EST 2012 ...
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =3D=3D=
=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =3D=3D=3D=
=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=
=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/nullMemMgr] =
=3D=3D=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/tilerMemMgr] =
=3D=3D=3D=3D=3D=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=
=3D=3D=3D
> | makefiles are up to date.
> | =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =3D=3D=3D=
=3D=3D=3D=3D=3D
> | making package.mak (because of package.bld) ...
> | Warning: no config.bld file was found along the package path.
> |          The config.bld file specifies the location of the
> |          compiler tool-chains required to compile runtime content.
> |          Without this file, the XDC tools assume no targets are to be
> |          used.
> | js: "./package.bld", line 76: xdc.services.global.XDCException:
> xdc.PACKAGE_NOT_FOUND: can't locate the package 'ti.syslink.ipc' along
> the path: '/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-e=
glibc/sysroots/c6a816x-evm/usr/share/ti/ti-ipc-tree/packages;/home/hutch/an=
gstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/c6a816x-evm/=
usr/share/ti/ti-sysbios-tree/packages;/home/hutch/angstrom/setup-scripts/bu=
ild/tmp-angstrom_2010_x-eglibc/sysroots/c6a816x-evm/usr/share/ti/ti-xdctool=
s-tree/packages;../../../../..;'.
> Ensure that the package path is set correctly.
> | make[1]: *** Deleting file `package.mak'
> | make[1]: *** No rule to make target `package.mak', needed by `.make'.  =
Stop.
> | gmake: *** [samples/hlos/tilerDaemon,.make] Error 2
> NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Failed
> ERROR: Task 7 (/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes=
-ti/syslink/ti-syslink_2.00.00.78.bb,
> do_prepsources) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1752 tasks of which 1751 didn't need to
> be rerun and 1 failed.
> + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/armv7a-angstrom-linux-gnueabi/bblayers-1.0-r0/bblayers-1.0
> + buildhistory_commit
> + '[' '!' -d /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x=
-eglibc/buildhistory
> ']'
> + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
buildhistory/
> + '[' '!' -d .git ']'
> ++ git status --porcelain
> + repostatus=3D
> + '[' '' '!=3D' '' ']'
>
> Summary: 1 task failed:
>  /home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-ti/syslink/ti=
-syslink_2.00.00.78.bb,
> do_prepsources
> Summary: There were 5 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> hutch@neo:~/angstrom/setup-scripts/
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


