Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B6BC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:10:24 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.464.1743531022271424849
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 11:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=RQ6ggXS9;
 spf=pass (domain: criticallink.com, ip: 209.85.167.47, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso6652084e87.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 01 Apr 2025 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1743531020; x=1744135820; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAQXwIeumlx7k/H5i8F2hGUsTnLMi0VvU7ly0/7EGtQ=;
        b=RQ6ggXS97mPj7T4S/pH3756R2ree62U1yYsPudGB6YtfkcB/agHh81pkMhEhQVtXRe
         4CocHYANYM0Y1bFdJB559TjZsY2rT+Oiq/uXwRaPRbExafGziNoz/H4oBLlEx4Ch0Ji4
         wY3IxTnE+nyldOlyG/HbbpJCtnmlxXj8b7xQ9C+QkWNCRoFENI3Eln5CjoeXfD17172E
         Y0k01jAtts3EaF/80YFRv4E1UFLM6S1bO187e9ZAl5VD2JHlYk3n+80stjmLAw7CIOji
         sd98TVglPi8BNG8DWAm068emglOgpb5QuSuOx/MtbDLmwkcOwpuKBm0RZX7HLHi5GVOa
         vQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531020; x=1744135820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAQXwIeumlx7k/H5i8F2hGUsTnLMi0VvU7ly0/7EGtQ=;
        b=Lkz8sL9iVw6RD400kajM5CVO4cN8gkblnfk7SIVW+S+j+FXPV24rW2+uUmJCs+bhIe
         jta6byWYa32sRk781YH+J2rS9WbWQ+zimcQfAUVvATpqogQAgy3LO/CSwFojU81bhid1
         i4ZpX7MM23HHCE3dHsEaekj/iXUSq6hRp2E4JF4/kNrN4Yi3B1McxTRinPFYKCCxkfsw
         HPD7LkNhdDJf+Cj1OxWfX9V1iL+fOSuTLCS9N30xXaNJkfzHpC8ii/rojXpmJREe2uCb
         JnoXBMI+NwY44UJnjyY7Yi9jDrVif6nAXybOsjTblEr1VzzkPmW54CO06D9A8UoYDmK/
         +35A==
X-Forwarded-Encrypted: i=1; AJvYcCWwbcP3ZCwC9ytVwGnM0o/KJK1H+bfpkMhBfO5WzJ94ceW4R7umvDXAYeJVGdPhWMf6Vwe+RNrH@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzzGBQfOKQO3Y4EaRwS4/8xVPCMYkjTThC6pjycewF8I+mkyFv5
	6EtcKdUSXrup+kjEoY+v4aDHvjdlafYq079rwEL76ErlcsW5O2Opzn1txBSeJiTOf3n5XwIrvC9
	HIwxndCnzqRxkZL1odpErr+OvI4C3nTmvqWXf
X-Gm-Gg: ASbGnctewlLaSqZ8E69/Xz8xGMJwm/VZmA/d5vU1ThxzYBAwJTvaNE7/PfR/2pr4hp4
	s5PEtzSjo2N2VQynnMuqQRq2wDti2FfnL3rTeoeUIbzmwjrcuJ57EnCJcpq+4jI9KITHDQVgllT
	Sz+gTP+qP3JbIxoB74nFPBgqX7
X-Google-Smtp-Source: AGHT+IGIcoc2M8DKFoS0ZvUhjXSFq2iTsZzbsaCweKxnsSV8J2aGQ5hedOSVdJfq0TcxI50CwGl8rfht8/Np/vBJFkg=
X-Received: by 2002:a05:6512:1326:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54b10dc8a18mr4684678e87.22.1743531020255; Tue, 01 Apr 2025
 11:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <8404.1743410272291654232@lists.yoctoproject.org>
 <16009.1743500207260580759@lists.yoctoproject.org> <D8VHW0FO7DYK.1QURC4QTQ4QRW@ti.com>
In-Reply-To: <D8VHW0FO7DYK.1QURC4QTQ4QRW@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 1 Apr 2025 14:10:08 -0400
X-Gm-Features: AQ5f1Jp_2tuPfjgkXZnWwISxTV53Tof8ewdZlPCzeGX0XcDxVfy_suA_20IMxpo
Message-ID: <CADL8D3YVBx+myquRxNm5h3yNnZcNnBgubT5VBbRAi6Gw7uLsdw@mail.gmail.com>
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed.
To: rs@ti.com
Cc: sebastian.krahl@lacon.de, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Apr 2025 18:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18444

On Tue, Apr 1, 2025 at 1:57=E2=80=AFPM Randolph Sapp via
lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
>
> On Tue Apr 1, 2025 at 4:36 AM CDT, Sebastian via lists.yoctoproject.org w=
rote:
> > I've applied the patch and it builds without any additional error.
> >
> > Thanks for that.
> >
> > But how to proceed? I'm not happy with the modification of an included =
layer...
If IT isn't going to update their meta-layer, if you have your own
layer, you can provide a duplicate recipe
ti-sgx-ddk-um_1.17.4948957.bb, and your patched version will be used
as long as your layer is a higher priority.
> >
> > Regards,
> >
> > Sebastian
>
> It's being picked up in newer branches. Unfortunately you'll have to wait=
 for a
> newer release as we typically don't backport patches.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18443): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18443
> Mute This Topic: https://lists.yoctoproject.org/mt/111937570/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

