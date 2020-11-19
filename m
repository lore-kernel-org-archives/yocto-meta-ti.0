Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.4154.1605755066120342925
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 19:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=psPDCVVf;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id v11so3345143qtq.12
        for <meta-ti@lists.yoctoproject.org>; Wed, 18 Nov 2020 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=lR04W9QcB5HDdVlI7uAq88oudxnR5fdrdl3OekqH4qI=;
        b=psPDCVVfTSclrr+3rPOkbV8N+mi2+0VYcNFmp1qFhp6Y4TQx389AAfS01dwwTQ4FPX
         Za+G9ROkauIxo4hg8IHMRRRTdGn8+jHaTkcxrt4zwV4JgH+oGaAHm0hvBlC9No0SYKiV
         lJh1+BWaruxUpuQEWvU+o6JCiO+S6Oxzu750HNBIj764UyRjzi9dHueoFPXZjDWeoxsG
         zIUhFZJ++LTmWWRow1102quPYsayqK4wnIFChlolfqY4wvPYfVqt75kiApVOVltE5+i1
         b8ulax2UdRO1xn2BCe9AiYuUGd2w0NkC8+2Pjzrzsn8Nzbc3D6Apzoep056UMuhykcjq
         TR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lR04W9QcB5HDdVlI7uAq88oudxnR5fdrdl3OekqH4qI=;
        b=eCB9c+Ct2lRi61dyC7P/CQQEIvAa5849b6H2GCr9teO5PeOyzhSX3DfAG0VIDVBVYT
         OpkzQNUFPCLtR7HydJKaukrdz3DHsPrurY3XDXoaJt27GTWXNS3+HxKAEnVxW/mNeYVv
         KlMrFheyrD5kzfPzy1n/PacPsNASyMxUIb3Vad8na/nhY9oS+CT/N4r0Fj7vuRLiU0ET
         JB6b8QWM4RIS2N96uEJ1z7obZvo1LZq7+V6wZZ1C3VzB65iae4TFxM7EIcxZHO+dzERW
         Z1bq+Az7pZGKw2UPBQhC0tSr3x6WpuCt/5KsLeLUv9vSe26YJ8JfyE1QoghIM9KxlPF2
         zS4g==
X-Gm-Message-State: AOAM531cnusqEwGPiUUqd9Dffh29qF97qCOUJkDD7uL0wMpgp3ja4V1Z
	owwRBXHNxBInXmSVQIXhzPboX+NnUDZGVYo9/zau+0wLsYk=
X-Google-Smtp-Source: ABdhPJym6VxA+UPirW69YlzfbWyrI275S0k9HkpZxa7nC61Un1YQ3YG1rAJtIQvenqJSEaolOvICsKYO/w8YVpFF0qE=
X-Received: by 2002:ac8:5c8d:: with SMTP id r13mr8848239qta.88.1605755064981;
 Wed, 18 Nov 2020 19:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20201113011308.604936-1-raj.khem@gmail.com>
In-Reply-To: <20201113011308.604936-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 18 Nov 2020 19:03:59 -0800
Message-ID: <CAMKF1spxTT2nH1Hjfg+M+XwMyg+xU0bpWvaBZfq73wUMmHXRvg@mail.gmail.com>
Subject: Re: [PATCH] u-boot-ti-staging_2020.01: Fix build on hosts with gcc10 on them
To: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>, 
	"Murphy, Dan" <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Nov 12, 2020 at 5:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Backport a patch from upstream to fix build on distros with gcc10+
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...e-redundant-YYLOC-global-declaration.patch | 28 +++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>
> diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
> new file mode 100644
> index 00000000..4973ea9d
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
> @@ -0,0 +1,28 @@
> +From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
> +From: Peter Robinson <pbrobinson@gmail.com>
> +Date: Thu, 30 Jan 2020 09:37:15 +0000
> +Subject: [PATCH] Remove redundant YYLOC global declaration
> +
> +Same as the upstream fix for building dtc with gcc 10.
> +
> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]
> +Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> +---
> + scripts/dtc/dtc-lexer.l | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
> +index fd825ebba6..24af549977 100644
> +--- a/scripts/dtc/dtc-lexer.l
> ++++ b/scripts/dtc/dtc-lexer.l
> +@@ -38,7 +38,6 @@ LINECOMMENT  "//".*\n
> + #include "srcpos.h"
> + #include "dtc-parser.tab.h"
> +
> +-YYLTYPE yylloc;
> + extern bool treesource_error;
> +
> + /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
> +--
> +2.29.2
> +
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 991ba0ca..29fa6ee6 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,9 @@
>  require u-boot-ti.inc
>
> -PR = "r22"
> +PR = "r23"
>
>  BRANCH = "ti-u-boot-2020.01"
>
>  SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
> +
> +SRC_URI += "file://0001-Remove-redundant-YYLOC-global-declaration.patch"
> --
> 2.29.2
>
