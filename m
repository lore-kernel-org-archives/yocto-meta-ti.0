Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA12FE0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:34:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7FJYT0c000697;
	Thu, 15 Aug 2013 14:34:29 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7FJYT57014008;
	Thu, 15 Aug 2013 14:34:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 14:34:29 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7FJYS8Q003393;
	Thu, 15 Aug 2013 14:34:29 -0500
Date: Thu, 15 Aug 2013 15:34:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130815193427.GJ2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<20130815190600.GF2190@edge>
	<CAFZh4h9xR44AvSW91eg_ecH0kR=760e5v1MC97r4hsjaB09Htw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h9xR44AvSW91eg_ecH0kR=760e5v1MC97r4hsjaB09Htw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:34:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 15, 2013 at 03:26:55PM -0400, Brian Hutchinson wrote:
> On Thu, Aug 15, 2013 at 3:06 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> >
> > Yes, it is often a PITA to get old kernels build ...
> >
> 
> What do you mean "old kernels"  It is from a TI PSP released not that long
> ago! Wink, wink.  I'd love to use a 3+ kernel, know where I can find one ;)

So, cross-referencing the 2.6.37 release date of January 4, 2011 against gcc 
releases shows that you can only expect 4.4 or 4.5 to work properly out of 
the box w/o patching... :)

And I have already answered the "newer TI81x kernel" question many times, 
including the last email in this thread :)

-- 
Denys

