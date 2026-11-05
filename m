Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36070.1793890063046142790
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 06:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20260707.gappssmtp.com header.s=20260707 header.b=nyOcHcPB;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.178, mailfrom: troth@openavr.org)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31261e8a9so14147187b3.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890062; cv=none;
        d=google.com; s=arc-20260327;
        b=TuDO9994tN3TwewzLcufICj14dIIGJJItP4Yr0RR2SbiCIPr3DZvmWWaWSh153IxnM
         uP2SadKPiMz0ruLpQlRO/EJ6s8yD/+Y0Wjj477jae+3SL1YLFW8g8moYDthqpY/pjAzD
         9yRXsThVeOVZVT19Ep1tc8+7a+AHzWXZCuPQ9YogNCQbYir7pHSN8OHubox7f8vpfY0w
         SJOg9ANUxbf1gif84+FQB2nuMTQiL5IteDeRrHOnoull403ONpYrBL1fAyph4KdOEus5
         CkbwUuDo7iGOuC+8XvWqtYC+hmUQGiFtbaBciKLlJb/nBYAzZvR9Xt2amMdGVxjc8PgH
         82PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7408UADsxa2lQqJk/vJWNVSkVpBnpQAgmcv6uA9l8Zo=;
        fh=WYVqFLTUn0sHXdSV4sTuMIskeS9MBfHPX+Xnz+Mm3Pg=;
        b=a/TUW8fNcXVv2Zm2sbfY8DpdfNpCdlPzweGSPd3XVfQ88FjQRrDh0yI/495ADiCq82
         uHDAqg26IGjm7CudBOpvx/WrGRC701DsiHE+4Y7URKK/ymF08SgpA0AqbqAR1JouoJOY
         skyk3Nu6vMmGfyMVBY6BZQqSJIlEDJk1RCmY37NtIR9LAg9wWB2VV5BUdUFkh3m/+7oU
         Is8/4P8Ljx5Df5nKpC9D2/Nv+uclVHUSmWRCC0JF3D2AU1y1yLKUVdReBWmTRhSZ0TGy
         o6yO+TtVl6GmgfJN9Y0BQxX5rcIUqNgCEKg9toF55TloLRKia6j+V6YDIGM+denKwp4V
         fteA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20260707.gappssmtp.com; s=20260707; t=1793890062; x=1794494862; darn=lists.yoctoproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7408UADsxa2lQqJk/vJWNVSkVpBnpQAgmcv6uA9l8Zo=;
        b=nyOcHcPBa2fl4CGzio2WvaGpzua6FMHue4zZHExywFaMmsU7/m3SOhpp3QRJQMFbhy
         +WdBmrTbTAp/vHKgwzDubZ0yycCFDLQJYLaD8Gr4f3UB1OwYMgXDO/dQsrbo8DyxJid8
         T+7+h5UajKIPg7lqSV+Hy6u9vdrCEgeAwsGOrefCppNbxHt3glwRg8rCEA8Y12eeRkmT
         9S2InURyoxpeF8UKER5NsULsCrHpHraI1uB5Af4/DycnCmETbB220Hgwpvn6njGM9Hp1
         cW9z7qNvWtVIPS6gNosE/FwXqqeyK5n1s3zkr2EcI5F0yV7hp1ECo6kJ22vQI6KVKhSx
         yd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890062; x=1794494862;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7408UADsxa2lQqJk/vJWNVSkVpBnpQAgmcv6uA9l8Zo=;
        b=L2e+HGe+3ftehFxOLTIQpiiM8oOwX2Jetgo1Zpy+SMSLNDiqu8CTBC2z/NAGIfpZCq
         LxhuJlEpUTUV9OvX6TOHu+O4717NHtEv3fDaZb/6ltGR2JPVT6k5K38zsY90lnF1JPJF
         +09iKv8XTyqUaFaGt4HxobXtBOmvx7f3zifjxgknHnbnnBk76PoeZW3CGzl7QjpaxbH6
         T7yMDMv1/bdiTg8yD9G1vTV0bmqRT3qdlS79pKsLycLIBs9TVcd+WyyJnWeKmkmBy36i
         2UZlvjYlCmDdcmzPR1GWtBKKdjaFNPRnn9mKuSENKcSjKALK20uZeofyLZsRH0LpWric
         VMFg==
X-Gm-Message-State: APuU4Z/hXK9UPDMULH+O65LcOVJCQjq/K/h2CsRVdEVbaojtzovwS9QD
	r/nURuibi/W29utvuyi6K0M4KZV2lZCA0JO/9DA9rdFbOqxiQ7hvCFPKPru76fbUz/0DuZZfGPY
	t2f/NYyW6r05OrB5QlPIV3lCChkOT7OOsIRIRbmECpeDPQlIEyvMMLxU=
X-Gm-Gg: AYBFou22eY6ogpk2JU8RhT8TCxHHMpgJDi4UJN1d06N5x5thr3KWFlbJsW5opXFDi0Y
	6YzfVTkKoBaADtOkfyBxEAgP3Tm9QEV2YZcbD2IiGqP67uYx/1kUARiPk2NYnugekXLcvmuVNDg
	NNxdwq/L3yRQeTxYdc+Ns3Is+6GSHtw9govX9JUYX0DtJBatdZBzQVSVc4SzEldHlpqcLTM03qB
	31ekNrommwt4Bt5UXAIY7fEwQyIzDThIim1pv3tw8gcuoc4m+5jZk1H7JKk2wMf9QK9Ed3PVmAg
	43QEDFQaVsTUCq15reMx3KnAo3PnxYq0jyMoYYRaAqnF9NU3hzGr66Gqyw3ZMm4MwP/axi6Omi3
	8cBozvCkULc2myl90QifdZTCZjdQjEBNalGno
X-Received: by 2002:a05:690c:d94:b0:8b0:ccc3:27d2 with SMTP id
 00721157ae682-8b2b671713emr140238307b3.29.1793890061768; Thu, 05 Nov 2026
 06:47:41 -0800 (PST)
MIME-Version: 1.0
From: "Theodore A. Roth" <troth@openavr.org>
Date: Thu, 5 Nov 2026 07:47:28 -0700
X-Gm-Features: AclHuK-5ne0utbkQHlWqRQMPgywHllkHumW_kWDUpShwKQFoJ0WUKurkUrPwk7M
Message-ID: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
Subject: Unable to clone or fetch from git.ti.com
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 05 Nov 2026 14:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20507

Hi All,

We started seeing errors in our yocto builds using meta-ti when
building the latest linux-ti-staging-6.18.59+git-r0 from wrynose.

It appears that we can't clone or fetch from git.ti.com:

    $ git clone https://git.ti.com/git/ti-u-boot/ti-u-boot.git
    Cloning into 'ti-u-boot'...
    error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
    fatal: expected 'packfile'

    $ git clone https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git
    Cloning into 'ti-linux-kernel'...
    error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
   fatal: expected 'packfile'

I have tried this both at home and in our offices (to check that corp
firewall is not the issue).

Here's the relevant output from bitbake:

    $ bitbake virtual/kernel
    ...
    Build Configuration:
    BB_VERSION           = "2.18.0"
    BUILD_SYS            = "x86_64-linux"
    NATIVELSBSTRING      = "universal"
    TARGET_SYS           = "arm-trimble-linux-gnueabi"
    MACHINE              = "judo-hs-prod"
    SDKMACHINE           = "x86_64"
    DISTRO               = "trmb-judo"
    DISTRO_VERSION       = "1.1.1.dev20261104171417"
    TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
    meta                 = "HEAD:ae5a301091f5b0574ea7444aab40b309b6d9f3f2"
    meta-poky            = "HEAD:79b6d87030178bed0088ad3b00aa6dfbabac37c4"
    meta-oe
    meta-initramfs
    meta-filesystems
    meta-python
    meta-networking
    meta-webserver       = "HEAD:c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e"
    meta-virtualization  = "HEAD:18d58082b2458cf85438ac6e0f2f1fd0153318cb"
    meta-arm-toolchain
    meta-arm             = "HEAD:673e8d7c5dcd14de58092eb73e6ecc5eee5c1735"
    meta-ti-bsp
    meta-ti-extras       = "HEAD:066a7c440c0b241bca045133ec8cb5e506d49d98"
    meta-clang           = "HEAD:ef0d22f21910a0c30c967eeb17d8f209806e2d81"
    meta-rauc            = "HEAD:38da0e5866a953e664001ba90b5edad68d68cd5d"
    meta-bedrock
    meta-bedrock-rauc
    meta-bedrock-yubi    = "HEAD:6c7b0bafe7b7d0871eb8c67ad467c845ccf6b1b9"
    meta-judo            = "HEAD:d32ad65582a763e9a682d19d0c6e6f93e9233c1a"
    meta-judo-bsp        = "HEAD:5dee33952a5fcb456045fb0598f3af59c66b65e6"
    meta-judo-proprietary = "HEAD:75867ed0ea3fdf9943ec4bc9346835c6d099e119"

    Sstate summary: Wanted 110 Local 3 Mirrors 0 Missed 107 Current
167 (2% match, 61% complete)
    ...
    NOTE: Executing Tasks
    WARNING: linux-ti-staging-6.18.59+git-r0 do_fetch: Failed to fetch
URL git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=ti-linux-6.18.y,
attempting MIRRORS if available
    ERROR: linux-ti-staging-6.18.59+git-r0 do_unpack: Bitbake Fetcher
Error: UnpackError('No up to date source found: clone directory not
available or not up to date: \
    /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git;
shallow clone not enabled',
'git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=ti-linux-6.18.y')
    ERROR: Logfile of failure stored in:
/home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.517414
    ERROR: Task
(/home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:do_unpack)
failed with exit code '1'

    Summary: 1 task failed:
      /home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:do_unpack
        log: /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.517414
    Summary: There was 1 WARNING message.
    Summary: There was 1 ERROR message, returning a non-zero exit code.

Wondering if anyone else is seeing this.

The only workaround I have at the moment is to use the github mirror:

    https://github.com/TexasInstruments/ti-linux-kernel.git

Thanks,

Ted Roth
