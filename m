Return-Path: <jpanis@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF3FE784AD
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 14:06:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.82809.1696255604729662833
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 07:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=LMsoHboA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jpanis@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-406402933edso82114015e9.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696255603; x=1696860403; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTTElsIvq6m69hHK6jIXr6yOLLP61WLVYjCtwDHxWFg=;
        b=LMsoHboA1yEqcvo1D1mZkpP9Shxm2TQJAojVm8WkWw5M9FE7TMnQg3CSMDKAP/08j8
         OkbfI+C5jWLy74HhmJ3zMj0eDILnvJGzk0hg69/1btQpov3hobDzHMP4/rwYrjkUzSxL
         k2swKWGFr/seoE56jhqwYtsivk59TZDat3taVn7jy9V02hZy0MpW2TKyPLu97tDZDXK3
         yP/+3cLZAepN+XVKiXjqsIJ44NEFeWNzbdOPXQGSHDkch3AB4G/T3T+d6IKbJnAunqc5
         vW/IP0PlH50Yvs1twS0PrkYn6UPDSl4tRXCG/KPA47SZQMXZLG6E6eVz0p4l4U/OkQdj
         FzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255603; x=1696860403;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTTElsIvq6m69hHK6jIXr6yOLLP61WLVYjCtwDHxWFg=;
        b=fT/hzwWz7xjU4Ifwk1IFK8alChSwjO9LRz/nmmb0tTL0TBX6iIzQ6IBqpVAYbcEH4/
         vFJmsAXvcrc+UqL40dgP09EC24BI3tHaMhL+qwnhFR2bh/38sUcip475Ek4sg2nys2Ti
         Vda3rUbt7akNNWwvn/6o3dVWo1qpK2cpj441N/bPSjkqW4hdnjSn2eyMVckDLpyfsTn7
         +HOSMhnPhUm6EFZ5ArxDW+jDII9dvhl0F8hfQh9fTzCKud020cafdz2zDMnKqnhFSQDJ
         u4FfL+RcYigz4XylZ7x8ZfV3Tr5QcoOIfSzq9U7Tb9Y00CeZCoBf4ly0MJH3LhFjs2mz
         FHug==
X-Gm-Message-State: AOJu0YyI+C7nIqhzVEECiopy33swTeRgpkIoHo+M88G0xaUF5gvUVp8G
	5gnUJk7itqLfWG8uUDJO2Siq6u4J+w88lh9fySE=
X-Google-Smtp-Source: AGHT+IHvifTOSZ4vpRPIWsw2zg2j/PlQSgfAPcQYPaJ4n+lwKEU8+ER0TT0o9yhkZ5jmKQEEI8PRlg==
X-Received: by 2002:a05:600c:21c2:b0:405:3d41:5635 with SMTP id x2-20020a05600c21c200b004053d415635mr10780067wmj.29.1696255602769;
        Mon, 02 Oct 2023 07:06:42 -0700 (PDT)
Received: from [192.168.1.70] ([86.71.62.184])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b00402f7b50517sm7268119wme.40.2023.10.02.07.06.42
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 07:06:42 -0700 (PDT)
Message-ID: <0f34de43-bdd5-47cf-bcff-b0e0dbb666aa@baylibre.com>
Date: Mon, 2 Oct 2023 16:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/kirkstone] u-boot-ti: Fix SPL binary name for SD/MMC
 media on HS boards
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
To: meta-ti@lists.yoctoproject.org
References: <20230929122555.10794-1-jpanis@baylibre.com>
In-Reply-To: <20230929122555.10794-1-jpanis@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 14:06:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17039

On 9/29/23 14:25, Julien Panis wrote:
> The SPL binary built by u-boot for SD/MMC/eMMC media on HS platforms is
> u-boot-spl_HS_MLO. Thanks to this fix, the binary is properly installed
> and deployed.
>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index d9a3a520e857..9ca0fb44d127 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -100,9 +100,9 @@ UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
>   UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
>   
>   # HS MLO
> -UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
> -UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
> -UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
> +UBOOT_HS_MLO_BINARY = "u-boot-spl_HS_MLO"
> +UBOOT_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
> +UBOOT_HS_MLO_SYMLINK = "u-boot-spl_HS_MLO-${MACHINE}"
>   
>   # HS ISSW
>   UBOOT_HS_ISSW_BINARY = "u-boot-spl_HS_ISSW"

I'm not sure that this patch should be applied actually.
In doc/README.ti-secure, u-boot_HS_MLO is mentioned for Keystone2 Secure Devices.
So, maybe this name was used intentionally...(?)

