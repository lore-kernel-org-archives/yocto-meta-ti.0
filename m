Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CFAC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:22:28 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.165.1677180146565346182
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 11:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pANRJTAD;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id f23so17015520vsa.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 11:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LyVYdfv1yL6LbxVICDqeYhQzhNX4jyQ4LGf7UKr2X/s=;
        b=pANRJTAD1/xKsKVXuACKvrkhytJf6vdS75fV2lpAO+XOEa5XVrK5HMnUGP0D/pXnhy
         65IE0i86AlRHPYNTo0mWoT8uAz0QvB8h4kEAIcr9itSdvzmTanG5MRxgUsFB+fdPadDb
         6KAgSUkK+WZMzrODlGJ7laDhHEwNtGgc4caK1ReJUpog/Y5uiOuYARwZ0ZwCP23vlB6P
         /tY393LdYnuGlaVLorimtrKy4uOCI0Q+edoF//HSK+QaA04Uge7AA7FC8KGnPKP2NUXZ
         OeXxFl0WdSaB8qqv/wVHfjzYqXXrKPqrpEN5tCdU2RjAw8KcN/0GH41cP+2dSx7lKnF2
         NrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyVYdfv1yL6LbxVICDqeYhQzhNX4jyQ4LGf7UKr2X/s=;
        b=I+E+iVAUXF8yWyysN3iNibxwVQWnsbFiAQtLybH6tncZSLB7f69Ut/d+mCIKmkctP+
         wTBoppX464yEe2qjTEj0reQoa3kZZ/5Kn2E6uGO9Kr5PWLC6V4ccAr0S1kw80J637YZi
         Xx/S1PRKFOxQvWETOUmud94DRnhYsWt66LDn6xTL/6y5JrugETOA3deuh9O+JJf4hkvF
         bkrMdYx3vl1xxqM28iHh95n5tQgSbXNhvXJGiKl+1d78366Gs6RaU1T+akLBljywY8I4
         p+oGx1jPeGf4XOpXM5gT7bPa2jhHP/PtVZ5bCzLapXDOAiHMFe+C6GQMMm3LyBIYun+w
         pZSg==
X-Gm-Message-State: AO0yUKUIREQjFkN9QyqyDjMIZYm0zqEhflnJa3+3XqA1ZA+7xBX41fc1
	KnzizizYMpfyOV+6YmdQKWEObMWGuR/wxhdWDlY=
X-Google-Smtp-Source: AK7set9V/wuFuvBfxVmcndEYrTAZFIMffKrMNS50cIKHxh/nWpjcK+4cAgsyfMXuLwdYhYmUX7zTI5qFiY/1e0/oVuE=
X-Received: by 2002:ab0:54d0:0:b0:68b:a181:563c with SMTP id
 q16-20020ab054d0000000b0068ba181563cmr2589765uaa.0.1677180145520; Thu, 23 Feb
 2023 11:22:25 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com> <174689B75462BC7D.19957@lists.yoctoproject.org>
In-Reply-To: <174689B75462BC7D.19957@lists.yoctoproject.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 23 Feb 2023 13:21:59 -0600
Message-ID: <CAOCHtYid579_w9-X1vRC7zO1emmpwCYvcLi5xFWOjMQsFRxm9w@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: robertcnelson@gmail.com
Cc: Danny <dadleyy@gmail.com>, danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, "denys@konsulko.com" <denys@konsulko.com>, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 19:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15937

Thinking this would fix both?

```
SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;tag=5.10.145-ti-r55"
SRCREV = "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
```

Another step could be to move 5.10.145-ti-r55 -> to a variable:

lots of tags to choose from:
https://git.beagleboard.org/beagleboard/linux/-/tags

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

