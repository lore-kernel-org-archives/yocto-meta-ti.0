Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A86EDE00928; Thu, 28 Jan 2016 16:10:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34DEBE00803
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 16:09:57 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0T09NR9013000;
	Thu, 28 Jan 2016 18:09:23 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0T09N1R013993;
	Thu, 28 Jan 2016 18:09:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 18:09:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0T09Nju003238;
	Thu, 28 Jan 2016 18:09:23 -0600
Date: Thu, 28 Jan 2016 19:09:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Troy Benjegerdes <hozer@hozed.org>
Message-ID: <20160129000907.GK11314@edge>
References: <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge> <20160127215645.GD2584@nl.grid.coop>
	<20160127220316.GZ11314@edge> <20160127221203.GE2584@nl.grid.coop>
	<20160127225529.GC11314@edge> <20160128045255.GF2584@nl.grid.coop>
	<20160128161351.GD11314@edge> <20160128163317.GA24907@nl.grid.coop>
MIME-Version: 1.0
In-Reply-To: <20160128163317.GA24907@nl.grid.coop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: regression tests for am3517-evm machine?
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
X-List-Received-Date: Fri, 29 Jan 2016 00:10:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 28, 2016 at 10:33:17AM -0600, Troy Benjegerdes wrote:
> > > After a little more digging around, I find that having:
> > > #define CONFIG_OF_LIBFDT
> > > is required for u-boot to be able to recognize and load a device
> > > tree, but it does not seem to be set in the am3517 build(s). 
> > > 
> > > If I build a u-boot from source with CONFIG_OF_LIBFDT, I get the
> > > expected output, but now if boot a mainline 3.16 or 3.18 kernel
> > > (which mostly work with no device tree), these kernels fail to
> > > boot with a device tree.
> 
> What is the state of linux-ti-staging and how does it compare to
> linux-omap.. it seems like there is some sort of brokenness in
> moving the am3517 (omap3) support from the legacy code to device
> trees.

linux-ti-staging recipe pulls from ti-linux-kernel on git.ti.com, which is 
the latest kernel development and upstreaming effort for all the current TI 
processors. Maintaining legacy parts like am3517 and omap3 in general is a 
best effort.

If by linux-omap you mean the actual kernel tree from Tony Lindgren, then it 
is one of the targets for patches staged in ti-linux-kernel to be upstreamed 
to, among others.

-- 
Denys

