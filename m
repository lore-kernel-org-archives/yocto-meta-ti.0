Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F7FCE00744; Thu,  4 Sep 2014 12:09:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 177FFE004A0
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 12:09:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84J9QUC028855;
	Thu, 4 Sep 2014 14:09:26 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84J9QDW009967;
	Thu, 4 Sep 2014 14:09:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 14:09:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84J9P0g027108;
	Thu, 4 Sep 2014 14:09:26 -0500
Date: Thu, 4 Sep 2014 15:09:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20140904190925.GS18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
	<CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
	<20140904181056.GO18620@edge>
	<CAOCHtYg3JOnTaGkxh9TTzUACUcgGsGYSG1SyZbKjdkX13xoOow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYg3JOnTaGkxh9TTzUACUcgGsGYSG1SyZbKjdkX13xoOow@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 19:09:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 02:03:07PM -0500, Robert Nelson wrote:
> > Robert, Peter,
> >
> > So, after some internal discussion, here's an update:
> >
> > 1. In TI kernel we do dynamic opp setting based on eFuse check in the file
> > arch/arm/mach-omap2/opp33xx_data.c
> >
> > 2. Since most of our EVMs and EVM-SKs use 2.1 Si, everything works properly
> > with eFuse check and dynamic opp setting.
> >
> > 3. But eFuse was not available in 2.0 rev of silicon, only in 2.1 rev. There
> > were many BBB boards made with 2.0 Si that were binned to run at 1GHz. And
> > older 1.0 Si revs were not 1GHz capable. Currently checking with HW and
> > marketing teams if all/most 2.0 chips are safe to run at 1GHz... As w/o eFuse
> > there's no way to determine if the chip is 1GHz capable or not.
> >
> > 4. If your BBB board has 2.1 Si rev, then you should get 1GHz automatically.
> > We'll try to figure something out for 2.0 Si boards, but setting opps
> > statically in dts is considered incorrect and risky...
> 
> Thanks Denys!!!
> 
> I'll take look at my bbb collection, i have a few of the "beta" bbb's
> which have the earliest non-production silicon, so i can find out what
> rev we started with.
> 
> BTW, since we at bb.org, are moving to this 3.14 ti base, i'll be
> patching this for 1Ghz operation. ;)

Further investigation with marketing and sales shows that all BBB in retail 
channels with 2.0 rev are guaranteed to have 1HGz capable silicon in them! 
Unfortunately, the same silicon revision w/o 1GHz capability was used in other 
boards by our customers. So, it's not possible to set opps just based on the 
silicon rev. Looks like we would have to do it similarly in boneblack.dtb to 
limit it just to BBB baords...

-- 
Denys

