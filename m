Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDF8FE01757
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:41:30 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA7HfTYD018226;
	Thu, 7 Nov 2013 11:41:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7HfTYI028366;
	Thu, 7 Nov 2013 11:41:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 11:41:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7HfTwm016746;
	Thu, 7 Nov 2013 11:41:29 -0600
Date: Thu, 7 Nov 2013 12:41:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131107174128.GP4510@edge>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<20131107170108.GI4510@edge>
	<5D86A8BA-2F44-4EFE-8AA9-1FEB5E1C38B2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5D86A8BA-2F44-4EFE-8AA9-1FEB5E1C38B2@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 17:41:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 07, 2013 at 09:33:33AM -0800, Khem Raj wrote:
> 
> On Nov 7, 2013, at 9:01 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > NAK for now, as there was a chance to comment on the proposed change:
> 
> well. I did not try, that change however its not that its set in stone 
> either. now meta-ti appears appears first no matter what in angstrom in 
> BBPATH and shadows meta-beagleboard which also provides definitions for 
> beaglebone.conf which I want to use and no matter what I try unless I start 
> changing the other layers to prepend as well I do not get the right order. I 
> can happily punt out meta-ti or fork it but thats not the solution I am 
> looking for.

Indeed - one of the problems I just described in the other reply to this 
thread.

Anyway, what really bothers me, is that you, me and Richard had this exact 
discussion at ELCE and agreed that prepending should solve the issue... :)


> > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2939
> > 
> > On Wed, Nov 06, 2013 at 06:25:26PM -0800, Khem Raj wrote:
> >> Currently, meta-ti appears as first path in BBPATH
> >> rest of layers append so lets do the same
> >> 
> >> helps distros with multiple BSP layers to include meta-ti
> >> 
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> conf/layer.conf | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/conf/layer.conf b/conf/layer.conf
> >> index e39bd85..faa4ac0 100644
> >> --- a/conf/layer.conf
> >> +++ b/conf/layer.conf
> >> @@ -1,5 +1,5 @@
> >> # We have a conf and classes directory, append to BBPATH
> >> -BBPATH =. "${LAYERDIR}:"
> >> +BBPATH .= ":${LAYERDIR}"
> >> 
> >> # We have a recipes directory, add to BBFILES
> >> BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >> -- 
> >> 1.8.3.2
> >> 
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> 

