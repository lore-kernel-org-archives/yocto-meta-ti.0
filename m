Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9273C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:45:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.8921.1665762334773883294
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 08:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OW8VoCRq;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id q9so11498084ejd.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 14 Oct 2022 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7haWiuSA9q7Rbr709Id1rTYG7rrMnEq3GjeSMx0CdIE=;
        b=OW8VoCRqgpJg4CY+U9FCDYT6wC+Mot24TWWn5bn+7RIwalGHhjIOGChCvXsybuv13a
         /jALhxg1nmCzy1hUohJjAGWBOk9O6t4bg5MsWHNLVCNf9xtrLwydW8yFzXEXYkO8VJiW
         KpeZhD09UhzyJ3c/5t/2IdO4UfO1+Z5lzlXeHhr0h5O2B8dVrwKJiW5egT+bKZZwOniI
         LPMR3Ox+zuL9wRdb9m3zDBB484O4KyyOd21TyDzLkcn5adN74+zuNyv2KO4PK8N6ryLh
         oFviciSoiCcwASFBCPgZAa2URDVOR5pp92zVaa5ElXAvV/SFLwLOB75CrP6gnbLupuzR
         0F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7haWiuSA9q7Rbr709Id1rTYG7rrMnEq3GjeSMx0CdIE=;
        b=hsDcUckNpKEJwh2FBzZ5KAUZp9YCa4a1cjzXOPJngTgA2WvxHxZ+txCqx5HM2Ac7Lr
         bShFw1jrtizxFatPa93hOb9pyoWshaYWaDoDEaxilApHRA/NUvCfA9UWxIFQzJOVxQj6
         E+4hWz/9IfyXEseyqRZIY9CdjeEHUYC6ZhxualVaKHqwO+D2pyCyzloWbdsSVL6kpNkO
         GkZ/wDBLpKUOAUSkaypZs7/lu8BihrD50CyqqLJpfBlAihU5XAlIcMDEWh+YG4boXyJq
         AfnMjN8Tp0qmfa0O/UEDtoLqRgoPe3+9TgLarGZL43dI3aDpWxn3dDZmWgKNmdURP2db
         quGw==
X-Gm-Message-State: ACrzQf0rK3v648AEwb+OX7z5W7cl1zehdH/z1K3CuQxxRaqcV52QDWgr
	A6UnEYahrKk4Ka6buZpz19lhOaxzdMvQNb+F1IGg5CnJF+8=
X-Google-Smtp-Source: AMsMyM5IBPSKt2ySS7wB6xPbSIp9LWoZIJV/9Zn7KnNlBT0ZTZvZtDtk8RipJ6eVPFmzx/0mTVZo6trTdw0c8SBdaiI=
X-Received: by 2002:a17:907:1b12:b0:72f:9b44:f9e with SMTP id
 mp18-20020a1709071b1200b0072f9b440f9emr4015721ejc.653.1665762332569; Fri, 14
 Oct 2022 08:45:32 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 14 Oct 2022 10:45:21 -0500
Message-ID: <CAJdd5GZshPXLmnpvNN-086V2oDFYCifCVx5+02--Dm3tAbVVTA@mail.gmail.com>
Subject: PDK Source Missing on Dunfell
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Oct 2022 15:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15174

I'm attempting to use PDK sources on Dunfell (basically trying to
include any recipe that inherits ti-pdk-fetch.bbclass) and it's
started erroring out saying that
https://git.ti.com/git/processor-sdk/pdk.git  doesn't exist anymore.
I've poked around on git.ti.com and it looks like this repo doesn't
exist anymore, or maybe got renamed to something else?

Either way, it appears that the PDK is broken on dunfell since it
can't fetch and I don't know how to fix it.

Thanks,
Joshua Watt

