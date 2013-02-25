Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7DF6E00496
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 06:32:52 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIS00IVU5PXOL80@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Feb 2013 08:32:37 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2EC64200F4; Mon,
	25 Feb 2013 09:32:21 -0500 (EST)
Date: Mon, 25 Feb 2013 09:32:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20130225143221.GB6725@denix.org>
References: <CALbNGRRDr+6vLtJRDgRi1NbO+s0sUB5TLT7uTck5L5La6xfDQw@mail.gmail.com>
	<CABcZANn3JbnhTEEP85K5bxXQd9ipYmuP9-bqMizpw+z9R3HhiQ@mail.gmail.com>
	<CAPhnLPCYxVk8F72Tv=PJo2OQJQmMdN0RKXNmTj_JeVy+7VJ+qA@mail.gmail.com>
	<CAPhnLPBwwM84Pu25od0pLr2446-RSbGsDHQbayQE3g+xNV2tkw@mail.gmail.com>
	<CALbNGRSioFk7F3W9yp_VbHz6sXP-LjUtg0DqJorZmyHt_+J2sw@mail.gmail.com>
	<CABxcv=kdCzvj=Z4GDtYC4P-az9LnT5VhrspRrZq8p568uPo9QA@mail.gmail.com>
	<CALbNGRSZeOC0Tyv1-x6og6g+HOD148PUdCWcONYBE_YUQ7FASA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALbNGRSZeOC0Tyv1-x6og6g+HOD148PUdCWcONYBE_YUQ7FASA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, "bitbake-devel@lists.openembedded.org"
	<bitbake-devel@lists.openembedded.org>,
	Chris Larson <clarson@kergoth.com>, "Flanagan,
	Elizabeth" <elizabeth.flanagan@intel.com>
Subject: Re: [bitbake-devel] trouble during parsing
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
X-List-Received-Date: Mon, 25 Feb 2013 14:32:53 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: 8bit

On Mon, Feb 25, 2013 at 11:02:21AM +0100, Andreas Müller wrote:
> On Mon, Feb 25, 2013 at 10:46 AM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > On Mon, Feb 25, 2013 at 10:32 AM, Andreas Müller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Mon, Feb 25, 2013 at 3:28 AM, Flanagan, Elizabeth
> >> <elizabeth.flanagan@intel.com> wrote:
> >>> On Sun, Feb 24, 2013 at 6:12 PM, Flanagan, Elizabeth
> >>> <elizabeth.flanagan@intel.com> wrote:
> >>>> On Wed, Feb 20, 2013 at 6:31 AM, Chris Larson <clarson@kergoth.com> wrote:
> >>>>>
> >>>>> On Wed, Feb 20, 2013 at 5:54 AM, Andreas Müller
> >>>>> <schnitzeltony@googlemail.com> wrote:
> >>>>>>
> >>>>>> with current bitbake master I get
> >>>>>>
> >>>>>> ERROR: Command execution failed: Traceback (most recent call
> >>>>>> last):#########################################################
> >>>>>>                               | ETA:  00:00:17
> >>>>>>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/command.py", line
> >>>>>> 92, in runAsyncCommand
> >>>>>>     self.cooker.updateCache()
> >>>>>>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/cooker.py", line
> >>>>>> 1330, in updateCache
> >>>>>>     if not self.parser.parse_next():
> >>>>>>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/cooker.py", line
> >>>>>> 1703, in parse_next
> >>>>>>     self.virtuals += len(result)
> >>>>>> TypeError: object of type 'ExpansionError' has no len()
> >>>>>
> >>>>>
> >>>>> Hmm, looks like it's returning the exceptions rather than raising them, for
> >>>>> some reason, but that doesn't make much sense — the pool code always raises
> >>>>> any exceptions from its imap iterator's next() method.
> >>>>> --
> >>>>> Christopher Larson
> >>>>>
> >>>>
> >>>> I'm hitting this as well with
> >>>> poky:dde7a481354d5b0539762109bdfaaba6f85f879b, meta-ti and pandaboard
> >>>> as my machine.
> >>>>
> >>>
> >>> Ach, should have updated my email. Seems reverting
> >>> 0a99563a4ea270594fd9a61da46f9387fb79dc66 cleared up the issue.
> >>>
> >>> -b
> >>>
> >> I have two machines (Fedora 14  / Fedora 15)  both reverted
> >> 0a99563a4ea270594fd9a61da46f9387fb79dc66 and both worked fine during
> >> weekend.
> >>
> >> Just a guess: Last week when arago git was down I saw errors during
> >> parsing for a recipe I never used. This was with a revision of bitbake
> >> a bit earlier than HEAD - that caused me to update. After sending a
> >> message to meta-ti I could work during weekend. Now it seems arago is
> >> down again:
> >>
> >> $ git clone git://arago-project.org/git/projects/u-boot-keystone.git
> >> Cloning into u-boot-keystone...
> >> fatal: read error: Connection reset by peer
> >>
> >> and bitbake -DD gives
> >>
> >> DEBUG: Fetcher accessed the network with the command git ls-remote
> >> git://arago-project.org/git/projects/u-boot-keystone.git
> >> DEV.MCSDK-03.00.00.07
> >> DEBUG: Running export SSH_AUTH_SOCK="/tmp/keyring-Pob6mG/ssh"; export
> >> PATH="/home/andreas/data/oe-core/sources/openembedded-core/scripts:/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi:/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/bin/crossscripts:/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/sbin:/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin:/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/sbin:/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux//bin:/home/andreas/oe-core/sources/bitbake/bin:/home/andreas/data/OpenEmbedded/bitbake/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:./:/home/andreas/bin:/sbin:/usr/sbin";
> >> export HOME="/home/andreas"; git ls-remote
> >> git://arago-project.org/git/projects/u-boot-keystone.git
> >> DEV.MCSDK-03.00.00.07
> >> DEBUG: while parsing sstate_installpkg, in call of bb.build.exec_func,
> >> argument 'preinst' is not a string literal
> >> DEBUG: while parsing sstate_install, in call of bb.build.exec_func,
> >> argument 'postinst' is not a string literal
> >>
> >> ...
> >>
> >> DEBUG: while parsing sstate_installpkg, in call of bb.build.exec_func,
> >> argument 'preinst' is not a string literal
> >> DEBUG: while parsing sstate_install, in call of bb.build.exec_func,
> >> argument 'postinst' is not a string literal
> >> DEBUG: while parsing do_clean, in call of bb.build.exec_func, argument
> >> 'f' is not a string literal
> >> DEBUG: while parsing sstate_installpkg, in call of bb.build.exec_func,
> >> argument 'preinst' is not a string literal
> >> ERROR: Command execution failed: Traceback (most recent call last):
> >>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/command.py", line
> >> 92, in runAsyncCommand
> >>     self.cooker.updateCache()
> >>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/cooker.py", line
> >> 1329, in updateCache
> >>     if not self.parser.parse_next():
> >>   File "/home/andreas/oe-core/sources/bitbake/lib/bb/cooker.py", line
> >> 1702, in parse_next
> >>     self.virtuals += len(result)
> >> TypeError: object of type 'ExpansionError' has no len()
> >>
> >>
> >> In the recipe u-boot_2013.01.bb I find SRCREV = "DEV.MCSDK-03.00.00.07"
> >>
> >> which is not a commit ID and causes a git ls-remote during parse
> >>
> >> Is it possible that this error occurs when a git SRC_URI server closes
> >> connection unexpected?
> >>
> >> Andreas
> >
> > Hi Andreas,
> >
> > I have the same issue and your guess is correct. The problem is that
> > Arago servers are down so "git ls-remote" is failing and this makes
> > the BitBake task to fail as well.
> >
> > Now about the why is been used tag names instead of just commits IDs
> > so a "git ls-remote" call is needed, this is because some git trees in
> > arago are been rebased overwriting the commit IDs.
> >
> > You may take a look to Robert P. J. Day email "[meta-ti] objections to
> > replacing git SRCREV tag names with actual      hash IDs?" [1] to get a
> > better understanding of this.
> >
> > Best regards,
> > javier
> >
> > [1]: http://www.mail-archive.com/meta-ti@yoctoproject.org/msg01304.html
> 
> One additional note: With current bitbake there are configurations
> which cause a full parse on every build [1]. Is it possible that
> arrago-git dies for the flood of  git ls-remote?
> 
> Andreas
> 
> [1] http://lists.linuxtogo.org/pipermail/bitbake-devel/2013-February/004178.html

All,

First of all, sorry for the troubles with the server connection. It should be 
fine now.

Second, there is a hard limit of maximum allowed simultaneous git connections 
on the server due to limited resources, and the limit was maxed out. The 
server was still running fine, but it would not accept any more connections. 
It looked like a DoS attack - connections were still running and packing data. 
Most of the connections were from China - I'm wondering how long does it take 
to clone a large git tree from over there...

Anyway, there are some fixes related to this problem being discussed and will 
be implemented shortly...

And BTW, bitbake's git-ls-remote is very fragile and we've seen it failing on 
a good server connection (even with kernel.org and github.com) very easily. 
There needs to be a re-try count implemented for that code as well...

-- 
Denys

