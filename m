Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2A4EE00533
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 15:48:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M9P007720NQVX60@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 01 Sep 2012 17:48:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B092F201AF; Sat,
	01 Sep 2012 18:47:50 -0400 (EDT)
Date: Sat, 01 Sep 2012 18:47:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120901224750.GD11821@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
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
X-List-Received-Date: Sat, 01 Sep 2012 22:48:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 01, 2012 at 09:07:31PM +0000, Cooper Jr., Franklin wrote:
> When debugging issues in meta-arago I frequently try building recipes using  
> the meta-ti,meta-oe and oe-core layers. However, I always have to remove the 
> following recipes due to "This recipe does not have the LICENSE field set" 
> error:
> cloud9-gfx-image.bb
> cloud9-gnome-image.bb
> cloud9-image.bb

FWIW, meta-arago explicitly masks those recipes, so you shouldn't be having 
those errors or have to remove the recipes:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/conf/distro/arago.conf;hb=HEAD#l2

Also, it was discussed here just few days ago:
https://lists.yoctoproject.org/pipermail/meta-ti/2012-August/001456.html


> The issue is these recipes have an include from meta-angstrom that provides 
> this LICENSE field. Meta-ti should not have this dependency so these recipes 
> should be fixed to address this. I personally do not think cloud9 related 
> recipes that install  cloud9, nodejs, mplayer etc.. should even be in 
> meta-ti which is a BSP layer but that is a completely different discussion. 
> I also don't believe pulling in the include file that is needed from 
> meta-angstrom is also a reasonably solution. Either these recipes need to be 
> fixed so that they can work in meta-ti with only a dependency on meta-oe and 
> oe-core. Or remove the recipes from this layer and pull it into 
> meta-angstrom which I believe is the best option.

So, what do you propose? ;) Or you just volunteering to be in the middle of 
a flame war by raising this hard issue?

-- 
Denys

