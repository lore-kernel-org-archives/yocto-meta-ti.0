Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4841E00B36; Tue, 19 Jan 2016 11:09:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B960E00A92
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 11:08:57 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0JJ8Ojt007058;
	Tue, 19 Jan 2016 13:08:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JJ8OYm032616;
	Tue, 19 Jan 2016 13:08:24 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Jan 2016 13:08:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JJ8O1h011618;
	Tue, 19 Jan 2016 13:08:24 -0600
Date: Tue, 19 Jan 2016 14:08:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Troy Benjegerdes <hozer@hozed.org>
Message-ID: <20160119190808.GE4223@edge>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
	<20160118200507.GE10881@nl.grid.coop>
MIME-Version: 1.0
In-Reply-To: <20160118200507.GE10881@nl.grid.coop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Tue, 19 Jan 2016 19:09:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 18, 2016 at 02:05:07PM -0600, Troy Benjegerdes wrote:
> On Mon, Jan 18, 2016 at 11:46:15AM -0500, Denys Dmytriyenko wrote:
> > On Sat, Jan 16, 2016 at 12:36:31AM -0600, Troy Benjegerdes wrote:
> > > Are there any regression tests and/or recent builds of a 3.1x or 4.x series
> > > kernel on an am3517 eval board? The original 'supported' TI SDKs were all
> > > of the 2.6.x series, and it seems like somewhere along the way something
> > > broke, and I'm trying to figure out what it was.
> > 
> > Do you have any specifics for the breakage?
> > 
> > -- 
> > Denys
> 
> The kernel stops after discovering the MMC, but before mounting the 
> filesystem:
> 
> [    2.446441] Key type dns_resolver registered
> [    2.461151] voltdm_scale: No voltage scale API registered for vdd_mpu_iva
> [    2.468444] voltdm_scale: No voltage scale API registered for vdd_core
> [    2.479156] PM: no software I/O chain control; some wakeups may be lost
> [    2.486816] ThumbEE CPU extension supported.
> [    2.491363] Registering SWP/SWPB emulation handler
> [    2.503784] regulator-dummy: incomplete constraints, leaving on
> [    2.516876] davinci_emac davinci_emac.0: using random MAC addr: 9e:53:0c:1a:23:3
> [    2.622650] Waiting for root device /dev/mmcblk0p2...
> [    2.629638] mmc0: new high speed SDHC card at address aaaa
> [    2.641143] mmcblk0: mmc0:aaaa SU04G 3.69 GiB 

Looks like it did not recognize the partitions on the MMC, hence waiting for 
the second partition /dev/mmcblk0p2 to become available to mount root from.


> Also, is there a bitbake target that makes an image I can write to an SD
> card? I got myself all confused trying to convert an SD image for a beaglebone
> and apparently replacing MLO was not sufficient.

If you are asking about a pre-partitioned SD card image, then there's no 
bitbake target for that, but you can look into 'wic' tool that does it.

-- 
Denys

