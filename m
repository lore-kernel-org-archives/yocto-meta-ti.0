Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5AFC71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 10:49:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.10699.1692960542715102855
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 03:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=G45lL4Rv;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fef4b063a7so7015645e9.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692960541; x=1693565341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEahcyGWO6ytehJ44E8VOpyyEuOY+8Mf/fhyV8mOliA=;
        b=G45lL4RvwntgZ3JUNOg7uskWRvqoRjiLJbMbEzmiF4+8woAf8V/9j+1O0VdW2yDIId
         Ry1QAn/cX2dF9z2dkA8hBa8e9L1YNMBnGv/LMNhxKTRP7BsrtCZLdrXSlgxutI/47L0Z
         UqRkA4EnGwAQAe+XjUbaNrPodJKfyyaAAPJ7y39g3K0DVmQH15Vk2IcihidkPECypmTQ
         Zh+Z1iVLYzNpTWAP0kUbgVrpqkuSctvD51Cl1eDSGMo1CH7WSzxLDdt3SBMRHwcmBxws
         iM7tfhAjIDJabLNHswf98+pbtGqp50Dsh4tPDVcOUR2Wdh6Uv3U9uvW8SI75hUnkDfIH
         iAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692960541; x=1693565341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEahcyGWO6ytehJ44E8VOpyyEuOY+8Mf/fhyV8mOliA=;
        b=G7B+dE1tyf0YNehZOsXm+gHFnyKaw8zc0d9eUKPJ3hMgqYl1yUKn6/oporZ7j0+syP
         NSYIzn/Ll+kPpt/K9W/2reMYNJnnvpb2BwYqP4MK56wuhRFk89qrHAYJuGcazFChV4wf
         kB5UDhWAfqNhLytyMCgfjJ9szrJTw9YtnCOemJvfpij606fAcX28imnMTVwwSmcv0NnU
         E2fP4hBw6r8C3X8vUR3Q8wjeNDPZAnQZzS9blfWiRmKOBwYAVVX9EfBZshx3v1clicbR
         UvFxwWIPn/LvmLfmAiCQlmXkwirYM1E3qfcHK7cqAsGtKgSR55P8iEv+LfNtpQYIAMWS
         Q4pw==
X-Gm-Message-State: AOJu0Ywl4px9hX0oPokZ5PiiMlZen4RIoOBPoHIpeVIh+HlhVH6ZOSM5
	kD6hWZTHpVUmzOJfc7Jf+S3FqFHzI8euqjLp2w8=
X-Google-Smtp-Source: AGHT+IG8qykqilrs6XLH8ohKbi/MJkFwQC1aR7dka4fj9WxKC6Eq8doY1MQhGtgN3QISf8OBlINo+0G6cGh7s+MMxtk=
X-Received: by 2002:a5d:6ac8:0:b0:30e:3caa:971b with SMTP id
 u8-20020a5d6ac8000000b0030e3caa971bmr14024743wrw.51.1692960540644; Fri, 25
 Aug 2023 03:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230824140848.1981957-1-max.oss.09@gmail.com> <41e1e94c-6efd-0663-129d-b61d682c0f50@ti.com>
In-Reply-To: <41e1e94c-6efd-0663-129d-b61d682c0f50@ti.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 25 Aug 2023 12:48:49 +0200
Message-ID: <CAEHkU3WxuXzT0GPt_Vm2wK71MfhYBdB+tWgTvSpp-LutXcxaoQ@mail.gmail.com>
Subject: Re: [meta-ti] Setting SERIAL_CONSOLES in machine.conf rather than SoC includes
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, max.krummenacher@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 10:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16892

Hello Andrew

On Thu, Aug 24, 2023 at 4:29=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 8/24/23 9:08 AM, Max Krummenacher wrote:
> > Hi
> >
> > The following two commits do set SERIAL_CONSOLES and
> > SERIAL_CONSOLES_CHECK in the the SoC specific am62xx.inc and k3.inc.
> >
> > With SysVinit this does spawn a getty on each tty which is specified
> > in the variables which also appears in /proc/consoles on the running
> > system.
> >
> > 31eb1aa2 ("recipes-ti: Add recipe and patches for jailhouse support for=
 am62xx")
> > bc894bf5 /"conf: machine: Set common default SERIAL_CONSOLES for all K3=
")
> >
> > Adding whatever tty comes to mind doesn't hurt in a SysVinit system,
> > however when configuring OE to use systemd as the init system a
> > getty is spawned unconditionally on each listed tty in
> > SERIAL_CONSOLES, SERIAL_CONSOLES_CHECK is ignored.
>
> The fix for this we did up in meta-arago using Systemd's getty-generator =
[0]
> which spawns getty only on valid consoles and ignores SERIAL_CONSOLES.
> SERIAL_CONSOLES is left here only for SysVinit systems.
>
> I'm guessing you are not using meta-arago (which is fine, ideally meta-ti
> should be all you need). In that case, we should find a way to move this
> systemd PACKAGECONFIG option setting into meta-ti.

Thanks for the reply.
Yes, we are not using meta-arago.
I wasn't aware that you can make a systemd behaving the same as SysVinit
in regard to SERIAL_CONSOLES and spawning a getty.
For us the way forward will be to add the PACKAGECONFIG to our distro
and be done with. I currently don't see any drawbacks for any of our other
machines.

Regards
Max

>
> Andrew
>
> [0] https://lists.yoctoproject.org/g/meta-arago/message/14632
>
> >
> > In the light of this, shouldn't bc894bf5 be reverted, i.e. the
> > setting of SERIAL_CONSOLES done in the <machine>.conf file and
> > 31eb1aa2 have a follow up to move the change to SERIAL_CONSOLES?
> > This would help people which do use systemd and include am62xx
> > and/or k3 in there <machine>.conf file to not having a getty
> > on an arbitrary tty.
> >
> > Any thoughts?
> >
> > Regards
> > Max
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#16889): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16889
> > Mute This Topic: https://lists.yoctoproject.org/mt/100935821/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

