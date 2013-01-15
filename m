Return-Path: <flavio.alves@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E48AE01454
	for <meta-ti@yoctoproject.org>; Tue, 15 Jan 2013 05:39:37 -0800 (PST)
Received: by mail-oa0-f52.google.com with SMTP id o6so97455oag.39
	for <meta-ti@yoctoproject.org>; Tue, 15 Jan 2013 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kKZLgP69TL5kpF7lc1ZwE/GdcvQhQdt2sROe7j3C0rQ=;
	b=j+ugOeIxPSMpCPcy3WJnt2mTiOm59TIif1W7Viw72CqJF5GZBR7j6xtp6wBtYNEh1x
	vSP3m6C3c7aZn1vcjYLgh18pEivgkqezXWoNF8qebQJp9rcSnTiD3uB40gcTtoZUMGNH
	p+pGbwuwq8Jm5Q4FSIfjWTp7gAcgPH+DCbUIrUhPitBCYVA299d6MLzVxMk1ss9vK1Ku
	jtn5xeMB1bS0VnnfMzv1G6gLsxqWZBvEQaJGFNiMKno7sN1Y5MDoOHpy722Qougy4lEU
	MrYSAgXqSIg7tj8x35ZK760hq0gHV1yERUXOB4jEgIPg5W18Wra9itaoNci1n/kC/Tue
	Pdag==
MIME-Version: 1.0
Received: by 10.60.172.209 with SMTP id be17mr19805375oec.51.1358257176740;
	Tue, 15 Jan 2013 05:39:36 -0800 (PST)
Received: by 10.60.161.244 with HTTP; Tue, 15 Jan 2013 05:39:36 -0800 (PST)
Received: by 10.60.161.244 with HTTP; Tue, 15 Jan 2013 05:39:36 -0800 (PST)
In-Reply-To: <20130115000449.GC10163@denix.org>
References: <CAFNBfte0i7kXGH8v7hoWdO9b==T-AQTSVJF7b1GbSovkNoowfA@mail.gmail.com>
	<20130115000449.GC10163@denix.org>
Date: Tue, 15 Jan 2013 11:39:36 -0200
Message-ID: <CAFNBfteAS-Q6W=9eeuNPxvmpS6x2QdYM7OhoQ7jvK-n5sm4FKA@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Tue, 15 Jan 2013 13:39:37 -0000
Content-Type: multipart/alternative; boundary=bcaec550b33c88847d04d353e40d

--bcaec550b33c88847d04d353e40d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Yes
Em 14/01/2013 22:05, "Denys Dmytriyenko" <denis@denix.org> escreveu:

> On Mon, Jan 14, 2013 at 06:58:31AM -0200, Flavio Castro Alves Filho wrote=
:
> > Hello,
> >
> > I'm trying to build a simple linux distro using Yocto danny and
> > meta-ti layer for Beagleboard-xm an I'm unable to download the kernel
> > files.
> >
> > I'm using Ubuntu 12.04, Yocto danny (poky), meta-ti danny branch and
> > meta-openembedded/meta-oe danny branch. I also tried using
> > openembedded-core with danny branch with the same results.
>
> Can you just do the following line on its own:
>
> $ git clone git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>
> --
> Denys
>
>
> > My error messages are the following:
> >
> >
> > flavio@Phi06:/home/prjs/beagle-xm/linux$ bitbake -c fetch virtual/kerne=
l
> > Parsing recipes: 100%
> >
> |########################################################################=
########################################|
> > Time: 00:00:39
> > Parsing of 1273 .bb files complete (0 cached, 1273 parsed). 1620
> > targets, 59 skipped, 7 masked, 0 errors.
> >
> > Build Configuration:
> > BB_VERSION        =3D "1.16.0"
> > TARGET_ARCH       =3D "arm"
> > TARGET_OS         =3D "linux-gnueabi"
> > MACHINE           =3D "beagleboard"
> > DISTRO            =3D "poky"
> > DISTRO_VERSION    =3D "1.3"
> > TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
> > TARGET_FPU        =3D "vfp-neon"
> > meta
> > meta-yocto        =3D "danny:47b0864fbd65746558d8186450c182d98bac78ca"
> > meta-oe           =3D "danny:f026e96295da101bb715858bc8705de7e4a33992"
> > meta-ti           =3D "danny:0a764d733691db4bf40539693fa3d93f6883baa7"
> >
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing RunQueue Tasks
> > WARNING: Failed to fetch URL
> > git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> ,
> > attempting MIRRORS if available
> > ERROR: Fetcher failure: Fetch command failed with exit code 128, output=
:
> > Cloning into bare repository
> >
> '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux=
-stable.git'...
> >
> > fatal: read error: Connection timed out
> > fatal: early EOF
> > fatal: index-pack failed
> >
> > ERROR: Function failed: Fetcher failure for URL:
> > 'git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> '.
> > Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> >
> /home/prjs/beagle-xm/linux/tmp/work/beagleboard-poky-linux-gnueabi/linux-=
mainline-3.2.28-r0/temp/log.do_fetch.2904
> > ERROR: Task 0 (/home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/
> linux-mainline_3.2.bb,
> > do_fetch) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
> > rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >   /home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/
> linux-mainline_3.2.bb,
> > do_fetch
> > Summary: There was 1 WARNING message shown.
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> > flavio@Phi06:/home/prjs/beagle-xm/linux$
> >
> > The log file contains the folllowing:
> >
> > DEBUG: Executing python function do_fetch
> > DEBUG: Executing python function base_do_fetch
> > DEBUG: Trying PREMIRRORS
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['bzr', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['cvs', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['git', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> > returning
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['git', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['hg', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['osc', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['p4', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['svk', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['http', 'downloads.yoctoproject.org',
> >
> '/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linu=
x-stable.git.tar.gz',
> > '', '', {}] comparing ['svn', '.*', '/.*', '', '', {}] to ['http',
> > 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['hg', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['osc', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['p4', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svk', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['svn', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > NOTE: fetch
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> > DEBUG: Fetcher accessed the network with the command /usr/bin/env wget
> > -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /home/prjs/src
> > '
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> '
> > DEBUG: Running export HOME=3D"/home/flavio"; export
> > SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ssh=
";
> > export
> GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc/gitc=
onfig";
> > export
> PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux/tmp/=
sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/prjs/b=
eagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prjs/bea=
gle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/linux/tm=
p/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-=
linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/home/pr=
js/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/lib/l=
ightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin=
:/usr/games";
> > /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate
> > -P /home/prjs/src
> > '
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> '
> > DEBUG: Mirror fetch failure for url
> >
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> > (original url: git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> )
> > DEBUG: Fetcher failure: Fetch command failed with exit code 8, output:
> >
> http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.=
scm.linux.kernel.git.stable.linux-stable.git.tar.gz
> :
> > 2013-01-13 21:18:27 ERROR 404: Not Found.
> >
> > DEBUG: Trying Upstream
> > DEBUG: Fetcher accessed the network with the command git clone --bare
> > --mirror git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >
> /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git
> > DEBUG: Running export HOME=3D"/home/flavio"; export
> > SSH_AGENT_PID=3D"1803"; export SSH_AUTH_SOCK=3D"/tmp/keyring-gnKUx0/ssh=
";
> > export
> GIT_CONFIG=3D"/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/etc/gitc=
onfig";
> > export
> PATH=3D"/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/linux/tmp/=
sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/prjs/b=
eagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts:/home/prjs/bea=
gle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/beagle-xm/linux/tm=
p/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-=
linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux//bin:/home/pr=
js/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/bin/:/usr/lib/l=
ightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin=
:/usr/games";
> > git clone --bare --mirror
> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >
> /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux-=
stable.git
> > WARNING: Failed to fetch URL
> > git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> ,
> > attempting MIRRORS if available
> > DEBUG: Fetcher failure: Fetch command failed with exit code 128, output=
:
> > Cloning into bare repository
> >
> '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux=
-stable.git'...
> >
> > fatal: read error: Connection timed out
> > fatal: early EOF
> > fatal: index-pack failed
> >
> > DEBUG: Trying MIRRORS
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['ftp', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['http', '.*',
> > '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > DEBUG: For url ['git', 'git.kernel.org',
> > '/pub/scm/linux/kernel/git/stable/linux-stable.git', '', '',
> > {'protocol': 'git', 'branch': 'linux-3.2.y'}] comparing ['https',
> > '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org',
> > '/mirror/sources/', '', '', {}]
> > ERROR: Fetcher failure: Fetch command failed with exit code 128, output=
:
> > Cloning into bare repository
> >
> '/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.linux=
-stable.git'...
> >
> > fatal: read error: Connection timed out
> > fatal: early EOF
> > fatal: index-pack failed
> >
> > DEBUG: Python function base_do_fetch finished
> > DEBUG: Python function do_fetch finished
> > ERROR: Function failed: Fetcher failure for URL:
> > 'git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3D=
linux-3.2.y;protocol=3Dgit
> '.
> > Unable to fetch URL from any source.
> >
> > Does anybody have any idea of what am I doing wrong?
> >
> > Best regards,
> >
> > Flavio
> >
> > --
> > Flavio de Castro Alves Filho
> >
> > flavio.alves@gmail.com
> > www.linuxembarcado.com
> > Twitter: http://twitter.com/#!/fraviofii
> > LinkedIn profile: www.linkedin.com/in/flaviocastroalves
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
>

--bcaec550b33c88847d04d353e40d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Yes</p>
<div class=3D"gmail_quote">Em 14/01/2013 22:05, &quot;Denys Dmytriyenko&quo=
t; &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; escreveu:=
<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Mon, Jan 14, 2013 at 06:58:31AM -0200, Flavio Castro Alves Filho wrote:<=
br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m trying to build a simple linux distro using Yocto danny and<br=
>
&gt; meta-ti layer for Beagleboard-xm an I&#39;m unable to download the ker=
nel<br>
&gt; files.<br>
&gt;<br>
&gt; I&#39;m using Ubuntu 12.04, Yocto danny (poky), meta-ti danny branch a=
nd<br>
&gt; meta-openembedded/meta-oe danny branch. I also tried using<br>
&gt; openembedded-core with danny branch with the same results.<br>
<br>
Can you just do the following line on its own:<br>
<br>
$ git clone git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git=
/stable/linux-stable.git" target=3D"_blank">git.kernel.org/pub/scm/linux/ke=
rnel/git/stable/linux-stable.git</a><br>
<br>
--<br>
Denys<br>
<br>
<br>
&gt; My error messages are the following:<br>
&gt;<br>
&gt;<br>
&gt; flavio@Phi06:/home/prjs/beagle-xm/linux$ bitbake -c fetch virtual/kern=
el<br>
&gt; Parsing recipes: 100%<br>
&gt; |#####################################################################=
###########################################|<br>
&gt; Time: 00:00:39<br>
&gt; Parsing of 1273 .bb files complete (0 cached, 1273 parsed). 1620<br>
&gt; targets, 59 skipped, 7 masked, 0 errors.<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.16.0&quot;<br>
&gt; TARGET_ARCH =A0 =A0 =A0 =3D &quot;arm&quot;<br>
&gt; TARGET_OS =A0 =A0 =A0 =A0 =3D &quot;linux-gnueabi&quot;<br>
&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;beagleboard&quot;<br>
&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>
&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.3&quot;<br>
&gt; TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon cortexa8&quot;<br>
&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;<br>
&gt; meta<br>
&gt; meta-yocto =A0 =A0 =A0 =A0=3D &quot;danny:47b0864fbd65746558d8186450c1=
82d98bac78ca&quot;<br>
&gt; meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;danny:f026e96295da101bb715858bc8=
705de7e4a33992&quot;<br>
&gt; meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;danny:0a764d733691db4bf40539693f=
a3d93f6883baa7&quot;<br>
&gt;<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; NOTE: Preparing runqueue<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; WARNING: Failed to fetch URL<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/stable=
/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" target=3D"_blank">gi=
t.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3Dlinu=
x-3.2.y;protocol=3Dgit</a>,<br>

&gt; attempting MIRRORS if available<br>
&gt; ERROR: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:<br>
&gt; Cloning into bare repository<br>
&gt; &#39;/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stabl=
e.linux-stable.git&#39;...<br>
&gt;<br>
&gt; fatal: read error: Connection timed out<br>
&gt; fatal: early EOF<br>
&gt; fatal: index-pack failed<br>
&gt;<br>
&gt; ERROR: Function failed: Fetcher failure for URL:<br>
&gt; &#39;git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/s=
table/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" target=3D"_blan=
k">git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=
=3Dlinux-3.2.y;protocol=3Dgit</a>&#39;.<br>

&gt; Unable to fetch URL from any source.<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/prjs/beagle-xm/linux/tmp/work/beagleboard-poky-linux-gnueabi/lin=
ux-mainline-3.2.28-r0/temp/log.do_fetch.2904<br>
&gt; ERROR: Task 0 (/home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/=
<a href=3D"http://linux-mainline_3.2.bb" target=3D"_blank">linux-mainline_3=
.2.bb</a>,<br>
&gt; do_fetch) failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn&#39;t need to b=
e<br>
&gt; rerun and 1 failed.<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt; =A0 /home/prjs/beagle-xm/poky/meta-ti/recipes-kernel/linux/<a href=3D"=
http://linux-mainline_3.2.bb" target=3D"_blank">linux-mainline_3.2.bb</a>,<=
br>
&gt; do_fetch<br>
&gt; Summary: There was 1 WARNING message shown.<br>
&gt; Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.<br>
&gt; flavio@Phi06:/home/prjs/beagle-xm/linux$<br>
&gt;<br>
&gt; The log file contains the folllowing:<br>
&gt;<br>
&gt; DEBUG: Executing python function do_fetch<br>
&gt; DEBUG: Executing python function base_do_fetch<br>
&gt; DEBUG: Trying PREMIRRORS<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;bzr&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;cvs&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;git&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url git://<a href=3D"http://git.kernel.org/pub/scm/linux/ke=
rnel/git/stable/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" targe=
t=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi=
t;branch=3Dlinux-3.2.y;protocol=3Dgit</a><br>

&gt; returning <a href=3D"http://downloads.yoctoproject.org/mirror/sources/=
git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz=
" target=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2_g=
it.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a><b=
r>

&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;bzr&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;cvs&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;git&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;hg&#39;, &#39;.*&#39;, &#3=
9;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;osc&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;p4&#39;, &#39;.*&#39;, &#3=
9;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;svk&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;http&#39;, &#39;<a href=3D"http://downloads.yocto=
project.org" target=3D"_blank">downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.stab=
le.linux-stable.git.tar.gz&#39;,<br>
&gt; &#39;&#39;, &#39;&#39;, {}] comparing [&#39;svn&#39;, &#39;.*&#39;, &#=
39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;,<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank">d=
ownloads.yoctoproject.org</a>&#39;, &#39;/mirror/sources/&#39;, &#39;&#39;,=
 &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;hg&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;osc&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;p4&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;svk&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;svn&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; NOTE: fetch <a href=3D"http://downloads.yoctoproject.org/mirror/source=
s/git2_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.=
gz" target=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2=
_git.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a>=
<br>

&gt; DEBUG: Fetcher accessed the network with the command /usr/bin/env wget=
<br>
&gt; -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /home/prjs/src<=
br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_=
git.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz" tar=
get=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.ke=
rnel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a>&#39;<b=
r>

&gt; DEBUG: Running export HOME=3D&quot;/home/flavio&quot;; export<br>
&gt; SSH_AGENT_PID=3D&quot;1803&quot;; export SSH_AUTH_SOCK=3D&quot;/tmp/ke=
yring-gnKUx0/ssh&quot;;<br>
&gt; export GIT_CONFIG=3D&quot;/home/prjs/beagle-xm/linux/tmp/sysroots/i686=
-linux/etc/gitconfig&quot;;<br>
&gt; export PATH=3D&quot;/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagl=
e-xm/linux/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnuea=
bi:/home/prjs/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts=
:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/bea=
gle-xm/linux/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp=
/sysroots/i686-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linu=
x//bin:/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/=
bin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr=
/bin:/sbin:/bin:/usr/games&quot;;<br>

&gt; /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate<=
br>
&gt; -P /home/prjs/src<br>
&gt; &#39;<a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_=
git.kernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz" tar=
get=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.ke=
rnel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a>&#39;<b=
r>

&gt; DEBUG: Mirror fetch failure for url<br>
&gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_git.k=
ernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz" target=
=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.kerne=
l.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a><br>

&gt; (original url: git://<a href=3D"http://git.kernel.org/pub/scm/linux/ke=
rnel/git/stable/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" targe=
t=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi=
t;branch=3Dlinux-3.2.y;protocol=3Dgit</a>)<br>

&gt; DEBUG: Fetcher failure: Fetch command failed with exit code 8, output:=
<br>
&gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_git.k=
ernel.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz" target=
=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.kerne=
l.org.pub.scm.linux.kernel.git.stable.linux-stable.git.tar.gz</a>:<br>

&gt; 2013-01-13 21:18:27 ERROR 404: Not Found.<br>
&gt;<br>
&gt; DEBUG: Trying Upstream<br>
&gt; DEBUG: Fetcher accessed the network with the command git clone --bare<=
br>
&gt; --mirror git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/g=
it/stable/linux-stable.git" target=3D"_blank">git.kernel.org/pub/scm/linux/=
kernel/git/stable/linux-stable.git</a><br>
&gt; /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.lin=
ux-stable.git<br>
&gt; DEBUG: Running export HOME=3D&quot;/home/flavio&quot;; export<br>
&gt; SSH_AGENT_PID=3D&quot;1803&quot;; export SSH_AUTH_SOCK=3D&quot;/tmp/ke=
yring-gnKUx0/ssh&quot;;<br>
&gt; export GIT_CONFIG=3D&quot;/home/prjs/beagle-xm/linux/tmp/sysroots/i686=
-linux/etc/gitconfig&quot;;<br>
&gt; export PATH=3D&quot;/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagl=
e-xm/linux/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnuea=
bi:/home/prjs/beagle-xm/linux/tmp/sysroots/beagleboard/usr/bin/crossscripts=
:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linux/usr/sbin:/home/prjs/bea=
gle-xm/linux/tmp/sysroots/i686-linux/usr/bin:/home/prjs/beagle-xm/linux/tmp=
/sysroots/i686-linux/sbin:/home/prjs/beagle-xm/linux/tmp/sysroots/i686-linu=
x//bin:/home/prjs/beagle-xm/poky/scripts:/home/prjs/beagle-xm/poky/bitbake/=
bin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr=
/bin:/sbin:/bin:/usr/games&quot;;<br>

&gt; git clone --bare --mirror<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/stable=
/linux-stable.git" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux-stable.git</a><br>
&gt; /home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stable.lin=
ux-stable.git<br>
&gt; WARNING: Failed to fetch URL<br>
&gt; git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/stable=
/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" target=3D"_blank">gi=
t.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=3Dlinu=
x-3.2.y;protocol=3Dgit</a>,<br>

&gt; attempting MIRRORS if available<br>
&gt; DEBUG: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:<br>
&gt; Cloning into bare repository<br>
&gt; &#39;/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stabl=
e.linux-stable.git&#39;...<br>
&gt;<br>
&gt; fatal: read error: Connection timed out<br>
&gt; fatal: early EOF<br>
&gt; fatal: index-pack failed<br>
&gt;<br>
&gt; DEBUG: Trying MIRRORS<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;ftp&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;http&#39;, &#39;.*&#39;,<br>
&gt; &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http&#39;, &#39;<a=
 href=3D"http://downloads.yoctoproject.org" target=3D"_blank">downloads.yoc=
toproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; DEBUG: For url [&#39;git&#39;, &#39;<a href=3D"http://git.kernel.org" =
target=3D"_blank">git.kernel.org</a>&#39;,<br>
&gt; &#39;/pub/scm/linux/kernel/git/stable/linux-stable.git&#39;, &#39;&#39=
;, &#39;&#39;,<br>
&gt; {&#39;protocol&#39;: &#39;git&#39;, &#39;branch&#39;: &#39;linux-3.2.y=
&#39;}] comparing [&#39;https&#39;,<br>
&gt; &#39;.*&#39;, &#39;/.*&#39;, &#39;&#39;, &#39;&#39;, {}] to [&#39;http=
&#39;, &#39;<a href=3D"http://downloads.yoctoproject.org" target=3D"_blank"=
>downloads.yoctoproject.org</a>&#39;,<br>
&gt; &#39;/mirror/sources/&#39;, &#39;&#39;, &#39;&#39;, {}]<br>
&gt; ERROR: Fetcher failure: Fetch command failed with exit code 128, outpu=
t:<br>
&gt; Cloning into bare repository<br>
&gt; &#39;/home/prjs/src/git2/git.kernel.org.pub.scm.linux.kernel.git.stabl=
e.linux-stable.git&#39;...<br>
&gt;<br>
&gt; fatal: read error: Connection timed out<br>
&gt; fatal: early EOF<br>
&gt; fatal: index-pack failed<br>
&gt;<br>
&gt; DEBUG: Python function base_do_fetch finished<br>
&gt; DEBUG: Python function do_fetch finished<br>
&gt; ERROR: Function failed: Fetcher failure for URL:<br>
&gt; &#39;git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/s=
table/linux-stable.git;branch=3Dlinux-3.2.y;protocol=3Dgit" target=3D"_blan=
k">git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=
=3Dlinux-3.2.y;protocol=3Dgit</a>&#39;.<br>

&gt; Unable to fetch URL from any source.<br>
&gt;<br>
&gt; Does anybody have any idea of what am I doing wrong?<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Flavio<br>
&gt;<br>
&gt; --<br>
&gt; Flavio de Castro Alves Filho<br>
&gt;<br>
&gt; <a href=3D"mailto:flavio.alves@gmail.com">flavio.alves@gmail.com</a><b=
r>
&gt; <a href=3D"http://www.linuxembarcado.com" target=3D"_blank">www.linuxe=
mbarcado.com</a><br>
&gt; Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank"=
>http://twitter.com/#!/fraviofii</a><br>
&gt; LinkedIn profile: <a href=3D"http://www.linkedin.com/in/flaviocastroal=
ves" target=3D"_blank">www.linkedin.com/in/flaviocastroalves</a><br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
</blockquote></div>

--bcaec550b33c88847d04d353e40d--
