Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.5842.1607347370896101222
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 05:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DpNMHgpS;
 spf=pass (domain: konsulko.com, ip: 209.85.167.172, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f172.google.com with SMTP id v85so4768164oia.6
        for <meta-ti@lists.yoctoproject.org>; Mon, 07 Dec 2020 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cKeuIUHZdU0jyEWmTOA7mAFbAxf8b+zx93ajl6Exld0=;
        b=DpNMHgpSjuicF35c/kzUV9Vu3K01KiPjBG03iZPWVaTwN5XoCN5o4HvYM1120j+O5W
         9wVlbgkRlJIqvXX1WdcDwUjxLRMjd2DZK8XvVZ16vPoqHaBC2iONf0RxWCG0iqGDEN7i
         4r+HN87t0mGMczR96WHn+xDFZ7PMwADaalFg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKeuIUHZdU0jyEWmTOA7mAFbAxf8b+zx93ajl6Exld0=;
        b=UoYuichtat3WQYcik8G/Y9IXlgolqqtOEGQGp7M6VgAJ1ha//vXw6qp5ByWAWv5+k0
         gErgLwg/QfAGt8TFY7Q//6/mKDqMXg8rwr6/a8bXnGSamqht3l2gIlfssDOnnZalCttT
         LbUI2zFISJr8Z2wlldeNgeGC7ty0Pgm5vvYpJ4K0hD/p+JMvRtvbc0l6dOxMwdv213pf
         J4af1p4n1Ce7oAcfbqllNPDLE91RX3aAq136Lv+itjGRKNTCtMFT/90BjbHUALEWrorT
         Ef3u7rtjORcA1Z92B+DAGvbaWjeM8V11w4xZMHeMCtru6cGKzZGRAXJY0gaiZqD+FJXO
         +76Q==
X-Gm-Message-State: AOAM531jQLM2yb0WeVNU2EaZdSZ3ZXV/6jQ7Gv+qD8y/27IVqhQDLWUC
	KvieGY6GlBKmvQMjU8ba6ref8i/8enrMQPNA/IuMyg==
X-Google-Smtp-Source: ABdhPJz5bis8L/0Wb3EDuquYzGrdUJAHc94SyDOAnvgJO7ybfBWJrylJ6oqMxRO/k8g2S6udyHouu+F1LdFgkqS3ml8=
X-Received: by 2002:aca:fd0d:: with SMTP id b13mr12255336oii.27.1607347370210;
 Mon, 07 Dec 2020 05:22:50 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
 <94da8736-0000-a797-8f20-f766feb1f1df@ti.com> <CAM9ZRVuurWq0BMbNbYbwq5r5JedNu1680LzjKQJ5C=6M40uCNw@mail.gmail.com>
In-Reply-To: <CAM9ZRVuurWq0BMbNbYbwq5r5JedNu1680LzjKQJ5C=6M40uCNw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 7 Dec 2020 13:22:40 +0000
Message-ID: <CAM9ZRVvpNM6H1Am+wHnmzKM-QJFJrJi0KrDezf+mDfjJNFo8Sw@mail.gmail.com>
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
To: Dan Murphy <dmurphy@ti.com>
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2020 at 18:27, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 17 Nov 2020 at 19:42, Dan Murphy <dmurphy@ti.com> wrote:
> >
> > Paul
> >
> > On 11/17/20 1:17 PM, Paul Barker wrote:
> >
> > Hey folks, apologies if this isn't the right place to ask but I can't
> > see where else I should be asking this question.
> >
> > The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
> > meta-ti. For our Arago builds I typically pin release versions of
> > these dependency layers, especially for meta-arago and meta-ti I want
> > to ensure that we're using known good versions. The tag we're
> > currently pinned to is 07.00.00.005 which I believe corresponds to a
> > TI CoreSDK release. I see there are some new tags in these layers and
> > in the ti-linux-kernel repository
> >
> > I also see that configs have been added to the oe-layersetup
> > repository which is usually my flag that something has been released.
> > However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
> > given config files while the meta-arago layer, meta-ti layer and
> > ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
> > are a bit confused.
> >
> > I've tried searching for "ti coresdk" in google but I can't find any
> > documentation for this. I've also tried looking at the Arago wiki but
> > this does not look to have been updated recently. The only list of
> > branches I can find is
> > http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> > which is definitely obsolete.
> >
> > So all I can do is ask the question then - how do I find out when a
> > release of Arago (or TI CoreSDK) is ready to pick up and use?
> >
> > This is on my to do for next year to try to document expected release dates.
> >
> > To pre-empt the obvious question - we do test with the HEAD of the
> > dunfell branch of layers regularly but we're not happy to issue a
> > release of our own BSP without ensuring we're aligned on released
> > versions of the underlying layers where possible. We need to track the
> > releases in the ti-linux-kernel layer as we've seen in the past that
> > our kernel needs to match with the expectations of the meta-ti layer
> > if we want the PowerVR drivers to work.
> >
> > Sorry for all the confusion. I created those additional configs for our internal SDK consumers.
> >
> > The official release will be 07.01.00.006 and I will be pushing that config shortly.
>
> Hi Dan,
>
> I see that there is now a config file in the oe-layersetup repository
> for v07.01.00.006.
>
> Is there any way I can tell if there will be a further pre-release
> here (e.g. 07.01.00.007) or if this is the "final" 07.01.00 release
> and ready for downstream users to pick up?
>
> Some reference for how CoreSDK is released would be really helpful but
> I can't find any such info online - I don't really need expected
> release dates, I just need to know how I can determine if something is
> "released" or not.

Hi Dan, just a quick ping on this. I'd like to get our BSP updated for
AGL and Arago support but I'm waiting on confirmation that
meta-ti/meta-arago are released. A link to some process documentation
or even just a "yes this is released" or "no, there will be an
07.01.00.007 tag coming" would be great.

Thanks,

-- 
Paul Barker
Konsulko Group
