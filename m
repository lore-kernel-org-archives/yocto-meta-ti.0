Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web08.12939.1605640676639504055
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 11:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q22aDEHi;
 spf=pass (domain: konsulko.com, ip: 209.85.210.47, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f47.google.com with SMTP id i18so20582826ots.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZpnVpfLXmIufA7nacMnR1taaltTrhKJ4u7Wo0OG48Fk=;
        b=q22aDEHiGaQAKG21HNqEGfYVe1yl6cqprZmGdXRpBg+mwbioIx4X6pc2PUncazXH1O
         sJUs2IU2eKnlHHDql82i8t95bTlVy40RSfnctQ/oM3v4JScUdGN0S4LlPa2igOSGqSRN
         dh9Z+1FBqtiKKDC6dMyVEQWnz2yZZncFqAaIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZpnVpfLXmIufA7nacMnR1taaltTrhKJ4u7Wo0OG48Fk=;
        b=e0V6yoU8E9wsmsP9kEZaJooskyI6DY7EELrzeNBknREluSR+qGzdvbHKBBSReJ78ij
         fj7IMkCq6HQAp8sQKFxEUdr+gSBKUX8uRoxjOZ6af1ZYYbG2yBCxaMuRAK/jKLrk32KJ
         p362lTbANJTJWu4069mKTjSfrb0Ex/YfXbPeutd3rpECLr111v83Ts3/IoOYCnbNE1Cs
         T1bYrD7EnANnfEu3bMJHMYnaG7BF6hZQMC6oUvxYxc8IfmnM45Z+r+NKP5x3VpmpMX3Q
         8mhaiJe1uoOYthpoEH0iBNGSs14syBib0a9XB3yemw6EHgS4PcwkwYMeCQRtkzE4TkeP
         TCaA==
X-Gm-Message-State: AOAM532vkWVpp/jMhFlr4G5DyOb6scIUaxXZqZltuU8XfcDfDzHPmmkL
	HkkrgvkQWP9utw1yJMPZ5RtDgFCZp1/gkpirpK2mAQ==
X-Google-Smtp-Source: ABdhPJy/P4jTGR+xeAZCfVj0xM2PM50gfaQCc48QJVLFwINeDFUhS5Wj0JUV1dsY2gGYe2z7Ze9NusEy7DM6qTn8sj8=
X-Received: by 2002:a05:6830:831:: with SMTP id t17mr4337501ots.92.1605640675870;
 Tue, 17 Nov 2020 11:17:55 -0800 (PST)
MIME-Version: 1.0
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 17 Nov 2020 19:17:46 +0000
Message-ID: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
Subject: How to tell when meta-ti/meta-arago or TI CoreSDK is released
To: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hey folks, apologies if this isn't the right place to ask but I can't
see where else I should be asking this question.

The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
meta-ti. For our Arago builds I typically pin release versions of
these dependency layers, especially for meta-arago and meta-ti I want
to ensure that we're using known good versions. The tag we're
currently pinned to is 07.00.00.005 which I believe corresponds to a
TI CoreSDK release. I see there are some new tags in these layers and
in the ti-linux-kernel repository

I also see that configs have been added to the oe-layersetup
repository which is usually my flag that something has been released.
However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
given config files while the meta-arago layer, meta-ti layer and
ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
are a bit confused.

I've tried searching for "ti coresdk" in google but I can't find any
documentation for this. I've also tried looking at the Arago wiki but
this does not look to have been updated recently. The only list of
branches I can find is
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
which is definitely obsolete.

So all I can do is ask the question then - how do I find out when a
release of Arago (or TI CoreSDK) is ready to pick up and use?

To pre-empt the obvious question - we do test with the HEAD of the
dunfell branch of layers regularly but we're not happy to issue a
release of our own BSP without ensuring we're aligned on released
versions of the underlying layers where possible. We need to track the
releases in the ti-linux-kernel layer as we've seen in the past that
our kernel needs to match with the expectations of the meta-ti layer
if we want the PowerVR drivers to work.

Thanks,

-- 
Paul Barker
Konsulko Group
