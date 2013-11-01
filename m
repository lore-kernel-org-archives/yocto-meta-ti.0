Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45821E017D5
	for <meta-ti@yoctoproject.org>; Fri,  1 Nov 2013 01:47:19 -0700 (PDT)
Received: from ad.chargestorm.se (213.114.79.21) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 1 Nov 2013 09:46:58 +0100
Date: Fri, 1 Nov 2013 09:46:57 +0100
From: Anders Darander <anders@chargestorm.se>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <20131101084656.GB6346@ad.chargestorm.se>
Mail-Followup-To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <20131025080849.GB8552@ad.chargestorm.se>
	<20131029200127.GM22054@edge>
MIME-Version: 1.0
In-Reply-To: <20131029200127.GM22054@edge>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: meta-ti/arago support for TI8148
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
X-List-Received-Date: Fri, 01 Nov 2013 08:47:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Denys Dmytriyenko <denys@ti.com> [131029 21:01]:
> On Fri, Oct 25, 2013 at 10:08:49AM +0200, Anders Darander wrote:
> > Hi,

> > I've got a customer using a dm8148 SoC, and though I'm not yet tasked
> > with helping them with the build system (I've got some lower level task
> > I'm helping them with), I suspect that it's just a matter of time before
> > they ask me to help setup their build environment.

> > I know that there was a commit in ~April that removed TI8148 from
> > meta-ti, stated that this machine were no longer supported. However,
> > from that commit message I can't really conclude whether it was
> > supported and working up until that, or if it had been non-functioning
> > for quite some time.

> > Has there been working support for TI8184 in meta-ti (i.e. after the
> > move to a oe-core based setup)? Or is the last supported version found
> > elsewhere?

> > To summarise my question; what's the latest version that
> > supports/supported the TI8184? meta-ti, meta-arago, arago, or where?
> > I'd be happy for any pointers regarding this. 

> Anders,

> The last supported kernel version for TI8148 was 2.6.37. There was still some 
> work being done to fix reported issues (look around arago-project.org repos), 
> but no new versions were planned or worked on. 

Sure, I didn't expect any newer kernel then 2.6.37. (As that was
customary for most vendors at that point in time).

> One of the biggest reasons to remove the support from meta-ti/danny
> was due to everyone expecting to get it updated to 3.x (which wasn't
> happening) and also because we were starting to see more and more
> incompatibilities between 2.6.37 kernel and new toolchains and new
> userspace system tools, like udev/systemd etc.

Fair enough.

I was only hoping that someone could point to a release / src-rev in
meta-arago that should have been working. (It be nice to work using
something oe-core based).

> So, your best bet would be to either start with a corresponding EzSDK for that 
> platform, or try to match toolchain and userspace that was available around 
> the time 2.6.37 was relevant...

Ok, then I guess that the best bet would be to look at the arago
project, prior to the move to oe-core / Yocto based arago...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

