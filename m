Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2F20E0086B; Mon, 18 Jan 2016 12:05:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C366CE007F2
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 12:05:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Mon, 18 Jan 2016 14:05:07 -0600
	id 00000000000613CD.00000000569D4573.000049A1
Date: Mon, 18 Jan 2016 14:05:07 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160118200507.GE10881@nl.grid.coop>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
Mime-Version: 1.0
In-Reply-To: <20160118164615.GC4223@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 18 Jan 2016 20:05:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 18, 2016 at 11:46:15AM -0500, Denys Dmytriyenko wrote:
> On Sat, Jan 16, 2016 at 12:36:31AM -0600, Troy Benjegerdes wrote:
> > Are there any regression tests and/or recent builds of a 3.1x or 4.x series
> > kernel on an am3517 eval board? The original 'supported' TI SDKs were all
> > of the 2.6.x series, and it seems like somewhere along the way something
> > broke, and I'm trying to figure out what it was.
> 
> Do you have any specifics for the breakage?
> 
> -- 
> Denys

The kernel stops after discovering the MMC, but before mounting the 
filesystem:

[    2.446441] Key type dns_resolver registered
[    2.461151] voltdm_scale: No voltage scale API registered for vdd_mpu_iva
[    2.468444] voltdm_scale: No voltage scale API registered for vdd_core
[    2.479156] PM: no software I/O chain control; some wakeups may be lost
[    2.486816] ThumbEE CPU extension supported.
[    2.491363] Registering SWP/SWPB emulation handler
[    2.503784] regulator-dummy: incomplete constraints, leaving on
[    2.516876] davinci_emac davinci_emac.0: using random MAC addr: 9e:53:0c:1a:23:3
[    2.622650] Waiting for root device /dev/mmcblk0p2...
[    2.629638] mmc0: new high speed SDHC card at address aaaa
[    2.641143] mmcblk0: mmc0:aaaa SU04G 3.69 GiB 


Also, is there a bitbake target that makes an image I can write to an SD
card? I got myself all confused trying to convert an SD image for a beaglebone
and apparently replacing MLO was not sufficient.

-- 
----------------------------------------------------------------------------
Troy Benjegerdes                 'da hozer'                  hozer@hozed.org
7 elements      earth::water::air::fire::mind::spirit::soul        grid.coop
      Never pick a fight with someone who buys ink by the barrel,
         nor try buy a hacker who makes money by the megahash


