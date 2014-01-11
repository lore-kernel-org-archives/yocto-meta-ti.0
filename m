Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 652EEE007EC
	for <meta-ti@yoctoproject.org>; Sat, 11 Jan 2014 03:55:58 -0800 (PST)
Received: by mail-ig0-f175.google.com with SMTP id uy17so579967igb.2
	for <meta-ti@yoctoproject.org>; Sat, 11 Jan 2014 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l1jdHxMdzCMt6WT8qfNNAGQ/HRTKIrOKwmgYKcPHwh0=;
	b=FnIplxxGZKxuViNp2ctuZSsXm8VpThJpkIKxs9DgyOmatN740aNfw+D561lb0/Sgoa
	m0iEUAblctFjNmKauiGXEQGUPfBDWMoLTwUNQ95x0BLWPbHH6ffmhEFfF/QMxRPf1QpS
	LkKuw4AgfzpJEflcq4yiLHa0UuQ7RU+PBxlnsqjnOeazW0rc5ZikzdwLDgEW9OblUeJM
	LGdsMeG3n9JGobYTtgahALsVJ704pDJ82NMRUpfbLWMYV/8TaNWs5/og0iIliokK83Zi
	+L/1L8G64iPFn4ddY5cqODi2/aFUl1VKNrmOciNChE9gWidoUonTvCkgUvRVBAJnZcFk
	LXIQ==
X-Received: by 10.42.144.201 with SMTP id c9mr12486704icv.16.1389441358202;
	Sat, 11 Jan 2014 03:55:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Sat, 11 Jan 2014 03:55:28 -0800 (PST)
In-Reply-To: <1389437624-5567-1-git-send-email-raj.khem@gmail.com>
References: <1389437624-5567-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jan 2014 03:55:28 -0800
Message-ID: <CAMKF1sosMhKj9nLBzU4nYMVtaVDxDQO951wfj=e_Kz9viT5tdg@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mesa-omap3-common.inc: Add missing virtual/mesa in PROVIDES
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
X-List-Received-Date: Sat, 11 Jan 2014 11:55:59 -0000
Content-Type: text/plain; charset=UTF-8

ignore this. I was coming from dinosaur era.

On Sat, Jan 11, 2014 at 2:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> We shave too much here, this lands into trouble of pulling mesa-gl
> to provide virtual/mesa since we overwrote mesa to just provide
> virtual/libgl and nothing else, this patch will fix the errors where
> both mesa and mesa-gl will be pulled when building a recipe that demands
> virtual/libgl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-graphics/mesa/mesa-omap3-common.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
> index 0340770..e8daaa6 100644
> --- a/recipes-graphics/mesa/mesa-omap3-common.inc
> +++ b/recipes-graphics/mesa/mesa-omap3-common.inc
> @@ -1,7 +1,7 @@
>  PRINC := "${@int(PRINC) + 1}"
>
>  # avoid providing conflicts for libgles-omap3 compatibles
> -PROVIDES_omap3 = "virtual/libgl"
> -PROVIDES_ti814x = "virtual/libgl"
> -PROVIDES_ti816x = "virtual/libgl"
> -PROVIDES_ti33x = "virtual/libgl"
> +PROVIDES_omap3 = "virtual/libgl virtual/mesa"
> +PROVIDES_ti814x = "virtual/libgl virtual/mesa"
> +PROVIDES_ti816x = "virtual/libgl virtual/mesa"
> +PROVIDES_ti33x = "virtual/libgl virtual/mesa"
> --
> 1.8.5.2
>

