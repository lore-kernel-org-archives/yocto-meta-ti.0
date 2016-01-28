Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DC1FE00903; Thu, 28 Jan 2016 08:33:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64EC5E0088B
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:33:21 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Thu, 28 Jan 2016 10:33:17 -0600
	id 00000000000613C7.0000000056AA42CD.00006178
Date: Thu, 28 Jan 2016 10:33:17 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160128163317.GA24907@nl.grid.coop>
References: <20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge> <20160127215645.GD2584@nl.grid.coop>
	<20160127220316.GZ11314@edge> <20160127221203.GE2584@nl.grid.coop>
	<20160127225529.GC11314@edge> <20160128045255.GF2584@nl.grid.coop>
	<20160128161351.GD11314@edge>
Mime-Version: 1.0
In-Reply-To: <20160128161351.GD11314@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 28 Jan 2016 16:33:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > After a little more digging around, I find that having:
> > #define CONFIG_OF_LIBFDT
> > is required for u-boot to be able to recognize and load a device
> > tree, but it does not seem to be set in the am3517 build(s). 
> > 
> > If I build a u-boot from source with CONFIG_OF_LIBFDT, I get the
> > expected output, but now if boot a mainline 3.16 or 3.18 kernel
> > (which mostly work with no device tree), these kernels fail to
> > boot with a device tree.

What is the state of linux-ti-staging and how does it compare to
linux-omap.. it seems like there is some sort of brokenness in
moving the am3517 (omap3) support from the legacy code to device
trees.

