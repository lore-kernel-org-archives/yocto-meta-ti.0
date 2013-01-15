Return-Path: <javier@dowhile0.org>
Received: from mail-da0-f48.google.com (mail-da0-f48.google.com
	[209.85.210.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93776E01304
	for <meta-ti@yoctoproject.org>; Tue, 15 Jan 2013 07:13:31 -0800 (PST)
Received: by mail-da0-f48.google.com with SMTP id k18so76321dae.7
	for <meta-ti@yoctoproject.org>; Tue, 15 Jan 2013 07:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Gcbx+GsjLp+NZR5aoZOaNsa/FieFCWUhm6UgCNmSg2M=;
	b=PD5ZUYupuQVV/RXPu5HOMOFP1stbSQKhtUtl5NAPYP9VuuyCc8QLmdlm26JelzhBuT
	dSdLePsm5Tx6KtcuXAMyuiHS+FmxVeQpBFH766LgOi9WV1wxxnNpI9FSV6953MpJIJDr
	hrNHr0eYAL4VeU+bqHrbp735lsmVyfQfC0sO09pNlEGa1YdmKvEjWIwjz8MxNzK/GbTX
	S5DgbYHNLUxC//Hkk7Q+puclLBGhe7HKi4/V4j8Rwg4axBp4f4c8aIobOb+MyaHOT4j6
	VTOOtCj7uqOa5Gr155DJUSYKrU8PFsoyyvsERXJphfIhXirvW1cmhEDt6vHeNSI9Uu85
	/yZA==
MIME-Version: 1.0
Received: by 10.68.253.1 with SMTP id zw1mr110272193pbc.98.1358262810684; Tue,
	15 Jan 2013 07:13:30 -0800 (PST)
Received: by 10.68.14.10 with HTTP; Tue, 15 Jan 2013 07:13:30 -0800 (PST)
X-Originating-IP: [188.77.222.205]
In-Reply-To: <CAFNBfteAS-Q6W=9eeuNPxvmpS6x2QdYM7OhoQ7jvK-n5sm4FKA@mail.gmail.com>
References: <CAFNBfte0i7kXGH8v7hoWdO9b==T-AQTSVJF7b1GbSovkNoowfA@mail.gmail.com>
	<20130115000449.GC10163@denix.org>
	<CAFNBfteAS-Q6W=9eeuNPxvmpS6x2QdYM7OhoQ7jvK-n5sm4FKA@mail.gmail.com>
Date: Tue, 15 Jan 2013 16:13:30 +0100
Message-ID: <CABxcv=mQMxFm3N5Ort+ajNBU7uAhGQKdVK4x0Q9OPX9pWVjxeA@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Flavio Castro Alves Filho <flavio.alves@gmail.com>
X-Gm-Message-State: ALoCoQmQlw48I+Mme1+B9zfLpEKamflKl/RwxnJ8+3T4x3aGpEo/7AgDhtUJPekYojqjACowCtjx
Cc: meta-ti@yoctoproject.org, beagleboard@googlegroups.com
Subject: Re: Problems with fetch of linux-mainline with Yocto and Meta-ti
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
X-List-Received-Date: Tue, 15 Jan 2013 15:13:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 2:39 PM, Flavio Castro Alves Filho
<flavio.alves@gmail.com> wrote:
> Yes
>
> Em 14/01/2013 22:05, "Denys Dmytriyenko" <denis@denix.org> escreveu:
>
>> On Mon, Jan 14, 2013 at 06:58:31AM -0200, Flavio Castro Alves Filho wrot=
e:
>> > Hello,
>> >
>> > I'm trying to build a simple linux distro using Yocto danny and
>> > meta-ti layer for Beagleboard-xm an I'm unable to download the kernel
>> > files.
>> >
>> > I'm using Ubuntu 12.04, Yocto danny (poky), meta-ti danny branch and
>> > meta-openembedded/meta-oe danny branch. I also tried using
>> > openembedded-core with danny branch with the same results.
>>
>> Can you just do the following line on its own:
>>
>> $ git clone
>> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>>
>> --
>> Denys
>>
>>
>> > My error messages are the following:
>> >
>> >
>> > flavio@Phi06:/home/prjs/beagle-xm/linux$ bitbake -c fetch virtual/kern=
el
>> > Parsing recipes: 100%
>> >
>> > |#####################################################################=
###########################################|
>> > Time: 00:00:39
>> > Parsing of 1273 .bb files complete (0 cached, 1273 parsed). 1620
>> > targets, 59 skipped, 7 masked, 0 errors.
>> >
>> > Build Configuration:
>> > BB_VERSION        =3D "1.16.0"
>> > TARGET_ARCH       =3D "arm"
>> > TARGET_OS         =3D "linux-gnueabi"
>> > MACHINE           =3D "beagleboard"
>> > DISTRO            =3D "poky"
>> > DISTRO_VERSION    =3D "1.3"
>> > TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
>> > TARGET_FPU        =3D "vfp-neon"
>> > meta
>> > meta-yocto        =3D "danny:47b0864fbd65746558d8186450c182d98bac78ca"
>> > meta-oe           =3D "danny:f026e96295da101bb715858bc8705de7e4a33992"
>> > meta-ti           =3D "danny:0a764d733691db4bf40539693fa3d93f6883baa7"
>> >
>> > NOTE: Resolving any missing task queue dependencies
>> > NOTE: Preparing runqueue
>> > NOTE: Executing RunQueue Tasks
>> > WARNING: Failed to fetch URL
>> >
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;=
branch=3Dlinux-3.2.y;protocol=3Dgit,
>> > attempting MIRRORS if available
>> > ERROR: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:
>> > Cloning into bare repository
>> >
>> > '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.li=
nux-stable.git'...
>> >
>> > fatal: read error: Connection timed out
>> > fatal: early EOF
>> > fatal: index-pack failed
>> >
>> > ERROR: Function failed: Fetcher failure for URL:
>> >
>> > 'git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git=
;branch=3Dlinux-3.2.y;protocol=3Dgit'.
>> > Unable to fetch URL from any source.
>> > ERROR: Logfile of failure stored in:
>> >
>> > /home/prjs/beagle-xm/linux/tmp/work/beagleboard-poky-linux-gnueabi/lin=
ux-mainline-3.2.28-r0/temp/log.do_fetch.2904
>> > ERROR: Task 0
>> > (/home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/linux-mainline=
_3.2.bb,
>> > do_fetch) failed with exit code '1'
>> > NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
>> > rerun and 1 failed.
>> >
>> > Summary: 1 task failed:
>> >
>> > /home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/linux-mainline_=
3.2.bb,
>> > do_fetch
>> > Summary: There was 1 WARNING message shown.
>> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> > code.
>> > flavio@Phi06:/home/prjs/beagle-xm/linux$
>> >
>> > The log file contains the folllowing:
>> >
>> > DEBUG: Executing python function do_fetch
>> > DEBUG: Executing python function base_do_fetch
>> > DEBUG: Trying PREMIRRORS
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['bzr', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['cvs', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['git', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;=
branch=3Dlinux-3.2.y;protocol=3Dgit
>> > returning
>> > http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.p=
ub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['git', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['hg', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['osc', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['p4', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['svk', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
>> >
>> > '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.l=
inux-stable.git.tar.gz',
>> > '', '', {}] comparing ['svn', '.*', '/.*', '', '', {}] to ['http',
>> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['hg', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['osc', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['p4', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svk', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svn', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > NOTE: fetch
>> > http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.p=
ub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz
>> > DEBUG: Fetcher accessed the network with the command /usr/bin/env wget
>> > -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /home/prjs/src
>> >
>> > 'http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.=
pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz'
>> > DEBUG: Running export HOME=3D"/home/flavio"; export
>> > SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ss=
h";
>> > export
>> > GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc/g=
itconfig";
>> > export
>> > PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux/t=
mp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/prj=
s/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prjs/=
beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/linux=
/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/i6=
86-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/home=
/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/li=
b/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/=
bin:/usr/games";
>> > /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate
>> > -P /home/prjs/src
>> >
>> > 'http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.=
pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz'
>> > DEBUG: Mirror fetch failure for url
>> >
>> > http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.p=
ub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz
>> > (original url:
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;=
branch=3Dlinux-3.2.y;protocol=3Dgit)
>> > DEBUG: Fetcher failure: Fetch command failed with exit code 8, output:
>> >
>> > http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.p=
ub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz:
>> > 2013-01-13 21:18:27 ERROR 404: Not Found.
>> >
>> > DEBUG: Trying Upstream
>> > DEBUG: Fetcher accessed the network with the command git clone --bare
>> > --mirror
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>> >
>> > /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.lin=
ux-stable.git
>> > DEBUG: Running export HOME=3D"/home/flavio"; export
>> > SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ss=
h";
>> > export
>> > GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc/g=
itconfig";
>> > export
>> > PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux/t=
mp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/prj=
s/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prjs/=
beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/linux=
/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/i6=
86-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/home=
/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/li=
b/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/=
bin:/usr/games";
>> > git clone --bare --mirror
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>> >
>> > /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.lin=
ux-stable.git
>> > WARNING: Failed to fetch URL
>> >
>> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;=
branch=3Dlinux-3.2.y;protocol=3Dgit,
>> > attempting MIRRORS if available
>> > DEBUG: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:
>> > Cloning into bare repository
>> >
>> > '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.li=
nux-stable.git'...
>> >
>> > fatal: read error: Connection timed out
>> > fatal: early EOF
>> > fatal: index-pack failed
>> >
>> > DEBUG: Trying MIRRORS
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['ftp', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['http', '.*',
>> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > DEBUG: For url ['git', 'git.kernel.org',
>> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
>> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['https',
>> > '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
>> > '/mirror/sources/', '', '', {}]
>> > ERROR: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:
>> > Cloning into bare repository
>> >
>> > '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.li=
nux-stable.git'...
>> >
>> > fatal: read error: Connection timed out
>> > fatal: early EOF
>> > fatal: index-pack failed
>> >
>> > DEBUG: Python function base_do_fetch finished
>> > DEBUG: Python function do_fetch finished
>> > ERROR: Function failed: Fetcher failure for URL:
>> >
>> > 'git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git=
;branch=3Dlinux-3.2.y;protocol=3Dgit'.
>> > Unable to fetch URL from any source.
>> >
>> > Does anybody have any idea of what am I doing wrong?
>> >
>> > Best regards,
>> >
>> > Flavio
>> >
>> > --
>> > Flavio de Castro Alves Filho
>> >

Hello,

I'm facing the same "Connection timed out" issue when trying to build
an image for a Pandaboard.

Manually cloning the kernel:

$ git clone git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git

works for me but is utterly slow (34 KiB/s) and I have a decent-ish connect=
ion.

In fact I don't have issues when building images for other target
machines neither other packages.

Thanks a lot and best regards,
Javier

