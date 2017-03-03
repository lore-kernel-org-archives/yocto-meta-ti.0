Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D620E00887; Thu,  2 Mar 2017 16:31:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C7F5E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 16:31:22 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v230VCkh018125
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 18:31:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488501072;
	bh=kEiA2MmWpWiYp3pAO8HJbIUfp8WjatbQNnxyXx85FLY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Oiu2HyMu4/xCeV7Cto/HCT9LuAYkLH+st9GwX70WIOJG1Xh+JBKg+gNtbSxJ4fmzb
	DwF98Rr12fq2jm32ntpwLZr5BHkao2CxHiszYLyqpoEEQtk3uYHuY85i5XG8Ioy12l
	dDDb450GECjeDtg+eQdRUjZbOlDUPoFelGP+Z80I=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v230V7ss029885
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 18:31:07 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 18:31:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v230V660016570;
	Thu, 2 Mar 2017 18:31:06 -0600
Date: Thu, 2 Mar 2017 19:31:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
Message-ID: <20170303003106.GY12614@edge>
References: <20170302202503.26165-1-manisha.agrawal@ti.com>
	<20170302211110.GV12614@edge>
	<3AC2660648D2B04999D9C7562469E8AF7EB780B6@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3AC2660648D2B04999D9C7562469E8AF7EB780B6@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM
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
X-List-Received-Date: Fri, 03 Mar 2017 00:31:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 02, 2017 at 04:15:42PM -0500, Agrawal, Manisha wrote:
> Denys,
> 
> Appreciate the feedback. Do you want me to fix the subject and email the patches again?

No need - I'll fix it this time. And thanks for your patch.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, March 02, 2017 3:11 PM
> To: Agrawal, Manisha
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM
> 
> > [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM
> 
> Please don't use nested brackets and also don't replace PATCH keyword.
> 
> In other words, it should be:
> 
> > [krogoth/morty][PATCH] dual-camera-demo : Video buffers from CMEM
> 
> 
> On Thu, Mar 02, 2017 at 02:25:03PM -0600, manisha.agrawal@ti.com wrote:
> > From: Manisha Agrawal <manisha.agrawal@ti.com>
> > 
> > Update git commit id to pick the source code demonstrating CMEM API 
> > usage for allocating video buffers from CMEM driver. This is to 
> > showcase the CPU access of the video buffers with read and write cache 
> > enabled for optimal CPU performance. Since the CMEM driver support 
> > exists only on AM57x today, modify makefile to  include the CMEM 
> > library conditionally only for am57xx-evm platform.
> > 
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > mo_1.0.bb 
> > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > mo_1.0.bb
> > index 6c36b98..1d1d836 100644
> > --- 
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > mo_1.0.bb
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camer
> > +++ a-demo_1.0.bb
> > @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
> >  DEPENDS += "libdrm"
> >  require recipes-core/matrix/matrix-gui-paths.inc
> >  
> > -PR = "r16"
> > +PR = "r17"
> >  
> >  BRANCH = "master"
> > -SRCREV = "5e250641bfbc8a1a90e5b98527d2012729d54c09"
> > +SRCREV = "f52cb4354785e5f2fd63f7cf8ab02d99a2fbbea7"
> >  
> >  SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
> >             file://desc_dual-camera.html \
> > --
> > 2.9.3
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

