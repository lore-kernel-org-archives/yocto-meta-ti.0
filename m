Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4C21E00D47; Wed,  3 Aug 2016 10:28:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E04DE00CE8
	for <meta-ti@yoctoproject.org>; Wed,  3 Aug 2016 10:28:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u73HSBaR019726;
	Wed, 3 Aug 2016 12:28:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u73HSBOQ015537;
	Wed, 3 Aug 2016 12:28:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 3 Aug 2016 12:28:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u73HSBWh015307;
	Wed, 3 Aug 2016 12:28:11 -0500
Date: Wed, 3 Aug 2016 13:28:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <20160803172810.GB17623@edge>
References: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
	<20160801233449.GI3677@edge>
	<fe415fd4-f9c9-faa7-61aa-d0e33d26ac78@mlbassoc.com>
	<72940363-f223-78b1-2b0e-0663fdd4510e@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <72940363-f223-78b1-2b0e-0663fdd4510e@xilinx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Getting started with meta-ti (beaglebone)
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
X-List-Received-Date: Wed, 03 Aug 2016 17:28:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 02, 2016 at 11:17:35AM -0700, Manjukumar Harthikote Matha wrote:
> All,
> 
> On 08/01/2016 07:12 PM, Gary Thomas wrote:
> >On 2016-08-02 01:34, Denys Dmytriyenko wrote:
> >>On Mon, Aug 01, 2016 at 03:49:37PM -0700, Manjukumar Harthikote Matha
> >>wrote:
> >>>All,
> >>>
> >>>I am trying to build for beaglebone but facing some errors on master
> <..>
> >>>Added BBMASK = "meta-ti/recipes-misc" in local.conf
> >>
> >>What's this ^^^ for?

> This is not required, I copied it from a wiki page (getting started
> on meta-ti)

I don't know what that wiki is or how old it is, but there's no recipes-misc 
in meta-ti... It's not a good idea to collect random outdated tidbits on the 
Internet and try to get it all working...


> >>>MACHINE=beaglebone bitbake core-image-minimal
> >>>
> >>>Gives me an error
> >>
> >>Are those Python3 related errors?
> >>
> <...>>>
> >>>line 51
> >>>    os.chmod(binfile, 0755)
> >>>                         ^
> >>>SyntaxError: invalid token
> >
> >In python3 this needs to be 0o755

> Yes this works and fails on a tar extraction command. Another
> Python3 error, will look into it. For now, I just deleted the
> extraction block to surpass the error.

Yeah, that was my other question - why master? There's currently Python3 
migration going on upstream and meta-ti is slightly behind on this. I'd 
recommend using krogoth stable release to get your stuff working. You 
should only be playing with latest master code, especially with several 
additional layers, only if you really know what you are doing...

-- 
Denys

