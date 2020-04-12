Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.3781.1586650114437015005
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 11 Apr 2020 17:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ItHaQ3wL;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id o10so4508971qtr.6
        for <meta-ti@lists.yoctoproject.org>; Sat, 11 Apr 2020 17:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xmPmTAZgrAfAHYohigICW8YY51v6y4rePTIj3e8mV/I=;
        b=ItHaQ3wLf1cGVdUg63yh8qLz41cBvKhBmIbDP5b5XQW33yMGNww4O/XYUko/0WmpOG
         AHRLWXyMbEWxPOu0vn7s9zDYMe3XNhVJXtv5nB51aIQlIiCNBHA5czQuUer5R1YLIyTp
         Pkv860XZCwjMslB67pno8+EfT5OanAbdsJ0+OXXMv2W9mz0T0/ISeDwr3XhQwOfxa/4i
         pS5LGFXVjqYJHW3Eo6e9s+/B4iz2T7jEv4BEU6NN3xrsA3wcMAe3/E1u2iWH6wZAJ8jA
         yGngSbIVnQuFVGmAvTy0vDcA8+Nm4t52lt+NsOVIMh4uKccn1x6K72VNTv8LtPAIXrqh
         kiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmPmTAZgrAfAHYohigICW8YY51v6y4rePTIj3e8mV/I=;
        b=etPastBDA6nGfJrMPOeyCuZQpr8IbJzX1QpPHF7qey1GvcedJvv4LO15fWunS7Z2C5
         QaBG4OoWEsvB1q/bSbaIh0hHn0wBBx6oZqOLUZy6bJ9MIrfgpM2nh9bRWqreA9dDQtu0
         LSjrERKnGnP/0Y9+LKYbmCZtmLPnta0Z2FkTlF5CHkPnUNUvYrbxmRXNW3t1qItBJ6Pm
         imxYo4qMPR3lON+IXiiW2nuHc1ZBoi0uRzCyOcxuEgCIyIxsnXGGrbuW2CEC62c4i9dN
         s6CQ66ulz1U2sLkLVm8X0SsAU/rl8d+QZGimYYnsfNqNYqFwcQWU8XSCK1YXfyW3/mPt
         7IYQ==
X-Gm-Message-State: AGi0PubOrtnCPm5DugVpApXvso690JJIVaOU/8KJP6hlLcfFhN+yoHQR
	POb1fEvKVuVbwB/V4eKV0uPNHk+7N9uJw27oEZ4=
X-Google-Smtp-Source: APiQypJ6z2K5/nUigwaEcWpTMJVfuwBKe3GekwNIKUB4ZVgINsuKmQdnr5TqfxAM0OtYPm1Bi0DYpwe+pV4arkGfc0E=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr5574667qti.190.1586650113271;
 Sat, 11 Apr 2020 17:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <1586645080-18410-1-git-send-email-denis@denix.org>
In-Reply-To: <1586645080-18410-1-git-send-email-denis@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 11 Apr 2020 17:08:07 -0700
Message-ID: <CAMKF1sq7iVWimQJx3vhi6HBeEBUmm71rQayg2tq5oBChsBD-_A@mail.gmail.com>
Subject: Re: [meta-ti] [master][PATCH] layer.conf: depend on meta-arm layer
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 11, 2020 at 3:44 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 33a7407..7848d19 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -12,7 +12,10 @@ LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> -LAYERDEPENDS_meta-ti = "core"
> +LAYERDEPENDS_meta-ti = " \
> +    core \
> +    meta-arm \
> +"

what does this layer need from meta-arm ?

>
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>      ti-sgx-ddk-km \
> --
> 2.7.4
>
> 
