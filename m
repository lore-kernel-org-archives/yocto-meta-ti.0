Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6386.1794232849899967169
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 06:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20260707.gappssmtp.com header.s=20260707 header.b=c55+SrHj;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.177, mailfrom: troth@openavr.org)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b33a08df33so7273887b3.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 06:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794232849; cv=none;
        d=google.com; s=arc-20260327;
        b=Epz1xhCE3owdPtzbSYPCNYO5qsvuKPkzP3GKC07QqpZYSdfGwQTkHduhctM3z3iWRH
         K+3ItYlSGJoJzM1ZsD5vn+qBsHc6UsDgu3ZsuR25sEluaOAB88e+7tyqLgxPDBwJnFRd
         grXREUtFU/Sj2bQP77pHacM0hLVCE6u9BCaVF7tPbkpIqJmBa3CxuaUZijyKloYs9oZ0
         z10v/iU7MTOuZBa0pW7mIOCvu8SRfXDlWanaiprPgUAdHcj5JoyuYZ+tnbNac3hufY/+
         YiEFvgLqKKTDJq7st05ZLYiVMboNEKV/HzfDbN0Sa8mJxU83sgJsw1LnFGKw+XLeZauO
         xADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/ogQ++oWcMsrRbcpigL/q009cdnxeSRAzYHgewGZzk=;
        fh=lA6h0X2wElyz3KGexwf0HYpPn9+2mystVHKGUWLLNIc=;
        b=aig/8DkhNoSZYcIOZ5L4q4C8hnQE20PtkwXABYOe1LVX+rjhEfLiRvmw+dQ+UsRzN2
         1t+q1PbsWi7MLXxLRfT+nDXCWVPaT2blpSpjXtY0ETijMA5a0P4IAmDgJUdnED/TRKzh
         h9+kBzwO+qSSoDcqFjer1x7NeJ5XeYueGjDjPrKmZ0u7POuEMn0KsZwq8kTxP2tdP9F7
         KMa51R29RupUN7Ufzteda2FTM7/LbFs04ZZayy5HWECvHy8Y3Ksp6AIOJzX2PUiX/7Nm
         9US/Nx8x3li8r5jyrCuyt34Y5zR/uqh5+5ufeZcZEGaaxf9AJ+ZWP1o6DHfs/2CwRe1h
         O0Ww==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20260707.gappssmtp.com; s=20260707; t=1794232849; x=1794837649; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/ogQ++oWcMsrRbcpigL/q009cdnxeSRAzYHgewGZzk=;
        b=c55+SrHjveVwvnATOj+4HGRNzDZvcBZwUEuu/LkN6YQoZ4obq0O2lNkpdF0F1bn72y
         boZkqdXw2fthInS77rztFhtTxLAszaOFq3i0NDXkwTLTj8eo3k2a4sGdcRSntTUNs9UT
         Gx9WS426+zKrj4VBAg8lVjQviHXXIyZN48aMEwefTPzAgyH0gP0LWNVursFizHnqTIEr
         MnTM46l/xA3WILp3eda3WfKuKgc2/UK4KWp3ScfavYFY1NOtnBx0x0mGh702dHp8ihAq
         ViyuBOE86o/CIdFGDTC+6roem+cKasNYfidFjsSV1a+6uD3FxiYNupMuLSShf8rtmgmh
         M99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232849; x=1794837649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/ogQ++oWcMsrRbcpigL/q009cdnxeSRAzYHgewGZzk=;
        b=chrZ4LDcM7BYEv9l+IZuy/zrm6FikUVZjCMGBsJezEvehVO3vdQPqEVXX+cN7SRct/
         SljHRFkFx7Uh6Dg5+FSsezTCcvqiXQn6K4Wc6Gm1RceZv1tFIO49RclIEbS07aMxaIrj
         AqbxoQdaCjDqyOwGw3fkcfJs92wfsFqwaAyCQsTkj8zhtiYPLhR1L/wGkfTpfFclgsty
         oL2qCxnNl7TJT/flActkbS1zbVeNTSxH5yXyWh7hRzxpZ9uNi6gEERcnqd0FlTAu08Sp
         olPAjxbk+1io/vRGYOOOAzFeN++ZO9a1nWM89CrFrSFdCGWhl/fuiOHT6gF8Qfo5T+01
         9GNg==
X-Gm-Message-State: APuU4Z8yS+DXi7pSZ1Gq09ljQCJYvAaZBJhGfmPv7NSr9VNoHPNTmSLb
	+XxKfXwsG1NNzl/JSet2UFaQEoTIxeqIH/F0q1u+XkaU1gWccagzW6x0No+9dKpn99V+dD60BkX
	FfCmUMmG2Y2di9sSKApe5ndJK0j5h/emwR0Odlw4H0Q==
X-Gm-Gg: AYBFou3WrDKoyaNmBeLGbXXYfc49IhKJOFPzPcR/p9PN/wSPn9SSHt5ExkAhKpbaRzz
	fyK1jZgW7cm8OiOSvPD2u6tHM+3U14bygp1oSC7sxDXlfNc/qiXQkXfUrv+6z1A0KDwJWP2H7k8
	jISslS19bRzmkXygBBb9hC8+K9j8np5Kq+w3pdjyGfsw5Ntpp3MCr1e2jhGHF9CYHa+608LUs7c
	puiUYpykb3nJ+KTDJRv0f4BUZWl/T84VYCU4KrFfIdxek1qL5pjJLngCesCOEnlNibjMmE91XFH
	Nt7tkCf+9cKEo0qiW3y9V8fYRsHUuMXUtAsgH/i1B8eXb1Oov4hh+r/ThbAw+XdY1fAlTSNUMrv
	MU01PEkLEMAsjc8uTandVWCdPmIKFqHyGy2m9uzzMH1wj+fSNc7QQtvMdLZXdpvQW7tlKa0U=
X-Received: by 2002:a05:690c:f92:b0:8ae:98ce:5497 with SMTP id
 00721157ae682-8b355c9fdedmr42835347b3.0.1794232847544; Mon, 09 Nov 2026
 06:00:47 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
 <20261105162117.GA4190@denix.org>
In-Reply-To: <20261105162117.GA4190@denix.org>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Mon, 9 Nov 2026 07:00:35 -0700
X-Gm-Features: AclHuK_Lq4DrKElg6YrJR3Yojys9gcnI30p074Rj9Wjqo-rLNelGQp9SAoTDyXU
Message-ID: <CAFMvBt1XU-uvKWzMN3o48BeqHZmUEGaXQNkquRzn=+GMa9PbEQ@mail.gmail.com>
Subject: Re: [meta-ti] Unable to clone or fetch from git.ti.com
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 14:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20512

Thanks for the response Denys!

On Thu, Nov 5, 2026 at 9:21=E2=80=AFAM Denys Dmytriyenko <denis@denix.org> =
wrote:
>
> Yes, git.ti.com is periodically under heavy AI bot crawlers attack and
> sometimes goes down.
>
> But meta-ti-bsp already sets up MIRRORS to point to github, where TI core
> repos, like kernel and u-boot, are mirrored. This works for most users
> automatically and doesn't break.
>
> The error you are seeing is because you heve your own PREMIRRORS (e.g. us=
ing
> own-mirrors.bbclass), which contains an older clones of those repos and h=
ence
> bitbake tries to use those, instead of falling back to MIRRORS, and can't=
 find
> the required SRCREV:
>
> | Error: UnpackError('No up to date source found: clone directory not ava=
ilable or not up to date:
> | /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linu=
x-kernel.git

I'm not using PREMIRRORS in this setup. That clone directory is in my
DL_DIR which I share
across multiple builds.

I have found that the MIRRORS setup by meta-ti-bsp do not get used
until I manually
removed the primary git repo from my DL_DIR. Only then did bitbake
fetch from the
github mirror and created the following symlink:

    git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git ->
${DL_DIR}/git2/github.com.TexasInstruments.ti-linux-kernel.git/

Doubt that this is a meta-ti issue though. Bug in bitbake? Don't know,
have not dug into it yet.

>
>
> You can disable your PREMIRRORS temporarily and re-fetch affected compone=
nts,
> then you can re-enable it back.

I agree in theory, but I'm finding it impossible to sync up my local
DL_DIR cache because
all fetches from https://git.ti.com/git/*/*.git fail for me

I was able to clone ti-u-boot using
'https://git.ti.com/cgit/ti-u-boot/ti-u-boot', but that did not
work for the kernel:

    $ git clone https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
    Cloning into 'ti-linux-kernel'...
    fatal: unable to access
'https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/': The
requested URL returned error: 403

>
> Please note that there are a few other TI repos, mostly used in meta-ti-e=
xtras
> and meta-ti-tests, which are not mirrored on github, but they haven't bee=
n
> updated in a while, so your existing copies from your PREMIRRORS should b=
e
> fine.

I'm seeing the same issues when bitbaking with the following repos
from meta-ti-bsp
(which do not have github mirrors; note that this is after I manually
updated u-boot and kernel):

Summary: 6 tasks failed:
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruhsr-fw=
/pruhsr-fw_2.17.25.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/pruhsr-fw/2022.01/temp/log.do_unpack.1887083
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/goodix-fw=
/goodix-fw_git.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/goodix-fw/1.0.0.0/temp/log.do_unpack.1887084
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prueth-fw=
/prueth-fw_5.6.15.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/prueth-fw/2022.01/temp/log.do_unpack.1887085
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruprp-fw=
/pruprp-fw_2.17.25.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/pruprp-fw/2022.01/temp/log.do_unpack.1887086
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prusw-fw/=
prusw-fw_3.2.9.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/prusw-fw/2022.01/temp/log.do_unpack.1887087
  $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/ti-rtos-f=
w/ti-rtos-messageq-test-fw_git.bb:do_unpack
    log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux-g=
nueabi/ti-rtos-messageq-test-fw/3.52.00.01/temp/log.do_unpack.1887124
Summary: There were 6 ERROR messages, returning a non-zero exit code.

Unfortunately, git.ti.com is unusable for me right now (and it sounds
like it is for others too).

Is this really an overloaded server (due to AI crawlers) or some
problem on the server?

FYI: I'm trying to update our OS builds to the latest HEAD of wrynose,
so I'm keen to
find some solution that doesn't require manually tweaking things for
every developer
and our CI system.

Thanks.

Ted Roth
