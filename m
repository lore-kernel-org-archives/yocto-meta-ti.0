Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 666CBE017B9
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 16:08:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9UN885o010631
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 18:08:08 -0500
Received: from DFLE72.ent.ti.com ([128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UN88JJ019844
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 18:08:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 30 Oct 2013 18:08:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UN88CO007422;
	Wed, 30 Oct 2013 18:08:08 -0500
Date: Wed, 30 Oct 2013 19:08:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Message-ID: <20131030230808.GC24696@edge>
References: <20131021125642.GA5975@ti.com>
MIME-Version: 1.0
In-Reply-To: <20131021125642.GA5975@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] u-boot-glsdk: Update to latest fixes
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
X-List-Received-Date: Wed, 30 Oct 2013 23:08:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 21, 2013 at 06:26:42PM +0530, Mrinmayee Hingolikar wrote:
>  * Migration of u-boot code to omapzoom.org. The development tree is shared
>    between the Linux and Android teams.This enables a common u-boot development
>    platform for both the teams for better alignment.
>  * Enable UART boot mode for dra7xx
>  * Add VIP,VPE and Ethernet crossbar setting for dra7xx
>  * Add SPL API, QSPI, and serial flash support of dra7xx
> 
> v2:
> 
>  * Update to conditional assignment for BRANCH and SRCREV

Well, I guess I missed why it was necessary... I would understand BRANCH, but 
not SRCREV... BTW, patch revision history should be hidden and not go into the 
main description, so should appear after the --- delimiter.


> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> index d60ef44..1805020 100644
> --- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> @@ -6,11 +6,11 @@ PR = "r0+gitr${SRCPV}"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.omapzoom.org/repo/u-boot.git;protocol=git;branch=${BRANCH}"
>  
> -BRANCH ?= "master"
> +BRANCH ?= "p-ti-u-boot-2013.04"
>  
> -SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
> +SRCREV ?= "76447484441a4b8e00840a2bde74e66dbac9e631"

One thing is missing - PR bump. You are updating source tree and the commit ID 
is lower than the previous one, hence if you would try to share the build 
where the old package exists, you may end up with the image that contains the 
old package and not the new one. Although, symlink in deploy would probably be 
correct...


>  SPL_BINARY = "MLO"
>  SPL_UART_BINARY = "u-boot-spl.bin"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

