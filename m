Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 238CDE009C3; Wed, 27 Jan 2016 13:56:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EDBBE00838
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 13:56:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Wed, 27 Jan 2016 15:56:45 -0600
	id 0000000000081126.0000000056A93D1D.00004B38
Date: Wed, 27 Jan 2016 15:56:45 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160127215645.GD2584@nl.grid.coop>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
	<20160118200507.GE10881@nl.grid.coop> <20160119190808.GE4223@edge>
	<20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge>
Mime-Version: 1.0
In-Reply-To: <20160121220740.GF11314@edge>
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
X-List-Received-Date: Wed, 27 Jan 2016 21:56:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 21, 2016 at 05:07:41PM -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 21, 2016 at 04:03:29PM -0600, Robert Nelson wrote:
> > >> Didn't 3.x kernels start requiring a device tree somewhere along the line?
> > >>
> > >> I know the Beaglebone uses a device tree, but I can't seem to manage find
> > >> all the right pieces to build a working u-boot for am3517-evm that can
> > >> properly pass it off to the kernel, at least with the Legacy image format(s).
> > >
> > > Well, am3517 is one of the legacy platforms and I don't believe it was ever
> > > converted to use device tree...
> > 
> > Looks like it should atleast boot to mmc rootfs..
> > 
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/arch/arm/boot/dts/am3517-evm.dts
> 
> Well, I guess my memory is not that great any more... :)
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=dbdb539e249c3b55ca3dc601c357634a0dbc909e
> 

So the first problem seems to be that the 'u-boot' target produces
a build from the 2014.07 version, which does not seem to have any
environment or other setup to load a device tree.

Is there some patch floating around somewhere that updates the
default u-boot environment to work better with new kernels, or do
I need try and merge something in from the beaglebone


