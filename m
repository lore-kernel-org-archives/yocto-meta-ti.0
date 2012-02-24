Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86207E003E3
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 12:42:42 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so3522193bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 12:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.204.129.203 as permitted sender) client-ip=10.204.129.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.204.129.203 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.204.129.203])
	by 10.204.129.203 with SMTP id p11mr1948073bks.58.1330116161264
	(num_hops = 1); Fri, 24 Feb 2012 12:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=F6/cXVP8s+oN46bUsBw6qboXb0OsQxoBY5kY9olJItI=;
	b=lmK4gGOJ3NKfVJNaX0Ep1qIPz6FkzVGotbloVor0TiBUrKPp3SeS9SwTlMr/bcAl5I
	10TDY4aOMau0hUQhTj/klL91qBvfIrnExpbLRRlLukxOcfa8inPELjGDDwsTVWR/BtKt
	AYENax4hVw+RuPQ9ZxLqVrUZLxsx0IyewZrfs=
MIME-Version: 1.0
Received: by 10.204.129.203 with SMTP id p11mr1609965bks.58.1330116160775;
	Fri, 24 Feb 2012 12:42:40 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Fri, 24 Feb 2012 12:42:40 -0800 (PST)
In-Reply-To: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>
References: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>
Date: Fri, 24 Feb 2012 15:42:40 -0500
Message-ID: <CAFZh4h_DZVM0-P6VjiZd4Czqiq5UGppS1qRhg2G7sKR5W2n5aw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 24 Feb 2012 20:42:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Here is a single threaded output of the error.  I'm still trying to
figure out what is going on.  I've seen hits on e2e of similar a
similar problem when using CCS which looks like a path problem:

NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Started
ERROR: Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.4254
for further information)
ERROR: Logfile of failure stored in:
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.4254
Log data follows:
| ERROR: Function failed: do_prepsources (see
/home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c6=
a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/temp/log.do_prep=
sources.4254
for further information)
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink_2=
_00_00_78
| + do_prepsources
| + cd /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/=
work/c6a816x_evm-angstrom-linux-gnueabi/ti-syslink-2_00_00_78-r2a/syslink_2=
_00_00_78/packages//ti/syslink
| + /home/hutch/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sys=
roots/c6a816x-evm/usr/share/ti/ti-xdctools-tree/xdc
--jobs=3D1 .make -PR .
| making .make: Fri Feb 24 15:30:20 EST 2012 ...
| =3D=3D=3D=3D=3D=3D=3D=3D .make [.] =3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./buildutils/rtos/buildScripts] =3D=3D=3D=
=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./family/rtos/bios6/ti814x] =3D=3D=3D=3D=
=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos] =3D=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/interfaces] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/shMem] =3D=3D=3D=3D=3D=3D=3D=
=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr] =3D=3D=3D=3D=3D=
=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/nullMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/shMemMgr] =3D=3D=
=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./ipc/rtos/syslinkMemMgr/tilerMemMgr] =3D=
=3D=3D=3D=3D=3D=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./procMgr/rtos/bios6] =3D=3D=3D=3D=3D=3D=
=3D=3D
| makefiles are up to date.
| =3D=3D=3D=3D=3D=3D=3D=3D .make [./samples/hlos/tilerDaemon] =3D=3D=3D=3D=
=3D=3D=3D=3D
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
NOTE: package ti-syslink-2_00_00_78-r2a: task do_prepsources: Failed
ERROR: Task 7 (/home/hutch/angstrom/setup-scripts/sources/meta-ti/recipes-t=
i/syslink/ti-syslink_2.00.00.78.bb,
do_prepsources) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1752 tasks of which 1751 didn't need to
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
Summary: There were 5 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
hutch@neo:~/angstrom/setup-scripts/

