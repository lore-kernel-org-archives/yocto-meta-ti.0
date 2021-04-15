Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web11.428.1618506977268569387
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Aiz16mYL;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71]) by mx-outbound14-222.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 15 Apr 2021 17:16:15 +0000
Received: by mail-wm1-f71.google.com with SMTP id f134-20020a1c1f8c0000b029012e03286b7bso997799wmf.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 15 Apr 2021 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfaPfZ0C75CA+7yX9eaAZoaBIZGpCqmuYy3GrIhKxKc=;
        b=Aiz16mYLJueeOWjKrxqM9BDJppzhwhmQM0ttv10tdWKH2UmRe4308QBzLIFjMQf9sb
         JJPw7J3hT0NXlZ/CqyqgOKAomlxKMP7y7Q2yFp++iZ0VoelulrYLOHTSoOhK7RuFC6QQ
         4rqs6kkbk/DuRmjPOeXYQDhQ4b6BYYLkcnhFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfaPfZ0C75CA+7yX9eaAZoaBIZGpCqmuYy3GrIhKxKc=;
        b=il1YfPCc0Q+R1FmSNo8OOF57hBd4PW1SRRPwlzVOyHa8u3INrrEKB1fl5tLY9eQz0n
         rv5puf4TfEszBy3xvnvs+0DwwAT39A7H3c3+Z7eGzOWywh5vD588RoHFzXb/vZU5s9RX
         xu6QvVGsvl1UzZuQmkgQoT8xA2ZgBG/4LhbjtUvCVrL0YNLk6xXoG2L6YPW+Bk2jEtQD
         G8FozM4nezl6HYNq1j7PNCyIge6a92dxIj/uvzej2C5mWxDfnbJ4Shq2scrRJksh36a/
         zdCiQn5SHl6JFNh/7P4EwPRsIzAI9DNk51knEKDqe/qsXKv0vdB1laxeh1tYsQafBYX6
         3Cuw==
X-Gm-Message-State: AOAM532cwK7Q6PXXrE0AEHBLvw98+vUlvFZCBRSYtgTy7qQ0wzZPwcfC
	JG5uKURMX4ef6h5ddg1+mHIiKY+taNO3vh4nXtYy2sR8Za5lQHyfhN9Q5IrDxoOv1FvUNdSVFp0
	nFYNocCqgKe7kgpFcj5N4HVP84qoLrOOR16FJQaeFY5gpIG4zqSn/seOOQLLPaGLyg02b1ToT3d
	C7M5Y=
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr4181695wml.103.1618506974920;
        Thu, 15 Apr 2021 10:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo2Yo1tlZHN4H7slLS4FN3dA1s5NujZwZXOqSF/j9xx6PtVP70VhY2NQNLgXR4tjyjatBCE5lhuzQN6wlxhQA=
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr4181683wml.103.1618506974751;
 Thu, 15 Apr 2021 10:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210408071654.63212-1-sinthu.raja@mistral.in> <20210408134409.u24qdeiindwia2hl@paralyses>
In-Reply-To: <20210408134409.u24qdeiindwia2hl@paralyses>
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
Date: Thu, 15 Apr 2021 22:46:03 +0530
Message-ID: <CAEd-yTRmTJm80fHNb9VVewxA8zYX4ymDH0OE6LbdQqXVBivFHA@mail.gmail.com>
Subject: Re: [meta-ti] [dunfell/master PATCH 3/3] AM64x Unification: Update ti-sci-fw recipe
To: Nishanth Menon <nm@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>
X-BESS-ID: 1618506975-303806-3303-43822-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.128.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231575 [from 
	cloudscan12-218.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 7:14 PM Nishanth Menon <nm@ti.com> wrote:
>
> On 12:46-20210408, Sinthu Raja M via lists.yoctoproject.org wrote:
> > From: Sinthu Raja <x0257345@ti.com>
> >
> > Updtae ti-sci-fw recipe to build for both SK and EVM compilation and
> s/Updtae/Update/
>
> > installation through one machine name
>
>
> Why are we doing this? What happens to the wic file image? What is the
> out of box experience for someone creating an SD image -> flash the
> image then modify the sd card? how would that help?
>
The AM64x EVM and SK have similar rootfs, kernel and u-boot source
except for R5 SPL where EVM and SK have two different DDR
configurations.
Two different processor SDK for EVM and SK creates overhead for
customers just for the change in tiboot3.bin. Two avoid the overhead,
we are creating two
different images for EVM and SK under one MACHINE_NAME (which is am64xx-evm)

Two WIC files will be available separately for EVM and SK in the
processor SDK installer. Users can use respective WIC files for
flashing on to the respective boards.

>
> if we are going to make things minimal, then we might just have a
> headless_k3 and gui_k3 or something similar
>
>
> Further, when people have their own boards, how are they supposed to add
> support for their platforms?
>
For adding support for new platforms, it will be the same as adding
any other new platforms, these changes will not affect the default way
of adding the new board.

>
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
