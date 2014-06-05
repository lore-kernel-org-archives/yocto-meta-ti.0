Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A324EE00B88; Thu,  5 Jun 2014 09:24:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 805E5E00A44
	for <meta-ti@yoctoproject.org>; Thu,  5 Jun 2014 09:24:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s55GOKab008496;
	Thu, 5 Jun 2014 11:24:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55GOKOE023212;
	Thu, 5 Jun 2014 11:24:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Jun 2014 11:24:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55GOJkx018377;
	Thu, 5 Jun 2014 11:24:19 -0500
Date: Thu, 5 Jun 2014 12:24:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Bo Wu <bowu86@gmail.com>
Message-ID: <20140605162419.GX21819@edge>
References: <CAAOg-bPGfMddJCfpr7z07eHpUK96HPdwEEPzDXSOEX+yVEcX6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAOg-bPGfMddJCfpr7z07eHpUK96HPdwEEPzDXSOEX+yVEcX6Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Patch error of meta-ti layer in building process
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
X-List-Received-Date: Thu, 05 Jun 2014 16:24:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, May 25, 2014 at 05:38:40PM -0400, Bo Wu wrote:
> Hi,
> 
> We are trying to build a yocto image for image processing with e-cam
> support. For this, we downloaded the meta-ecam layer and meta-ti layer from
> https://github.com/jumpnow/meta-ti.

Looks like that patch comes from meta-ecam layer:

https://github.com/floft/meta-ecam/blob/dylan/recipes-ti/dmai/files/ienc1.patch

Please contact the author of that patch/layer for further assistance. Thanks.

-- 
Denys


> However when building the image by the command
> 
> bitbake ecam-console-image
> 
> The building process ran into error...
> 
> ERROR: Command Error: exit status: 1  Output:
> Applying patch ienc1.patch
> can't find file to patch at input line 4
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.c
> dmai.new/packages/ti/sdo/dmai/ce/Ienc1.c
> |--- dmai/packages/ti/sdo/dmai/ce/Ienc1.c    2013-08-06 08:57:41.000000000
> -0700
> |+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.c    2013-08-23
> 09:32:14.855847975 -0700
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> can't find file to patch at input line 36
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.h
> dmai.new/packages/ti/sdo/dmai/ce/Ienc1.h
> |--- dmai/packages/ti/sdo/dmai/ce/Ienc1.h    2013-08-06 08:57:41.000000000
> -0700
> |+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.h    2013-08-23
> 09:39:45.218186154 -0700
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> Patch ienc1.patch does not apply (enforce with -f)
> 
> Looks like the patch file could not find the file to patch... Also I could
> not find anything about patching in ti-dmai_svn.bb, so really confused
> about there this patch comes from. Any one had similar problem before?
> Really appreciate any suggestions.
> 
> Best,
> Bo

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


