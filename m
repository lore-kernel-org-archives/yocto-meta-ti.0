Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62F38E0141B
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:55:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K4tMYV012808;
	Wed, 19 Jun 2013 23:55:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K4tM2N022566;
	Wed, 19 Jun 2013 23:55:22 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 19 Jun 2013 23:55:22 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5K4tLe4021772;
	Wed, 19 Jun 2013 23:55:22 -0500
Date: Thu, 20 Jun 2013 00:55:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20130620045521.GR13356@edge>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
	<CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Jun 2013 04:55:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 20, 2013 at 12:46:21AM -0400, Nicolas Dechesne wrote:
> On Thu, Jun 20, 2013 at 12:34 AM, Sundareson, Prabindh <prabu@ti.com> wrote:
> 
> > The instructions build eglfs as well (without xcb), as in the below patch.
> > Just that I cannot test it on platform due to the absence of GLES2 driver.
> >  verbose flag in the qt configuration (qt5.inc) would help debug what is
> > going wrong.****
> >
> > ** **
> >
> >
> > https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a
> > ****
> >
> >
> yeah, i am using something similar *but* i do not have x11 in
> DISTRO_FEATURES, and i suspect you might have it, right? without X11
> feature, the x11 -dev packages are pulled/installed, and then the qtbase
> configure script will fail to 'check' for EGL.

Heh, I was having similar issues with Prabu's recent libgles-omap3 patches. 
It would try to pull x11 packages due to -dev dependencies and complain that 
DISTRO_FEATURES lacks X11 setting... It's not exactly the same issue, but 
seems related.

-- 
Denys

