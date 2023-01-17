Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1A3C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 16:29:15 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.201124.1673972950314471936
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 08:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AZED2NEv;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id p1so15976216vsr.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 08:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh7D4scj93wDSpYCoCLk+YCpTDLN1u9NAs0kOLq2c/Y=;
        b=AZED2NEvXGSRsOebOJkG+YPH0Xt909i5ts8Wwl50cJMNkcRwCkyhLZzf6xV/TMh6U3
         rEbdlhGPBSopBuV9Imu5NaIt5DV4uZVR2+9FMUNOrhbw3DBwUYb8J92qqepk7wjiSpCT
         LzsRTeJubluRrKJw3x9xGvjJMs9qz3egChN2t+xH9mIcgiV+iDZBkLDTg56c5L87KkjJ
         SCSO1m3Mo5BPAd9SeZJywXjp1Fkz4PVLloOdyqs/078AKwzHsKUCNZoFPWzbCMriniQ6
         syXS1mPV53paZIxkfSeBu1+VEqbc1Y0WY0rXAiXGYTRBL6K4Jhaxd+Ll898qDUBH81E3
         8X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh7D4scj93wDSpYCoCLk+YCpTDLN1u9NAs0kOLq2c/Y=;
        b=R4xbDKTGgxYyTp4cKDd7mz1i81Kw8YNpRl0bglu2vQPz5+53bgbc+d4pE+PfXv3IVF
         oF6afmI7bJQPF71a6b9Y9Qd+uNu5NL7sBqHY32doFGslUV5oeHFIWXW2MJ7/mpei8sru
         Nr7kUOO08/WWqhBqcFFQJ7wBBR7h0NMh7XUchV8jjcvtYQeue6VcjVarCkbA6bXshVvd
         fe6WwuPhRB+HOlpHQT/XthKeZRvuz5f6rRFSsm/zOt7fCg6TVaPKHiMbIS9/D1PGFtkD
         TRx5qUnbfi1FNWJcdMG+Wqq2jN3MvaDbUfrg2r33f/apmFEus90ctjYcmlI/II32sOM9
         BcBg==
X-Gm-Message-State: AFqh2ko0dr1NObgc34KS7LoRye25oUWpf6Sb0gmJZXrh/Stytjw57skw
	lTz+kKY472XuePTq4VnOjJuZHOtQQf/9cfhS5bM=
X-Google-Smtp-Source: AMrXdXvoiw/VQOERIBvmNPbqTRowCWRG3d9eDq0rS24AsXer40Nr9FkMwLd15kQCRN9ds05XcHIR4ey1+mUfe+3/9Gw=
X-Received: by 2002:a05:6102:941:b0:3b5:1e92:f898 with SMTP id
 a1-20020a056102094100b003b51e92f898mr483638vsi.63.1673972949194; Tue, 17 Jan
 2023 08:29:09 -0800 (PST)
MIME-Version: 1.0
References: <cd46cdf4-af94-a845-0421-f905f12b8618@balister.org>
In-Reply-To: <cd46cdf4-af94-a845-0421-f905f12b8618@balister.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 17 Jan 2023 10:28:42 -0600
Message-ID: <CAOCHtYhDs2roRjxDS-cW5YVE=K45obMaB-BRDcVd=u_ha4NUmw@mail.gmail.com>
Subject: Re: [meta-ti] Beagle AI BSP
To: Philip Balister <philip@balister.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 16:29:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15578

On Tue, Jan 17, 2023 at 9:39 AM Philip Balister <philip@balister.org> wrote:
>
> Any tips on getting a BeagleBone AI-64 running fairly quickly? I am late
> thinking about FOSDEM demos.

Hey Philip,

What do you need for your demo, i have u-boot and kernel branches against TI's

ti-processor-sdk-linux-08_05_00

https://git.ti.com/gitweb?p=arago-project/oe-layersetup.git;a=commit;h=fea115b8615464b06bd88fcb7883f1bd843f1fdc

u-boot: https://git.beagleboard.org/beagleboard/u-boot/-/commits/v2021.01-ti-08.05.00.005-SDK-8.5/

For the kernel:
https://git.beagleboard.org/beagleboard/linux/-/commits/5.10-arm64/

or just use TI's meta-ti bsp and add our Device tree changes:

https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees/-/tree/v5.10.x-ti-unified/src/arm64
https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees/-/tree/v5.10.x-ti-unified/include/dt-bindings

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

