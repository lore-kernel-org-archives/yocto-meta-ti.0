Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCA29E01304
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 14:11:58 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7LLBudv028648;
	Tue, 21 Aug 2012 16:11:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7LLBu9T019935;
	Tue, 21 Aug 2012 16:11:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 21 Aug 2012 16:11:56 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7LLBt31028118;
	Tue, 21 Aug 2012 16:11:55 -0500
Date: Tue, 21 Aug 2012 17:11:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120821211155.GE7636@edge>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
	<20120821180942.GB7636@edge>
	<CAMKF1sqpM+wVj_EGAqojAUbknH_WnBb4L9nZh3-fH2uDhEx4RA@mail.gmail.com>
	<20120821195359.GC7636@edge>
	<CAMKF1sobc2Xu1Ti-CyOP3PELRXst2WRXB3z3+_FDTgFGfGjm3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sobc2Xu1Ti-CyOP3PELRXst2WRXB3z3+_FDTgFGfGjm3Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linaro and CS ABI compatibility
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
X-List-Received-Date: Tue, 21 Aug 2012 21:11:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2012 at 01:54:28PM -0700, Khem Raj wrote:
> On Tue, Aug 21, 2012 at 12:54 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Tue, Aug 21, 2012 at 11:39:07AM -0700, Khem Raj wrote:
> >> On Tue, Aug 21, 2012 at 11:09 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> >> >
> >> > BTW, Yocto Project prefers self-built toolchain, although you can easily add
> >> > Linaro toolchain with meta-linaro layer.
> >>
> >> There are no ABI differences even though its built separately.
> >
> > Linaro's external (i.e. pre-built) toolchain now defaults to hardfp, so still
> > need to pay attention to possible ABI mismatch...
> 
> you would use callconvention-hard TUNE_FEATURE in such a case which
> would configure
> internal toolchain to do hardfp call convention. But yes when it comes
> to prebuilt
> toolchains a bit of extra care is always good.

Regardless, Graphics SDK comes pre-built and the hard-fp version wasn't yet 
released, AFAIK.

-- 
Denys

