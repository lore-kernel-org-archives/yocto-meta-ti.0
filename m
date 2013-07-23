Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C565E013E8
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:37:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NKbdSg021832;
	Tue, 23 Jul 2013 15:37:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NKbd8C008212;
	Tue, 23 Jul 2013 15:37:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 15:37:38 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NKbcEv020995;
	Tue, 23 Jul 2013 15:37:38 -0500
Date: Tue, 23 Jul 2013 16:37:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20130723203737.GC32068@edge>
References: <20130723200931.GA10067@panicking> <20130723202110.GB32068@edge>
	<20130723202417.GB10067@panicking>
MIME-Version: 1.0
In-Reply-To: <20130723202417.GB10067@panicking>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Unable to compile am180x-evm + gstreamer-ti
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
X-List-Received-Date: Tue, 23 Jul 2013 20:37:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 23, 2013 at 10:24:17PM +0200, Michael Trimarchi wrote:
> Hi
> 
> On Tue, Jul 23, 2013 at 04:21:11PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jul 23, 2013 at 10:09:31PM +0200, Michael Trimarchi wrote:
> > > Hi
> > > 
> > > I was having trouble in compilation of am180x-evm. The problem is that
> > > I have this error:
> > > 
> > > Nothing PROVIDES 'ti-codecs-omapl138'. I'm using HOB right now and I
> > > have included meta-ti repository. Any hints?
> > 
> > But am180x-evm is the platform without DSP, so you shouldn't use gstreamer-ti 
> > with it.
> > 
> > -- 
> > Denys
> 
> http://www.ti.com/product/omap-l138
> 
> Is there a reference platform for this cpu?

Actually, am180x CPU is the same exact one on the ARM side as OMAP-L138, just 
doesn't have DSP:

http://www.ti.com/product/am1808

Currently, there's a SW gap in meta-ti on the DSP side, hopefully it will be 
closed in the future - there was some activity and discussions on the mailing 
list and internally... No promises yet.

-- 
Denys

