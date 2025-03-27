Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AA8C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 15:22:50 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.52533.1743088967775104362
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 08:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K26z2plm;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1247471e87.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743088966; x=1743693766; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vaWNpjxIALW0rP7Wb6X6AqoH5R4jl5b+oHap77/cWE=;
        b=K26z2plmkT9DbAmbGzpuGm5byZJ0IgLQWj0Weo7MzkDIGhWaYKvHulowduNZd3kkNx
         0qS8b6V93wW6LvGMJKzSdNhk3H0M3LMw/8apgN9Z27MsukB2r6hxEurJNOn+7w4pAaso
         Ksc4R9fXtNdAh3LALWB9yBBEHdV9ZT9TvzudJum63PpmmGHFre0f183s+QscPzhwQiF+
         aF8Pc1JzPY2DAVMONidPrMbnhVOpFvqIamrU9xRmXJD6JXOClFEy9NpT9hifIN/XqWnH
         GaInt4uomvebZhVID13zoXFUMygGiSXIzpaMklTjFQPWoPODAXnTJ6F7Qx7Uz2PZmmC9
         d/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088966; x=1743693766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vaWNpjxIALW0rP7Wb6X6AqoH5R4jl5b+oHap77/cWE=;
        b=oIOdt8D4BtLZ6xrwwTtgd1xUv/dDhPzf115W7icMkRtR0sU2KoQX0gNf9eVrhPZXEw
         /QPgmE0i5XvWAg0SnpQUaJA8TmfVsqkdvrjnDGdqtl3pMKoX7z2T1hoy9miNv7jrQDvF
         LsK6Oaa4nQR8JDjC6XBX7CjBF10doE/slZwkapmQIt6k1xjP2W1nVLbObweHCYDQdItD
         t132em12citx2WkXez/pbsVhL9zqIpQmOX/KSQiemLrJB7tKomSi6mk/s1kLkXMtVrYC
         I3IE0H0oVvujZK6GCCKybbdBe/dFc/5cuXng9ePCKKOwhSKk4XPwX1sb0X9eAAKZk4+p
         BHpA==
X-Gm-Message-State: AOJu0YwLr0joEPbdfpX0rUKh3v0U41y78ILdFQImOa8UCNzvrCxuO4zL
	MJ4/faeLocxOIsnFGJvs2i1wryqkdFrr5pmqU1Jjah33oQay29ETHv4WPYFbBXed5mF/50LheNn
	u+xpjb9HcULDROtXJoz1aCtjpIs4=
X-Gm-Gg: ASbGncsjYTc0YZHpO+zxfAyaFJSuiRqcBMQHF2LSyh7opOauOMDS4WKwpR9mVoGw6MR
	AhxVOIy+D8DO862OH2pSzQ0WT0ofEK0Bqr6ZTzD8P/WizZLQsxpcOf4e7nC8k0+Q0kap8cktbKc
	k8RDOvRj4M8lAEYEfQ3lkMAEx2e1vGsffCDsg=
X-Google-Smtp-Source: AGHT+IFv+gUd/s+1iF+s30a95txbr2ydyVCsVr9GOko+WrP9jjw9RIdlA01/S2TXbGmvQ4r+CACi1W6keNLvmMzAFaI=
X-Received: by 2002:a05:6512:3f05:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-54b011d5bbdmr1824393e87.22.1743088965457; Thu, 27 Mar 2025
 08:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <vr9P.1743087135909863464.R6f8@lists.yoctoproject.org>
In-Reply-To: <vr9P.1743087135909863464.R6f8@lists.yoctoproject.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 27 Mar 2025 15:22:33 +0000
X-Gm-Features: AQ5f1JqMXpQjm8IVNBqNlRl6v1JXcllBvYj16x6rDEOAzOtLTaGt0td0p1ljU_0
Message-ID: <CAO5Uq5QZhqoxA4H0D+b=mTzo_tYOTYU-un1fD2XbCSyLimN3CA@mail.gmail.com>
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed.
To: sebastian.krahl@lacon.de
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 15:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18424

The postinstall script in ti-sgx-ddk-um failed - look at the
referenced log file, hopefully you'll get a clue as to what/why.

Assuming its this recipe:

https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-graphics/powe=
rvr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone

I'd guess its something about the init script setup (update-rc.d adds
a postinstall scriptlet).

On Thu, Mar 27, 2025 at 2:52=E2=80=AFPM Sebastian via lists.yoctoproject.or=
g
<sebastian.krahl=3Dlacon.de@lists.yoctoproject.org> wrote:
>
> Hey there,
>
> actually I'm frustrated, I don't know where I'm going wrong.
>
> My setup:
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> MACHINE              =3D "beaglebone"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.0.25"
> TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky            =3D "kirkstone:b210ed67de098a78a577baf464fae569d020d=
e62"
> meta-arm-toolchain
> meta-arm             =3D "kirkstone:936c02ec13661bd86a05f7f90e1b920d5092d=
670"
> meta-ti-bsp
> meta-ti-extras       =3D "kirkstone:98c5c3d732334a26d57cb3534230e858d96db=
0c6"
> meta-oe              =3D "kirkstone:7e18b3fc774b7efabf9a20ae3cd6abd0e0715=
b59"
>
> I want to build the core-image-sato but it fails with:
> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-s=
gx-ddk-um'] have failed. If the intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /home/lacon/yocto/build/tmp/work/beaglebone=
-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.
> ERROR: Logfile of failure stored in: /home/lacon/yocto/build/tmp/work/bea=
glebone-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.23534
> ERROR: Task (/home/lacon/yocto/poky/meta/recipes-sato/images/core-image-s=
ato.bb:do_rootfs) failed with exit code '1'
>
> Can anyone help to progress further?
>
> Regards,
>
> Sebastian
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18423): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18423
> Mute This Topic: https://lists.yoctoproject.org/mt/111937570/3618097
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [alex.kiernan=
@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

