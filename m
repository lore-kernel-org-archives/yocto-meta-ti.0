Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web08.8113.1603765874810262846
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 19:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K9Bjasmv;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id bl9so14154qvb.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 26 Oct 2020 19:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDfEQGosBOHWMHPD8WLF2JUMBtUlD/OrOgi/3urgzo8=;
        b=K9BjasmvOeREqLQGXmgifxnJqXRY1tet3z5wh2/eUAlM27lRjWfWI1mq6niQQiVPCt
         5/qJ+0ae+PdAJpS8TTrUbvp1tHQY1CgMe/LVfKa/ujrO5SX0WRBaxyakCfBh0AyTyE2d
         cGZg9KToT5zY3LoMkp2VYzmD+hr/dg5rZIpq9CDyqndz92vlys1fWSojANONrUdhqw1W
         fyiOQWVz2dF5eyr7y7D0/0FW4dv4h/ZW+MUnbELgmhBf7R6PvNsUy3q2DL8Vld9oEYMy
         kisSCJaI5FXoH7iz3zaCN9v6Wf+v2/MhM4NmxoExH8u2blPHITyoDPjKeyogTJcbaDUc
         2pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDfEQGosBOHWMHPD8WLF2JUMBtUlD/OrOgi/3urgzo8=;
        b=KbXxOxPI6oRk69GSQDnvK8C5v3jyrhDJ9iN3+1Yn1s/xvzRLUXBGYBI+bHfEcz7rWo
         jEDK3DuHZFJc9AFeTif55IiqbYD+fbLOvDX1KiCYdrRqMPRrrJlFdJ2l0j6ThA1+lCVL
         rtf0xM15eInxmwILZx6qNQ1I7Vyk98uNW88Cu2dDNAhc9Spva2NmdartP7q/Juz+X7IT
         8IKys39V+xsSXo9Wsw52+7DAjVYTyux8fgFdv4PRwej4z6OXiTlG/14RPwA6x31JRtxv
         sSt/0AQ1qKtk0gFQBa4onMmx06QUlBe5/rUIbDZGqrEG1M/5tOfuvko+Ng6C9yG5fopn
         X4LQ==
X-Gm-Message-State: AOAM533dSRXtid4B9winGzHMa72dI5f89pAm4Qk5J9XcKes/WBVjBJH+
	OdWcZv8AH+rXflkG9GInSNaUUADUtXaMtIEBy3c=
X-Google-Smtp-Source: ABdhPJxLrmcnd9T9TJwktbrxBZrjs29eAf8ywCtEZUmT8WvDIMP8Yyc3gI+zqcQU6YR/4zAMJGB4mujwdJg/WMMm+zY=
X-Received: by 2002:a0c:e387:: with SMTP id a7mr253378qvl.21.1603765873735;
 Mon, 26 Oct 2020 19:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201025065934.3308920-1-raj.khem@gmail.com> <20201025065934.3308920-2-raj.khem@gmail.com>
 <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
In-Reply-To: <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 26 Oct 2020 19:30:47 -0700
Message-ID: <CAMKF1so1wH-hQQQ1L3E6dAFLEAxdXkbDjpd9xRzt3tjjdDqPrg@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
To: Suman Anna <s-anna@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 7:19 PM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Raj,
>
> On 10/25/20 1:59 AM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> > index b41e68eb..d08031cb 100644
> > --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> > +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> > @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> >  PV = "0.1.0+git${SRCPV}"
> >
> >  S = "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> >
>
> This looks ok, but I am trying to understand why this is needed in general (am
> still getting familiar with OE). Aren't the recipes processed only on
> packagegroups that include them?

on image builds yes. however in yoe distro CI builds we test multi-BSP
setups and do world builds which catch
such issues, where BSP layers are exposing general packages which are
not compatible with other BSPs.

>
> regards
> Suman
>
> >
> >
> > 
> >
>
