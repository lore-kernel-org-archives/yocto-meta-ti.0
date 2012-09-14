Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF224E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 21:30:08 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8E4U560019144;
	Thu, 13 Sep 2012 23:30:05 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8E4U5Wn011195;
	Thu, 13 Sep 2012 23:30:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 13 Sep 2012 23:30:05 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8E4U5So021105;
	Thu, 13 Sep 2012 23:30:05 -0500
Date: Fri, 14 Sep 2012 00:30:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120914043004.GA26968@edge>
References: <1347210467-19332-1-git-send-email-raj.khem@gmail.com>
	<20120911164620.GB5256@denix.org>
	<CAMKF1sp3mhD_x6jLoZVL4o8YM5rhLPrbM7XqM9jjahmv2WkD7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3mhD_x6jLoZVL4o8YM5rhLPrbM7XqM9jjahmv2WkD7g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Fri, 14 Sep 2012 04:30:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 11, 2012 at 10:26:14AM -0700, Khem Raj wrote:
> On Tue, Sep 11, 2012 at 9:46 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Sun, Sep 09, 2012 at 10:07:47AM -0700, Khem Raj wrote:
> >> bring recipes in sync with OE-Core, task bbclass
> >> is now replaced by packagegroup.
> >>
> >> and task recipes are now called packagegroup_something
> >>
> >> diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
> >> index 04bc987..96d6121 100644
> >> --- a/recipes-kernel/linux/multi-kernel.inc
> >> +++ b/recipes-kernel/linux/multi-kernel.inc
> >> @@ -117,5 +117,5 @@ do_deploy_append () {
> >>
> >>  }
> >>
> >> -do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
> >> +do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
> >
> > Why is this changed? Isn't gcc${KERNEL_CCSUFFIX} no longer useful?
> >
> 
> this should have been a separate commit.

Then you wouldn't mind if I skip that hunk?

> Its needed to accompany > http://patchwork.openembedded.org/patch/35151/

Interesting. What's the status on that?

-- 
Denys

