Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1253.1602690704202813575
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sBN9SUbQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id z6so3089701qkz.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2020 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NE3OMuqCz+TJOPEottJeofj3DsklC61rdOD7nBofQXM=;
        b=sBN9SUbQbp0W2hxiYp/KNBSvQzyD8JfVsYDw7uvEG1K6he1zj432MVRlQsxneDTfKL
         CKd3F3NFPeCFnokHgLkOxkvmDxNoH4dKI0xEaIOJHNRmtMzsXGhJMRVdjJ6T/1JYT9J/
         Z3asmJvJVVUpAtSVqeuEXYwM+UJ4AV3ICzXa5vYIzQ7lkzfGs4/kduWAiAOQHaqJ//4x
         7Eqp8fw80xFANlLfwJzZUGMDG59qDfHgXXxpVbMoAId9i+kev3xFv/+5qL3zdNSBwfeC
         flmGHpIlKkuT7SVbWA2KKK60lsNDY5ZDvqmJYfCMC09m6id/VY4nG2lm6xczDzLUlkv5
         QoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NE3OMuqCz+TJOPEottJeofj3DsklC61rdOD7nBofQXM=;
        b=FA9BLWAaeTnz7K0owzDd94a6UNkEhCaDJnZlXWxQS36bYx44VUEuByL8YX1TraGGjF
         Lo6F9Mx0AzhpyEuHwwi15tkX0fP8Z+GSUbdIP9zw0SYGT7rEOPt9u/Y8LAAKOIAgDJGX
         LfGdAbPlCl6v3O5+KJEVCUSKldNOIb2p8HJ2FCvMUbcxMmWiPL1FjWDQU5JQQKxJnqj7
         ZK5x4oWcsKMh0iM4cgAySJghbuSlJyZjRIjf72qk5WWhhQF4O/pv3X40utqHNbZDXZhc
         Yp8CzKycyp4G9xsZ3P1tkhM3mha1jnmQzapQEz+Gtz9Nn2hglZX3JkiCy2HND6FW5uDx
         bYZA==
X-Gm-Message-State: AOAM533zG+hwn7WU9EaICT8UeRhtXfhrea1WBwMiMGGc5YCM67CUJW8n
	KywCHMAWVujQDG8By7ljjh2wdA66KDSPKRb4xzY=
X-Google-Smtp-Source: ABdhPJwAd1kDYOTPZk47nHqqujuZQtX484kpaMCwqi3M89pZCH8t7qX4+iM+b4/cKDGKYdY9fFCHZeMHg4f4nDVaj8I=
X-Received: by 2002:a37:4015:: with SMTP id n21mr5697775qka.212.1602690703267;
 Wed, 14 Oct 2020 08:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201013214911.339265-1-raj.khem@gmail.com> <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
In-Reply-To: <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 08:51:17 -0700
Message-ID: <CAMKF1sowVNcMN+voQ03RMdKZoBMsjXygTa3c4FDoP6sg1FK+sw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
To: Dan Murphy <dmurphy@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 8:35 AM Dan Murphy <dmurphy@ti.com> wrote:
>
> Khem
>
> On 10/13/20 4:49 PM, Khem Raj wrote:
> > latest OE-core does not promote using trailing slash to make pseudo's
> > life easier
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Strip slash from S if it exists
>
> There were 2 patches submitted with v1.  Do we just drop the RTOS patch now?
>

right you need v1 of one patch and v2 of the other. I usually update
the series with the resent patches. If you want whole series to be
resent I can do that.


> Dan
>
