Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B63FC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:24:28 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.222.1677180258191343590
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 11:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iE7Ibq7A;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id j14so17368162vse.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 11:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+mkz1erIrQHiddqkmQ4b0geNuKTA58UBhzb/l0jh6gw=;
        b=iE7Ibq7ADh9mClDKX5wGugpqAI6pAXWwb7wu6NOB4XP0Ov09aaHCmMJSQ7sn7R62zc
         rFfhcvxcQblXrWolA9VE0deAangUJSzHheeRjqJyWCd+FOoIPXOIJ0bUM1CXPReFizcO
         p8O2uGKW3jH5liWCTRdxGwsindB6rC/ieYpDke4QWoysAXVys6j4xkLZlbTcEdoyE10e
         BHHfmnXOXiDAL/rzQStF/74R1B0qAQOGjq5Y5b4539dh+yZ63bFxeWguHKRknC88NR9o
         X/Zu0M7Dl57xCz0via5kIrmdtcBLSPsqUaX1S1oT2dVNJNAw5OFFznfnJC/JndQGlNC/
         4CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mkz1erIrQHiddqkmQ4b0geNuKTA58UBhzb/l0jh6gw=;
        b=XYfSA7UKd8jk39Zm7QWMnpMrb9O6DICQv4X2F7j941V56t0Wod2GI91n4YT2LQuDRu
         DwKl3+TU4m6GTqoeqXrfh8t0GXhA47aXNMuqD8n97HlRNo5Fhux6d6RQW8FWkI+WQys2
         Hy2dTBTVggyJdGioGkqgpSxAsXDYyaHp57eNQq3c9j4k11tqi44vJ37Gf9wJzmd6Snbf
         Fmumy95HW7rSv+UZc7eUBBdFTE5y9/2EFFnrcszTKmOmtAsE2qAsBgMcz7unfpOl/CxW
         khGZR8+49aVd1chFJJM8W6htZoVPkhcmIm8sQKM08tRGQd7t9+3kqsy2Vn8wGyU/+rLo
         KNDQ==
X-Gm-Message-State: AO0yUKUCr+k/wSd3EKUXR1eU6HgI9OhQtRhOBqqVz2JztF/iBGsoJgZB
	ZBkrW6qUSpHhxompOZDASPI8dBD9iF/q8Gbu+0M=
X-Google-Smtp-Source: AK7set/AL4CH8bP3Jszk0LAKqGv/B4ORcx4+yKr380LMv/+yKzZqUsu0N1iLR0+kGMlINT5c9wCAFrD8KIprtAX1F0U=
X-Received: by 2002:a67:d21c:0:b0:416:8ea0:7f9b with SMTP id
 y28-20020a67d21c000000b004168ea07f9bmr639653vsi.2.1677180257157; Thu, 23 Feb
 2023 11:24:17 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
 <174689B75462BC7D.19957@lists.yoctoproject.org> <CAOCHtYid579_w9-X1vRC7zO1emmpwCYvcLi5xFWOjMQsFRxm9w@mail.gmail.com>
In-Reply-To: <CAOCHtYid579_w9-X1vRC7zO1emmpwCYvcLi5xFWOjMQsFRxm9w@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 23 Feb 2023 13:23:50 -0600
Message-ID: <CAOCHtYifHusHaeb7YmvRcgf7B8AfV2yyTdYAPCc3o8K5wkiyYA@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: robertcnelson@gmail.com
Cc: Danny <dadleyy@gmail.com>, danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, "denys@konsulko.com" <denys@konsulko.com>, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 19:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15938

On Thu, Feb 23, 2023 at 1:21 PM Robert Nelson <robertcnelson@gmail.com> wrote:
>
> Thinking this would fix both?
>
> ```
> SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;tag=5.10.145-ti-r55"
> SRCREV = "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
> ```
>
> Another step could be to move 5.10.145-ti-r55 -> to a variable:
>
> lots of tags to choose from:
> https://git.beagleboard.org/beagleboard/linux/-/tags

K3 only arm64 tags can be filtered via:

https://git.beagleboard.org/beagleboard/linux/-/tags?sort=updated_desc&search=ti-arm64

non arm64 are am335x/am57xx

Regards,
-- 
Robert Nelson
https://rcn-ee.com/

