Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.6013.1616053888592441810
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 00:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hBb/ssNc;
 spf=pass (domain: linaro.org, ip: 209.85.167.180, mailfrom: fathi.boudra@linaro.org)
Received: by mail-oi1-f180.google.com with SMTP id y131so1149180oia.8
        for <meta-ti@lists.yoctoproject.org>; Thu, 18 Mar 2021 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=239cKlv6SlL0aLw7UTS4jt7Tn21cb06IVJxShHtBGxQ=;
        b=hBb/ssNcSh7g2IQ5fynZC2r89jb0wOxznsx+LIlUSIMb4NZt4BLj+Xf/eYHGbc9Xzo
         5IJ2vCDDwiCGp9XpiNzYj+uG01aMwgNOYZk8GYu45Q7RLzRvGfmt+8g6szy58YsLxdaL
         7PIy3LWsLXLsIwKqg8Oa9t02/KKUg3xE8hCtRoOzlk45GZBe8lmO2PnwYgkpm7t/CFkm
         YHpWJffpZ8Bjt0hOND1DXPoYrA20ihA3HwqRsiqMDEMJ3F/tr4pHcNfNof7SMR148Pyu
         n1mDLJMO6h/XPnlaATbDryIjgvigV8cYHTbmY6OR71o82SgQw+48CPRdorPFskshIFlE
         gS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=239cKlv6SlL0aLw7UTS4jt7Tn21cb06IVJxShHtBGxQ=;
        b=WFvfnRdKTxf5xBqYCj7chJa7udC2NqvwEu+1OxwAN04tIjnibF4RrdpmoLwpwGmiDT
         u9yEH3fqruTxD171JUWZ+EKNqXLjgPfuqfC7wJUNDUMVFQUb3fPn1XBFO9ie4lmKRqjL
         /SLykrYQyBwb2AsZEc3Dixq2SJGnRvV6YIUyn+qBXZKT/2cwPVgM+lUg+A0do7qKPFWZ
         O2TzVoOABRfEcwT9V4i3GfkpNwbo/PDk+VgJqA6K8/fCLjCPIBHvs2psbQEbUo4seOdJ
         sN8TOaEorTjdLJtiXx8/SjlzdVXbeu69qEafjpGfZF1FhwZ7J24r7jLW8SqXwyB9QgWI
         wO9A==
X-Gm-Message-State: AOAM5309NUQZbTNOigCqRlnc6xKz4rRIBnvuxxCUezxz1qu2/6aFacvF
	xRWSEqO1YF2NNpPwPHexUVuCz+zcQYKGFdouCCwbcg==
X-Google-Smtp-Source: ABdhPJwM79A80q2iZI++Z/FzWAXOg93OTc7xq9ynNp1+bJk32YVtbfEDWRttbUz7S+K3LBpKkVnKq1kFQQSYDUf9iG0=
X-Received: by 2002:aca:f50f:: with SMTP id t15mr2122042oih.53.1616053887717;
 Thu, 18 Mar 2021 00:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soh-om+Qwh8J4YNpCa4Hv+SUgwUcRzHGvxcrBYyPB0Row@mail.gmail.com>
In-Reply-To: <CAMKF1soh-om+Qwh8J4YNpCa4Hv+SUgwUcRzHGvxcrBYyPB0Row@mail.gmail.com>
From: "Fathi Boudra" <fathi.boudra@linaro.org>
Date: Thu, 18 Mar 2021 08:51:16 +0100
Message-ID: <CAGNsrLCSOpGgFi5dip3KwM6=hWw6yhnUdVMCMxBiZMGZVDYoEQ@mail.gmail.com>
Subject: Re: uim-sysfs duplicate recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 18 Mar 2021 at 06:43, Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi
>
> uim-sysfs seems to be copied into several layers as seen here
>
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=uim-sysfs
>
> I wonder if this should be consolidated into one common place ?
> perhaps meta-oe or somesuch
> layer.
>
> If not, which one should be used when both meta-ti and meta-96boards
> layers are used in
> a distro ?

meta-96boards uim was modified for the hikey board and should be
considered as a fork.
I'll need to check the specifics and if it can use the upstream recipe nowadays.

Wrt if you use meta-96boards/meta-ti, then you should prefer
meta-96boards for the hikey machine. Otherwise, prefer meta-ti.

> Thanks
> -Khem

Cheers,
-- 
Fathi Boudra
Linaro.org | Open source software for ARM SoCs
