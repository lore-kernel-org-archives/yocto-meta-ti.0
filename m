Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F6B9E01371
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 06:57:06 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8JDv1uq032236;
	Wed, 19 Sep 2012 08:57:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8JDv0lE026864;
	Wed, 19 Sep 2012 08:57:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 19 Sep 2012 08:57:00 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8JDv0P4012124;
	Wed, 19 Sep 2012 08:57:00 -0500
Date: Wed, 19 Sep 2012 09:57:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20120919135659.GA589@edge>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Wed, 19 Sep 2012 13:57:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 19, 2012 at 08:16:05AM +0200, Nicolas Dechesne wrote:
> hi there,

Hi Nicolas,

> i was able to build a 'vanilla' yocto image using the yocto git repo.
> then i wanted to add meta-ti layer. so i have done the following:

First, a little rant... :)

It's unfortunate, but this still causes lots of confusion. Some purists among 
us will say that is not Yocto, but Poky. Case in point - which "yocto" git 
repository you cloned from http://git.yoctoproject.org/ ?

Same applies to a 'vanilla' yocto image, which does not exist. It would rather 
be useful to specify which exact image for which MACHINE you are trying to 
build. A little bit more detail is always helpful...


And now to the resolution part. I see you already used BBMASK as prescribed in 
the README, since you get past the unset LICENSE error... The below error 
happens when you build for a MACHINE that is overshadowed by another BSP 
layer that does not define MACHINE_KERNEL_PR. This MACHINE_KERNEL_PR variable 
is set in MACHINE definitions of meta-ti BSP layer and then used in other 
recipes within meta-ti and different layers.

In other words, you are trying to build for "beagleboard" machine, which gets 
also defined by meta-yocto-bsp layer, besides meta-ti. The solution is simple -
you need to move meta-ti above meta-yocto-bsp in your bblayers.conf or just 
remove meta-yocto-bsp from the list, if you are not planning on building any 
of the reference platforms. That way you'll get the machine definition from 
meta-ti layer and not from meta-yocto-bsp.

After that, core-image-minimal and some other images should build fine. Good 
luck!

-- 
Denys


> - clone git://git.yoctoproject.org/meta-ti
> - modify BBLAYERS in conf/bblayers.conf to add meta-ti
> 
> i can verify that meta-ti layer is configured properly as
> bitbake-layers show-layers shows it just fine (with priority 10).
> 
> However parsing recipes failed with:
> 
> Loaded 23 entries from dependency cache.
> ERROR: ExpansionError during parsing
> /work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb:
> Failure expanding variable FILESPATH, expression was
> ${@base_set_filespath([
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager/files",
> "/work/yocto/meta-ti/recipes-ti/local-power-manager" ], d)} which
> triggered exception SyntaxError: EOL while scanning string literal
> (FILESPATH, line 1)
> ERROR: Command execution failed: Exited with 1
> 
> is there a particular commit in yocto that meta-ti requires?
> 
> how do you guys generate vanilla yocto images with meta-ti?

