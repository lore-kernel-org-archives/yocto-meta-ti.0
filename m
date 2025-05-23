Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A8EC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:19:23 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.2012.1748027960945515547
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 12:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqNxhHOi;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: robertcnelson@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7d6cbd3a82so233495276.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027960; x=1748632760; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51goM3uvrdIMBHPIm7zCHlmcO6J97q+iOIiUTCDH/To=;
        b=VqNxhHOinOT8akO1gqGSXwJytOL90uYmSVNacCEH/+BkBe5HqhzHhP70Iz97sZccmA
         P3Lrp4A+HrOAUbEPa3PkwSexW5zlC1AiIfNkYgpa3P4gTzTIStyuqiMxrSBgxJUXKv7n
         dS2VG3DteXl2rIRtzUfutgHpCzK377x0c3gjy0mT7ljHabG5n5+cBMQnQ0LMO1MamsWf
         uLsidvq3Zcwfk7GhuTBjibS0UbB39DOHPBrHbpfPVzZubiRoPbc9u0A+p9UySZ3xr75/
         xdU1McnETtcYNXNN5vixWU5bxsrwYedEfrHFm35+JC55kCJqCaQmqIYyBWo2rHOpZKV/
         WbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027960; x=1748632760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51goM3uvrdIMBHPIm7zCHlmcO6J97q+iOIiUTCDH/To=;
        b=WMoAs6OHzy/Cgf5Sf/0RQkt1RPYT9I1avzsXHxp5BqxDz8YHPDtGR0ZBGvVvLYcop2
         J64OyS0SgH9H2eaoNwyERp6LCyciKVKdVS+KdgSrKRoU+CbkX2sdZ5cPP+tVtmqnZBlp
         DerEi7qzuCaMqD2DXvspJZ1Sd53W0Lk8QmVp3RzN67tE5gcA1ApnJ8veGAP2cDRRc7tN
         d9dCk9eQy0Um8bsuwykwnOGuhVnd8LXJswe/klE0I/l/wAmJFdhvyf/twGhwDGNqAhcS
         VpLhc7El8XCRYDSNqU9mbiw+Y0q7s6GFNBu6EwMCpsokT9PmotxKRYM0orXh512/D7+A
         oPwA==
X-Forwarded-Encrypted: i=1; AJvYcCWdYsKn/DFzoOSSdqVmB//MwkQhrgS21KhHJTuBGCDQWZDYA7Stswj+z7SpDLfiNt13vDV4EQXa@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzZO1snzLCqCHvAHpW3J+TNvsa4ArefCqSXeftgpddp1DVpkzg0
	1nPwXdUQG8bbQSDIA4sHW4usIdZQcReDLa810Ul9pJwyPp46wjEI4NY1nzRffpF0E9387jPxCr0
	lQ6FMisyqRdCWNY4PxhWXsW79O4GM/MA=
X-Gm-Gg: ASbGncsE+poIPsPFqkNJ92PrLtFJcFWCZTWTaUyh8a3HdpdqMY854VmrdxNudo6afRB
	FCC688fv2kav5sZ+9Dk6o+9yGj01OeZEAELbVjm671axl4gbLcoGb7J+U8GB0NGkyYDQ5mZIiy9
	zox7DPa1FpCFWLmtA/vsPX0Iba4TOgSAxZAw==
X-Google-Smtp-Source: AGHT+IHON40bp+S0QADRQT/twJXA2V4uR7q6kqoFXma6OyyuSpNrT/bpmtmdIc2PmDg/6dnsQhfQ0zDdjuoEC8VlTHQ=
X-Received: by 2002:a05:6902:120a:b0:e7d:744d:e7e8 with SMTP id
 3f1490d57ef6-e7d919ef6dcmr856566276.30.1748027960020; Fri, 23 May 2025
 12:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250517005430.3648211-1-denis@denix.org> <20250517005430.3648211-6-denis@denix.org>
 <ad550e5e-3f13-45ff-8b42-08ff4e7117eb@ti.com> <20250523185239.ysx3b2du37qa2vmk@lcpd911>
In-Reply-To: <20250523185239.ysx3b2du37qa2vmk@lcpd911>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 23 May 2025 14:18:53 -0500
X-Gm-Features: AX0GCFuhM8-cncS4m7-6L9_8IsGC7pbj2UhRu6rGtVo0Z1ieSc7qY0EAXuGmuvY
Message-ID: <CAOCHtYhbNLkwcGKmmVeRdQUKXcVtUj8fzJ9_u_JVhndCsGo=Jw@mail.gmail.com>
Subject: Re: [meta-ti] [master][PATCH 6/6] pocketbeagle2: add configs for new
 PocketBeagle2 platform
To: Dhruva Gole <d-gole@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>, jkridner@beagleboard.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 19:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18595

On Fri, May 23, 2025 at 1:52=E2=80=AFPM Dhruva Gole <d-gole@ti.com> wrote:
>
> Hi Chirag,
>
> On May 23, 2025 at 17:23:01 +0530, Chirag Shilwant wrote:
> > + Dhruva from beagleboard.org
> >
> > Looks like Beagle-board.org just released Rev A1 which
> > makes it quad-core A53 plus GPU [0]
>
> Yes that's right.
>
> >
> > Dhruva,
> >
> > Any idea if beagleboard/u-boot will do s/am6232/am6254 in [1]
>
> I checked with Robert on discord, looks like he'll be the one making
> these decisions.
> Adding him to this thread.

Oh it's worse.. I'm going to do... s/am6232-/am62- ...

I blame TI. ;) for giving Jason the quad core..

So I'm going to do it in my `v2025.07` branch..

I still need to make all prior u-boot installs work for all our end
users, so I'm going to have a mess of Device Tree files:
am6232-pocket... am62-pocket...

The good news, am62-pocket* device tree is in mainline kernel, so
that's one piece in stone today..

Regards,
--=20
Robert Nelson
https://rcn-ee.com/

