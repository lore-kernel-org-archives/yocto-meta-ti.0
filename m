Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.1051.1628619371174442972
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 11:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cvaeRS4c;
 spf=pass (domain: konsulko.com, ip: 209.85.222.181, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f181.google.com with SMTP id c130so15112466qkg.7
        for <meta-ti@lists.yoctoproject.org>; Tue, 10 Aug 2021 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vH+JRpHaF1hoAAbRsAt8NRFakdmy/s7ZC+xbxksRS2Y=;
        b=cvaeRS4cmJ2tvFzE+ElnblPfHDtW9Np5FX02LzomzaSGhvbz2+OseZB/vdIgOwnjbB
         ZU7ptCar84L7wi1FSsVEPu4HqRF06QGZmbxoLEY4O0RFSDgaR/2sRH6p7NQV+9yT1DPP
         u7rJJSUlUJ45BCR7oz3tI1en/K6m/lXlS9CLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vH+JRpHaF1hoAAbRsAt8NRFakdmy/s7ZC+xbxksRS2Y=;
        b=dNqdb0FpHsoTN2CajGOcS0i+93JW3sq4elm1qiCRPxMw5evEnJmr1AaA4/bwUO6dIu
         4RIYkKjMsVWeD6ndBlwzsDoffWuxX29LX1g44IPT2cfGSZNm33jNCxT5/F86aAw0gYkA
         mS1e3ZCuYb1xhrhk4ARvpJ4LfrExTiKJRDM3G21QJyDsGWQKJFUEfy6QQ+LlqcPD8gAl
         1Gb9IbP5edue+rn1j8FP453Nzc1ZSi1CP6etSFx6747kw0Ax1zEIHoDiH7Bf+BknRQc2
         GV8+lcRr3tHOEfS2DYpzvYUbatSRTXa8N04NCdEiIXyITCnwCu1lSYN7CD0d7YkOI0Ps
         14+g==
X-Gm-Message-State: AOAM533iPPejyGzJRanps8ZnBql3bZPHT5cXU97ZT6+1S7aVeUljyPpM
	hXVqR47yOfWuOZzFU97fOMJNkg==
X-Google-Smtp-Source: ABdhPJx2//4yZ8tM3OGOAXHVn2OCKq9weKBlAkxiGiI61o8sRHUQKxjg9uEeLtq3ezisKDr+k8dYAw==
X-Received: by 2002:ae9:eb8b:: with SMTP id b133mr29833044qkg.344.1628619370260;
        Tue, 10 Aug 2021 11:16:10 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-2899-f679-6391-9304.res6.spectrum.com. [2603:6081:7b01:cbda:2899:f679:6391:9304])
        by smtp.gmail.com with ESMTPSA id p19sm8056695qtk.75.2021.08.10.11.16.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 11:16:09 -0700 (PDT)
Date: Tue, 10 Aug 2021 14:16:08 -0400
From: "Tom Rini" <trini@konsulko.com>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] [meta-ti] [PATCHv2] conf/machine: k3: Enable grub-efi by default in wic images
Message-ID: <20210810181608.GK858@bill-the-cat>
References: <20210628180617.789-1-trini@konsulko.com>
 <f5fdf644-7f2a-b7e5-7ca9-da741e7b2a4c@ti.com>
MIME-Version: 1.0
In-Reply-To: <f5fdf644-7f2a-b7e5-7ca9-da741e7b2a4c@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2021 at 11:48:34AM -0500, Siraswar, Yogesh wrote:

> Tom,
> I am running into build issue after integrating this to dunfell-next.(See
> attachment)
> Let me know if I am missing anything.

OK, I can reproduce this with just oe-core, meta-arm and
meta-arm-toolchain, using an external toolchain.  This is a failure of
the external toolchain.  I suggest you raise this problem with the
meta-arm folks as building grub-efi for aarch64 is kinda an important
use case for Arm (the company).

-- 
Tom
