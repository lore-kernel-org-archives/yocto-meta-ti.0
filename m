Return-Path: <jpanis@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0BCEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 06:31:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.5018.1687329056546484369
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 23:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=4ubkdrJU;
 spf=pass (domain: baylibre.com, ip: 209.85.218.41, mailfrom: jpanis@baylibre.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988a5383fd4so568237566b.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 23:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687329054; x=1689921054;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBRfa/8iuhrIWfxcT0DK40OBWm9NAySWq/iM0YeCIe0=;
        b=4ubkdrJUlBMbANYgRoiKb05K3/Yvti/XiC3ZY5B9lugt6qamvjsjQg1yk1yESqHuJe
         xGezCMWlmf6OYoaX0YiKqPpNAF0+yb8LzPscfd8ipYn5gNgZlLSCnGLg4MjpstAgQ/Pd
         puh+HcSgmK/q3cyrmK9z3gl3/E03rzDairLzrvF6iia9cH+sDh86kqs5U64ID0/p3wiW
         DpfHuJ1InBfBx3CUyb9k6YWNmnBcJ6RwxSiMJS7/BVvO1HiC/wjGVvkYTi25rfpKZeRd
         2TOGPOpku5/2UozPXXaLIwVbRNtTuvAF4TxHmMcDCqJIPWqG144jYkoJ9hMQffZEb4dG
         Lcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687329054; x=1689921054;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBRfa/8iuhrIWfxcT0DK40OBWm9NAySWq/iM0YeCIe0=;
        b=Z2V650avzLoJguvPTdb9XshFGLFsQ0xHzWbcFUmfEwwmkE+tigkhNqSyH38S5D/rL9
         Kc0RK8pvBvdmvaeyelYPKoo2oM73DT5xwvvvgpx0R6FDe352CgloQPR7tpK9lEMdzMd+
         VM75L6NwVXOgTIPzsNU9PJm2Bx64ytPVu3Efi9k1apLHX/ffBRbjyLTHWTF76frb5v1F
         a/pEenkDI1KHzXsyfJcV1ZWPXcaGu5IfbkBbu87Epaq9gpIYJLU8HIDRdMk88OfD4tSb
         WiTMW1h2VnXDEtAZ50pylVmfND2gsfNJGu/+gAaQ9kxPUnl6Iy/LcA9Nt7OA8SWbm9d/
         iJ5w==
X-Gm-Message-State: AC+VfDyPDf01/cxMUH5963ZOveNlE912KysL2B9xm2jSYRWGg7FeRBXR
	0wsymUpVfvz/Q2bpM5flpUV61g==
X-Google-Smtp-Source: ACHHUZ4VWVEkYFm27j1oaPQBSYpNGyEoTvlHv/wmUD1W2JxT6qUFpC+TYEYsYZZ9T+Qb+S69846SXg==
X-Received: by 2002:a17:907:868d:b0:982:8bd5:4229 with SMTP id qa13-20020a170907868d00b009828bd54229mr18504050ejc.25.1687329054620;
        Tue, 20 Jun 2023 23:30:54 -0700 (PDT)
Received: from [192.168.31.121] (135.21.205.77.rev.sfr.net. [77.205.21.135])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709063a4600b00987e76827b2sm2513333ejf.53.2023.06.20.23.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 23:30:54 -0700 (PDT)
Message-ID: <b4c70bf5-a04c-b5b7-933c-477d71032a98@baylibre.com>
Date: Wed, 21 Jun 2023 08:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: am335x-evm and
 am437x-evm: bump max_leb_cnt
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
 Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
References: <20230620170932.19093-1-reatmon@ti.com>
 <6cee690d-ccc6-7a5d-671a-9152632d3cab@ti.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <6cee690d-ccc6-7a5d-671a-9152632d3cab@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 06:31:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16756



On 6/20/23 21:25, Bajjuri, Praneeth wrote:
>
>
> On 6/20/2023 12:09 PM, Ryan Eatmon wrote:
>> New features added require another increase to max_leb_cnt.
>
> Julien,
>
> Please review.
>
>
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>>   meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Julien Panis <jpanis@baylibre.com>

