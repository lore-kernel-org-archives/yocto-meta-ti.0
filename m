Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2732.1578692124944598426
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 13:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=B9XfO2Bx;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.47, mailfrom: troth@openavr.org)
Received: by mail-wm1-f47.google.com with SMTP id d73so3511842wmd.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2020 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bqZjneapwtOLd8HFi2WiJGmB1N8urd5b+reV7XsULA=;
        b=B9XfO2BxCNA1L7XciERmeTjAH1WJgQ0JAA+Pj8nFqEKTqkSMlLCYo9x7h9dCZNVY0x
         AMQr+rzMnW7IBg4inCh3tk+R+qpi7j0ULWNJdiRgYjVuX077C3whmKzZ8S9uKSEZkT7k
         J5ZtM8RXkL8xP8cKlOBD90zugWWBP1ubmCVebToAeC48khioAG3z1JoYmzbQDdjaGnnO
         LOMZqCRNHPkvqxLFWS3kRamLBgabPPB9sjDtz5wEcZ95BPiqoouWwXfST6QJsiVs7XXO
         1zP2lk10Ee9wp3vNW+OAHl6Uq1t03aNbjSAqFV+cNxqXnmHgzxVgOgO44pFVcFTTxb37
         5hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bqZjneapwtOLd8HFi2WiJGmB1N8urd5b+reV7XsULA=;
        b=fhjptALV2kIjoNqM+uoSmfoXLHx8FPB6ET3cyx48H6CbW1fnZqIQbaiLxtQ7K50iDk
         5zY6x5bS97p1yxgjazY+7B7TCHAeqGyH/CFQFDlGqze+QMhztJSw+MHHwZqEoaN3KofU
         CF918+DkJPc3ydW+sYv1WaG4rOk3McyeFcsB3iLq9a3mvKylL2gbF+coXZ6sWpiZ4eSV
         P2HGs5EFOqNQNgEO9u5+5DTj51wHNM6eE3muS1CWym6L8TyGOpC7Ij08qteYd9l/JsF8
         ydXEJdFqT0B9vHFUv/lKnpG1ZAYJrCuxtx+7LJBEWep8AVuUNCMnyEKHVTbEdQD9ioAH
         Abjg==
X-Gm-Message-State: APjAAAV4dBcTioVmudRk9IDVdmTtsQrpxHK9DE1FUvnF1DGjX+4WLLCq
	PksW7mKObpjPfFkDl4T67VTTUA80MALtYfJAWbdAlg==
X-Google-Smtp-Source: APXvYqxpLvpv5fC/UjlJn8hS01duQkMSd9B+XBETg+oUe8Z0HiwIoGUZRiPQV8D4vLGmv9Du/KNRkc4N5m/H0BZHrF0=
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr6013380wmg.176.1578692123424;
 Fri, 10 Jan 2020 13:35:23 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt15f3nbMMACAHmQCKgQU-hKoP8UwH22AXxj9QprBTY5nA@mail.gmail.com>
 <35bde3f7-3d78-4910-a6d7-40ddec6b01f7@ti.com>
In-Reply-To: <35bde3f7-3d78-4910-a6d7-40ddec6b01f7@ti.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Fri, 10 Jan 2020 14:35:12 -0700
Message-ID: <CAFMvBt2_TZd4Xid-nJxNYkp_OThisAFJFGfwT7Y5NqE4qU06Kg@mail.gmail.com>
Subject: Re: [meta-ti] issues with fetching git repos from git.ti.com
To: William Mills <wmills@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 10, 2020 at 2:15 PM William Mills <wmills@ti.com> wrote:
>
> Hi Ted
>
> On 1/10/20 3:38 PM, Theodore A. Roth wrote:
> > We're using the meta-ti layer in our yocto builds and all this week
> > we've been having accessibility issues when fetching the u-boot and
> > linux kernel git repos from git.ti.com. Seeing these errors:
> >
> >     fatal: unable to connect to git.ti.com:
> >     git.ti.com[0: 198.47.28.208]: errno=Connection timed out
> >
> > Seems to be worse in our New Zealand offices than in the Colorado US
> > offices, but not having much luck today in the US.
> >
>
> Thanks for the issue report.
> I have fwd your message to the internal team that runs that server.
>
> I tried git protocol from inside the TI network, from Maryland
> residential connection, and from the Virgina AWS data center and all
> worked OK. (I only tried once each not 10's of times.)
>
> Could it be a DNS issue local to your company?

I don't think so since I'm currently testing from home (outside of
company network
via Comcast ISP) and seeing the same issues.

> Anything else that might be common to Colorado and New Zealand?

Nothing that I can think of.

One difference we looked into is that the NZ site blocks port 9418,
but are using a
git proxy to work around that. SInce I'm seeing the same problem in
the US on corp
network and my home network (neither network is blocking 9418 port), I
don't think
the proxy is the problem.

Also, in my testing, the problem seems to manifest more often when using bitbake
to fetch the repo versus just running a git clone from the command
line directly.

>
> > We tried to set `UBOOT_GIT_PROTOCOL` to `https` in our bbappend files,
> > which helped initially, but isn't helping much today.
> >
> > Is there a mirror we can use until this server accessibility improves?
> >
>
> I don't know of any (full) public mirror of the kernel and u-boot repos.
>

Ok, thanks for the info and for passing this on.

Ted Roth
