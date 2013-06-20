Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A56FE0141B
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:17:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K2H0Z5019157;
	Wed, 19 Jun 2013 21:17:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K2Gx9H022043;
	Wed, 19 Jun 2013 21:16:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 19 Jun 2013 21:16:59 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5K2GxrY004225;
	Wed, 19 Jun 2013 21:16:59 -0500
Date: Wed, 19 Jun 2013 22:16:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
Message-ID: <20130620021658.GO13356@edge>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 20 Jun 2013 02:17:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Prabu,

Do you have any plans extending it in meta-ti?

-- 
Denys


On Thu, Jun 20, 2013 at 02:09:42AM +0000, Sundareson, Prabindh wrote:
> Are you asking about the status in general (ie, outside of the yocto 
> infrastructure) ? In general, eglfs,kms has been proven working for more 
> than a year now.
> 
> Within meta-ti, eglfs should work if the display driver is available (fb or 
> drm). The only reason I stopped at "minimal" on Beaglebone was because the 
> "display" driver part was not integrated at that time on Beaglebone (in 
> meta-ti) and hence OpenGL ES driver couldn't be installed.
> 
> regards,
> Prabindh
> 
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Nicolas Dechesne
> Sent: Thursday, June 20, 2013 7:34 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] meta-ti + meta-qt5
> 
> hi there,
> 
> not sure if this is the right place to ask... but since i am about to ask about QT5, OE and TI platforms, i am starting here!
> 
> so, i read a couple of blog posts about getting Qt5 on beaglebone, however it's not clear to me what's the latest status is. has anybody been able to use/enable OpenGLes either with KMS, or directfb or eglfs platform driver? The only thing i have seen are references to using the 'minimal' platform driver.
> 
> if so, can i get some pointers?
> 
> thanks!
> 
> nicolas

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


