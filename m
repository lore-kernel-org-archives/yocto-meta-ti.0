Return-Path: <gizero@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53561E002AB
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:56:43 -0700 (PDT)
Received: by wgbdt10 with SMTP id dt10so430337wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=68rp5qiqHpw8Vugm7fdm7qNwqUSIAaLIeiT1SxBLVXQ=;
	b=e4Rr28t4yRgIvVSKsYOQus9EionVzQa4WP8AhLvKL/LWjEvRemBJ8RYodOlsQmChO9
	1qknmApNWdpzXMiXVyw2O/XDLEQ5Pb4+qa4A94oi0vZ/QaIxQGOgthsAxSL6/zFNMODz
	OnRk8AeCY98qUfboh8REbWRVR2IdPvmtWphbEIdGhrRaRyaKhyqX3+rBIFZ/26G8G7kZ
	GJWmzQLx0+cRy6/EwK2OUwfrJx/fOyHFHZXq023bm1+yDuANUW13ftmfWFHYdBO0DkZQ
	3eq8jGY2ZPG3hyXr3Gz4SoGVdPdUMexxAIphgqobfB+yEqlEF5RQ7XgGxZAf6JMrqoNT
	hYxQ==
MIME-Version: 1.0
Received: by 10.180.84.169 with SMTP id a9mr4643083wiz.8.1348037802241; Tue,
	18 Sep 2012 23:56:42 -0700 (PDT)
Received: by 10.223.181.65 with HTTP; Tue, 18 Sep 2012 23:56:42 -0700 (PDT)
In-Reply-To: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
Date: Wed, 19 Sep 2012 08:56:42 +0200
Message-ID: <CAC+thW1ToaaK_NgHHb4N4o6XvO2Ob4tg5aJCU-+RMw=jQcCG0Q@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
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
X-List-Received-Date: Wed, 19 Sep 2012 06:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Nicolas,

On Wed, Sep 19, 2012 at 8:16 AM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> hi there,
>
> i was able to build a 'vanilla' yocto image using the yocto git repo.
> then i wanted to add meta-ti layer. so i have done the following:
>
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

What version of yocto are you using? If denzil is your target, meta-ti
repo has a corresponding denzil branch which should work fine. Having
a look at meta-ti's README is also a good starting point since you
might need to mask some recipes which could not be parsed without, I
think, the meta-oe layer.

I'm personally building core-image-minimal with the following commits:

OE Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "wally"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2.1"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta
meta-yocto        = "denzil:65ffa7395055f7e012cb973f63f92380828eed0d"
meta-ti           = "denzil:9c103ce85a6ecb836bcdc46137207e466846ee2e"

Regards

