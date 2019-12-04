Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.7364.1575478245317653423
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 08:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cLW7ObuK;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d5so450506qto.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Dec 2019 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uN9djdOb8r0rgUACTCn9MD6N65gGL1BstbnAA6Ctg88=;
        b=cLW7ObuKERMDgcDLLKIQ4sC6hCMbWLk5Bmvysw8QoZp7zrwL2dJOiuZp4MYZ4D0tK+
         ji/PMMva38uyibUKDSqTuOQKz5trqP41AM+2jLC7hFpcWsLrLjY0r0iSji7K6TTVp82e
         zicG9CtKT7dH+aBvmdjc+ClqbQmPIsoqSgHu2P9Yozl8ZTpA2lIPWhUrPBL9xGio3oLg
         WgllB2kzbmt3vdkaSGcWN/uHdLRT2HVaeDRBRPhdXuDlKRCsxW321YpgTb+XbtrpKn1J
         xvWGoLtZ7GjnDOAvwopO7DdsiTNZDHZKoerwE+qJsncFTpteXX6dzcgIMLk0H4JZYBJ/
         C4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uN9djdOb8r0rgUACTCn9MD6N65gGL1BstbnAA6Ctg88=;
        b=LUZ9n3GT+vvkLu2zpfMWxUUA8z+O94PbyuyPdAVOkiC/Ce5N5lluFpsqiftR0tl2w6
         OI5pUnZ8jZkCQVnxM4P6RZ9rUuZW5FJJeErmRPWODPKSLGNMtXT2YdmWG97pph0c2ydO
         ayAODFbm8umh4ctqMUBeEgFYNOAaY8WHmTVx/FmISbWuLuxG0hmhWBUxnjSoF3NzvHw5
         Lei5qxeAjGP9UrfCZSIV7Zo9KRqWy6K/Vdz9U/4SR0SYP3u0dfHRDWVuOdvwoph0V3SC
         qSDIymOOm8QgZH0OU/vp7WLuPC+SXFHN99yns1RXHAJqKfq4h54jBQxFDLLq2soYGgGX
         KR1g==
X-Gm-Message-State: APjAAAWBQp9PlBQuSs1Bf2xD/nomniFgb/0ydUJCRl9MnEcO/dkmhTVf
	4NAKx1xxIvSywcy02qSe+D+kbt6Xuat0Sw5xvDM=
X-Google-Smtp-Source: APXvYqwETaBWOXHQhi2cI4xsEZ+eRxv/WQUGhe+d4tXR40BavwPyHy7cE1d6tqqsHeDt6LXjDXkJHB8zB8pRkP6bcqA=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr3721048qtq.53.1575478244011;
 Wed, 04 Dec 2019 08:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20191204164529.19951-1-luca@lucaceresoli.net>
In-Reply-To: <20191204164529.19951-1-luca@lucaceresoli.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 08:50:16 -0800
Message-ID: <CAMKF1sowAhsB=zBuWBmY27WVeVPKmrTyiWCgMv52hbMRnjykEg@mail.gmail.com>
Subject: Re: [PATCH v3] Fix "basehash value changed" errors and BB_NUMBER_THREADS usage
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: meta-ti@lists.yoctoproject.org, "Kemal R . Shakir" <kemal@ti.com>
Content-Type: text/plain; charset="UTF-8"

thanks for iterating over it. Its looks good now.

On Wed, Dec 4, 2019 at 8:45 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Changing BB_NUMBER_THREADS between successive builds causes a "basehash
> value changed" error. Additionally, using BB_NUMBER_THREADS to pass a
> number of processes to run to xdc is wrong: PARALLEL_MAKE is the correct
> variable to use.
>
> Fix both problems by using oe.utils.parallel_make_argument() to obtain the
> number of processes to run from PARALLEL_MAKE.
>
> Fixes:
>
>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.
>
> Steps to reproduce:
>
>   BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos ti-ipc-examples-linux
>   BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
>   BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos ti-ipc-examples-linux
>
> Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
> Reported-by: Matthew McKee (e-mail unknown)
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---
>
> Changes v2 -> v3:
>  - reimplement using oe.utils.parallel_make_argument(), thanks to Khem for
>    the hint
> ---
>  classes/ti-pdk.bbclass         | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 7030f70ed8e2..a07fdbb34bbe 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -71,7 +71,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
>
>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>
> -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> +PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
>  PARALLEL_MAKE = ""
>
>  def get_doxygen_support(d):
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index 7789b5a1ad2d..baf1ccc1f7b4 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -84,12 +84,13 @@ IPC_TARGETS_am65xx = "\
>      ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
>  "
>
> +PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
>  EXTRA_OEMAKE = "\
>      PLATFORM=${PLATFORM} \
>      XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>      BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
>      ${IPC_TARGETS} \
> -    JOBS="--jobs=${BB_NUMBER_THREADS}" \
> +    ${PARALLEL_XDC} \
>      JAVA_TOOL_OPTIONS=-Xss2560k \
>  "
>  EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
> --
> 2.24.0
>
