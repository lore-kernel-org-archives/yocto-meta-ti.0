Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AE71E01400
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:15:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K2F9eQ018954;
	Wed, 19 Jun 2013 21:15:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K2F9w9020494;
	Wed, 19 Jun 2013 21:15:09 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 19 Jun 2013 21:15:09 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5K2F9fv003729;
	Wed, 19 Jun 2013 21:15:09 -0500
Date: Wed, 19 Jun 2013 22:15:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20130620021508.GN13356@edge>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 02:15:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 19, 2013 at 10:04:27PM -0400, Nicolas Dechesne wrote:
> hi there,
> 
> not sure if this is the right place to ask... but since i am about to ask
> about QT5, OE and TI platforms, i am starting here!
> 
> so, i read a couple of blog posts about getting Qt5 on beaglebone, however
> it's not clear to me what's the latest status is. has anybody been able to
> use/enable OpenGLes either with KMS, or directfb or eglfs platform driver?
> The only thing i have seen are references to using the 'minimal' platform
> driver.
> 
> if so, can i get some pointers?

Have you seen those multiple iterations of libgles-omap3 patches from Prabu 
we've been discussing here lately? Those are one of the necessary steps in 
getting Qt5 on our platforms (although w/o OMAP4/OMAP5 support)...

I have few fixes on top of the latest patchset that I have been playing with 
in the past few days - I was planning on pushing all that soon.

-- 
Denys

