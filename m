Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 128FDE01389
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 08:59:53 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA7Gxq2B024453;
	Thu, 7 Nov 2013 10:59:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7Gxps9003343;
	Thu, 7 Nov 2013 10:59:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 10:59:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7Gxpv9009328;
	Thu, 7 Nov 2013 10:59:51 -0600
Date: Thu, 7 Nov 2013 11:59:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131107165950.GH4510@edge>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 07 Nov 2013 16:59:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> > This seems like a reversal of http://arago-project.org/git/meta-ti.git?a=commit;h=dabd83e96fe99d0c3d1a88be4d1637831526d217
> >
> > Looks like there may be a need to cover the different use cases and 
> > understand what each person is trying to do :)
> >
> 
> ah I see what caused this all pain. So now meta-ti is odd ball out.
> this patch should have never gone in.

Khem,

If you remember, we discussed this with Richard and he suggested this as a 
solution to the ordering problem. Otherwise people tend to append any extra 
layers _after_ oe-core, which should be the other way around in order to 
override anything in there...

-- 
Denys


> >>-----Original Message-----
> >>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >>bounces@yoctoproject.org] On Behalf Of Khem Raj
> >>Sent: Thursday, November 07, 2013 7:55 AM
> >>To: meta-ti@yoctoproject.org
> >>Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
> >>layer world
> >>
> >>Currently, meta-ti appears as first path in BBPATH
> >>rest of layers append so lets do the same
> >>
> >>helps distros with multiple BSP layers to include meta-ti
> >>
> >>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>---
> >> conf/layer.conf | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/conf/layer.conf b/conf/layer.conf
> >>index e39bd85..faa4ac0 100644
> >>--- a/conf/layer.conf
> >>+++ b/conf/layer.conf
> >>@@ -1,5 +1,5 @@
> >> # We have a conf and classes directory, append to BBPATH
> >>-BBPATH =. "${LAYERDIR}:"
> >>+BBPATH .= ":${LAYERDIR}"
> >>
> >> # We have a recipes directory, add to BBFILES
> >> BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> >>${LAYERDIR}/recipes*/*/*.bbappend"
> >>--
> >>1.8.3.2
> >>
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

