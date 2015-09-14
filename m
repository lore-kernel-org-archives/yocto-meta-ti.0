Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE2CCE00D0B; Mon, 14 Sep 2015 11:36:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5C92E00B0B
	for <meta-ti@yoctoproject.org>; Mon, 14 Sep 2015 11:36:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8EIarP3015304;
	Mon, 14 Sep 2015 13:36:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8EIardX019453;
	Mon, 14 Sep 2015 13:36:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Sep 2015 13:36:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8EIaqpJ014955;
	Mon, 14 Sep 2015 13:36:52 -0500
Date: Mon, 14 Sep 2015 14:36:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20150914183636.GR18085@edge>
References: <CAFeBWL5k=r+MDabbAMDRkrfqAMpKxyk-4zZXA2edh8vwrpdqig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL5k=r+MDabbAMDRkrfqAMpKxyk-4zZXA2edh8vwrpdqig@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Fetch failure on SDK 5.01.01.01
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
X-List-Received-Date: Mon, 14 Sep 2015 18:36:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same here - seems fine, please re-download it:

$ wget http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_01/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin
$ md5sum Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin
94acdbd20152c905939c2448d5e80a72  Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin


On Thu, Sep 10, 2015 at 11:55:07AM -0700, Adam Lee wrote:
> Hello everyone, I am trying to build "libgles-omap3_5.01.01.01" for
> the first time and seeing checksum mismatch and fetch failure as
> below:
> 
> ERROR: Fetcher failure for URL:
> 'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_01/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'.
> Checksum mismatch!
> File: '/media/adam/Build/dev/build/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'
> has md5 checksum 405499961427b695664f9b1758b5b7e4 when
> 94acdbd20152c905939c2448d5e80a72 was expected
> File: '/media/adam/Build/dev/build/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'
> has sha256 checksum
> f725533190c9296680873204d247870f703d62019381dd990cd1d55164e0011b when
> 7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae was
> expected
> If this change is expected (e.g. you have upgraded to a new version
> without updating the checksums) then you can use these lines within
> the recipe:
> SRC_URI[md5sum] = "405499961427b695664f9b1758b5b7e4"
> SRC_URI[sha256sum] =
> "f725533190c9296680873204d247870f703d62019381dd990cd1d55164e0011b"
> Otherwise you should retry the download and/or check with upstream to
> determine if the file has become corrupted or otherwise unexpectedly
> modified.
> ERROR: Function failed: Fetcher failure for URL:
> 'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_01/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /media/adam/Build/dev/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/libgles-omap3/5.01.01.01-r38.1/temp/log.do_fetch.7124
> ERROR: Task 765
> (/media/adam/Build/dev/poky/meta-ti/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5492 tasks of which 5491 didn't need to
> be rerun and 1 failed.
> 
> 
> Version 5.01.01.02 builds fine, but I am having issues at runtime [1].
> Hence I am trying my luck with this older version.
> 
> Is anyone else seeing this fetch failure?
> 
> Thanks,
> 
> Adam
> 
> [1] https://gist.github.com/adam-lee/95949bb5825decc7e299
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

