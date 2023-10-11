Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAF2CDB465
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 23:05:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.1046.1697065492875159051
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 16:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aB+UFLSA;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: perezmeyer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a645e54806so54419566b.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 11 Oct 2023 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697065491; x=1697670291; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+it/m1CEsBlehJJ9sVPFA1rphkp2uJpKmBqMo12lHc=;
        b=aB+UFLSA9u7DxS0IpJ3jGgW/ZG6tjPCAJaSaHddhLoz4BjOqP8rSrl5hqGhBR/zXy0
         P9K92GXshXGk1JbDNkh1wUIu3CsdUiFHMBGhNdRdiO57SysVVYWr6E28nzDiYR1s77P/
         xR8GQF9oGPRJ4oTHahkQ2OFfApJkiy1+gcwjHclhOKVfe/2RgZuo8hdgLZhBdhrOyJ4i
         kE1azQNbJb+yAYIE9GjZfRLxoiza95fOvPIBXmopu47T0o9ietZEsXMGbT9f/ltHlw9m
         eOmmwKsZ0AgEr0nnxuZrcqWY3/rEXDQUl1FdYuCUPMIoDCllfTS4r35aOUZV+rGWC25N
         47ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065491; x=1697670291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+it/m1CEsBlehJJ9sVPFA1rphkp2uJpKmBqMo12lHc=;
        b=a5sCBsVXMzpjjMVYYRdi/ruMRTfyFdAhXecaMpyfNtDi0Om6E/qsAKdB4fi5M/cLha
         iMWOIUCCU6yqzQap/jZoNQ/OehcsjjinG7cUcd3OLBf14DhP5Dj7AOedNWokp7HyI/OU
         eneEU0QW6igOuK4Poo7liYSdKHRd48Qob8cQdWCz8Dl9RIOZbbewcPIOEpwmzkwHZv8C
         EfTFhcsxv5x7sco+LlKndpCbWuuXqQHrPBQdPaZRgR7WRrb/VlvZpnvvNwg3hBZG7bIJ
         U4+xbXQOTt7xN8IxmHD2nIf172uKihvk82Bw+Di39MQH2uwiqUC+GhtVUw+Yu7m8NcSz
         ZwFQ==
X-Gm-Message-State: AOJu0YxV+tJTfyu1m8WEItRSfY9ZrKq0+VECx9G1nynMM3WD3kHXNIXY
	jco91mWok/H2ucAEDUWXP0oJtBfxrao1lr/2DHs=
X-Google-Smtp-Source: AGHT+IGrayFqGtMmy8gTHXqz+ncJm7O3sTv5SCLiNP3dr2Pxb5ouhsDSAq6J0EzOrKKNZtScawX9EsqDqi4Ukkenidw=
X-Received: by 2002:a17:906:74ce:b0:9ba:2a5:75c5 with SMTP id
 z14-20020a17090674ce00b009ba02a575c5mr14507434ejl.75.1697065491104; Wed, 11
 Oct 2023 16:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+QPbz0JEs2cFDm81AZmsODgHgsiVhcKe4ASQyTK9-xEeJjwJg@mail.gmail.com>
 <9c1a5c94-e499-45e9-884d-4b5715b62733@ti.com>
In-Reply-To: <9c1a5c94-e499-45e9-884d-4b5715b62733@ti.com>
From: =?UTF-8?Q?Lisandro_Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?= <perezmeyer@gmail.com>
Date: Wed, 11 Oct 2023 20:04:38 -0300
Message-ID: <CA+QPbz0rd34pG=tBdRct5gL6BnOnqQdn_2yznEz+fP7HoK6hNg@mail.gmail.com>
Subject: Re: [meta-ti] TI_COMMON_DEPLOY: wrong default value?
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Oct 2023 23:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17092

Hi,

On Wed, 11 Oct 2023 at 11:46, Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 10/11/2023 7:44 AM, Lisandro Damian Nicanor Perez Meyer wrote:
> > Hi!
> >
> > In https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp?id=4dcc70a8778e9fe53ca43bda22b144edcf1dd7c8
> > Denys set:
> >
> > TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
> >
> > Now it is customary that the deploy directory ends up in
> > ${TOPDIR}/tmp/, so probably that should have been:
> >
> > TI_COMMON_DEPLOY ?= "${TMPDIR}/deploy-ti"
> >
> > Regards, Lisandro.
>
> As part of our meta-arago layer we added support for creating the
> secondary toolchain SDK.  This also created the addition of a second tmp
> directory for the baremetal tools.  The issue came down to needing to
> create a single deploy directory for all of the things produced by our
> builds.
>
> You can read more about it in the commit message you referenced above.

OK, I clearly read that incorrectly. I stay corrected.

