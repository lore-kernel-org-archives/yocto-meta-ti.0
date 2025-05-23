Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF4C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 22:32:50 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.1220.1748039562359132693
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 15:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=boylO0eT;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: robertcnelson@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7b811be6dbso314734276.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748039561; x=1748644361; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaodDphZM1kpa/K2ImTsdutWD745zNk3mcY8nW0WM+E=;
        b=boylO0eTHC3HIcPJNFexMrDddpP8IKusRsjH7sCPhBsS6uNTSkx8p2szDS86sFyUhm
         DgbnutpGQlhKcBh0fA02bdNxlXm3DJJ9+PEieDt71KhGrALCJGr9bc6TVWCONAn8QIHf
         j48mv0AZnjrA3puV1gCKypho+wLnmaqk6ajKgSnmVmXehbVyOSIviQvvZmlMcN50mGaT
         Xmaybh7psDlmkuZrJkfzrMUp0f8yqEJMqJRb+1VxlSQi8tJitjQSsA2fPIH6ESsv1+mN
         SfNlG+c3/L3yqSrd7deM+I8mGvDmZdcoXCcTazMN6WrJYO4CAIlPdOaBRqcBq6rUqVmI
         9b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748039561; x=1748644361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaodDphZM1kpa/K2ImTsdutWD745zNk3mcY8nW0WM+E=;
        b=jvs/WDDmxa5UIcvJxKCpubCsbSCvcCopnlHu/hPRlaImojnzvPUZo5319Wz0PFOOt9
         NWfs7UJ69aglhVc7sQlyORD0dO3UVU8LUCESp/eFY77PS5uCk2UjYw05+vm5zexkQGha
         fBOwDu3+nsQvJr5AdURpLgEF5uAQ7G3iOS5DevH6Cf1UUCRyGV6uCxYnuLd1UqnBHnlQ
         xZEz2PzX+6ELTLo7pLn3FhLGDCCJ83F6D6SR86qUQJ3UI31I86c5BHlY1cbj5vOMP9Ey
         +sKfpqtRQRu8KAAOrTIQ9T4hEtij7WpZfaRfQOL3bz4+Ei909jN1KO3lem6KKsEM92US
         H4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxnlbJ7BF/nmZXlygqJ/V0hzb1x1+5qfo9n5bW+Uyw9v3Yys1SnGgg/PXxUQa9h4SoGX6w/+G@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyWJdifWeNSf2X8cRTt1TKklnPrf0E2zXo/yrHssMFBdfQNGmSp
	1QFzqKk9fMNHvefxsFIHGPuPklmc8h83K3c3VGdnbnteGRBTVjPjKoh6soIVpVlWBNLYZA8rXT1
	wcfihscIQmExh/S0RGFNqH1zETBCXaeM=
X-Gm-Gg: ASbGncuSSweTu/MougEI4SSarLYsawd7j0BMLxQxNj5WEOF9OY8NMeMTHoT68bTGuDa
	w4zTNvWF4WSPNPYy+6tIe1LjN3bnYSATiYv8bgYbqPoGl6b4mEk3TAvyyBnP5Tz7Tiz6TL/jj+R
	R8WobYsV7HyFQDMDVyWrf8lcu7quZTenijFA==
X-Google-Smtp-Source: AGHT+IFNSaFT/Fd+GfHkix18XQquWj2fDKz9visiIlH6A2pHDDONd7SvXO6HPkz70eaWtHd+F4yB7st+lyI2thgaJAw=
X-Received: by 2002:a05:6902:114a:b0:e7d:5acf:5f7d with SMTP id
 3f1490d57ef6-e7d91a048camr1446217276.22.1748039561374; Fri, 23 May 2025
 15:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250517005430.3648211-1-denis@denix.org> <20250517005430.3648211-5-denis@denix.org>
 <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com> <20250519175202.GZ18383@denix.org>
 <CAOCHtYhAwQ=NXkgYzgTcCZnPjOzXcWPn3LBA6u4f1WAfGvbExg@mail.gmail.com>
In-Reply-To: <CAOCHtYhAwQ=NXkgYzgTcCZnPjOzXcWPn3LBA6u4f1WAfGvbExg@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 23 May 2025 17:32:14 -0500
X-Gm-Features: AX0GCFs7YUxlJ4c7dKpmKfe98ZCwJEvwSmBKW3HN7_FMSijH5unyP4YqOj1NwpI
Message-ID: <CAOCHtYg2Vr0USbPbT9tryNw7-Qr0QjOHeYBsbPt=jtuE4-c3+g@mail.gmail.com>
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI to 6.12
To: denis@denix.org
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 22:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18597

On Fri, May 23, 2025 at 5:30=E2=80=AFPM Robert Nelson <robertcnelson@gmail.=
com> wrote:
>
> > > >@@ -10,3 +10,10 @@ UBOOT_GIT_URI =3D "git://github.com/beagleboard/u=
-boot.git"
> > > >  UBOOT_GIT_PROTOCOL =3D "https"
> > > >  BRANCH =3D "v2025.04-Beagle"
> > > >  SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> > > >+
> > > >+BRANCH:beagley-ai =3D "v2025.04-rc3-BeagleY-AI"
>
> Ugh... this was a build test of Andrew's patchset!
>
> > >
> > > BeagleY-AI support is now in the latest upstream master. This branch =
here
> > > is missing some updates for BeagleY-AI that can be found in master.
> > >
> > > Would it be better here to take the v2025.07-rc1-Beagle here which
> > > includes both these additional BeagleY-AI patches and also PB2 suppor=
t?
> > > Maybe it should be the default then.
> >
> > I'd be fine switching to 2025.07 eventually, once it matures a bit - I'=
m not
> > comfortable taking rc1 at this point.
> >
> > We can do this in stages - now update 6.1 -> 6.12 with 2025.04 in a sea=
prate
> > branch, then update 2025.04 -> 2025.07 when it's ready (either final or=
 at
> > least rc3/rc4).
>
> https://github.com/beagleboard/u-boot/tree/v2025.07-rc2-Beagle

I also tested on 2 BeaglePlay's and 2 BBAI-64's.. so i've moved
BeagleY-AI, BeaglePlay and BBAI-64 to v2025.07-rc2..

I'll hack on PB2 over the weekend, that's going to take more of a
cleanup for am6232- -> am62 changes..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

