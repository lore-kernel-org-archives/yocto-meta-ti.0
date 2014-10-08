Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E320EE00786; Wed,  8 Oct 2014 11:05:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D3D8E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 11:05:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98I5QkG006270;
	Wed, 8 Oct 2014 13:05:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98I5QNw014850;
	Wed, 8 Oct 2014 13:05:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 13:05:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98I5PLY009009;
	Wed, 8 Oct 2014 13:05:25 -0500
Date: Wed, 8 Oct 2014 14:05:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Message-ID: <20141008180525.GS1731@edge>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
MIME-Version: 1.0
In-Reply-To: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, martinez.javier@gmail.com, ebutera@gmail.com
Subject: Re: [PATCH 0/3] Fix dsp related packages for new kernels
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
X-List-Received-Date: Wed, 08 Oct 2014 18:05:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 08, 2014 at 03:47:43PM +0200, Enric Balletbo i Serra wrote:
> Hi all,
> 
> According to the README I know that probably these packages are unmaintained,
> but these packages are still used for some of us with newer kernels. This patch
> series fixes some build problems found when I tried to build this infrastructure
> with a 3.17 kernel. With these patches I'm able to build and run dsplink examples
> and gstreamer-ti to encode/decode some videos using the DSP.
> 
> If you don't have any inconvenient maybe would be interesting add these patches.

Thanks for the patches! Can you please provide a bit more details about the HW 
platform you are using these on. Also, we are slowly updating other components 
in meta-ti, that touch DSP, like IPC, etc. - please let us know if any of the 
new changes affect the old components or break anything for you. I can't 
guarantee we'd be able to fix or support older platforms within new components 
right away, but at least we should be able to preserve old versions of the 
required components for as long as they work. Please keep in touch. Thanks!

-- 
Denys


> Enric Balletbo i Serra (3):
>   ti-dmai: Fix build with recent kernels and compilers.
>   ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.
>   ti-linuxutils: Fix build problems for kernel up to 3.17
> 
>  .../dmai/ti-dmai/remove-unneeded-includes.patch    | 26 ++++++++++
>  recipes-ti/dmai/ti-dmai_svn.bb                     |  3 +-
>  recipes-ti/dsplink/ti-dsplink.inc                  |  2 +-
>  ...splink_1_65_kernel_3_7_0_fix-irq-mismatch.patch | 16 ++++++
>  recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |  1 +
>  recipes-ti/linuxutils/ti-linuxutils.inc            |  2 +-
>  .../linuxutils_2_26-cmemk-fixes.patch              | 59 ++++++++++++++++++++++
>  .../linuxutils_2_26-sdmak-fixes.patch              | 25 +++++++++
>  recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |  5 +-
>  9 files changed, 135 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
>  create mode 100644 recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch
>  create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
>  create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
> 
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

