Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DB0CE007AD; Mon, 18 Aug 2014 07:16:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9585E007A2
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 07:16:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7IEGFc0031111;
	Mon, 18 Aug 2014 09:16:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7IEGFvE017232;
	Mon, 18 Aug 2014 09:16:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 18 Aug 2014 09:16:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7IEGEqD006113;
	Mon, 18 Aug 2014 09:16:14 -0500
Date: Mon, 18 Aug 2014 10:16:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140818141613.GI23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org>
	<2948184.BeJYLBqp38@localhost.localdomain>
	<53F1C2F5.50209@pseudoterminal.org>
	<8239334.zKDPeKpJDo@localhost.localdomain>
	<CAMCfZKFSUXqmrSP4evQyHQkRC1ygXVTROxJstDjJTDXtsAQatw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFSUXqmrSP4evQyHQkRC1ygXVTROxJstDjJTDXtsAQatw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Mon, 18 Aug 2014 14:16:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 18, 2014 at 09:34:58AM -0300, Diego Sueiro wrote:
> On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <
> maciej.borzecki@open-rnd.pl> wrote:
> 
> > Rough guess, but it looks like a default u-boot from eMMC. Try following
> > official instruction to make it boot off SD card:
> > https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebone
> >
> 
> This should do the trick:
> "Pressing the USER/BOOT button when powering on will temporarily change the
> boot order".

The USER button may sometimes be tricky, as it preserves the state across 
reboots. So, if you already booted off of eMMC, holding the button and 
rebooting won't work - you'd have to unplug the power to completely turn it 
down and then power it up, while pressing the USER button. Making eMMC 
non-bootable is more reliable in many cases...

-- 
Denys

