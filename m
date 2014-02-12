Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C348FE0043B
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 08:23:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CGNaGA024002;
	Wed, 12 Feb 2014 10:23:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGNaaj021607;
	Wed, 12 Feb 2014 10:23:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 10:23:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGNZDr019705;
	Wed, 12 Feb 2014 10:23:35 -0600
Date: Wed, 12 Feb 2014 11:23:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140212162334.GE4346@edge>
References: <CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
	<CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
	<20140211164725.GN3131@edge>
	<CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Feb 2014 16:23:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 12, 2014 at 01:42:30PM -0200, Diego Sueiro wrote:
> On Tue, Feb 11, 2014 at 2:47 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Set DEFAULTTUNE in your distro or local config to one of the available
> > values,
> > like armv7athf-neon or cortexa8thf-neon etc.
> >
> 
> Thanks,
> It worked.
> 
> I's there a image recipe to test this module?

We use it in our Arago distribution and SDKs and there are image recipes in 
meta-arago for that. If you use meta-ti with other distributions, you'd have 
to come up with your own image recipe or modify one of the existing ones.

-- 
Denys

