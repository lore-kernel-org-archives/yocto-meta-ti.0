Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.14240.1605645448941009764
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 12:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qWmk8Jht;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id g19so20756477otp.13
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2020 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XCv5tdMvxygMRWBDAFPI+IAOQePQGSkT4vhhueV2Oks=;
        b=qWmk8JhtUwCcjSWQ1T9u42C2KzQuHVE1IIQ7PNugzUWjk54DyByp0GOBIBiago5+el
         7eSGbrX7iF35LgFzak/FOYMAoCbOQGDdgNAb71RsOkuxoH1tdFi2yQCgZ8IohYvVojNs
         wofTTUdwOPHSyLRFxR4FAGmMTB+00cKRQaQzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XCv5tdMvxygMRWBDAFPI+IAOQePQGSkT4vhhueV2Oks=;
        b=RPeYCgk52ZuR3KknIg2K6xFvF8evdhkabQBe6ITNkzhSPFctxovvwOqdsn1F6FaKVF
         WnU5h2rAftajDknxPNtcZin7BWrKWiHg1opgBhGiNeg1e5X7thYQK0ptX/ua0tI2iSWW
         4X6LA3Zk+IM4Fg2UlEO4Uvt5Di3A3T2RC6r1dYnSZncBWmLUmV5wmXHs5cRkcySrClSB
         OPB+4zR92nsuaxggjosVYMY6460J0Jx7PUW3UH71BEEEM20CU7w3tb1rvh4M8AZYMOOv
         vqMRXe9GKPqIP/86PeyRDFWCEqL/hfiYcsaBNt4mx/dBWBb0GONKJaOuTo6In4H49ONX
         WJzA==
X-Gm-Message-State: AOAM5312DmzAP3KFhccMUHcp/XdaNUXdzrhh7Q0K2WYdYzOKHq3qaVi7
	D3GvqvF/ANIlXqMYkFaNTUcqKIxRwKCy9plkN/u0Rw==
X-Google-Smtp-Source: ABdhPJy3+PUIIHvt1jc0sp/j1PtFbCvefx+OFILiiy0xZs9o+G/LLZviWhLsdkAZD0Wa3kWli8P4HA4AFyXMm2X7R08=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr3929049otc.305.1605645448269;
 Tue, 17 Nov 2020 12:37:28 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
 <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
In-Reply-To: <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 17 Nov 2020 20:37:18 +0000
Message-ID: <CAM9ZRVutG13oRD78iUsdJWZPmfqDJQ+4a6CXQ7ruG0B_s+PTDw@mail.gmail.com>
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
To: Dan Murphy <dmurphy@ti.com>
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2020 at 19:42, Dan Murphy <dmurphy@ti.com> wrote:
> Paul
>
> On 11/17/20 1:17 PM, Paul Barker wrote:
>> Hey folks, apologies if this isn't the right place to ask but I can't
>> see where else I should be asking this question.
>>
>> The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
>> meta-ti. For our Arago builds I typically pin release versions of
>> these dependency layers, especially for meta-arago and meta-ti I want
>> to ensure that we're using known good versions. The tag we're
>> currently pinned to is 07.00.00.005 which I believe corresponds to a
>> TI CoreSDK release. I see there are some new tags in these layers and
>> in the ti-linux-kernel repository
>>
>> I also see that configs have been added to the oe-layersetup
>> repository which is usually my flag that something has been released.
>> However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
>> given config files while the meta-arago layer, meta-ti layer and
>> ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
>> are a bit confused.
>>
>> I've tried searching for "ti coresdk" in google but I can't find any
>> documentation for this. I've also tried looking at the Arago wiki but
>> this does not look to have been updated recently. The only list of
>> branches I can find is
>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>> which is definitely obsolete.
>>
>> So all I can do is ask the question then - how do I find out when a
>> release of Arago (or TI CoreSDK) is ready to pick up and use?
> This is on my to do for next year to try to document expected release dates.
>>
>> To pre-empt the obvious question - we do test with the HEAD of the
>> dunfell branch of layers regularly but we're not happy to issue a
>> release of our own BSP without ensuring we're aligned on released
>> versions of the underlying layers where possible. We need to track the
>> releases in the ti-linux-kernel layer as we've seen in the past that
>> our kernel needs to match with the expectations of the meta-ti layer
>> if we want the PowerVR drivers to work.
>
> Sorry for all the confusion. I created those additional configs for our
> internal SDK consumers.
>
> The official release will be 07.01.00.006 and I will be pushing that
> config shortly.
>
> Yes I understand the issue with the PVR modules and kernel dependencies.
>
> Dan

Hi Dan,

Thanks for the quick reply there.

From my point-of-view what would be really helpful is release
announcement emails to the list when the release is "final" so that we
can easily tell that, for example in this case, 07.01.00.006 is the
release proper.

Thanks,

-- 
Paul Barker
Konsulko Group
