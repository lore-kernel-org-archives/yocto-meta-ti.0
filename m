Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56A8AE00B32
	for <meta-ti@yoctoproject.org>; Fri,  7 Mar 2014 13:12:50 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27LCmaZ021346;
	Fri, 7 Mar 2014 15:12:48 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LClS0017817;
	Fri, 7 Mar 2014 15:12:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 15:12:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LClBm032447;
	Fri, 7 Mar 2014 15:12:47 -0600
Date: Fri, 7 Mar 2014 16:12:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140307211246.GS22125@edge>
References: <1394215241-14051-1-git-send-email-denis@denix.org>
	<CAMKF1sqiidoFYkyVyFBjcQ=qy2TKfgHaLL2b46TykWkyhf0wFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqiidoFYkyVyFBjcQ=qy2TKfgHaLL2b46TykWkyhf0wFA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-mainline: add 3.14 mainline recipe
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
X-List-Received-Date: Fri, 07 Mar 2014 21:12:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 07, 2014 at 01:03:23PM -0800, Khem Raj wrote:
> On Fri, Mar 7, 2014 at 10:00 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > +PR = "${MACHINE_KERNEL_PR}"
> 
> is it possible to get rid of MACHINE_KERNEL_PR

What's wrong with MACHINE_KERNEL_PR the way it's used above?

-- 
Denys

