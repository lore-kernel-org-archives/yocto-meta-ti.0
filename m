Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48DC5E00DB0; Thu, 10 Sep 2015 11:55:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.170 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (adam.yh.lee[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DA90E00BF0
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 11:55:08 -0700 (PDT)
Received: by ykei199 with SMTP id i199so67889867yke.0
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5oo64hRKT3qteKeKmrNW7dhYyDQkjziCGpLQ1NIkckg=;
	b=Wzz8XAkijHglujCCCBDdehCkUyac8wtyKuL4evryfkBbCyPlNb0hwhybk1cXWEmDnq
	y12RSQJzESJbm/0ZuhEesnQhdJ6JJ0tdkJjmK4s4grxTCgCh0/UYx7m8zMWHYy5aJwYI
	P5qBupZK4+lfpeCuhHGzEGcf6PAvFu4ebsHxNuYNyaH4WV/OLG6oUXr+e2jopw6Ushz+
	E2bmWzk1O8BMJTGfp9iknVlyzLvchU8HycO0PPZUGaat3V1s63/gllmHGBZ2587+P6vO
	CoHz7Z45rpl+TI2ie0LLiJFhXU0rOfddMQ/XA7gbf+yetw5Vhhn/lAjrQ327Uz3w83WV
	dIBw==
MIME-Version: 1.0
X-Received: by 10.129.125.6 with SMTP id y6mr50133231ywc.5.1441911307941; Thu,
	10 Sep 2015 11:55:07 -0700 (PDT)
Received: by 10.13.192.66 with HTTP; Thu, 10 Sep 2015 11:55:07 -0700 (PDT)
Date: Thu, 10 Sep 2015 11:55:07 -0700
Message-ID: <CAFeBWL5k=r+MDabbAMDRkrfqAMpKxyk-4zZXA2edh8vwrpdqig@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Fetch failure on SDK 5.01.01.01
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
X-List-Received-Date: Thu, 10 Sep 2015 18:55:09 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone, I am trying to build "libgles-omap3_5.01.01.01" for
the first time and seeing checksum mismatch and fetch failure as
below:

ERROR: Fetcher failure for URL:
'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_01/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'.
Checksum mismatch!
File: '/media/adam/Build/dev/build/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'
has md5 checksum 405499961427b695664f9b1758b5b7e4 when
94acdbd20152c905939c2448d5e80a72 was expected
File: '/media/adam/Build/dev/build/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'
has sha256 checksum
f725533190c9296680873204d247870f703d62019381dd990cd1d55164e0011b when
7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886d4460b76c9051ae was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[md5sum] = "405499961427b695664f9b1758b5b7e4"
SRC_URI[sha256sum] =
"f725533190c9296680873204d247870f703d62019381dd990cd1d55164e0011b"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.
ERROR: Function failed: Fetcher failure for URL:
'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_01/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_01.bin'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/media/adam/Build/dev/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/libgles-omap3/5.01.01.01-r38.1/temp/log.do_fetch.7124
ERROR: Task 765
(/media/adam/Build/dev/poky/meta-ti/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb,
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5492 tasks of which 5491 didn't need to
be rerun and 1 failed.


Version 5.01.01.02 builds fine, but I am having issues at runtime [1].
Hence I am trying my luck with this older version.

Is anyone else seeing this fetch failure?

Thanks,

Adam

[1] https://gist.github.com/adam-lee/95949bb5825decc7e299

