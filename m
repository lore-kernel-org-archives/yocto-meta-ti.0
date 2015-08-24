Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 373EAE00BC6; Mon, 24 Aug 2015 12:35:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A2CCE00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:35:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7OJZinv003578;
	Mon, 24 Aug 2015 14:35:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OJZi4m011931;
	Mon, 24 Aug 2015 14:35:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 24 Aug 2015 14:35:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OJZhwN025769;
	Mon, 24 Aug 2015 14:35:44 -0500
Date: Mon, 24 Aug 2015 15:35:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20150824193527.GW6542@edge>
References: <20150818221434.GH6542@edge>
	<2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
	<CAOCHtYjt6i2WpvrtfBE7sTkWi-xW-UN=-z42F6BGXwGijcfPBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYjt6i2WpvrtfBE7sTkWi-xW-UN=-z42F6BGXwGijcfPBg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Mon, 24 Aug 2015 19:35:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 23, 2015 at 07:56:16PM -0500, Robert Nelson wrote:
> On Wed, Aug 19, 2015 at 4:46 AM, Benjamin Bimmermann
> <b.bimmermann@yahoo.de> wrote:
> > Thank you,
> >
> > now my last question for this Topic:
> >
> > When will this new version for 4.1 be realese ?
> > This mounth ? This year? Is there a date approximate date?
> 
> Why wait?
> 
> Just patch the kernel yourself..
> 
> https://github.com/RobertCNelson/ti-linux-kernel-dev/tree/ti-linux-4.1.y/patches/sgx

Thanks, Robert,

I see you've taken our old patches we used on 3.14... We are currently working 
on replacing the old libgles-omap3 graphics stack with a different version and 
Wayland support. Hoping to get it ready soon...

-- 
Denys

