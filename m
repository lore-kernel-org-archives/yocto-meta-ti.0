Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7A43E009C1; Thu, 14 May 2015 15:08:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	T_HDRS_LCASE,T_MANY_HDRS_LCASE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 T_HDRS_LCASE Odd capitalization of message header
	* 0.0 T_MANY_HDRS_LCASE Odd capitalization of multiple message headers
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 192CAE00985
	for <meta-ti@yoctoproject.org>; Thu, 14 May 2015 15:08:27 -0700 (PDT)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOD005M11HDQK40@vms173021.mailsrvcs.net>; Thu,
	14 May 2015 17:08:11 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ZJdgQs+z c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10	a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
	a=ipKX-WOIrPPr20CU9TIA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CF177200EB; Thu,
	14 May 2015 18:08:01 -0400 (EDT)
Date: Thu, 14 May 2015 18:08:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-id: <20150514220801.GD20022@denix.org>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
	<55521DB8.2070606@windriver.com>
MIME-version: 1.0
In-reply-to: <55521DB8.2070606@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?iso-8859-1?Q?Schauml=F6ffel=2C?= Jan <J.Schaumloeffel@astro-kom.de>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Thu, 14 May 2015 22:08:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:
> On 2015-05-12 10:20 AM, Brian Hutchinson wrote:
> >On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
> ><bruce.ashfield@windriver.com> wrote:
> >>On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
> >>>
> >>>On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
> >>><bruce.ashfield@windriver.com> wrote:
> >>>>
> >>>>It is plausible. But in theory, linux-dummy should still provide
> >>>>what you need (but since it doesn't build anything, there is
> >>>>no abi .. and no modules can be built against it) .. so the
> >>>>error isn't graceful.
> >>>>
> >>>>Bruce
> >>>
> >>>
> >>>I can confirm this same problem is happening to me.  I just updated
> >>>one of my builds from 1.7 to 1.8 and am also getting my rootfs to fail
> >>>due to no abi kernel version:
> >>
> >>
> >>We still have a race condition in the 1.8 branch for the population
> >>of the build-artifacts directory.
> >>
> >>If modules start building, they'll race against the population of the
> >>abiversion, and you may see that message.
> >>
> >>There's a proposed patch for master, but I don't think it is in
> >>fido yet.
> >>
> >>Bruce
> >
> >Hi Bruce,
> >
> >I did some searches and looks like there are a number of 'race'
> >condition fixes but it wasn't obvious which one I may need.  Is it
> >this one:
> >http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98
> >
> 
> That's the one that should make sure that the shared workdir
> (Which has the abiversion) is in place before building any modules.
> 
> I can't say that it is exactly your issue, but it is the change
> I was thinking of.

Brian,

Were you able to try the above mentioned commit against am180x in meta-ti? Did 
it solve the missing abi kernel version? Thanks.

-- 
Denys

