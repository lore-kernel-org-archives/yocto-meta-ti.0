Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.1028.1606242486569289777
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 10:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Msii+jip;
 spf=pass (domain: konsulko.com, ip: 209.85.167.169, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f169.google.com with SMTP id v202so21679220oia.9
        for <meta-ti@lists.yoctoproject.org>; Tue, 24 Nov 2020 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mMDIdWg2w7x9yanpxRmCfz00R819tE3/o3G+G0vpXuc=;
        b=Msii+jipXHl01RgMlSE6Rde3RpttuSrpYFfLvFW9/u4nfWiDypHX3ivDTXYG1mxDSm
         7w2A0KcKbgxHBqORWYatJg4JyYrrfk8MSfi7M1zNlR0vQ0EE1KCLy833HEP+Gr+Uspl2
         y5ej7TEu97OX4jTo0buWMtIVPdIxKYzCVpw9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMDIdWg2w7x9yanpxRmCfz00R819tE3/o3G+G0vpXuc=;
        b=U5u4dHJYuwL96dMx1WEfFjdL6ZHYeyZU4Q0JA3TMIc2nUorLtYLJea9hlJmKmfgPyG
         pcXkICfJgOrwsE3n8VJgetCZFZuLo8jRxKFL16A0IXZha0/2N6saiLVK//5N+avvbhS9
         ucW2FIKDoFHXoIF207pO6CI5uJeiDmIxE3zOPWi7/1IfqWBQqsXmintYd80lPAjbSGQZ
         i49jSzej+ewHeKy4Lzal3pjV+6/CNFcShHdeCMXBaGF5p2WFnqqdXCd5SpM568cceCGw
         ir55fUh/sfz6kFaifwsy/IwF/QFNxMJ6+6HIX/Vww4XzMXz/29lUHsyS4getZHKuVYyo
         8GFA==
X-Gm-Message-State: AOAM5320fV4MbqLw1F1iDZm4Ks5mrfelGFL+qF7JYKRb+YtbO9foODHU
	OMhQ0l/2S0ORGTePeUu1+dQhAoO1wPuwa8vaJjPcww==
X-Google-Smtp-Source: ABdhPJxA+3FocwFiLH3s4QB850kUZyZKwXtWhdCt3SAjvohTUeBdRqUqFItFVv6Eu5ixeRRm02PGsLuZCy6y1A/MZuQ=
X-Received: by 2002:aca:ebce:: with SMTP id j197mr3439225oih.6.1606242485867;
 Tue, 24 Nov 2020 10:28:05 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
 <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
In-Reply-To: <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 24 Nov 2020 18:27:54 +0000
Message-ID: <CAM9ZRVuurWq0BMbNbYbwq5r5JedNu1680LzjKQJ5C=6M40uCNw@mail.gmail.com>
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
To: Dan Murphy <dmurphy@ti.com>
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2020 at 19:42, Dan Murphy <dmurphy@ti.com> wrote:
>
> Paul
>
> On 11/17/20 1:17 PM, Paul Barker wrote:
>
> Hey folks, apologies if this isn't the right place to ask but I can't
> see where else I should be asking this question.
>
> The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
> meta-ti. For our Arago builds I typically pin release versions of
> these dependency layers, especially for meta-arago and meta-ti I want
> to ensure that we're using known good versions. The tag we're
> currently pinned to is 07.00.00.005 which I believe corresponds to a
> TI CoreSDK release. I see there are some new tags in these layers and
> in the ti-linux-kernel repository
>
> I also see that configs have been added to the oe-layersetup
> repository which is usually my flag that something has been released.
> However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
> given config files while the meta-arago layer, meta-ti layer and
> ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
> are a bit confused.
>
> I've tried searching for "ti coresdk" in google but I can't find any
> documentation for this. I've also tried looking at the Arago wiki but
> this does not look to have been updated recently. The only list of
> branches I can find is
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> which is definitely obsolete.
>
> So all I can do is ask the question then - how do I find out when a
> release of Arago (or TI CoreSDK) is ready to pick up and use?
>
> This is on my to do for next year to try to document expected release dates.
>
> To pre-empt the obvious question - we do test with the HEAD of the
> dunfell branch of layers regularly but we're not happy to issue a
> release of our own BSP without ensuring we're aligned on released
> versions of the underlying layers where possible. We need to track the
> releases in the ti-linux-kernel layer as we've seen in the past that
> our kernel needs to match with the expectations of the meta-ti layer
> if we want the PowerVR drivers to work.
>
> Sorry for all the confusion. I created those additional configs for our internal SDK consumers.
>
> The official release will be 07.01.00.006 and I will be pushing that config shortly.

Hi Dan,

I see that there is now a config file in the oe-layersetup repository
for v07.01.00.006.

Is there any way I can tell if there will be a further pre-release
here (e.g. 07.01.00.007) or if this is the "final" 07.01.00 release
and ready for downstream users to pick up?

Some reference for how CoreSDK is released would be really helpful but
I can't find any such info online - I don't really need expected
release dates, I just need to know how I can determine if something is
"released" or not.

Thanks,

-- 
Paul Barker
Konsulko Group
