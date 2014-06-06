Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A831E00B95; Fri,  6 Jun 2014 08:42:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1393CE009E7
	for <meta-ti@yoctoproject.org>; Fri,  6 Jun 2014 08:42:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s56FgahW014737;
	Fri, 6 Jun 2014 10:42:36 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s56Fgan4008527;
	Fri, 6 Jun 2014 10:42:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 6 Jun 2014 10:42:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s56FgaCP032690;
	Fri, 6 Jun 2014 10:42:36 -0500
Date: Fri, 6 Jun 2014 11:42:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <20140606154235.GA18034@edge>
References: <CAOd_LFzCrgUGLKtgPUSQgxtd7ASn8Ee4oBbDyCSZH8yobh78pw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015D09841A@DLEE11.ent.ti.com>
	<CAOd_LFwesJcR4nan9Bp9E8dQVj6-GPOZFEU-6OCUjQcjdFd=Tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwesJcR4nan9Bp9E8dQVj6-GPOZFEU-6OCUjQcjdFd=Tw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: what branch of meta-ti should be used with dora?
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
X-List-Received-Date: Fri, 06 Jun 2014 15:42:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 06, 2014 at 11:32:32AM -0400, Cliff Brake wrote:
> got it.  Looking further, I happened to be using
> https://github.com/Angstrom-distribution/meta-ti, so that is why I
> don't see the dora branch.  Thanks!

And that is NOT meta-ti!

That is actually a very wicked way to discredit the project... I've heard 
first-hand few other instances when people were confused by that stale fork 
into thinking meta-ti is dead. :(

-- 
Denys


> On Fri, Jun 6, 2014 at 11:20 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
> > Use the dora branch.
> >
> >>-----Original Message-----
> >>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >>bounces@yoctoproject.org] On Behalf Of Cliff Brake
> >>Sent: Friday, June 06, 2014 10:13 AM
> >>To: meta-ti@yoctoproject.org
> >>Subject: [meta-ti] what branch of meta-ti should be used with
> >>dora?
> >>
> >>I'm wondering what branch of meta-ti is a good one to use with OE
> >>1.5/Dora.
> >>
> >>Thanks,
> >>Cliff
> >>
> >>--
> >>=================
> >>http://bec-systems.com
> >>--
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
> 
> -- 
> =================
> http://bec-systems.com
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

