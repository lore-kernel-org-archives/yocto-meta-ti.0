Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 706C8E00524; Wed, 25 Jun 2014 07:11:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAA9AE003FA
	for <meta-ti@yoctoproject.org>; Wed, 25 Jun 2014 07:11:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5PEB8qx019639;
	Wed, 25 Jun 2014 09:11:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5PEB8LY016515;
	Wed, 25 Jun 2014 09:11:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 25 Jun 2014 09:11:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5PEB7Qo030611;
	Wed, 25 Jun 2014 09:11:07 -0500
Date: Wed, 25 Jun 2014 10:11:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140625141106.GV6700@edge>
References: <CAMCfZKH23Ow_q1MQPi3Hu3oGjTGqpJ=CyO5kXYXoK3uoE-55qA@mail.gmail.com>
	<20140624230443.GP6700@edge>
	<CAMCfZKFpsX+SHevjZwQ5o5xkFxVeqS5G5FCuDY1ZUyZMZAsJSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFpsX+SHevjZwQ5o5xkFxVeqS5G5FCuDY1ZUyZMZAsJSg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules fails on do_compile
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
X-List-Received-Date: Wed, 25 Jun 2014 14:11:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 25, 2014 at 09:41:49AM -0300, Diego Sueiro wrote:
> Hi Denys,
> 
> On Tue, Jun 24, 2014 at 8:04 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Graphics SDK 5.01.01.01 doesn't work with kernel 3.14 yet.
> >
> > The last tested kernel version to work with Graphics SDK was 3.12; and 3.14
> >
> > has changed some APIs, hence the breakage.
> >
> 
> I've updated meta-ti repo and it works now.

Yes, I lowered default priority for 3.14 kernel for now, so it should pick up 
3.12 in the meantime.

-- 
Denys

