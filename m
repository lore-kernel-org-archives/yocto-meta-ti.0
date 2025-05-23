Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26B9C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 22:31:10 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.1160.1748039462206150788
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 15:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nlt7zCzo;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: robertcnelson@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7b93d61ee1so289717276.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748039461; x=1748644261; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0m5C31tc2yCtT7pRM17KKIGevX9NiTP9+VsTeWqC7wI=;
        b=nlt7zCzoI4GVZXdjbioH2J/2g4LFDlKLTeNZ+YDpZEEQLNINi4I6jeFfSk6MUBAa7G
         Edl0ULoSCppe8Zn9vTMLB3N0wVwbl75M1GbmVCHpbqR1HXnIbL5od9OPH39Y2axc/Z+E
         rBlxMlvBf0F5/km14vX+VrgYdp1z+IEt3b2PlOH6uQBksqOdKZcu6OFPYMkXcZki7K0G
         zd682F/4QiDU7HL341o+m8wsn53VuVYCp12l4LHzzWv4SjrL8s2yKgf9Wq53segavjEn
         CSmLhWQ0WZF6P2nI4TfJ9EXivhN/12HcVV5L6ff97bYMxKMz4vzlfWV7vAA6CmFtzy2h
         oVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748039461; x=1748644261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m5C31tc2yCtT7pRM17KKIGevX9NiTP9+VsTeWqC7wI=;
        b=bS7Veo+7P93LV1JzB7YnXJsURFx0YnoBKNVtI2BknWaAghOhDQNLDYrwbWF3sCkqDD
         6B8IMz4toQDNsy2trxzDby6/K4NnhHDrvTyyCa272HTTQWu8ypeow/RIy2pJn3mAUrFV
         fFVJsVqUaOchz53zDzyW1NtHCGVs6QB+Xc9zDXjTZfHHFp4CQrhZRLZDqtd0s2wL4NH5
         gZNBwauKNuBqR1RoRRioVPehNca91flLqVuGD6vTHlAirY5nw/sKYHXizl3j/MeV38P2
         a46b4j2eZKonJDYw1vWDGnXTkHFC5HF59dfyjHA2FaK5bhm1p1xfCxYqIolY61wqrQJC
         UngQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxuKQGFHG154Y5vwsZ6mu3EdNbwG9omOyGTLn8+ZFO1XXgmKfSmG6t7Cb7GMGv5JK8UvXhmXKO@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwC+cxFFXXKvGsazOKycXwg0UeXfGJ5GLNJGZ4PyniXcWCDOxz0
	uFqSAbhVBpLfBRKuGNij/eO/NJ3VfzSN7iT/Xx8zrGoRLDiaOk2geMBvF5Wm+F1HjGYypxE5Yb9
	9oegO1z928DMVmX9EXkwtXgdKl8dMt30=
X-Gm-Gg: ASbGncve/8aIAA0R0HoXWO2E1n7lu8vzlUwJ+P+mCJgAZf51zYIbNCuwpFXJBb6KK4q
	583ukjEYBmAykWi0Xcs0TuTSXRVjXOCiCRmylYTPZFOuT/7yR/UMymuiVjcNp9ZGNQ7LUgIqsxF
	Pq7Ayc8DjK8GG3uzrn3osCEAmt9pqab7Gdlg==
X-Google-Smtp-Source: AGHT+IHOsnN3tp1sRQLEDmtXmmifZmaznriQHjT0Q+ycDXDHsHRSWhBiXnBqewiulWyRfb7BQdC2z5uwErF4twEH72U=
X-Received: by 2002:a05:6902:4584:b0:e7d:7496:76ce with SMTP id
 3f1490d57ef6-e7d919d9bd8mr1055908276.27.1748039461309; Fri, 23 May 2025
 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250517005430.3648211-1-denis@denix.org> <20250517005430.3648211-5-denis@denix.org>
 <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com> <20250519175202.GZ18383@denix.org>
In-Reply-To: <20250519175202.GZ18383@denix.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 23 May 2025 17:30:34 -0500
X-Gm-Features: AX0GCFtjRaUlsRzojOB3kBp61MJzey_H91qnYyslykaYTP4Y94TwSY-yicJ4tYo
Message-ID: <CAOCHtYhAwQ=NXkgYzgTcCZnPjOzXcWPn3LBA6u4f1WAfGvbExg@mail.gmail.com>
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI to 6.12
To: denis@denix.org
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 22:31:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18596

> > >@@ -10,3 +10,10 @@ UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
> > >  UBOOT_GIT_PROTOCOL = "https"
> > >  BRANCH = "v2025.04-Beagle"
> > >  SRCREV = "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> > >+
> > >+BRANCH:beagley-ai = "v2025.04-rc3-BeagleY-AI"

Ugh... this was a build test of Andrew's patchset!

> >
> > BeagleY-AI support is now in the latest upstream master. This branch here
> > is missing some updates for BeagleY-AI that can be found in master.
> >
> > Would it be better here to take the v2025.07-rc1-Beagle here which
> > includes both these additional BeagleY-AI patches and also PB2 support?
> > Maybe it should be the default then.
>
> I'd be fine switching to 2025.07 eventually, once it matures a bit - I'm not
> comfortable taking rc1 at this point.
>
> We can do this in stages - now update 6.1 -> 6.12 with 2025.04 in a seaprate
> branch, then update 2025.04 -> 2025.07 when it's ready (either final or at
> least rc3/rc4).

https://github.com/beagleboard/u-boot/tree/v2025.07-rc2-Beagle

Tested on 5 BeagleY-AI's, 3 running pcie nvme root's, 2 normal
microSD, v6.1.x-ti, v6.6.x-ti kernels.. (dropped in over the shipping
2023.xx u-boot)

TI_FIRMWARE="11.00.14"
TRUSTED_FIRMWARE="lts-v2.12.3"
OPTEE="4.6.0"
UBOOT="v2025.07-rc2-Beagle"

https://openbeagle.org/beagley-ai/u-boot-beagley-ai/-/blob/main/build_u-boot.sh?ref_type=heads

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

