Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.1998.1598295408740807551
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 11:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=XKdeX7PI;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.196, mailfrom: troth@openavr.org)
Received: by mail-il1-f196.google.com with SMTP id j9so8206340ilc.11
        for <meta-ti@lists.yoctoproject.org>; Mon, 24 Aug 2020 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pvTuewb8q1H1wmDijuTLwEKyVuM8ZsEIZHMYTKrzh6M=;
        b=XKdeX7PIeyyt3QZUbGEqKj9UpUn2eWITBXY5xY3hLrF1Nj6BjNiZQ/fNfbaJqurMyQ
         5+JiyHTgPF9VYSMog0CoXNf0b4+v3lHrGT8MlCPvduqE7If89oVGr01xuSIFHtq63bpr
         3Y+sAxfkycjU2TrAQvxx+6JlcH/+BYho0IkAVUkdW5UiFRtLQU8uird1KotYHTCqIjLO
         /nAerX6JOPi4LVZ5ES/xDcSBVkIcZeE2J1Pn4UDh1rZDiegzJIjIwWmyCaPXMp8Ewj6G
         N7L/9SqaUTqfDtRHw1XEagMATRmLIMVcZPyHv81D0upaF1EnKUCD+8tqC2Gih7XqJvj+
         jazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pvTuewb8q1H1wmDijuTLwEKyVuM8ZsEIZHMYTKrzh6M=;
        b=hbxSbanzn/5pvLyn2DIaFc3aQo439cJka+lq7nB3vHvCzpST79N3flhzlzbBS9E//O
         ZN9iGZNRhqohaG6qjQrH8xbG1cV0h6JU3ZsEmlxP+r3GDUix8xBQ3MD4q1zOp61EawYJ
         lzVMQKarsBd0PwQxMzZutqTIq02h7VOUhPF/46bkSWr0OM8vccDwsZ6wBo41cb+rp/60
         zIQzm7cW+taHy4pgPLEnGgXgM3aJh54bdwV4w/gs/OoXcB5V1xQ1kF/7K0HlOA6XHT/F
         3f35Wdth8aHwq3/HLLyhUFzw2E2St74UGKoPfUhmaf75bX3CAoHsaT777UIGCrMyNkxm
         5RxA==
X-Gm-Message-State: AOAM5335HB1Wvwdme4kDcgcmi7y7l7wVfyTEn5KBp15hEAsIMEJZVQ6h
	fNhb38vJBUtG5gZW1IGizEzBIJYOOOXWPyAodRIjJg==
X-Google-Smtp-Source: ABdhPJy2Af7wqGVSkcaEERgNdcO+eOCjYEUXALbzHiZCDNriQMoYsy59jUvkro207PrNotKZUaaS+WG/3M14gqZVogo=
X-Received: by 2002:a92:c84f:: with SMTP id b15mr6412560ilq.100.1598295408012;
 Mon, 24 Aug 2020 11:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt3VaA+vULJFv14t0FprpAt1JY9OXRZg78g+qKL+8yc0hA@mail.gmail.com>
 <CADVatmM+mZtfUS+K2AtSnpw81P6aXvHkmGd4Khg75czehEijkA@mail.gmail.com>
In-Reply-To: <CADVatmM+mZtfUS+K2AtSnpw81P6aXvHkmGd4Khg75czehEijkA@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Mon, 24 Aug 2020 12:56:37 -0600
Message-ID: <CAFMvBt181ij1nBbKUf8QsTLKdUoNzPYh7PWJiV0MBx69vkBv9w@mail.gmail.com>
Subject: Re: [dunfell] ti-soc-termal bandgap termperature reading got broken in 5.4.y kernel
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Eduardo Valentin <edubezval@gmail.com>, 
	Keerthy <j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sundip,

On Mon, Aug 24, 2020 at 11:05 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> There was a problem in that change which has been fixed later.
> Can you please cherry-pick 6482f5119946 ("thermal: ti-soc-thermal: Fix
> reversed condition in ti_thermal_expose_sensor()") and try again..
> It also has been added in v5.4.59
>
> This is the link in linus tree.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f348db01fdf128813fdd659fcc339038fb421a4
>

Applied that commit to my build and it does indeed fix the issue.

Thank you for the timely response!

Ted Roth
