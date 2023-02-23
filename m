Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E74C636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:09:01 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.20353.1677179331484903914
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 11:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oNuZoBb7;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id o6so17518733vsq.10
        for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 11:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRm5/U/1WcLgKuvkJGv5eFnnIhTCA03wF/TmzPXuvOk=;
        b=oNuZoBb7d+c7oz6E2N+bVdzAdfdljAe2PawRUHWpVoqbxXPBzgR+N6FdL41mishjHg
         x88hWtDqHwGrG4noIqNvhXSz4pYCHESrpZkdm8tkSpU9PBxr250iSWgMP3WWlezMF/E2
         tTpRJYD5cQcsop6jKRltW3mPwL6ZzrbB4l9lYkdVD9PqB03KyTm9hURJaMAauIK7JtcY
         VNQ9LdiZ9vzYTSDEOEr29xSlxyug6HX3Wx1t1L51pu0PXPZ2AU8m+rNgzCWMYSNo1mKm
         ijs6JIAQdHcmhE2EXDs1RX+MQs7t2sJOhhFZNfspy2H8lXpRHl7ENiXQ4hzxS8y89vG0
         0uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRm5/U/1WcLgKuvkJGv5eFnnIhTCA03wF/TmzPXuvOk=;
        b=TuYJKvjN8QTFQxYjW58Fufg2b2MPFpAgDpfqGpkejKAmtlgyQqlaHF+ZYhXOmV1V8S
         nKNzhWqJrHSqfG5w7FSFmwe8V9LCC4wVf+fNg3HVDDKPUx1vh0Vzc1h0jzs17UMDr2VO
         dqDEaAvVwy2znHfsJlP2NkXmEhawv/jWmMLtyTZ5iqLWNH4L/EEWqzrQcODObxNwFuca
         TcSlGElqaEtKWbkjQV8pp1lzE9v/eJy+nMYsLkr88giJFaYuUJhSymrEUrpYzY1achiA
         cLSPS06NK0PIw1NdhTkik96tBswjS1R5iOPB2SuUKa3LAz7PzXuImOUkX0cRUvnduNRh
         KvwQ==
X-Gm-Message-State: AO0yUKWm5r/IIV1bH73G/Bxcndma6GNQEt4XJ+/U395TA9gUXWTbJYcd
	g9z1XRE0278b10txP3gGC2PKRVK0bxeaTifjSEw=
X-Google-Smtp-Source: AK7set9ms5q7XKmdfV9GUfX+Jlr45KkuMoVmCBoNY1VtdAlLfMB6F3ZSwwwEyhdgKzPg3mEuqGkR0kJrnHm0nSt3+5g=
X-Received: by 2002:a67:c38a:0:b0:411:bbdd:a908 with SMTP id
 s10-20020a67c38a000000b00411bbdda908mr607287vsj.2.1677179330557; Thu, 23 Feb
 2023 11:08:50 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com> <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
In-Reply-To: <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 23 Feb 2023 13:08:24 -0600
Message-ID: <CAOCHtYia14VzrLpo=QZOGO-1BXGrv1JgXSWvp7rwEFVkVg7iLg@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: Danny <dadleyy@gmail.com>
Cc: danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, "denys@konsulko.com" <denys@konsulko.com>, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 19:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15935

On Tue, Feb 21, 2023 at 6:59 PM Danny <dadleyy@gmail.com> wrote:
>
> Hi Robert - Thank you for the response (and apologies for double emailing)! I have tried swapping my kernel provider to use the bb.org recipe by setting:
>

No worries, i'm on every list, so it's a matter of just replying to
the one with the most reach!


> ```
> PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
> ```
>
> but after about ~5 attempts I still have not been able to successfully fetch the repo; I am a bit worried I might be trying to fetch too large of an amount of data. I believe the relevant logs from my build system are:
>
> ```
> git -c core.fsyncobjectfiles=0 -c gc.autoDetach=false -c core.pager=cat clone --bare --mirror https://git.beagleboard.org/beagleboard/linux.git git.beagleboard.org.beagleboard.linux.git --progress failed with exit code 128, no output
> ```
>
> yocto aside, trying to clone via
>
> ```
> git clone https://git.beagleboard.org/beagleboard/linux.git
> ```
>
> fails (somewhat expectedly, I think) with
>
> ```
> error: 1610 bytes of body are still expected1.01 GiB | 5.65 MiB/s
> fetch-pack: unexpected disconnect while reading sideband packet
> fatal: early EOF
> fatal: fetch-pack: invalid index-pack output
> ```

So I've talked with NM about this too, I'm thinking we should swap the
beagleboard.org's git repo back to github:
https://github.com/Beagleboard/linux  as both repo's are a mirror of
each other...

On the Hosting side, BeagleBoard.org's "GitLab" git server is a single
AWS arm64 host, whereas github is a massive data farm..

Swap: https://git.beagleboard.org/beagleboard/linux.git
For: https://github.com/beagleboard/linux.git

I keep both in sync on every BeagleBoard.org tag..

https://git.ti.com/gitweb?p=arago-project/meta-ti.git;a=commit;h=f843fa1914896358911b52eba7052ba1996a6919

CC'ed Denys and Ryan from ^

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

