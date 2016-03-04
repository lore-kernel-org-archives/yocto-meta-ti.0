Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0931E00B89; Fri,  4 Mar 2016 10:34:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 355 seconds by postgrey-1.32 at yocto-www;
	Fri, 04 Mar 2016 10:34:34 PST
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F8E4E00B37
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 10:34:34 -0800 (PST)
Received: from [172.16.1.4] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 199122C55F
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 19:28:37 +0100 (CET)
To: meta-ti@yoctoproject.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56D9D3D4.5040302@pseudoterminal.org>
Date: Fri, 4 Mar 2016 19:28:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Problems with the kernel and udev
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
X-List-Received-Date: Fri, 04 Mar 2016 18:34:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build a rootfs for the BeagleBoard-XM Rev.C , and added 
meta-ti. I am using the master branch of meta-ti, poky, and 
meta-openembedded.
But I do run into problems.

1) recipes-core/udev/udev_%.bbappend cannot be applied, because oe-core 
apparently replaced udev with eudev.

2) The kernel cannot be built. Here are some logs:

| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:145: 
first defined here
| arch/arm/mm/context.o: In function `nop_dma_map_area':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:145: 
multiple definition of `nop_dma_map_area'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:145: 
first defined here
| arch/arm/mm/context.o: In function `nop_dma_unmap_area':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:148: 
multiple definition of `nop_dma_unmap_area'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:148: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_icache_all':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/cache-l2x0.c:600: 
multiple definition of `nop_flush_icache_all'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/dma-mapping.c:742: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_kern_cache_all':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/cache-l2x0.c:600: 
multiple definition of `nop_flush_kern_cache_all'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/dma-mapping.c:742: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_kern_cache_louis':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/cache-l2x0.c:600: 
multiple definition of `nop_flush_kern_cache_louis'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/mm/dma-mapping.c:742: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_user_cache_all':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:136: 
multiple definition of `nop_flush_user_cache_all'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:136: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_user_cache_range':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:138: 
multiple definition of `nop_flush_user_cache_range'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:138: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_coherent_kern_range':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:140: 
multiple definition of `nop_coherent_kern_range'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:140: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_coherent_user_range':
| 
/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:142: 
multiple definition of `nop_coherent_user_range'
| 
arch/arm/mm/dma-mapping.o:/home/build/BuildSetups/yocto-master/poky/build/tmp/work-shared/beagleboard/kernel-source/arch/arm/include/asm/glue-cache.h:142: 
first defined here
| arch/arm/mm/cache-l2x0.o: In function `nop_flush_kern_dcache_area':


Any ideas?

