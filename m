Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 531A6E0077A
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 08:27:59 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BGRrnN023192;
	Tue, 11 Feb 2014 10:27:53 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BGRrMB005574;
	Tue, 11 Feb 2014 10:27:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Feb 2014 10:27:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BGRrJt015769;
	Tue, 11 Feb 2014 10:27:53 -0600
Date: Tue, 11 Feb 2014 11:27:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140211162752.GL3131@edge>
References: <321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 16:28:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2014 at 01:31:49PM -0200, Diego Sueiro wrote:
> On Tue, Feb 11, 2014 at 1:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Are you using the latest meta-ti?
> 
> 
> Yep:
> 1923b5f (HEAD, origin/dora, dora) u-boot-ti-staging: update with fixes for
> NAND partition names and sizes

Did you see messages like this during the initial parsing:

WARNING: libgles-omap3-5.01.00.01 ONLY supports hardfp mode for now

Unfortunately, 5.x series of graphics is only available for hardfp mode for 
now...

-- 
Denys

