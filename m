Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.2354.1637438407968191521
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Nov 2021 12:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvpdwUcp;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id a11so13771075qkh.13
        for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 12:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=cjvE9XeaXgED0mgVvf8kqEYH5HBheHc7kEoFg4LaEo4=;
        b=GvpdwUcprP69tkWOlm8CqRy2RAddImIC75xTq9R773hpSHr62fPDweSUAbR7HcOnQt
         IxXBkiMzP34wuML97q6A1sviEJEIulnO9cFDDR/okzVowfoWzXVEOScKCBzIav1oEUyo
         ajrkL1gvmB5yEnp8nKkaVVcqxP9mgAjtmUOy604kB1iCD4yKetqaO4CJk8KvUBJQYAQU
         T0O8XVI41/fjd6xi+KARKfmrcDY3/ut2MKH0rNEfIV1mIG9jJlvs1VSWpIYmDcNCVBJt
         XjfkeUOFU2bjPU6OW9OBTFrF/XdeFtUKyz8zJ/GwdDQJLPJz2nzaXdv9jo2zzdBUa0s7
         0fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=cjvE9XeaXgED0mgVvf8kqEYH5HBheHc7kEoFg4LaEo4=;
        b=PdZr9k9Lee1ou/AAE+4xurYmhELvTFCKJa7JvHNpHqPQ3zKd0lU9ErfkCAE5R/0bKD
         z3NZRhAsQOb+rTcl+1ua8vcFU80t3p2EsLwFFGqBIzNoao/YK/pOOoc+7LRflr5Jz65Z
         MpFJc60TNK28FCzCGSK0Ot3tV1Mn/AmKZ7S08RrFgMKJO5Lv82iJjqA8CammVG9D5kDE
         Wlofz698+W5u76ruaCEs6Eo8loKz3iu2XfBNVeW/oYBC0HuBNtIucvrtLITtaZ1p4W/5
         MLldys8ox0uaUoHhQpVIC5DDtdEXEbtizjobz2hmnLOnwrXq4AEt8u6L6npe1URJSEBM
         GgOA==
X-Gm-Message-State: AOAM530HBz2Ni7H/8byyCwzAFRB2DzNXXhrRfKRRH8/ec0WXKxfnpi28
	/q8uj53724Pq0EMGsovjP1E=
X-Google-Smtp-Source: ABdhPJzY61pWnVjVY09A0meXOEduWdsFFKajpT7mu457tOyuwKHrpov0DhBz0jECnY0AF1NmcYFjrg==
X-Received: by 2002:a05:620a:d81:: with SMTP id q1mr37960656qkl.432.1637438407082;
        Sat, 20 Nov 2021 12:00:07 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id d11sm1713436qtj.4.2021.11.20.12.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 12:00:06 -0800 (PST)
Date: Sat, 20 Nov 2021 15:00:05 -0500
Message-ID: <20211120150005.GB2737481@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Vivien Didelot <vdidelot@pbsc.com>
Subject: Re: [meta-ti] [PATCH] ti33x: remove the screen machine feature
In-Reply-To: <20211120030211.GN18191@denix.org>
References: <20211119201533.2540388-1-vdidelot@pbsc.com>
 <20211120030211.GN18191@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Fri, 19 Nov 2021 22:02:11 -0500 "Denys Dmytriyenko" <denis@denix.org> wrote:
> On Fri, Nov 19, 2021 at 03:15:33PM -0500, Vivien Didelot wrote:
> > Some distros or image recipes may rely on the presence of the "screen"
> > machine feature to install graphical front-end applications.
> > 
> > The ti33x SoC has an integrated GPU but does not have a screen per-se,
> > thus having this feature in the SoC configuration may lead to unwanted
> > packages being built.
> > 
> > Comment the 'screen' feature and remove it from MACHINE_FEATURES.
> 
> Well, 'screen' also implies not just a built-in LCD, but also external screens 
> connected over HDMI or DVI. There are even remnant MACHINE_GUI_CLASS variables 
> set in machine configs for either "bigscreen" or "smallscreen", although that 
> one is no longer used.

I understand what you're saying. The confusion comes from the fact that
some people think about the 'screen' feature as 'the machine has an LCD
_controller_ and/or graphic output port(s)', while others think of it as
'the machine literally has a graphical display'.

IMHO the 'screen' and 'touchscreen' machine features are a software-agnostic
way to describe the usage of a physical graphical display on the end product;

the 'directfb', 'x11' and 'wayland' distro features are a subjective way
to configure the graphical software stack of choice;

and finally the 'gpu' machine feature describes the capability of hardware
accelerated graphical processing.

As an example, a distro can configure the Qt stack and tweak images like this:

    DISTRO_FEATURES:append = " directfb"
    PACKAGECONFIG_DISTRO:pn-qtbase ?= " \
        ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'eglfs', '', d)} \
        ${@bb.utils.contains('MACHINE_FEATURES', 'touchscreen', 'libinput tslib', '', d)} \
        "
    EXTRA_IMAGE_FEATURES ?= " \
        ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'hwcodecs', '', d)} \
        ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'splash', '', d)} \
        "

while a generic image recipe or local conf can tweak packages this:

    IMAGE_INSTALL:append = " ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'qt-kiosk-browser', '', d)}"

The MACHINE_GUI_CLASS actually shares the same concern, it assumes the
presence of a built-in screen of subjective size, which is simply wrong
for machines with an optional graphical display.

> All TI platforms with am335x SoC do have screen outputs, but I do understand 
> there could be headless platforms from other manufacturers with this SoC. The 
> correct way would be to not completely remove "screen" MACHINE_FEATURE from 
> the SoC include file, but rather move it to corresponding machine configs that 
> use it - am335x-evm, beaglebone, etc.

I would say that the 'screen' feature definitely doesn't belong to the SoC
configuration, and it doesn't belong to the machine description neither:

even though I understand it can be handy for beginners, boards like Rpi
and BeagleBone can be used headless and thus removing the feature from the
local configuration to get rid of unwanted configs is likewise cumbersome.

I think it's the user responsibility to specify MACHINE_FEATURES += "screen"
in their local configuration to describe the usage of a graphical display,
especially for machines not shipped with a built-in one.


Best,

	Vivien
