Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 180C5E016DC
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 10:05:01 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA4I4xpm017692;
	Mon, 4 Nov 2013 12:04:59 -0600
Received: from DFLE72.ent.ti.com ([128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4I4xR2020445;
	Mon, 4 Nov 2013 12:04:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Nov 2013 12:04:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4I4xjV029920;
	Mon, 4 Nov 2013 12:04:59 -0600
Date: Mon, 4 Nov 2013 13:04:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20131104180458.GU24696@edge>
References: <1383587507-2528-1-git-send-email-denis@denix.org>
	<5277DFB1.7070507@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <5277DFB1.7070507@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] mesa: update bbappend to 9.2.2 to match oe-core
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
X-List-Received-Date: Mon, 04 Nov 2013 18:05:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 04, 2013 at 10:56:01AM -0700, Gary Thomas wrote:
> On 2013-11-04 10:51, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  recipes-graphics/mesa/{mesa_9.1.6.bbappend => mesa_9.2.2.bbappend} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename recipes-graphics/mesa/{mesa_9.1.6.bbappend => mesa_9.2.2.bbappend} (100%)
> >
> >diff --git a/recipes-graphics/mesa/mesa_9.1.6.bbappend b/recipes-graphics/mesa/mesa_9.2.2.bbappend
> >similarity index 100%
> >rename from recipes-graphics/mesa/mesa_9.1.6.bbappend
> >rename to recipes-graphics/mesa/mesa_9.2.2.bbappend
> >
> 
> I thought these were just going to be dropped since they aren't
> correct (can't build mesa on OMAP3 because of incorrect provides)
> as discussed previously?

Correct, that should follow soon, once I finish the validation - I'm slightly 
behind on that task as I was sick last week and had limited capacity...

-- 
Denys

