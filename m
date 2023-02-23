Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53F2C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:12:31 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.20455.1677179544266372688
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 11:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NG5XHSzR;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id j14so17304695vse.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 11:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qJS7uv8k+QwzJO0snTRnJziuw/ux6SAZzPngX0xDdZs=;
        b=NG5XHSzRJIW8fbD6jdM4O9rV3YtolsxECuKJ/e5HmD4b0kX+DuoKjL4Slqll25h8He
         KmI/IxrLo9WnvYCzSQ7VwzFmMAcqLX4IxAxzMDEY6BskmfXuLJqFTsS0GDJSzpDZ8pSv
         CJhaGd+tJMENn46k+3FlnR2b48XDUajNZTBa3x2gQUX3ctdM3a/ovkPF/4zgFvJMcl2B
         eg4VURnAuL2GjIMPY0PayEs+pt/1VB2LwpKyddaL5nsJQnoanLmKqSD1e0syvNF2me25
         4KZpMQLaC8GEklXA91yy81mPgMZOj3vtZC08QDK2vX5zVN3faUhPMxHMWokakmvnp8BI
         R0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJS7uv8k+QwzJO0snTRnJziuw/ux6SAZzPngX0xDdZs=;
        b=qpHSeWp6vfrjrCUhGXAJ096VlT6cZ3y8UBlwkbI2L77vuDLzLDPSDSNR5EEsFTt3gA
         TW5ufF+fvD1KTH17/+xfwaL75BskGtVg0ZuFec8SHrAyWEdwvWNINXnxaX27w1zLsEdM
         MThovrtsDk9HpcubTYhj1NIYDMjB6iYdn33C0/Trng+pqXxFMfBPhlj4z0WZUYSk1N/Y
         tC6YCpYGyFzG1fdqMazHXUgthLFlRDlz3zo5NbYnSm5XM4g1sSnJRd6qHQRjVP9Kw3iO
         jhbceM0RDtdRRWL9QccO8z5T/hgpR+4LILl+pDMc+CKtR+NUSa+rnlQxAyXICUtemyea
         xI+g==
X-Gm-Message-State: AO0yUKVyGp69KVG6nF5PkN9nfM14WE8YH582aeTjCwgxIk3XMDgDtO4q
	LmlJ90HJRkfFsV1Zj+MrN+rlo9x1LJnQGNyUMgj49kBbTStj3w==
X-Google-Smtp-Source: AK7set9x5FktKFbrf4ROkbbCZVkj4mPhbnTtLEkME9OgIE4Hk3u+3r2x5fvT6TPeVkrK1ETrZcqu4ssFwu6UdzOHtAg=
X-Received: by 2002:a05:6102:1592:b0:412:5424:e58e with SMTP id
 g18-20020a056102159200b004125424e58emr734997vsv.0.1677179543210; Thu, 23 Feb
 2023 11:12:23 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com> <CAOCHtYia14VzrLpo=QZOGO-1BXGrv1JgXSWvp7rwEFVkVg7iLg@mail.gmail.com>
In-Reply-To: <CAOCHtYia14VzrLpo=QZOGO-1BXGrv1JgXSWvp7rwEFVkVg7iLg@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 23 Feb 2023 13:11:56 -0600
Message-ID: <CAOCHtYhgi12=WSJEYFUwaqoJR_masSes+-AgiLm6ZDew7R4+CA@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: Danny <dadleyy@gmail.com>
Cc: danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, "denys@konsulko.com" <denys@konsulko.com>, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 19:12:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15936

What is interesting is that the parent of 9b11aaf does exist in both -
49ae123d2fee3f4ed30c5359fbb3e398e898f2a9. I tried overriding the
`SRC_URI` of the linux-bb.org_git.bb recipe to be

```
SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
SRCREV = "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
```

which causes bitbake to fail with

```
Fetcher failure: Unable to find revision
49ae123d2fee3f4ed30c5359fbb3e398e898f2a9 in branch 5.10
```

ah, i see another issue..

49ae123d2fee3f4ed30c5359fbb3e398e898f2a9 -> 5.10.145-ti-r55

How do we fix this in yocto, to grab a specific tag, and not the
branch:  (the Branches get rebased, the tag's stay for-ever)

I've seen another user do it on the forum (Balena maybe..)

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

