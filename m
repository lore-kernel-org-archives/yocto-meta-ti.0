Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7570.1603513112901355814
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 21:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fl5FVQGw;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: raj.khem@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 19CB638C089F
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2020 21:18:32 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id k9so3590205qki.6
        for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2020 21:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Vo9R03OmhTUyEhgxw5Jwt1wRwDTh/7blY820EddUR0=;
        b=fl5FVQGwv91zNwB8/nTBa/kDgmwQJ+lRCPuMEGbxlpRVQ2VX0AbXjusXnTO6rc3HMS
         QRhDdnunvcPkfr95y6WmfYcRN4uJ+hZIlpCuq5LItxPtI1TGjI6M50eoqBARcGkFjJQa
         ssq0akjY7drmUPKU1rBdeBcHCHnmkZpY5Gxn8upQBQ0llbtmjkgKTspJis8iPQQCUaVp
         aPjf6+2WvZvSnjhEJedmi8EXia0o4TN6TrtzUCiIjXVOZQdpL4mElnJgXiiExzTR5ydg
         zZzhRwsJ6I4h0sVbeAzXbc/hfvabdPI7RSdg9BvPeAhKOM9Ak/iHHYFJm2ulO0fEpA56
         4xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Vo9R03OmhTUyEhgxw5Jwt1wRwDTh/7blY820EddUR0=;
        b=gR04e9WWtw4duD6wbai6JSpKkRGkX/LHETCYTlb5Lml18iZ8CMlBYsIIBcp5+gh098
         i5qGjIwOKxDDKRlc77h24PjSVDvPT0T2vPxStek5aaTWrLxaLT6QhrEJtT862CVBaM8M
         zeY/EZNDP1SuN14SpMHaOI7ukKRxjWSSjVcYpw8gdD/VYtXVWOfQtYa0QWcYhQmJvwQU
         sSh1WNL+UZ5tUuprXlueq9zIaqhG/u6JhphG/C8Bbuk16iHI4i7E+1yD0hP21+tGgTQn
         ttz5hRQRoxuM378NrnQv/DmgYTOCbz34tD7qvtmh7IQfOAnjqYRcDrTGOu0I8oSrAgul
         8qqg==
X-Gm-Message-State: AOAM531Y1cbL+oE1Ru1wG9X6p4Uz0JFDqNwZZU2I+OnV5o3Jq1xxBxRU
	5FbTMj0pTINH8JQkl2olHhoEdqbxiGp3EEwWS5vK2u86yGAKLQ==
X-Google-Smtp-Source: ABdhPJwXpXW7BYz4m/qImDRVRxAkcE9vgFB6x4eqknkJ9dBS48bbzFvpvb0+OZD972WGtNn1HYPslPYfaFQCPWFwUvc=
X-Received: by 2002:a37:27c9:: with SMTP id n192mr5347822qkn.71.1603513110922;
 Fri, 23 Oct 2020 21:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201022005614.9344-1-s-anna@ti.com>
In-Reply-To: <20201022005614.9344-1-s-anna@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 23 Oct 2020 21:18:04 -0700
Message-ID: <CAMKF1sqm3Q4q+t9o4CBFZWec3HBiDTqBocp1yQGytX4maSz6VQ@mail.gmail.com>
Subject: Re: [meta-ti] [dunfell/master PATCH v2] ipc: ti-rpmsg-char: Add initial recipes
To: s-anna@ti.com
Cc: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>, meta-ti@yoctoproject.org, 
	Gowtham Tammana <g-tammana@ti.com>
Content-Type: text/plain; charset="UTF-8"

This fails a build time QA check. See

http://errors.yoctoproject.org/Errors/Build/111395/

Please look into this.

On Wed, Oct 21, 2020 at 5:56 PM Suman Anna via lists.yoctoproject.org
<s-anna=ti.com@lists.yoctoproject.org> wrote:
>
> Add the initial recipes for building the ti-rpmsg-char package.
> The library and examples are built using two separate recipes
> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> v2: Addressed review comments from Denys
>  - Dropped the DEPENDS and do_compile depends from ti-rpmsg-char_git.bb
>  - Dropped the RDEPENDS from ti-rpmsg-char-examples_git.bb
>  - Eliminated the TI_RPMSG_CHAR_GIT_xxx variables and redirection
>  - Replaced DESCRIPTION with SUMMARY
>
>  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 11 +++++++++++
>  recipes-ti/ipc/ti-rpmsg-char.inc             | 15 +++++++++++++++
>  recipes-ti/ipc/ti-rpmsg-char_git.bb          |  7 +++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
>
> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> new file mode 100644
> index 000000000000..142e5bf07ad7
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> +
> +require ti-rpmsg-char.inc
> +
> +DEPENDS = "ti-rpmsg-char"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OEMAKE = "-C ${B}/examples"
> +
> +PR = "r0"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> new file mode 100644
> index 000000000000..b41e68eba0f9
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -0,0 +1,15 @@
> +SUMMARY = "TI RPMsg Char Utility Library"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
> +
> +# Initial 0.1.0 release
> +SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> +
> +PV = "0.1.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> new file mode 100644
> index 000000000000..63711a3b35dd
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "TI RPMsg Char Utility Library"
> +
> +require ti-rpmsg-char.inc
> +
> +inherit autotools pkgconfig
> +
> +PR = "r0"
> --
> 2.28.0
>
>
> 
>
