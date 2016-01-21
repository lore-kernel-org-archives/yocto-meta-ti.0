Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D4D2E007D9; Thu, 21 Jan 2016 14:08:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00210E0079A
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 14:08:30 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0LM7vve005739;
	Thu, 21 Jan 2016 16:07:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0LM7uDI026949;
	Thu, 21 Jan 2016 16:07:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 Jan 2016 16:07:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0LM7ub4027259;
	Thu, 21 Jan 2016 16:07:56 -0600
Date: Thu, 21 Jan 2016 17:07:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20160121220740.GF11314@edge>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
	<20160118200507.GE10881@nl.grid.coop> <20160119190808.GE4223@edge>
	<20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Jan 2016 22:08:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 21, 2016 at 04:03:29PM -0600, Robert Nelson wrote:
> >> Didn't 3.x kernels start requiring a device tree somewhere along the line?
> >>
> >> I know the Beaglebone uses a device tree, but I can't seem to manage find
> >> all the right pieces to build a working u-boot for am3517-evm that can
> >> properly pass it off to the kernel, at least with the Legacy image format(s).
> >
> > Well, am3517 is one of the legacy platforms and I don't believe it was ever
> > converted to use device tree...
> 
> Looks like it should atleast boot to mmc rootfs..
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/arch/arm/boot/dts/am3517-evm.dts

Well, I guess my memory is not that great any more... :)

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=dbdb539e249c3b55ca3dc601c357634a0dbc909e

-- 
Denys

