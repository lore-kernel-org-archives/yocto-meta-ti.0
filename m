Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.11674.1625601998648164233
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fWLBdIiZ;
 spf=pass (domain: konsulko.com, ip: 209.85.222.170, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f170.google.com with SMTP id b18so9944779qkc.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 06 Jul 2021 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T1S38PQ17UNj/2z28uQqlNqssJCYL9m8JFAnHQ5Q1uI=;
        b=fWLBdIiZm0opf3OVg7V9U5MNBuVW7Kt+N/vYeT54u5nxYxmK7XqoD5scqfD7rbgQfg
         zfPFxrvtnQqn21wUzqO7x1EVPvxkD/h9f/ZUnmHLvSHjoT9vaKdpbrdfieajZVasYSMY
         Z59xUd13i/H+Dbwtswy1ccRw1NW+iG2GFeWEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T1S38PQ17UNj/2z28uQqlNqssJCYL9m8JFAnHQ5Q1uI=;
        b=K2lwMP4U+kRNzEU6r70rntFRSr0DPOeacM5LHzEUSQNfos3fE80bzwH6qfO1X3BSzh
         W6TAc9Dd8eUpoccrv/FP4rYM7Wy/rfvJvVVHXGUGAFlO69+7h2uA8bpDJjZD0BpZiy8B
         fADugI4UQqLAZRYjt2U2zlWICFmCsiWr3l9BgHSU008Su9+el5s1ooOitswyslMcrwQx
         pNJurgmzzL2iXZI7HfIoL4I0jc4VjMiraApJf7722x2DlTx73iM8+9do8za8ZCkAxh3X
         MdrrJ6xE9cc0wzlMCEB/HR2Ht2zEnovkn51rsJY+jvO3nRNQV3lz22QfxL/P28V8ZhuP
         9omA==
X-Gm-Message-State: AOAM533OYHnH0UjLHhiax1PbwmZDoof5HdGZzzE38j1At6OSyMihR1d9
	MwhZRs87H1WSnYWsfTZ3I2im/w==
X-Google-Smtp-Source: ABdhPJxMVpZGS9suwr43WZYH2OhHA2V2oqB74zVl6OLoIktdKvKRd9aRWtAWSTxKvVCPQx+uZvSAuA==
X-Received: by 2002:a05:620a:f03:: with SMTP id v3mr21864739qkl.96.1625601997796;
        Tue, 06 Jul 2021 13:06:37 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-5120-5dda-66b4-5098.res6.spectrum.com. [2603:6081:7b01:cbda:5120:5dda:66b4:5098])
        by smtp.gmail.com with ESMTPSA id e10sm7383837qkg.18.2021.07.06.13.06.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 13:06:37 -0700 (PDT)
Date: Tue, 6 Jul 2021 16:06:35 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: nm@ti.com, praneeth@ti.com, yogeshs@ti.com, denys@konsulko.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.07 release
Message-ID: <20210706200635.GG9516@bill-the-cat>
References: <20210706152747.31291-1-nm@ti.com>
 <20210706195339.GQ1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210706195339.GQ1528@denix.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 03:53:39PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 06, 2021 at 10:27:47AM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> > Update u-boot recipe to be on the bleeding upstream tag.
> 
> Is this the official release commit? Bleeding might be slightly confusing...

It is, so perhaps a slightly cleaner phrasing is in order.

> 
> 
> > This introduces initial support for AM64x which works with v5.13
> > kernel tag.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom
