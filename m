Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC11C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 20:22:18 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.213.1667852528381975159
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 12:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ysgkcg8U;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id m204so13410112oib.6
        for <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 12:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq1QlGgJCphplFRCwl3SFmq+joYSZBsAJFiiHvVHAPg=;
        b=Ysgkcg8UJ2zqVr8JIwByM19GHDZAqGDK5Nj6ULJlWxEiDpI1SL+BbHEWW7kW9J5ffa
         6kIfT4XcuSHewZktIqqR0lheKjtTs1skMP8pacp73kGFhNwnFjwr/vbwh5OMticmgDym
         DYFGU22wuTenKKLkVq9iZqTQ3qZ9A4qtthww8qnZD+uNwMBpc/9i25Vv/TtCLEQae5AW
         jQgY9VG3EPy+wWKzzv1D3L5uq7lnymn4b0VmGMFvHQpLHzl6rHBqrhj8yZTz7yIgSTnO
         2+F4/OlkYhW9ss2GL74d9pQfOhj7QOD/0RiSFyT0v6ToCR6JeE3Jsk4NO6NO7Bgyjo7n
         CYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq1QlGgJCphplFRCwl3SFmq+joYSZBsAJFiiHvVHAPg=;
        b=GuCFGgfcjjnPB9WbtakKVI9OE18cOx9MAy/NzTfqh0PeJYOzNRwksRf+Gs0pvTy4gW
         0QgFs+uQUc+FeCQNoT6NrJHbJFxvAAi6qDc6o1gvfPfQpdoXRsBg8iyxGy33gxAsEWjz
         9b4r+371YuzilN5T9dYi/HkyQ1TCgl6YG+DMM+gzPEVbzB3gDtdRoeR0fpeohFbZ6CVr
         uCTv33KZSYHvBIlJ2pmA9PpKMSG55K306q5k7ctkerrOQxU0mAk2BvpbIYI+vSqxErmm
         UYqp8hU3Ez1rynKhUElPWNbcgjcOq3jhvXlsbS/Rm56f3Tl5eKQ0nAUixJCfCPU+rYIX
         1V6A==
X-Gm-Message-State: ACrzQf0DXbbz1PtIUDE2IZptmmPzqXc4nuPlkc782+OP4Z9u9D+VSNSn
	f6IJFd7IhgqPPkfX/e2W9cEFHEAbzBU=
X-Google-Smtp-Source: AMsMyM5rwIwewHqZX3/zQ3RmnKZOcPVLQCGKvmGdJOU9tEURJLabychFRz+HCLYWnqliC3twmSIW3w==
X-Received: by 2002:a05:6808:1908:b0:35a:b52:7955 with SMTP id bf8-20020a056808190800b0035a0b527955mr22832639oib.177.1667852527348;
        Mon, 07 Nov 2022 12:22:07 -0800 (PST)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o131-20020acabe89000000b003549dde122fsm2792103oif.5.2022.11.07.12.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 12:22:06 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <c9739ccd-ce38-baa0-10b0-953c52a625a6@gmail.com>
Date: Mon, 7 Nov 2022 14:22:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][PATCH] conf: omap-a15: Fix parsing when
 KERNEL_DEVICETREE is not set
Content-Language: en-US
To: meta-ti@lists.yoctoproject.org
Cc: Zachary Booth <zachary.booth@garmin.com>,
 Joshua Watt <Joshua.Watt@garmin.com>
References: <20221107201830.1203599-1-JPEWhacker@gmail.com>
In-Reply-To: <20221107201830.1203599-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 20:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15333

I forgot to include it in the subject, but this is for the "dunfell" branch

On 11/7/22 14:18, Joshua Watt wrote:
> From: Zachary Booth <zachary.booth@garmin.com>
>
> Correctly handle parsing when KERNEL_DEVICETREE is not set.
>
> Signed-off-by: Zachary Booth <zachary.booth@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   conf/machine/include/omap-a15.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index 02225a4e..4f57e6d1 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -19,7 +19,7 @@ UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
>   
> -DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
> +DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/","")}"
>   
>   # Generate an extlinux.conf file
>   UBOOT_EXTLINUX = "1"

