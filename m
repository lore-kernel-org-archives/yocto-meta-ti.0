Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBD94E0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:22:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7FJMoHJ017380;
	Thu, 15 Aug 2013 14:22:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7FJMoG5028930;
	Thu, 15 Aug 2013 14:22:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 14:22:50 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7FJMntF027351;
	Thu, 15 Aug 2013 14:22:50 -0500
Date: Thu, 15 Aug 2013 15:22:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130815192249.GH2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<CAFZh4h8eAULbEJPVeMtA51gQK293bUEKPGpMxtmX2Z8kJSgJJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8eAULbEJPVeMtA51gQK293bUEKPGpMxtmX2Z8kJSgJJA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:22:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 15, 2013 at 03:10:24PM -0400, Brian Hutchinson wrote:
> On Thu, Aug 15, 2013 at 12:25 PM, Chris Larson <clarson@kergoth.com> wrote:
> 
> >
> > I haven't seen the panic, but I have seen a complete silent boot hang when
> > moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM board. The gcc-linaro
> > toolchain worked, as did a 2012.03 sourcery toolchain, but neither the
> > 2013.05 toolchain nor the internal built yocto toolchain from 1.5/master
> > resulted in a successful boot. I got past that issue by cherry picking
> > these two commits from a more recent kernel:
> >
> > 455bd4c430b0c0a361f38e8658a0d6cb469942b5 - ARM: 7668/1: fix memset-related
> > crashes caused by recent GCC (4.7.2) optimizations
> > 418df63adac56841ef6b0f1fcf435bc64d4ed177 - ARM: 7670/1: fix the memset fix
> >
> > See also
> > http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39864
> >
> I found this thread which is bang on with my problem but didn't see a
> solution yet:
> https://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html

Have you tried poking into the following repositories for a possible fix:

http://arago-project.org/git/projects/?p=linux-omap3.git;a=shortlog;h=refs/heads/ti81xx-master
http://arago-project.org/git/projects/?p=linux-dvr-rdk-dm81xx.git;a=summary
http://arago-project.org/git/projects/?p=linux-ipnc-rdk-dm81xx.git;a=summary

There are some product-specific forks around TI81x which I don't have any 
visibility into and hence I can't support it in meta-ti... :(

-- 
Denys

