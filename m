Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3464C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 20:43:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.2428.1658349832087877987
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=07+og9Zx;
 spf=pass (domain: baylibre.com, ip: 209.85.215.181,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pg1-f181.google.com with SMTP id f11so17460208pgj.7
        for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y+FWObOmQtaC+TdPwB1EI24gcJ9OcwLP9N1dZzdARMM=;
        b=07+og9Zx2AB+maCKyGPYRKRwMYw02VKKY3Vf/1IZHlYmFwHI8a4WJvsWJiHhXoTLiE
         94jmuV7g/XclDU3RIv6IVFRiiVEQMpMf5V9l6mwES6pSFIQN0Uo60Q9j1t3A0xJpKHPm
         ecM/wX1x8ZCGavUuCPopGKQrkxtV6B7gzDDP62HbexzoR9UTV+TT0G+pZNPBjRViYmnX
         v3Vf0a1ZSaimIr0RCeD3GFgTuD0I1hpEGO6fTa9y14Q90jwz9ZqyLYzxI5E24bPfgZ+Z
         HwBJkaJDjkX0WBJMdBkFteDXl4smUVgno5fYxkneYPutUbq7ghtZITddb+sJoA5QELa+
         zF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+FWObOmQtaC+TdPwB1EI24gcJ9OcwLP9N1dZzdARMM=;
        b=uSbNKVlcyUDYWOIopLqcBe6CILTx7d3eYdOWKmshHWEg+Uzq+Ftho9Vd7CBz2afDZd
         lSPTe0amrra4OJ2Jkr6bubsk6PJoWA3gKxTnMzpuBaeJ314Og2a6QZ7zSuzaozpwScsF
         dsmfrtWJEXEBr1SHVIRW13tTrgUXVFsMp+uWGe7ieBlldlTMLHFHx2iV3Z/2fHJ8du1v
         07lF6qt06XDIbR1qiEPl/qVAXSJuUwZAQblqKnxaa5QR6HKQhp0bg2+bhtaMeEtpH6r7
         7jX62iVKt3g4HhaZctuL8AzvGRilOFRRp8hNNEuR1MRF3GPBz4lrIoEID8cCs/lbCIfd
         cFoQ==
X-Gm-Message-State: AJIora+xxM+i3MhmY3d+UQDdGdvz0alxgL6s7APu31SzI/I/YcnhjQlT
	8eCXmiDl8MnKORlgYer8BBMTew==
X-Google-Smtp-Source: 
 AGRyM1tk7u8q9ZfcCXK/c6NGJn+1oVpMTlSF0krzEhf7BVaWbMjEezQDEoTD5JrV7p5/vsm5wpA2Xw==
X-Received: by 2002:a63:3f48:0:b0:40c:f2ca:4769 with SMTP id
 m69-20020a633f48000000b0040cf2ca4769mr34487841pga.205.1658349831309;
        Wed, 20 Jul 2022 13:43:51 -0700 (PDT)
Received: from x1 ([2601:1c2:1001:7090:195b:a0a6:8901:2068])
        by smtp.gmail.com with ESMTPSA id
 a143-20020a621a95000000b00528d7d27211sm55577pfa.178.2022.07.20.13.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 13:43:50 -0700 (PDT)
Date: Wed, 20 Jul 2022 13:45:24 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Nishanth Menon <nm@ti.com>, meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Message-ID: <YthpZBoEnSaWxg5R@x1>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
 <20220719031841.GY18692@denix.org>
 <20220719132201.2r73plviktkkxnkf@wrecker>
 <20220719195102.GE18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719195102.GE18692@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 20:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14890

On Tue, Jul 19, 2022 at 03:51:02PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 19, 2022 at 08:22:01AM -0500, Nishanth Menon wrote:
> > On 23:18-20220718, Denys Dmytriyenko wrote:
> > > I was thinking that instead of keying off of ARAGO_BRAND=mainline, which 
> > > is very specific to Arago distro, long term we should instead key off of 
> > > PREFERRED_PROVIDER_virtual/kernel=linux-ti-mainline, that is specific to 
> > > meta-ti... Thoughts?
> > 
> > 
> > We'd want mainline kernel, u-boot, tf-a, optee ..... as many upstream
> > components as possible. is there a way to create a virtual package group
> > that points to all upstream base components?
> > 
> > I am looking for ways we can enable this beyond just arago brand.
> 
> My understanding is that tf-a and optee were initially forked for K3 
> development, but these days are pretty much the same as upstream.
> 
> And optee is already pulling code from upstream, just pinning down to a 
> specific version and doing some extra TI-specific signing on top.
> 
> As of tf-a, I'd recommend dropping git.ti.com fork completely and pulling 
> from upstream, if possible.
> 
> But kernel/U-boot is a bit more involved. Those are done as multiple 
> providers and require switching corresponding PREFERRED_PROVIDER 
> variables.
> 
> Either way, for testing which kernel is being built (ti-staging or mainline) 
> and which U-boot (ti-staging or mainline), checking PREFERRED_PROVIDER 
> should be doable and Distro-agnostic.

Thank you for the suggestion.

Would the conditional then being something like this?

  ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)}


Drew

