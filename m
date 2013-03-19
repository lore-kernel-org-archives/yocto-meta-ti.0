Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D5D5E006C3
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 12:51:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JJphwa007448
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 14:51:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JJpgu7007307
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 14:51:42 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Mar 2013 14:51:42 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2JJpggr019637;
	Tue, 19 Mar 2013 14:51:42 -0500
Date: Tue, 19 Mar 2013 15:51:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130319195141.GT32759@edge>
References: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
	<1363705841-9610-2-git-send-email-Chase.Maupin@ti.com>
	<20130319171251.GP32759@edge>
	<7D46E86EC0A8354091174257B2FED10159486FDB@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159486FDB@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 19 Mar 2013 19:51:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 19, 2013 at 03:29:55PM -0400, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, March 19, 2013 12:13 PM
> > To: Maupin, Chase
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 2/2] omap5-evm: Add OMAP5 EVM
> > configuration
> > 
> > On Tue, Mar 19, 2013 at 10:10:41AM -0500, Chase Maupin wrote:
> > > * Add the machine configuration for the OMAP5 EVM device.
> > 
> > Overall looks good.
> > 
> > > * Create the omap-a15.inc file to be shared with all Cortex-A15
> > >   derivative devices.
> > 
> > Is the omap-a15 a preferred name? I didn't see it used internally
> > anywhere.
> > It's not like I object specifically to this name, but was
> > wondering if there
> > was something else other people are more familiar with? Another
> > option would
> > be just simple "omap5", but I guess you are planning for few of
> > those new
> > derivative platforms that don't really have omap5 in the name...
> > :)
> > 
> > Moreover, the comment above implies omap-a15 SoC file will be
> > used for all
> > Cortex-A15 devices, which is not exactly correct, as Keystone has
> > nothing to
> > do with omap5 and shouldn't share that SoC file.
> 
> Good point.  I'll change the comment.  I was thinking of this because of the 
> DRA7xx.  I'm open to other SOC_FAMILY names though.

The more I think about it, the more omap-a15 feels appropriate - basically 
highlighting and grouping OMAP-drived Cortex-A15 SoCs. Just make sure the 
comment makes it clear, as there are other non-OMAP Cortex-A15 SoCs from TI.

-- 
Denys

