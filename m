Return-Path: <dev@codyps.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F6EEE009AE; Wed, 22 Apr 2015 14:58:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.175 listed in list.dnswl.org]
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D06DDE00994
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 14:57:57 -0700 (PDT)
Received: by iget9 with SMTP id t9so3724172ige.1
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=58OqXg7D2NcjAzkmU+mb26Hww47q/3dDtmh/+9GYbnc=;
	b=FGdUTY6UmONMRv3iszq5bFPmgCcvYa7g75XdEPUkxKR+fSDX3eztcLR+hkuq1MZYLK
	Fy8a2q3SHuRovKoy3bA8vsifILQA2/6jsIEYeASaeB6j6EUnfBXWocrnmtGIsA+xi+km
	gtra4+am9uc2firc7WzzN3bxs4slkLEwA1TII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=58OqXg7D2NcjAzkmU+mb26Hww47q/3dDtmh/+9GYbnc=;
	b=CPlunsO1h4xS+fFZnPoaqWEFJ7RUr3Xl+F9GHRtMQqpSWEwf9BM9iJLhVgp43douMq
	IbgRoyYYeVElOh+m/jeJy5jL3GAkIViyBsAL33qMunpVIfVyvfAARvG+pZ9f1CQVX9c4
	Yqu0aBeEmNgUwiMyX/2rvhfubjz9OcTFulwm0sHrAFxsd/1m7xvxtaWX1vM23OsjVgsS
	P60p3+zRBfzmxZZfvdn0UzdgcJVloeqVv8zQ9Y23btoRGJ3C755mZBlf3/A+B92/7xbB
	r97iRwKKF3xPvA4YD0axPHUwsmIBbU/lb7W+RCjgTQwId8jNEwEVdjv+5U2NR1RymBHT
	ik9Q==
X-Gm-Message-State: ALoCoQkPSs4EuwYb+B7Rm4krTuEJI8TmOFwwyRN1oh6NpMtFeTvAG2zbR4knp7We5tCUWF0tVSH2
MIME-Version: 1.0
X-Received: by 10.42.23.17 with SMTP id q17mr225360icb.4.1429739876781; Wed,
	22 Apr 2015 14:57:56 -0700 (PDT)
Received: by 10.36.197.195 with HTTP; Wed, 22 Apr 2015 14:57:56 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <1406842426-28955-1-git-send-email-denis@denix.org>
References: <1406684113-18232-2-git-send-email-denis@denix.org>
	<1406842426-28955-1-git-send-email-denis@denix.org>
Date: Wed, 22 Apr 2015 17:57:56 -0400
Message-ID: <CAPoQQ-0r2tnPZ0Zk-FSiOYqA_TYmXz5hMxrbWpTGW79KdJpLiA@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/2] omap3-sgx-modules 5.01.01.01: add Darren's patches to work with 3.14 kernel
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
X-List-Received-Date: Wed, 22 Apr 2015 21:58:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 5:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - update patch #4 to not break builds against 3.12 kernel
>
>  ...SDK-Make-5_01_01_01-work-against-3.14-LTS.patch |  52 +++++++
>  ...x-use-platform-data-to-provide-reset-info.patch | 121 ++++++++++++++++
>  ...class-am335x-am437x-fix-mutex-deadlock-wa.patch | 153 +++++++++++++++++++++
>  ...-make-it-building-against-ti-linux-3.14.y.patch |  45 ++++++
>  .../omap3-sgx-modules_5.01.01.01.bb                |   7 +-
>  5 files changed, 377 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch
>
[snip]

It looks like the new 5.01.01.02 also needs some of these patches:

| /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:411:2:
error: implicit declaration of function 'reset_control_clear_reset'
[-Werror=implicit-function-declaration]
|   ret = reset_control_clear_reset(rstc);
|   ^
| /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:471:17:
error: implicit declaration of function 'reset_control_is_reset'
[-Werror=implicit-function-declaration]
|                  ret = reset_control_is_reset(rstc);
|                  ^
| /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:399:32:
warning: unused variable 'pdata' [-Wunused-variable]
|   struct gfx_sgx_platform_data *pdata = dev->platform_data;
|                                 ^
| cc1: some warnings being treated as errors
| /home/cody/obj/y/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:257:
recipe for target
'/home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o'
failed

