Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web09.4178.1575306602509136562
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 09:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qdA/ZtcL;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g24so403806qtq.11
        for <meta-ti@lists.yoctoproject.org>; Mon, 02 Dec 2019 09:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1TZV4Zm2nXY2hiYHnrVoMgqVxThHmPmHxgfnpGq66U=;
        b=qdA/ZtcLn0BF2Z6AiNOlRmo+3oyAI+WPQXDU1Lowckd7Vvv7ve+XlZNZaQJRupjImu
         0TclQzwK/DwXgCcqN+Y2/AhM2IjinHUU6kTNOmQ3+jS6a0aS3vB4UTd3VJu3X8uYLDgL
         J3ojFVtoMts0XEIgnejei9PYEJ0L/8By2q3MGCROtrq7LarG8wvcnPML3G0cKKKunZa4
         oS+EhKNQdSP8aTO9t+UEnaTQ4UGpfJrgJjH99H/ZZYq4Jb0djVKEYM6Q4DlrLCfSXlc0
         dKUbRYptFJpDBL0y9HbR+/xgU1Q6FxlADMUlbKCO1n3/miC7rIrAejkQdxfX2MPqv1Zt
         BsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1TZV4Zm2nXY2hiYHnrVoMgqVxThHmPmHxgfnpGq66U=;
        b=NX+bXep36CuCHGEK8VkoZQkOpIoTenUffqWIVz4iaXhrH7sYHA7sCkeFQUr6t03gic
         jvqJFyEZr3ndy/lQz+XdY4TR6vw0lnLOjtzPWeKac7mPQQTHDBLzBGXgSG1KuoWgs5Iq
         ZqUB0VU7n1lZuTvyBVjemHT+6Hm5aWNNxQh0/B8TFRMbH5bVKzY1E3c1jrpk8+6ILj/M
         ESK84W7M1wi5ufut0k23VYbjeBrfzGEk60qS00zbk9gjG+HJIlfePalyVDl0hZoYj+5N
         AjZoyedgat5KKffZo2hzIp1581eWTTiRXgRGfMfnBsaf7uKNvTOj2p/WTM03Tuaii/2V
         ytlA==
X-Gm-Message-State: APjAAAVObQgV66cHZwIt6BhefGazJbHnnPgu8LWurdZsR9ONlZhC/zzY
	4g0kAzsxbNye0F3Xiy+eZXrgLLcBGbcBckChXUKqd7Ln/ww=
X-Google-Smtp-Source: APXvYqykHuHXuWKYln5wMxF2zQzaXn5SovhlfIejdRaTD68SZ8jeg221uLH/LBc7dIJvh8v7dzSE7da/tkcJ3NYttik=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr360954qtm.88.1575306601042;
 Mon, 02 Dec 2019 09:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20191129144818.14061-1-luca@lucaceresoli.net> <CAMKF1sp-vHHK4Y=UepxZhJFcvukndix7KYoKtG3C4cDE_X9M9Q@mail.gmail.com>
 <afdd88a1-949e-ad0a-98bb-db6b5bef66a5@lucaceresoli.net>
In-Reply-To: <afdd88a1-949e-ad0a-98bb-db6b5bef66a5@lucaceresoli.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Dec 2019 09:09:34 -0800
Message-ID: <CAMKF1sry3S0JLQLb+rc4N4FHtPCnXvA469tNA1Fj4JoPUKm5og@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] meta-ti: Set the --jobs based on host cpu_count
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: meta-ti@lists.yoctoproject.org, "Kemal R. Shakir" <kemal@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 2, 2019 at 4:20 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Khem,
>
> On 29/11/19 17:17, Khem Raj wrote:
> > On Fri, Nov 29, 2019 at 6:48 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> >>
> >> From: "Kemal R. Shakir" <kemal@ti.com>
> >>
> >> Using BB_NUMBER_THREADS to set variables causes an "basehash value changed"
> >> error when BB_NUMBER_THREADS is changed between successive builds.
> >>
> >> Fixes:
> >>
> >>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
> >>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.
> >>
> >> Steps to reproduce:
> >>
> >>   BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos
> >>   BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
> >>   BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos
> >>
> >> Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
> >> Patch from Kemal R. Shakir
> >> Reported-by: Matthew McKee (e-mail unknown)
> >> [Luca: add detailed commit message]
> >> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> >> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> >>
> >> ---
> >>
> >> I'm having the same problem and found this patch solving it on e2e.ti.com,
> >> but it does not appear on any git branch nor in the meta-ti mailing list. I
> >> tested it on the thud branch and fixes the problem. Can it be applied to
> >> both thud and future branches?
> >>
> >> Thanks
> >> ---
> >>  classes/ti-pdk.bbclass         | 2 +-
> >>  recipes-ti/ipc/ti-ipc-rtos.inc | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> >> index f0e6f2d2738a..5f78bafa94b5 100644
> >> --- a/classes/ti-pdk.bbclass
> >> +++ b/classes/ti-pdk.bbclass
> >> @@ -68,7 +68,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
> >>
> >>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
> >>
> >> -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> >> +PARALLEL_XDC = "--jobs=${@oe.utils.cpu_count()}"
> >
> > this may create another variableto control when limting parallelism so
> > expressing it in
> > terms of BB_NUMBER_THREAD s desired
> >
> > perhaps you can try adding
> >
> > do_configure[vardepsexclude] = "PARALLEL_XDC"
> > do_compile[vardepsexclude] = "PARALLEL_XDC"
>
> Thank you for your review.
>
> I agree the solution in this patch is not ideal as it removes ability to
> control the build load.
>
> However using BB_NUMBER_THREADS (with our without vardepsexclude) is
> also not quite correct. PARALLEL_XDC should have to do with
> PARALLEL_MAKE, not BB_NUMBER_THREADS.
>
> But PARALLEL_MAKE is not a number, so using PARALLEL_MAKE would be
> correct but it's not doable, and using BB_NUMBER_THREADS is doable but
> not quite correct... :(
>
> Bottom line: for lack of better ideas, I'm sending a new patch that
> keeps using BB_NUMBER_THREADS and takes your suggestion above. I guess
> it should be OK for most users. At least it's not worse than the current
> behavior and can still be improved later.
>

another option would be to use parallel_make_argument to contruct what you want
e.g. see how boost does it

https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/boost/boost.inc#n141

> --
> Luca
