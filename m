Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E28ABE0077F; Wed,  8 Oct 2014 12:54:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B149E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 12:54:04 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 2CA1C6FD; Wed,  8 Oct 2014 21:54:05 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id D53E01BE;
	Wed,  8 Oct 2014 21:54:04 +0200 (CEST)
Date: Wed, 8 Oct 2014 21:53:59 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20141008195358.GF18916@piout.net>
References: <20141008161507.GE18916@piout.net>
 <20141008181338.GT1731@edge>
MIME-Version: 1.0
In-Reply-To: <20141008181338.GT1731@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 08 Oct 2014 19:54:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/10/2014 at 14:13:38 -0400, Denys Dmytriyenko wrote :
> On Wed, Oct 08, 2014 at 06:15:07PM +0200, Alexandre Belloni wrote:
> > Hi,
> > 
> > I'm trying to build an image with poky (daisy) for the am335x-evm. While
> > libgles-omap3 builds fine. At the final installation step (do_rootfs for
> > my image), it fails with:
> > 
> > Computing transaction...error: Can't install libgles-omap3-es5-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
> > 
> > On another build machine, it fails with:
> > 
> > Computing transaction...error: Can't install libgles-omap3-es3-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
> > 
> > 
> > What I don't understand is why it is not selecting libgles-omap3-es8
> > which as I understand would be the correct package for ti33x.
> > 
> > Any insight on how to debug that ?
> 
> Can you please show how do you pull it into your image. Thanks.
> 

Sure, I tried multiple things, but basically, I have:

PREFERRED_PROVIDER_virtual/egl ?= "libgles-omap3"
PREFERRED_PROVIDER_virtual/libgles1 ?= "libgles-omap3"
PREFERRED_PROVIDER_virtual/libgles2 ?= "libgles-omap3"
PREFERRED_PROVIDER_virtual/libgl ?= "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa ?= "mesa-gl"

and libgles-omap3 is coming as a dependency of qtbase (from meta-qt5).
But I also tried removing qtbase from my image recipe and putting
directly either libgles-omap3 or libgles-omap3-es8 in IMAGE_INSTALL,
with the same result.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

