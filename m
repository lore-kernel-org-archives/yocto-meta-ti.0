Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BA4C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 05:15:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15841.1703222094900190986
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 21:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=On/6KRb3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: bremenpl@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d490a1936so188835e9.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 21:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703222093; x=1703826893; darn=lists.yoctoproject.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iH0PzZCdlNpPA3jha138ETyuaqbOHYTl/J6+G4jW1MI=;
        b=On/6KRb3xg0qY9+kaEVyW4fcjKuwLVjIrIkHM5+NgJkiPfi6kZT2uH5Hk5vQFLTz2O
         nlzBBnzIBDamRf2DHdYCVqEYNa03y0pkOrSb+zl/Tj7TnXk7rsfyFDseNVCzS2nyFik7
         Mz08ishn1110Ks+5e7yBv65BtsyWJ3nQazMaB2gfSRDKnc7ByFtc1tSX5HJy8sftK4O6
         bk28YaWwIucoxgOrg68SnuEFb3HCHDEhmrHvDIff/FbRLCoGDdhbUpaMheTTZDQRN4yr
         WUNcQW79yZAJZpM4CFyk26N7zzxqIhgUQkwNCa6k0jYD4ijcEz1RVKNF0pgznLD4Hn8P
         prBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703222093; x=1703826893;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH0PzZCdlNpPA3jha138ETyuaqbOHYTl/J6+G4jW1MI=;
        b=pDY5KAtNtV5BXEtFgQ46fED0WZRXngR+abJBGKtJaa9QMv02m0303csrb1pIMXWnrI
         na3E82V52AkdLElx8A4IBii6TAA/EvFJNoYqhPUNQCLV31qbfIWjWnIkwNkBCvVR6l/8
         05nHz49Q/44Kxolb8bb3n7s0wXYl6le6cFu6xVX5/97g7bmP25XHawLTo9WrHzWT+DJX
         k3qJ8FoPwbdgAaYBLUp8ug+6DbVQA+HjWeUdhfI7Uu3pX7VoyFKlPDOaPA1dM8rOhv1J
         bHK2ppetafZdmlR9spZ3X2K1BqiOPHhW2eb4f+itkKmuHdrIkq7CPTkAnp2K8ciGP7ak
         P5DQ==
X-Gm-Message-State: AOJu0YwjalSOkVI5VtpZe7xYc/4xKFsLwbxa1tktUxl0FIKscZ+b2QCt
	5QK4RiGlEc5lAdkSfYS1QTE=
X-Google-Smtp-Source: AGHT+IHSbyb6qn99QoOK+xilaDLKdjIzgFOwvs0ft0EMQcgKmpTDuYNWZBhf+6DV/elP1X6OwacfJA==
X-Received: by 2002:a05:600c:4fcb:b0:40b:305c:9ce8 with SMTP id o11-20020a05600c4fcb00b0040b305c9ce8mr217669wmq.28.1703222092933;
        Thu, 21 Dec 2023 21:14:52 -0800 (PST)
Received: from [192.168.7.5] (eqj153.neoplus.adsl.tpnet.pl. [83.20.77.153])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c4f0700b0040c1d2c6331sm5585759wmq.32.2023.12.21.21.14.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Dec 2023 21:14:52 -0800 (PST)
From: Bremenpl <bremenpl@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Jon Cormier <jcormier@criticallink.com>, <meta-ti@lists.yoctoproject.org>
Date: Fri, 22 Dec 2023 06:14:51 +0100
Message-ID: <18c8ff29cf8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <20231222014935.GM11745@denix.org>
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
 <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
 <emfb88b8f2-4501-4fef-8010-1618c71d24e1@ffb2c130.com>
 <20231222014935.GM11745@denix.org>
User-Agent: AquaMail/1.49.0 (build: 104900403)
Subject: Re: [meta-ti] Custom device tree overlay for BBB
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18c8ff2a07963ac284ed2e4f77"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Dec 2023 05:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17369

This is a multi-part message in MIME format.
--18c8ff2a07963ac284ed2e4f77
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Denys,
Should be easy enough to test it quickly as a proof of concept, thank you. 
Will bitbake know to compile this overlay, tell the u-boot to load it and 
so on?

On December 22, 2023 02:49:39 Denys Dmytriyenko <denis@denix.org> wrote:

> You could simply add your overlay in one of the conf files, such as
> local.conf:
>
> KERNEL_DEVICETREE += "your-overlay.dtbo"
>
> Check the existing machine conf files for examples.
>
>
> On Thu, Dec 21, 2023 at 08:51:49PM +0000, Lukasz Przenioslo wrote:
>> Hi Jon,
>> I guess the first option is more feasible, as I would not like to
>> modify any files provided by the Poky repo, but rather create my own
>> recipe that would somehow cover the default settings during the
>> build. There is still a lot ahead for me to understand though...
>>
>> Thank you for the useful links.
>>
>> --
>> Łukasz Przeniosło
>>
>>
>> ------ Original Message ------
>> From "Jon Cormier" <jcormier@criticallink.com>
>> To "Bremenpl" <bremenpl@gmail.com>
>> Cc meta-ti@lists.yoctoproject.org
>> Date 2023-12-21 16:17:38
>> Subject Re: [meta-ti] Custom device tree overlay for BBB
>>
>> >This solution seems like a good place to start. I haven't tried it
>> >myself but it looks clean and easy to implement.
>> >https://stackoverflow.com/a/68650774
>> >
>> >The alternative would be to bbappend the kernel and patch your
>> >overlay into the correct folder.
>> >https://stackoverflow.com/a/39343720
>> >
>> >On Thu, Dec 21, 2023 at 10:03 AM Bremenpl <bremenpl@gmail.com> wrote:
>> >>Hi and thank you for the answer Jonathan!
>> >>
>> >>Do you happen to also know a good reference on how to
>> >>incorporate an overlay into the yocto build?
>> >>
>> >>On December 21, 2023 15:58:56 Jon Cormier
>> >><jcormier@criticallink.com> wrote:
>> >>
>> >>>Here is a possible example overlay that configures pinmuxes
>> >>>with the expectation that the pru's will use them.  There is
>> >>>likely a similar example in that long list of overlays that
>> >>>disables hdmi.
>> >>>
>> >>>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
>> >>>
>> >>>Note its entirely possible these examples won't build or apply
>> >>>correctly on a different kernel version, but they should still
>> >>>be a decent starting point.
>> >>>
>> >>>On Thu, Dec 21, 2023 at 6:34 AM Lukasz Przenioslo
>> >>><bremenpl@gmail.com> wrote:
>> >>>>Hello there,
>> >>>>
>> >>>>I was able to compile the Poky image (Dunfell) with meta-ti
>> >>>>included for the BBB. I am working on an open source project
>> >>>>intended for home automation based on the BBB:
>> >>>>https://github.com/Beaglenode/BeagleNodeHW
>> >>>>
>> >>>>The next step I am trying to make is to prepare a proper
>> >>>>device tree overlay that would align with the HW
>> >>>>requirements of this project (or "cape"). I need to:
>> >>>>- Disable the HDMI pins,
>> >>>>- configure multiple pins as either PRU0 or PRU1 controlled.
>> >>>>
>> >>>>For that I thought the best approach would be to prepare a
>> >>>>DTO, instead of modifying the default one for BBB. I don't
>> >>>>know how to prepare that DTO yet and I don't know how to
>> >>>>include it in my build. I would like to ask for some help in
>> >>>>this manner, especially the prior part (how to load the
>> >>>>custom DTO). Right now I am still modifying everything in
>> >>>>the local.conf, as I do not have the knowledge yet to build
>> >>>>my own distro for this device (that's the end plan).
>> >>>>
>> >>>>I would appreciate all help!
>> >>>>
>> >>>>


--18c8ff2a07963ac284ed2e4f77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi Denys,</div><div dir=3D"auto">Should be easy enough to=
 test it quickly as a proof of concept, thank you. Will bitbake know to com=
pile this overlay, tell the u-boot to load it and so on?</div><div dir=3D'a=
uto'><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<div dir=3D"auto">On December 22, 2023 02:49:39 Denys Dmytriyenko &lt;denis=
@denix.org&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">You could simply add your overlay in one of the conf file=
s, such as&nbsp;</div>
<div dir=3D"auto">local.conf:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">KERNEL_DEVICETREE +=3D "your-overlay.dtbo"</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Check the existing machine conf files for examples.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, Dec 21, 2023 at 08:51:49PM +0000, Lukasz Przenios=
lo wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Jon,</div>
<div dir=3D"auto">I guess the first option is more feasible, as I would not=
 like to</div>
<div dir=3D"auto">modify any files provided by the Poky repo, but rather cr=
eate my own</div>
<div dir=3D"auto">recipe that would somehow cover the default settings duri=
ng the</div>
<div dir=3D"auto">build. There is still a lot ahead for me to understand th=
ough...</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thank you for the useful links.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--</div>
<div dir=3D"auto">=C5=81ukasz Przenios=C5=82o</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">------ Original Message ------</div>
<div dir=3D"auto">From "Jon Cormier" &lt;jcormier@criticallink.com&gt;</div=
>
<div dir=3D"auto">To "Bremenpl" &lt;bremenpl@gmail.com&gt;</div>
<div dir=3D"auto">Cc meta-ti@lists.yoctoproject.org</div>
<div dir=3D"auto">Date 2023-12-21 16:17:38</div>
<div dir=3D"auto">Subject Re: [meta-ti] Custom device tree overlay for BBB<=
/div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">This solution seems like a good place to start. I haven't=
 tried it</div>
<div dir=3D"auto">myself but it looks clean and easy to implement.</div>
<div dir=3D"auto">https://stackoverflow.com/a/68650774</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The alternative would be to bbappend the kernel and patch=
 your</div>
<div dir=3D"auto">overlay into the correct folder.</div>
<div dir=3D"auto">https://stackoverflow.com/a/39343720</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl &lt;bre=
menpl@gmail.com&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #669900; padding-left: 0.75ex;">
<div dir=3D"auto">Hi and thank you for the answer Jonathan!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Do you happen to also know a good reference on how to</di=
v>
<div dir=3D"auto">incorporate an overlay into the yocto build?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On December 21, 2023 15:58:56 Jon Cormier</div>
<div dir=3D"auto">&lt;jcormier@criticallink.com&gt; wrote:</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #FF8800; padding-left: 0.75ex;">
<div dir=3D"auto">Here is a possible example overlay that configures pinmux=
es</div>
<div dir=3D"auto">with the expectation that the pru's will use them. &nbsp;=
There is</div>
<div dir=3D"auto">likely a similar example in that long list of overlays th=
at</div>
<div dir=3D"auto">disables hdmi.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">https://github.com/beagleboard/bb.org-overlays/blob/maste=
r/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Note its entirely possible these examples won't build or =
apply</div>
<div dir=3D"auto">correctly on a different kernel version, but they should =
still</div>
<div dir=3D"auto">be a decent starting point.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo=
</div>
<div dir=3D"auto">&lt;bremenpl@gmail.com&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #CC0000; padding-left: 0.75ex;">
<div dir=3D"auto">Hello there,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I was able to compile the Poky image (Dunfell) with meta-=
ti</div>
<div dir=3D"auto">included for the BBB. I am working on an open source proj=
ect</div>
<div dir=3D"auto">intended for home automation based on the BBB:</div>
<div dir=3D"auto">https://github.com/Beaglenode/BeagleNodeHW</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The next step I am trying to make is to prepare a proper<=
/div>
<div dir=3D"auto">device tree overlay that would align with the HW</div>
<div dir=3D"auto">requirements of this project (or "cape"). I need to:</div=
>
<div dir=3D"auto">- Disable the HDMI pins,</div>
<div dir=3D"auto">- configure multiple pins as either PRU0 or PRU1 controll=
ed.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">For that I thought the best approach would be to prepare =
a</div>
<div dir=3D"auto">DTO, instead of modifying the default one for BBB. I don'=
t</div>
<div dir=3D"auto">know how to prepare that DTO yet and I don't know how to<=
/div>
<div dir=3D"auto">include it in my build. I would like to ask for some help=
 in</div>
<div dir=3D"auto">this manner, especially the prior part (how to load the</=
div>
<div dir=3D"auto">custom DTO). Right now I am still modifying everything in=
</div>
<div dir=3D"auto">the local.conf, as I do not have the knowledge yet to bui=
ld</div>
<div dir=3D"auto">my own distro for this device (that's the end plan).</div=
>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I would appreciate all help!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18c8ff2a07963ac284ed2e4f77--


