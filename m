Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93646E00741
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 11:59:00 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2KIwtHv003063;
	Wed, 20 Mar 2013 13:58:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KIwtJ7017851;
	Wed, 20 Mar 2013 13:58:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 13:58:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2KIwt5W016438;
	Wed, 20 Mar 2013 13:58:55 -0500
Date: Wed, 20 Mar 2013 14:58:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Steven Grunza <grunzasr@comcast.net>
Message-ID: <20130320185854.GZ32759@edge>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org> <5149F665.9090204@comcast.net>
	<20130320175415.GW32759@edge> <5149FD74.3030906@comcast.net>
	<20130320182722.GX32759@edge> <514A0473.8050704@comcast.net>
MIME-Version: 1.0
In-Reply-To: <514A0473.8050704@comcast.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 20 Mar 2013 18:59:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 20, 2013 at 02:48:19PM -0400, Steven Grunza wrote:
> >>I did something wrong or missed a step.  I got:
> >>
> >>grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$ bitbake
> >>core-image-sato-sdk
> >>Pseudo is not present but is required, building this first before
> >>the main build
> >>Parsing recipes: 100% |#####################################################################################################|
> >>Time: 00:02:17
> >>Parsing of 899 .bb files complete (0 cached, 899 parsed). 1205
> >>targets, 67 skipped, 7 masked, 0 errors.
> >>ERROR: No recipes available for:
> >>/home/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend
> >>ERROR: Command execution failed: Exited with 1
> >>
> >>I put the meta-ti (via a git clone) into /home/yocto/poky-danny-8.0
> >If you are using poky-danny as a base, you need to use "danny" branch of
> >meta-ti to match the versions.
> >
> How can I get a danny branch?

git checkout -b danny origin/danny
man git

-- 
Denys

