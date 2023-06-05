Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B9DC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:13 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8891.1685974448534347967
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 07:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=d5ximZ+/;
 spf=pass (domain: foundries.io, ip: 209.85.208.178, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b1a86cdec6so53285491fa.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1685974447; x=1688566447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eApixcWAeZmfhxEwImOg/e9XCdklo0lxyxCSLZk9v3U=;
        b=d5ximZ+/LbdHFSf9z1m1wQGYsBv+Xln59m8kmIYtU2xwZ+PpFalTutQxtUhnFFOMky
         dgrFeL+YUe0LLlHWvW3FYxcQAL07rMm44O94VDYaU5DlUjtrr50fLpW22BwHtKBQ60J4
         +mNn9clYmMafS/iQiOx5pXQmQ06TR4iPp09t5s0/n//KlrRFTL0BvGx9yM+kgggB5O1J
         HuQGvhPfT676/z/3u8PgeTws7Ig/F4dV3+TlwJi3aLX5oU60yL+dHRQMOBCsf8Dr2Jro
         s9//2ns0sOiVJk0QU28R64WuuQU2o9f48SEFFYSJRAGPWzb6pdgZFLC5x6Bw1NCZp7Gt
         vYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974447; x=1688566447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eApixcWAeZmfhxEwImOg/e9XCdklo0lxyxCSLZk9v3U=;
        b=P1YyocoiN3FNsGbW348k9R7ZjjzYy+0uLOROVdGWYqy603ZLwF1azdN2JRsIVuFgL1
         fKdH11/t1uhQJ+I8EcE8eD/vbCkAZo25OpKQ0o2YnGzMmVN+2xnr+qTJuTp8VhMCOH40
         JilibvTTIwokIK9roJhJ0CFoLBEzD/2g3F+LYFCiyb/OdttXtkZiz9ep+0fTj9VZXZpR
         uoB7YzoFN2d3PPwD6YOdti06/SI99Kp7Zj3h30I+LA58TkZDZY/migLILDa5hGmGD1Tm
         XhfsK3urZGRAgvGjBI8VHldgJ6Vnf3IbRgA+Ut0szfp4Tl+Cw9cic+dGLvi4clplE2BL
         r8tQ==
X-Gm-Message-State: AC+VfDwJLHerCqAgrky7idgNJVWSF9PpQ7Ng5rNBuopTCzJ9lazEITpu
	XqpYSlU0XA7+6HYIvWG5S8m1QXc45QGYO9JfXTPU
X-Google-Smtp-Source: ACHHUZ76H43H6yk+3ZKUhiUyAp3CEjYMVw8pT2W9mCgfGgAIQRAsnsZs79tmvpPTaW67NEBR3fVif0s+WoVaamrn++c=
X-Received: by 2002:a2e:98c9:0:b0:2b1:eba8:c23e with SMTP id
 s9-20020a2e98c9000000b002b1eba8c23emr536430ljj.27.1685974446630; Mon, 05 Jun
 2023 07:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230602092932.2576466-1-p-bhagat@ti.com> <CAAaKDhH6NFE4wE7Rge4qYELvOSV6V4YTWoi7eyiAeoZBr_8BPw@mail.gmail.com>
 <8e560bf3-7997-9a66-a3fb-55dbb264c4e8@ti.com>
In-Reply-To: <8e560bf3-7997-9a66-a3fb-55dbb264c4e8@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Mon, 5 Jun 2023 11:13:30 -0300
Message-ID: <CAAaKDhGwQiYMqRAmgiN=snodp+jvBsosL7bWvyMau1-RC9LrMQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-ti@lists.yoctoproject.org, g-gupta@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16666

On Mon, Jun 5, 2023 at 8:22=E2=80=AFAM Paresh Bhagat <p-bhagat@ti.com> wrot=
e:
>
> Hi,
>
> On 02/06/23 22:45, Ricardo Salveti wrote:
> > On Fri, Jun 2, 2023 at 6:29=E2=80=AFAM Paresh Bhagat via
> > lists.yoctoproject.org <p-bhagat=3Dti.com@lists.yoctoproject.org> wrote=
:
> >> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which cont=
ains
> >> patches used for jailhouse. These will be used to build jailhouse imag=
e.
> > Should a new u-boot recipe be created for just one patch?
> The patch in u-boot is used for jailhouse on am62xx-evm. It fixes the
> "reserving fdt memory region failed" error while reserving memory for
> jailhouse using device tree overlay. patch is kept it in a separate
> repository(processor-sdk/u-boot) and only the jailhouse image build will
> use this u-boot recipe.

As Ryan said in the v2 thread, this will cause more maintenance issues
as we move forward, and for just one extra patch why not have it
applied as part of this layer?

Just make it depend on a jailhouse MACHINE_FEATURES, then you can
control that more easily during build time.

Cheers,
--=20
Ricardo Salveti

