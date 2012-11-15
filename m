Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43FB6E00498
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 14:39:38 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDJ008YIW9M6I40@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 15 Nov 2012 16:39:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F26022004C; Thu,
	15 Nov 2012 17:39:21 -0500 (EST)
Date: Thu, 15 Nov 2012 17:39:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Belisko Marek <marek.belisko@gmail.com>
Message-id: <20121115223921.GA28859@denix.org>
References: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
	<CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
	<CAAfyv36w+eRju-dA0zd_L9pgLjhaQJjeYjMwMJrXBgC12ajBkg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAAfyv36w+eRju-dA0zd_L9pgLjhaQJjeYjMwMJrXBgC12ajBkg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard fails to fetch 3.4 kernel
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
X-List-Received-Date: Thu, 15 Nov 2012 22:39:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 15, 2012 at 09:37:43PM +0100, Belisko Marek wrote:
> Hi,
> 
> On Thu, Nov 15, 2012 at 9:36 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> > On Thu, Nov 15, 2012 at 9:32 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> >> ERROR: Function failed: Fetcher failure for URL:
> >> 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
> >> Unable to fetch URL from any source.
> >> ERROR: Logfile of failure stored in:
> >> /home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671
> >> ERROR: Task 681
> >> (/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
> >> do_fetch) failed with exit code '1'
> >>
> >
> > are you behind a corporate firewall?
> Nope.
> >
> > is it reproducible several times? it could be a weakness of our git server...
> 100% reproducible

Can you do it manually:

$ git clone git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git
Cloning into 'kernel-ubuntu'...
remote: Counting objects: 2881261, done.
remote: Compressing objects: 100% (435671/435671), done.
remote: Total 2881261 (delta 2417385), reused 2880107 (delta 2416231)
Receiving objects: 100% (2881261/2881261), 691.87 MiB | 1.02 MiB/s, done.
Resolving deltas: 100% (2417385/2417385), done.
Checking out files: 100% (33126/33126), done.

-- 
Denys

