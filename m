Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2069.1578688709381234444
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 12:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=BlHADXzE;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.46, mailfrom: troth@openavr.org)
Received: by mail-wr1-f46.google.com with SMTP id g17so3048253wro.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2020 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=5iBjOpaw4UnWd22Jb8HOyVVcPkDqvK0yNfqnl2z70OM=;
        b=BlHADXzE/geqnjaeaWm4SSu1kkxRT1not+NzZlYtq+Pdg2L1gkzTtaP/ra0I2geUqV
         OTiG4TmgDen1aCB4a6I4Bi1kPZ+3gGOrMqKB/14blpVe6kNCY2GU9b9YXIGEfNDIqdhb
         m+doaQWCaWJWa9JmbwNoKQsgS6bJvwaERod8iUbBYg7B4KXc59VkEUuIqI9XS5GR+a9+
         Fb9HCMJ5A7p+OJZAUOyqesbKpwiee/xT5ztsyUbXzcgwz/BybEcPkeztHeRzKzd5VsUP
         IGwcOlqYXGmYy1iSDdieecPSklhTKAY+LwwswjSTAwQzDSq0pPK/xPJLWyKdC6YSiGos
         kVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5iBjOpaw4UnWd22Jb8HOyVVcPkDqvK0yNfqnl2z70OM=;
        b=q28CsYw4Ix/0YUbAv6090xk99MXVTTOkW1Xip/Wz/Rv0RYeE32Vpd9/D68PFvVS2Uh
         HEEdnzljTxT2cPpH4P0OdbPNNGcKLhMN/TC6yUON4SmOAMFMmfn/lRlDuFOhCTHbmqMB
         CuufEjMTHf4oj5sRqoPb8XUW2EG9eAdFx72o8arIV02YA4F/6V5hGdBWzY5L4W9jgFO3
         toi8VaR2RgGJSxwq+Lgl7dTxDbVpNSjHxxmen4BbkJiXDHrrwUajHmrKbvzLD8YCVxo0
         hHCqGoXbGdO/AGozot1XLIB3CVycyS6lKjoEQAXRXAGtQ+X3u4ggGxKA29MRxjFMm00O
         3eFA==
X-Gm-Message-State: APjAAAXtVZ5AsLTRz8jQoAwT2wcISNru6EKwMp03NjYmlSxNhYyVL6KL
	UHKOn7XH8sgnbpn0YiVxZzw/ptHYrw4LFZObgBqo9vJK9zXGwA==
X-Google-Smtp-Source: APXvYqxFQFFnyhgDVO1Ka5l0l60gmoCkGhX0KTXb3YLaWQWnnxbksS6xbo75448mUnMsjsXc4IaZSu9HZSEgOFWDEE8=
X-Received: by 2002:a5d:608a:: with SMTP id w10mr4939109wrt.136.1578688707474;
 Fri, 10 Jan 2020 12:38:27 -0800 (PST)
MIME-Version: 1.0
From: "Theodore A. Roth" <troth@openavr.org>
Date: Fri, 10 Jan 2020 13:38:16 -0700
Message-ID: <CAFMvBt15f3nbMMACAHmQCKgQU-hKoP8UwH22AXxj9QprBTY5nA@mail.gmail.com>
Subject: issues with fetching git repos from git.ti.com
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

We're using the meta-ti layer in our yocto builds and all this week
we've been having accessibility issues when fetching the u-boot and
linux kernel git repos from git.ti.com. Seeing these errors:

    fatal: unable to connect to git.ti.com:
    git.ti.com[0: 198.47.28.208]: errno=Connection timed out

Seems to be worse in our New Zealand offices than in the Colorado US
offices, but not having much luck today in the US.

We tried to set `UBOOT_GIT_PROTOCOL` to `https` in our bbappend files,
which helped initially, but isn't helping much today.

Is there a mirror we can use until this server accessibility improves?

Ted Roth
