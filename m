Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2AF3EE0077F; Wed,  8 Oct 2014 09:15:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6721BE006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 09:15:16 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 6FBB56D5; Wed,  8 Oct 2014 18:15:13 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id E72F2161
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 18:15:12 +0200 (CEST)
Date: Wed, 8 Oct 2014 18:15:07 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: meta-ti@yoctoproject.org
Message-ID: <20141008161507.GE18916@piout.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Issues installing libgles-omap3
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
X-List-Received-Date: Wed, 08 Oct 2014 16:15:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm trying to build an image with poky (daisy) for the am335x-evm. While
libgles-omap3 builds fine. At the final installation step (do_rootfs for
my image), it fails with:

Computing transaction...error: Can't install libgles-omap3-es5-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so

On another build machine, it fails with:

Computing transaction...error: Can't install libgles-omap3-es3-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so


What I don't understand is why it is not selecting libgles-omap3-es8
which as I understand would be the correct package for ti33x.

Any insight on how to debug that ?

Thanks !

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

