Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23FA2E00BEB; Mon,  9 Jun 2014 16:35:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.49 listed in list.dnswl.org]
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4CA0E00B7B
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 16:34:47 -0700 (PDT)
Received: by mail-yh0-f49.google.com with SMTP id c41so3185891yho.36
	for <meta-ti@yoctoproject.org>; Mon, 09 Jun 2014 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x9t1BV87StV+IRJ9HMkXI3TdkFcSAL2xz/tJrDC2hxU=;
	b=0ZmtV/yG31DWzATK0qJwPwZGoCOkvUaIK5D1CRYL0Vwpza3bvufYavTM93MkbTStSs
	2E1SlsJdV6LdNeUdLU1kZgkyTkomNrKBw/qGlBJuClKKov9/Qb0zHsMe3LCdE7imhgzL
	7KWJOz6AH7/FJUupt5aKFprilAyw2Cwlp6M6fSLxoF4c7EksVIfp25/T3dsKcUTgZ2ye
	80aYb5PSpli26ygcOlhUqHIkAOtwMkMmkyv9SNkwEbSLDJEZyXuaPVnfB5AceTzxBTcm
	NmbWgAxRyAiijQP66yJLHrTmttaAOWctpe3oEpGjRW6jfT62F3p6FsNxjO1YTvq6hYlW
	pg0w==
MIME-Version: 1.0
X-Received: by 10.236.192.73 with SMTP id h49mr19425385yhn.6.1402356887383;
	Mon, 09 Jun 2014 16:34:47 -0700 (PDT)
Received: by 10.170.134.131 with HTTP; Mon, 9 Jun 2014 16:34:47 -0700 (PDT)
In-Reply-To: <53963B12.2090906@emagii.com>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
	<CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
	<53963B12.2090906@emagii.com>
Date: Mon, 9 Jun 2014 18:34:47 -0500
Message-ID: <CAOCHtYh40Us+q3fCi3nUDDL2N8awzFVqaJFurgefzrWQZ_ddqQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: Ulf Samuelsson <meta-ti@emagii.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 23:35:00 -0000
Content-Type: text/plain; charset=UTF-8

>
> The kernel options have set
> CONFIG_DRM_TILCDC=y
> CONFIG_DRM is not set
> CONFIG_FIRMWARE_EDID=y
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
> CONFIG_FB_DA8XX=y
> CONFIG_FB_ST7735=y
> FB_BOTH_ENDIAN=y
>
> CONFIG_OMAP2_DSS_DPI=y
> CONFIG_OMAP2_DSS_RFBI=y
> CONFIG_OMAP2_DSS_VENC=y
> CONFIG_OMAP4_DSS_HDMI=y
> CONFIG_OMAP2_DSS_SDI=y
> CONFIG_OMAP2_DSS_DSL=y
>
> CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
>
>
> CONFIG_FB_OMAP2_NUM_FBS=3

If this is just for the beaglebone you can drop these OMAP*_DSS configs..

>
> CONFIG_PANEL_GENERIC_DPI=m
> CONFIG_PANEL_SHARP_LS037V7DW01=m
> CONFIG_PANEL_NEC_NL8048HL11_01B=m
>
> CONFIG_PANEL_TAAL=y
> CONFIG_PANEL_TPO_TD043MTEA1=y
> CONFIG_PANEL_ACX565AKM=y
> CONFIG_LCD_ILI9320=y
>
>
> CONFIG_LCD_PLATFORM=y
> CONFIG_FRAMEBUFFER_CONSOLE=y
> CONFIG_FONTS=y
> CONFIG_FONT_8x8=y
> CONFIG_FONT_8x16=y
> FONT_MINI_4x6=y
> LOGO_LINUX_MONO=y
> LOGO_LINUX_VGA16=y
> LOGO_LINUX_CLUT224=y
>
> Checked the 3.12 meta-ti kernel and it does not seem to have a lot of extra
> config options.
>
> Should I focus on the kernel or the libraries to get an EGL display?
>
> ---------------------------------------------------------------------
>
> BTW: What is the reason that there is no cape support
>
> 1.It is considered a bad idea, and rejected?
> 2.Beaglebone specific, and thus of no interest to anyone with real money?
> 3.Noone bothered to submit to mainstream?

Patch series 1 (overlays) is stuck in never-ending "review", here is
the latest submission:

https://lkml.org/lkml/2014/5/28/280

> 4.There is another API in the works, which will allow similar functionality.
> 5.Other reason?

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

