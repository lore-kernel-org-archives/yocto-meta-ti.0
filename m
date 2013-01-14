Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1753BE002AB
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 00:58:31 -0800 (PST)
Received: by mail-ie0-f170.google.com with SMTP id k10so4784486iea.29
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 00:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QmkUvl95CK1rSfiP0t5lmlREksJMf0zcOpFpkav9Nus=;
	b=LKVdfusJuqeIU47NXmGinSnKeWEzJORXLk4fGVX4LUIXFl2+e7NAq7gl2+fnVizB5Z
	eNSYbCL8d37/aVXZuvX+Fyj0m52F1N7sO7Ot0kiwqQtkGjahGCj250CuXNjZvhTxi91e
	AP/+/QbE1jcXbdU/lZ4HV4rNgVUWhSrePCd/7FRqjhqc8XKAzoznwiOBAyrH1mRJqx0a
	B0cXGQV97XtaiBjeAFDaUBMvSr7SIrx2b/Tka/iScQIdv+j6Fmu1/vuh+sENNrHqYZIW
	GHylPHyKDqsGeAqTJDjvXslnEekeaeNnNlwrxLzOAD0ry0cecTt0CfTHgk4Wre4u5B+x
	BYJA==
MIME-Version: 1.0
X-Received: by 10.50.106.227 with SMTP id gx3mr6408439igb.10.1358153911455;
	Mon, 14 Jan 2013 00:58:31 -0800 (PST)
Received: by 10.42.24.202 with HTTP; Mon, 14 Jan 2013 00:58:31 -0800 (PST)
Date: Mon, 14 Jan 2013 06:58:31 -0200
Message-ID: <CAFNBfte0i7kXGH8v7hoWdO9b==T-AQTSVJF7b1GbSovkNoowfA@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: meta-ti@yoctoproject.org, beagleboard@googlegroups.com
Subject: Problems with fetch of linux-mainline with Yocto and Meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 08:58:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to build a simple linux distro using Yocto danny and
meta-ti layer for Beagleboard-xm an I'm unable to download the kernel
files.

I'm using Ubuntu 12.04, Yocto danny (poky), meta-ti danny branch and
meta-openembedded/meta-oe danny branch. I also tried using
openembedded-core with danny branch with the same results.

My error messages are the following:


flavio@Phi06:/home/prjs/beagle-xm/linux$ bitbake -c fetch virtual/kernel
Parsing recipes: 100%
|##########################################################################=
######################################|
Time: 00:00:39
Parsing of 1273 .bb files complete (0 cached, 1273 parsed). 1620
targets, 59 skipped, 7 masked, 0 errors.

Build Configuration:
BB_VERSION        =3D "1.16.0"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.3"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta
meta-yocto        =3D "danny:47b0864fbd65746558d8186450c182d98bac78ca"
meta-oe           =3D "danny:f026e96295da101bb715858bc8705de7e4a33992"
meta-ti           =3D "danny:0a764d733691db4bf40539693fa3d93f6883baa7"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branc=
h=3Dlinux-3.2.y;protocol=3Dgit,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-s=
table.git'...

fatal: read error: Connection timed out
fatal: early EOF
fatal: index-pack failed

ERROR: Function failed: Fetcher failure for URL:
'git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;bran=
ch=3Dlinux-3.2.y;protocol=3Dgit'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/prjs/beagle-xm/linux/tmp/work/beagleboard-poky-linux-gnueabi/linux-ma=
inline-3.2.28-r0/temp/log.do_fetch.2904
ERROR: Task 0 (/home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/linux=
-mainline_3.2.bb,
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/linux-mainline_3.2=
.bb,
do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
flavio@Phi06:/home/prjs/beagle-xm/linux$

The log file contains the folllowing:

DEBUG: Executing python function do_fetch
DEBUG: Executing python function base_do_fetch
DEBUG: Trying PREMIRRORS
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['bzr', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['cvs', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['git', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-s=
table.git;branch=3Dlinux-3.2.y;protocol=3Dgit
returning http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.=
org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['git', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['hg', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['osc', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['p4', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['svk', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org',
'/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git.tar.gz',
'', '', {}] comparing ['svn', '.*', '/.*', '', '', {}] to ['http',
'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['hg', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['osc', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['p4', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svk', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svn', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
NOTE: fetch http://downloads.yoctoproject.org/mirror/sources/git2_git.kerne=
l.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget
-t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /home/prjs/src
'http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.s=
cm.linux.kernel.git.stable.linux-stable.git.tar.gz'
DEBUG: Running export HOME=3D"/home/flavio"; export
SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ssh";
export GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc=
/gitconfig";
export PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux=
/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/p=
rjs/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prj=
s/beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/lin=
ux/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/=
i686-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/ho=
me/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/=
lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin:/usr/games";
/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate
-P /home/prjs/src
'http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.s=
cm.linux.kernel.git.stable.linux-stable.git.tar.gz'
DEBUG: Mirror fetch failure for url
http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.sc=
m.linux.kernel.git.stable.linux-stable.git.tar.gz
(original url: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-s=
table.git;branch=3Dlinux-3.2.y;protocol=3Dgit)
DEBUG: Fetcher failure: Fetch command failed with exit code 8, output:
http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.sc=
m.linux.kernel.git.stable.linux-stable.git.tar.gz:
2013-01-13 21:18:27 ERROR 404: Not Found.

DEBUG: Trying Upstream
DEBUG: Fetcher accessed the network with the command git clone --bare
--mirror git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.=
git
/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-st=
able.git
DEBUG: Running export HOME=3D"/home/flavio"; export
SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ssh";
export GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc=
/gitconfig";
export PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux=
/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/p=
rjs/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prj=
s/beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/lin=
ux/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/=
i686-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/ho=
me/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/=
lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin:/usr/games";
git clone --bare --mirror
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-st=
able.git
WARNING: Failed to fetch URL
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branc=
h=3Dlinux-3.2.y;protocol=3Dgit,
attempting MIRRORS if available
DEBUG: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-s=
table.git'...

fatal: read error: Connection timed out
fatal: early EOF
fatal: index-pack failed

DEBUG: Trying MIRRORS
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['ftp', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['http', '.*',
'/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.kernel.org',
'/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
{'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['https',
'.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
'/mirror/sources/', '', '', {}]
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-s=
table.git'...

fatal: read error: Connection timed out
fatal: early EOF
fatal: index-pack failed

DEBUG: Python function base_do_fetch finished
DEBUG: Python function do_fetch finished
ERROR: Function failed: Fetcher failure for URL:
'git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;bran=
ch=3Dlinux-3.2.y;protocol=3Dgit'.
Unable to fetch URL from any source.

Does anybody have any idea of what am I doing wrong?

Best regards,

Flavio

--
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

