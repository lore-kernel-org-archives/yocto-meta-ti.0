Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70077E00533
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 15:56:19 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q81MuIQq011191
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 17:56:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q81MuIis024696
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 17:56:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 1 Sep 2012 17:56:18 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q81MuIQS001840;
	Sat, 1 Sep 2012 17:56:18 -0500
Date: Sat, 1 Sep 2012 18:56:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Kridner, Jason" <jdk@ti.com>
Message-ID: <20120901225617.GF22219@edge>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
MIME-Version: 1.0
In-Reply-To: <kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Fix image recipes in meta-ti
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
X-List-Received-Date: Sat, 01 Sep 2012 22:56:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Sep 01, 2012 at 09:14:43PM +0000, Kridner, Jason wrote:
> Will meta-oe take the recipes?

Well, those maybe better suited for meta-angstrom instead... If you think 
about it - cloud9 is an important component of default Beaglebone images based 
on Angstrom, so images with the cloud9 in the name are naturally associated 
with Angstrom. Anybody else who'd like to use meta-ti as BSP layer outside of 
Angstrom would most probably use own images anyway...

-- 
Denys


> -------- Original message --------
> Subject: [meta-ti] Fix image recipes in meta-ti
> From: "Cooper Jr., Franklin" <fcooper@ti.com>
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> CC:
> 
> 
> When debugging issues in meta-arago I frequently try building recipes using  
> the meta-ti,meta-oe and oe-core layers. However, I always have to remove the 
> following recipes due to ?This recipe does not have the LICENSE field set? 
> error:
> cloud9-gfx-image.bb
> cloud9-gnome-image.bb
> cloud9-image.bb
> 
> The issue is these recipes have an include from meta-angstrom that provides 
> this LICENSE field. Meta-ti should not have this dependency so these recipes 
> should be fixed to address this. I personally do not think cloud9 related 
> recipes that install  cloud9, nodejs, mplayer etc.. should even be in 
> meta-ti which is a BSP layer but that is a completely different discussion. 
> I also don?t believe pulling in the include file that is needed from 
> meta-angstrom is also a reasonably solution. Either these recipes need to be 
> fixed so that they can work in meta-ti with only a dependency on meta-oe and 
> oe-core. Or remove the recipes from this layer and pull it into 
> meta-angstrom which I believe is the best option.

