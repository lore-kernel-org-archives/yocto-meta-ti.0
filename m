Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3759E0077F; Wed,  8 Oct 2014 11:13:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93332E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 11:13:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98IDeC9032659;
	Wed, 8 Oct 2014 13:13:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98IDd9L024268;
	Wed, 8 Oct 2014 13:13:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 13:13:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98IDdch010187;
	Wed, 8 Oct 2014 13:13:39 -0500
Date: Wed, 8 Oct 2014 14:13:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20141008181338.GT1731@edge>
References: <20141008161507.GE18916@piout.net>
MIME-Version: 1.0
In-Reply-To: <20141008161507.GE18916@piout.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Issues installing libgles-omap3
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
X-List-Received-Date: Wed, 08 Oct 2014 18:13:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 08, 2014 at 06:15:07PM +0200, Alexandre Belloni wrote:
> Hi,
> 
> I'm trying to build an image with poky (daisy) for the am335x-evm. While
> libgles-omap3 builds fine. At the final installation step (do_rootfs for
> my image), it fails with:
> 
> Computing transaction...error: Can't install libgles-omap3-es5-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
> 
> On another build machine, it fails with:
> 
> Computing transaction...error: Can't install libgles-omap3-es3-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
> 
> 
> What I don't understand is why it is not selecting libgles-omap3-es8
> which as I understand would be the correct package for ti33x.
> 
> Any insight on how to debug that ?

Can you please show how do you pull it into your image. Thanks.

-- 
Denys

