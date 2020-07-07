Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26574.1594156942630061051
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 14:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ehraMPeA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067LMLg8046192;
	Tue, 7 Jul 2020 16:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594156941;
	bh=HSVSRJ1pfeDXiwxXlHmwZudKMmwrTPoWzMMKgsNRmjo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ehraMPeAMgA9xYxCuQY7UWPZgCI6yozWpVwsFkm6oefMwoK9Zu1lz2opE4YIANbMB
	 aWwtPEf86D4wttjcBTTxM9ztAauG5VqJFFdEqtFkeyoNKlYymkHCjx6ZgVwS8lT7VU
	 8q+R/5yUih0lL49mrmZnFoams583uUaEHOg8trAg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067LMLQ9027522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2020 16:22:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 16:22:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 16:22:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067LMLBc101717;
	Tue, 7 Jul 2020 16:22:21 -0500
Date: Tue, 7 Jul 2020 17:22:20 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Jondhale, Prasad" <prasad.jondhale@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "eth_fw_auto@list.ti.com - Auto Ethernet firmware development team"
	<eth_fw_auto@list.ti.com>
Subject: Re: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Message-ID: <20200707212220.GJ22569@beryl>
References: <20200707171721.10205-1-prasad.jondhale@ti.com>
 <20200707171904.GI22569@beryl>
 <d95169b6c95a46e0a6002f3a291b7cc4@ti.com>
MIME-Version: 1.0
In-Reply-To: <d95169b6c95a46e0a6002f3a291b7cc4@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Most of the below is just a standard git workflow and Open Source process...

Here are the basic guidelines for the OpenEmbedded commit messages:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

For commit message itself, "recipes-bsp: cpsw9g-eth-fw: Update SRCREV to 
latest" would be fine, or even simly "cpsw9g-eth-fw: Update SRCREV to latest"

When you create a patch with git format-patch, it automatically prepends 
commit message with [PATCH] for a single patch or [PATCH x/y] for a series. 
You can also specify if it's not the first revision, resulting in [PATCH v2]. 
BTW, the default for the first revision is not to have "v1".

You can also specify which branch you need this merged to in a separate 
brackets like [dunfell/master] or [thud], etc. The default is the current LTS 
and master, thus [dunfell/master] is assumed, if omitted, but still nice to 
have.

There's no need to add mailing list prefix, as it will be added automatically 
by the mail server.

Nesting brackets are not allowed - Patchwork chokes on them and mangles the 
commit log (e.g. this original patch). And no need to cram everything into a 
single set of brackets.

So, all in all, here's a proper Subject line for a patch sent to the list:

Subject: [meta-ti][dunfell/master][PATCH v3 4/7] recipe: brief change summary

Please note that [meta-ti] will be added automatically by the mailing list. 
Also it indicates that it is a 3-rd revision of the patch, which is #4 in a 
series of 7 patches total. Need to be applied to dunfell and master branches.

All information inside square brackets is only for the maintainer and will be 
automatically discarded when merged into git repo.

Also, some Open Source communities and mailing lists require copying 
maintainers directly, besides the list, which is not required for meta-ti 
and meta-arago. I usually prefer when a patch is send just to the list.
Further discussions and replies can then be copied between participant.

Hope this helps, especially since we are getting influx of new patch 
submitters lately. Please let me know of any further questions.

Oh, and please don't forget that this list is public and is community 
oriented. Anything you post or say will be seen by hundreds of community 
people.

-- 
Denys


On Tue, Jul 07, 2020 at 01:20:59PM -0400, Jondhale, Prasad wrote:
> Actually this is what I have in my confluence instructions. Should this be 
> removed? What should it be replaced with?
> Is just " recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest" fine?
> 
> Regards,
> Prasad
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, July 7, 2020 10:49 PM
> To: Jondhale, Prasad
> Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org; eth_fw_auto@list.ti.com - Auto Ethernet firmware development team
> Subject: Re: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
> 
> [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
> 
> This is better, but what's with "[[meta-ti][Dunfell/master PATCH v1]"?
> 
> 
> On Tue, Jul 07, 2020 at 10:47:21PM +0530, Prasad Jondhale wrote:
> > Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
> > ---
> >  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> > index 37ba52d0..8cb62b2a 100755
> > --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> > +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> > @@ -11,7 +11,7 @@ inherit update-alternatives
> >  
> >  PROTOCOL = "git"
> >  BRANCH = "master"
> > -SRCREV = "afe62ada2e91e2665f597ca16eb3888b752016de"
> > +SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
> >  
> >  SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
> >  
> > -- 
> > 2.17.1
> > 
