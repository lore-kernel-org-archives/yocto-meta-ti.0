Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A42D2E0027E
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 10:48:15 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UHm8qh024632;
	Thu, 30 Aug 2012 12:48:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UHm802015781;
	Thu, 30 Aug 2012 12:48:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 12:48:08 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7UHm8in016709;
	Thu, 30 Aug 2012 12:48:08 -0500
Date: Thu, 30 Aug 2012 13:48:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sebasti?n Bas Kana <sbaskana@gmail.com>
Message-ID: <20120830174807.GB26145@edge>
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building a core-image-base
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
X-List-Received-Date: Thu, 30 Aug 2012 17:48:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 28, 2012 at 06:22:08PM -0400, Sebasti?n Bas Kana wrote:
> Hi,
> 
> I'm using Yocto/Poky and I'm trying to build an image for my Gumstix Overo.
> I added the meta-gumstix layer and I can build the minimal image. The issue
> is with the core-image-base. I get errors regarding the license of the
> image recipes, so I used BBMASK to solve that. Then, an issue with netbase
> appears, so I added it to BBMASK too. Then I get an error that says:
> 
> Nothing RPROVIDES 'fbset' (but
> /home/sebastian/poky/meta-ti/recipes-graphics/libgles/
> libgles-omap3_4.05.00.03.bb RDEPENDS on or otherwise requires it)
> 
> I tried to remove that error but then other failures arise and I just can't
> get it to build. Any help will be really appreciated.
> 
> Thanks in advance!

Apparently, your first email was held for moderation - please subscribe to the 
mailing list in order to post to it.

Your problem is that you are trying to build a raher complete image 
(core-image-base), which pulls lots of dependencies and some of them are from 
additional layers, such as meta-openembedded. For example, here's the reason 
for fbset from libgles-omap3 recipe:

> # The initscript calls fbset, cputype calls devmem2
> RDEPENDS_${PN} += "fbset devmem2"

Both fbset and devmem2 are available from meta-openembedded.

Not sure what was the problem with netbase, as it's quite self contained. Are 
you sure you are using matching branches?

Either way, you may be better off composing your own image recipe, if you 
don't want to enable additional layers.

-- 
Denys

