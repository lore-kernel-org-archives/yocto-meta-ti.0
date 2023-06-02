Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCBDC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 17:15:48 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.1346.1685726142435113418
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 10:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=BecOz+6a;
 spf=pass (domain: foundries.io, ip: 209.85.208.176, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b1aecef94fso11099821fa.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1685726140; x=1688318140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uu9/qISaQMcg2PIpzKWETOw6J5vK6rmnMFhZenZrDAk=;
        b=BecOz+6aOzgRRS2dzElEXUwdsUDp7UYnW0lZjzX+X4Bb+SOTvEqdPcZFVie3iqsLSF
         khIGWcw47bdPt6HcVh4qEh8kkJNXIp023JYdFHKAoxA1LxtKI4R5oHrS/GoimJpOX1Bl
         3WWFa5m4L4n7reNTCuFKCukXGJww97WVZUOr0yn6pYSUvbvRkDPAG3fglWTwLPTOwxxJ
         CRUkfJJ65VtTEhzZN3WstSKetB6juHW7JAPBGyLkiukWaNb+ogDRHSsZyuuyzay2VJpL
         TqHNywiRPrkeWq6GDdg2inBwezk18XrBDwQxRKq6lvz4St+2i4XmWXmn5X9JiJruRodY
         yRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685726140; x=1688318140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu9/qISaQMcg2PIpzKWETOw6J5vK6rmnMFhZenZrDAk=;
        b=Z+xOKrmP3194eHFrxCoF9f0yYdnpop0zRxyMRjy6zSg3NuA3dDGMSi1ZdxmOV3u9mq
         J0XqEnf0c0NxnJrLhN8jzKrVwm0glb5+5ZlbHVZGjvOpoIWzOiXpw+Av9fWLHRvVLqB3
         0eZTHQzn8M7f28O0naQWjov+r1bZwfH9kdU9csoa7BQ/JoNKfs+8bkzCB++zPffN2F2Z
         bn+o4IFpsSxeDM+fcXs+X/1yGgHuof4LVnLXo1np8988aHeCgqvelmFNvWrE4FfEQAya
         0qeRs1P9XayY8/5CShjy2wzWzGCFFK8d+xuYfHoPDIGdDs92FO9g1EbNiDbRKAkJHnEA
         iyIw==
X-Gm-Message-State: AC+VfDxJmGIbmWUwfsCWsW/eHLccVU81noJc1Wq8O8b5axW35mfgv958
	xTNmaUMJJhIgJvCA83ItDlqIfJkps2fgc8Iyf5Ac
X-Google-Smtp-Source: ACHHUZ7HRGGNJ5f5V8haOES46A3h9vx1D9z8LuigKOidbdAvZNVJpCUUZqgxeByiqSRFM+CGrRW2bpt2lUWbvFI0+Is=
X-Received: by 2002:a2e:9546:0:b0:2b1:b107:5acd with SMTP id
 t6-20020a2e9546000000b002b1b1075acdmr425968ljh.27.1685726140459; Fri, 02 Jun
 2023 10:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230602092932.2576466-1-p-bhagat@ti.com>
In-Reply-To: <20230602092932.2576466-1-p-bhagat@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Fri, 2 Jun 2023 14:15:03 -0300
Message-ID: <CAAaKDhH6NFE4wE7Rge4qYELvOSV6V4YTWoi7eyiAeoZBr_8BPw@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
To: p-bhagat@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com, 
	c-shilwant@ti.com, s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 17:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16659

On Fri, Jun 2, 2023 at 6:29=E2=80=AFAM Paresh Bhagat via
lists.yoctoproject.org <p-bhagat=3Dti.com@lists.yoctoproject.org> wrote:
>
> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which contain=
s
> patches used for jailhouse. These will be used to build jailhouse image.

Should a new u-boot recipe be created for just one patch?

--=20
Ricardo Salveti

