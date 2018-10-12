Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0CBFE00B93; Fri, 12 Oct 2018 14:14:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B50BE00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 14:14:50 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id q12-v6so8490469qkl.13
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5MikP4JdfUhrV25FijhW9f4Q8HCgguRaY+KcpHDWiO0=;
	b=sArOuOU2gxmSbOgtmAQE7vQsdAfBbrtilpfkKgCFSF/7SarZ47v0snHN6ggDqp61un
	9TN7VWo+uwrJ5bwzTgh1Z/DZ7pPIbYFG9IxYULanipcR+SnadyNoYxRhDdP2+PeMvDj3
	soIjExQB7I6ipAg5Z1MVE0/BVOE8RuxfmGxET3Y5ewcXJ1yvTV/DjxUHcpqNxfrjuhdW
	G+FB7JKzC17MAxqu6gLmXcXTvuChhG0AKt24J1jJ2SgNFowNjF6NcvihP7WC2pkQ/Bdu
	ccIVs/PsGK9tZ/tU3Lc4bueF92VwlzWbVMtjQ9CUfS97phwKXkeUs7JUZDpkZEQuUIW0
	a8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5MikP4JdfUhrV25FijhW9f4Q8HCgguRaY+KcpHDWiO0=;
	b=FyJjSHeskFpsbRr/pIenMa+ZtuHCbc8lRA2kjUk8smBu+lbiXEhlV63k590yljrXiv
	rX4OEXWBSQtDejboQiMHxOCg9qqK8OXJqyDNsIOb2jhF2xKoj6Tb0HKeVO2KhimHK9eR
	P6gAm/zBE0y076FNWUPNvlBwtuYbW4qhwU4ruyA64kwiRuOYyb9OlXpmioQQCGswHYUr
	+lvpIsDHeZYifJVw+rK/nPnYANar+sOwtoAwGyIW9gJvQ98mDGIw4cCJzJxWhwZYQEjl
	E8wNHTga1f4pCjOjiyWsicIxbDtZYHyhb8cdxSoe+Ylxs3Xmf7Nbi8ozk5L/XxFTvNoZ
	4dAQ==
X-Gm-Message-State: ABuFfoibf3X/5W2Dm3Mqirkuw4QZqIyNZX3KNeIUamQS2dA8UBCAXj6h
	lRXXPUwaoRfw+dGJ4SnMLYR+VBSqHHQ0iJjTYLI=
X-Google-Smtp-Source: ACcGV61Qwpqb1pG7hBTFinHLD5cEOgrMUUBdJyg6m6jW5iGQN4nzbWCTEun6bYrLJFK4J4hgL06VDRcQLPeyu39Mau8=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr7639357qkl.2.1539378889394; 
	Fri, 12 Oct 2018 14:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20181012195000.4545-1-raj.khem@gmail.com>
	<20181012195801.GV19188@beryl>
	<CAMKF1spE0fJTErUNg=ifQx9s2T-UybjAL++GFwZM+Pyi77pJwg@mail.gmail.com>
	<20181012203149.GW19188@beryl>
	<CAMKF1sqh743UGN0DeWEoR1jX=2NQYGtwh+ONEg+q0MTXkkx3aA@mail.gmail.com>
	<20181012203700.GY19188@beryl>
	<CAMKF1sr48=qWuYYGA4DBbA7Mz+SeOquVfv8iLCWXh66+_pfYQw@mail.gmail.com>
	<20181012210144.GZ19188@beryl>
In-Reply-To: <20181012210144.GZ19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 14:14:23 -0700
Message-ID: <CAMKF1spNj-CGTGUQaRqSNZXjjspVQQ_fkRt=9pHDhMYMG279Pg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
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
X-List-Received-Date: Fri, 12 Oct 2018 21:14:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 2:01 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Fri, Oct 12, 2018 at 01:49:05PM -0700, Khem Raj wrote:
> > On Fri, Oct 12, 2018 at 1:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Fri, Oct 12, 2018 at 01:34:13PM -0700, Khem Raj wrote:
> > > > On Fri, Oct 12, 2018 at 1:31 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > On Fri, Oct 12, 2018 at 01:01:41PM -0700, Khem Raj wrote:
> > > > > > On Fri, Oct 12, 2018 at 12:58 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > > >
> > > > > > > Are you still trying to do world builds? :)
> > > > > > >
> > > > > >
> > > > > > yes. with the patches I send in this week meta-ti seems to behave in
> > > > > > multi-BSP setup
> > > > > > I will soon add it to bblayers.conf for Yoe distro and it will start
> > > > > > testing on meta-openembedded CI builds, atleast for not nosing other
> > > > > > BSPs, I dont have infra to do world build for all the machines
> > > > > >
> > > > > > but if you were to pick Yoe distro and run with it for machines you
> > > > > > are interested in
> > > > > > that would be awesome.
> > > > > >
> > > > > > See. https://github.com/YoeDistro/yoe-distro, everyone having interesting boards
> > > > > > is welcome to run world builds using that and report problems.
> > > > >
> > > > > I can probably add it to my CI loop as well - I already do extensive builds
> > > > > and tests on Arago, Poky and distroless.
> > > >
> > > > Cool thanks. Although you wont need all of above
> > > > after this :)
> > >
> > > Meaning?
> >
> > Yoe is a superset
>
> Uhm, hardly. Do you mean just BSP pieces?

not only that but we have added lot
of common layers too

