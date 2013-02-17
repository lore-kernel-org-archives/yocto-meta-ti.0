Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45238E0144A
	for <meta-ti@yoctoproject.org>; Sun, 17 Feb 2013 15:42:46 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIE00L9E1UMEC30@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 17 Feb 2013 17:42:27 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 09E0D20531; Sun,
	17 Feb 2013 18:42:21 -0500 (EST)
Date: Sun, 17 Feb 2013 18:42:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20130217234221.GE2174@denix.org>
References: <1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
	<CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
	<CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
	<CALbNGRSSsPvC8gRJ6nx0HjjQoPM1NBRoPNQFWBKrbqAz0hN54w@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C388EA4@DFLE09.ent.ti.com>
	<CALbNGRTnx5Tg8Vcme4eZ77bDSzwkaoHHuTa4C+z6tfM+bB4jwA@mail.gmail.com>
	<CALbNGRRt7QoifHFqQMDeSY7g2ABt15_KhgBos6ijwGbLAOcpPw@mail.gmail.com>
	<CALbNGRTbKfetZ3kDUnzFjx+cxM0O-mLob5HcjS4YMLmJ5DVyYA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALbNGRTbKfetZ3kDUnzFjx+cxM0O-mLob5HcjS4YMLmJ5DVyYA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Sun, 17 Feb 2013 23:42:46 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Wed, Feb 13, 2013 at 11:43:34AM +0100, Andreas Müller wrote:
> On Tue, Feb 12, 2013 at 12:03 AM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Feb 7, 2013 at 5:25 PM, Andreas Müller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Thu, Feb 7, 2013 at 2:51 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
> >>> Yes I've got this working for me on danny. However, I do use a non x11 build which is most likely the reason why I am not having this problem.
> >>>
> >>> A related thread about possible issues with x11 distributions
> >>> https://lists.yoctoproject.org/pipermail/meta-ti/2012-September/001502.html
> >>>
> >>>
> >> Have fixed this - after testing I will send a follow up patch series
> >> because I am really burning to see the X11 stuff...
> >>
> >> Andreas
> > Aargh - during tests I ran into other issues with oe-core/meta-oe
> > current HEAD so I can not do run-tests. Build-tested results are at
> >
> > https://gitorious.org/schnitzeltony-oe-meta/meta-ti/commits/sgx-test
> >
> > As soon as HEADS are back and build working images I'll return on this...
> >
> OK I managed to build and am testing now. When loading pvr_drv X
> complains for wrong ABI (is 10 expected 13). Is there a version of
> Graphics SDK available with support for xserver 1.13? I saw
> v4.08.00.02 supports xserver 1.12. Are there any other sources for the
> userspace-driver part?

Andreas,

I just pushed v4.08.00.01. Please let us know if you have any further comments 
or patches.

Currently, v4.08.00.02 has some issues compiling from the recipes, as 
historically recipes didn't use Graphics SDK's Makefiles - we will be 
reworking that soon. As well as we'll try to address installer's size issue.

As of the xserver support - 1.12 from v4.08.00.02 is as good as it gets right 
now. While X11 support hasn't been the first priority for Graphics SDK lately, 
that might change in the near future...

-- 
Denys

