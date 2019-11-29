Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.9850.1575044300997369452
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Nov 2019 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHmrGJZQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id x14so11812204qvu.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 29 Nov 2019 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nFkN6evK3PBBARD1ni6ag4LhwNUJ+Mxmk5o9BD31XIU=;
        b=gHmrGJZQsklMXFf7csRDPzD/hfDtcNU3zSCUYco3UxqfR39UbdSM3LXX7p1UaCcbRP
         JZBCctdUFmr63q0tDSt/fA4e/mA/ibyzWMXl32qY6iTjGN7RvTpTyGU+UF42cF967CvF
         NuhnnTBOR9CM4uDLF/DTGybYyyR7S8Mez9NZOhYaFk/000riEt8WtIxuqjH9jKt0Ii1e
         Q6/ul5E1W4L0ZT+o9g2cnV9XIM2tHMnL8FxnVcsXHAG92xaMLCUj9q1RVCpg1afapK/3
         TnJWvcBoe2Q7KhE3yT9Th/cMFzl18U7LcL6ngGGLkDJ8ca3F0sP8D8CnxlH7cn64G2Z/
         57fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nFkN6evK3PBBARD1ni6ag4LhwNUJ+Mxmk5o9BD31XIU=;
        b=REIUTjhSfuabYSCM469EJHwdRHHpXD2Ippn1QUMLcKce7IiZnVOm6Z5FNb8Au3TCJp
         p4sYXUaNnMLgHLOeVya3WbWeSjWWjvzlJW+b9bDDiusS1Vq4anGJJZElWsi4dAkFFT4n
         h1kh0E1gB1B06/TnNLeYipNqxWFiiyec7Yo+YoHVXWCkvgDdH5VYoDZG4qFE7NWhOK9W
         TOgyjYeB2CPDuT5+cnSifoSBeVW+mhUw3n0uI4qkhy1pZ6k2fH9CbiXLhdtoBYgcV9Rc
         G9DgeRg2/gWE3q/pOal5ffDGVFAhPHmIzRzXmNv87E0MJ8gXDbCHanVNhChIATuijSZ7
         D76w==
X-Gm-Message-State: APjAAAXaVeANQ+Cta6buRKA3oJnsl3x513IucVATM992iiG88FXnDigr
	nGl7SBlseIVjXIi1fWO59i2ehd2Q2qvRbluMlLQ=
X-Google-Smtp-Source: APXvYqzhAFfTfcxlGDOs2FGsDeETaOhDF5gptRToVvYg0XnN71ApELROG4P4RK1OpP6e5XS3F2fkdV/ZlZ9UYHC0Z1w=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr3203649qvo.55.1575044299729;
 Fri, 29 Nov 2019 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20191129144818.14061-1-luca@lucaceresoli.net>
In-Reply-To: <20191129144818.14061-1-luca@lucaceresoli.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 29 Nov 2019 08:17:53 -0800
Message-ID: <CAMKF1sp-vHHK4Y=UepxZhJFcvukndix7KYoKtG3C4cDE_X9M9Q@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] meta-ti: Set the --jobs based on host cpu_count
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: meta-ti@lists.yoctoproject.org, "Kemal R. Shakir" <kemal@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 29, 2019 at 6:48 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> From: "Kemal R. Shakir" <kemal@ti.com>
>
> Using BB_NUMBER_THREADS to set variables causes an "basehash value changed"
> error when BB_NUMBER_THREADS is changed between successive builds.
>
> Fixes:
>
>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.
>
> Steps to reproduce:
>
>   BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos
>   BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
>   BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos
>
> Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
> Patch from Kemal R. Shakir
> Reported-by: Matthew McKee (e-mail unknown)
> [Luca: add detailed commit message]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---
>
> I'm having the same problem and found this patch solving it on e2e.ti.com,
> but it does not appear on any git branch nor in the meta-ti mailing list. I
> tested it on the thud branch and fixes the problem. Can it be applied to
> both thud and future branches?
>
> Thanks
> ---
>  classes/ti-pdk.bbclass         | 2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index f0e6f2d2738a..5f78bafa94b5 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -68,7 +68,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
>
>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>
> -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> +PARALLEL_XDC = "--jobs=${@oe.utils.cpu_count()}"

this may create another variableto control when limting parallelism so
expressing it in
terms of BB_NUMBER_THREAD s desired

perhaps you can try adding

do_configure[vardepsexclude] = "PARALLEL_XDC"
do_compile[vardepsexclude] = "PARALLEL_XDC"

>  PARALLEL_MAKE = ""
>
>  def get_doxygen_support(d):
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index dcd6309fe2ab..1b21375edd33 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -89,7 +89,7 @@ EXTRA_OEMAKE = "\
>      XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>      BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
>      ${IPC_TARGETS} \
> -    JOBS="--jobs=${BB_NUMBER_THREADS}" \
> +    JOBS="--jobs=${@oe.utils.cpu_count()}" \

something similar here.

>      JAVA_TOOL_OPTIONS=-Xss2560k \
>  "
>  EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
> --
> 2.24.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#12534): https://lists.yoctoproject.org/g/meta-ti/message/12534
> Mute This Topic: https://lists.yoctoproject.org/mt/64369908/1997914
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
