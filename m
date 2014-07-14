Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B53B4E006B7; Mon, 14 Jul 2014 13:27:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82CA4E00524
	for <meta-ti@yoctoproject.org>; Mon, 14 Jul 2014 13:27:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EKQnej009005;
	Mon, 14 Jul 2014 15:26:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EKQnVH030925;
	Mon, 14 Jul 2014 15:26:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 15:26:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EKQm5t006527;
	Mon, 14 Jul 2014 15:26:49 -0500
Date: Mon, 14 Jul 2014 16:26:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Cliff Brake <cbrake@bec-systems.com>
Message-ID: <20140714202648.GX15788@edge>
References: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE73207ADE2@DLEE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE73207AE8F@DLEE08.ent.ti.com>
	<CAOd_LFysd8sM+-PU54eEDSNCs=A2tr83yMoZMvpQ-CsutwJCTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFysd8sM+-PU54eEDSNCs=A2tr83yMoZMvpQ-CsutwJCTg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [diasy] omap2plus_defconfig does not include systemd support
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
X-List-Received-Date: Mon, 14 Jul 2014 20:27:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 11, 2014 at 12:24:15PM -0400, Cliff Brake wrote:
> On Fri, Jul 11, 2014 at 12:08 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> > Unless you also have meta-yocto-bsp layer (before daisy) defining
> > beagleboard machine...
> 
> or unless you have meta-gumstix-community included ...
> 
> DEBUG: LOAD /scratch/oe/oe-build-daisy/sources/meta-ti/conf/machine/beagleboard.conf
> DEBUG: CONF /scratch/oe/oe-build-daisy/sources/meta-ti/conf/machine/beagleboard.conf:5:
> including conf/machine/include/omap3.inc
> DEBUG: BB /scratch/oe/oe-build-daisy/sources/meta-gumstix-community/conf/machine/include/omap3.inc:
> handle(data, include)
> DEBUG: LOAD /scratch/oe/oe-build-daisy/sources/meta-gumstix-community/conf/machine/include/omap3.inc
> 
> Supporting multiple machines in one build present some interesting
> challenges -- what are the best practices in situations like this?
> 
> I guess the good news is I got to try 3.14 on the bb ...

That is interesting indeed. If they felt the need to overwrite the entire 
include file for the SOC, then they should care to keep it updated or set all 
necessary defaults. Otherwise they should have used a more unique name, like 
omap3-gumstix.inc and made necessary customizations in there, keeping the 
original upstream omap3.inc intact and using or not using it from their 
machine configs accordingly. For example, I've dealt with u-boot.inc in a 
similar fashion in meta-ti:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/u-boot-ti.inc

-- 
Denys

