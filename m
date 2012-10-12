Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E508CE0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 09:19:45 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CGJjJ4000897
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 11:19:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CGJjvc014119
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 11:19:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 11:19:45 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9CGJiGB023991;
	Fri, 12 Oct 2012 11:19:45 -0500
Date: Fri, 12 Oct 2012 12:19:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Herv? Fache <h-fache@ti.com>
Message-ID: <20121012161944.GH26956@edge>
References: <507836EF.8050506@ti.com> <20121012153140.GG26956@edge>
	<50783E2F.4060204@ti.com>
MIME-Version: 1.0
In-Reply-To: <50783E2F.4060204@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 16:19:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 12, 2012 at 05:58:39PM +0200, Herv? Fache wrote:
> On 10/12/2012 05:31 PM, Denys Dmytriyenko wrote:
> > On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
> >> Hi guys,
> >>
> >> I am new to Poky and have created the following recipe:
> >>     require recipes-graphics/images/core-image-x11.bb
> >>     IMAGE_INSTALL += "omapdrmtest"
> > Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?
> >
> Thanks a lot, that did it!

I'm glad it worked for you.

But I'm still baffled why IMAGE_INSTALL didn't work. The only 2 reasons I can 
see for that are:

1. If you made a typo and used '=' instead of '+=', which would re-assign 
IMAGE_INSTALL, instead of appending to it, losing its current value.

2. Or if you tried to append to IMAGE_INSTALL before loading the base image 
recipe with 'require' (effectively, swapping the 2 lines of your recipe) - in 
that case you'd append to an empty IMAGE_INSTALL first and inside the 
core-image class it uses conditional assignment to pre-set that variable with 
system defaults. But since you already assigned to it early on, it won't be 
populated with system defaults...

Other than that, the example you showed above seems to work for me here...

-- 
Denys

