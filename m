Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E91EDEBEA
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 19:20:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.783.1772565645151705662
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 11:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVB1O00y;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ivitro@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2640316f8f.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772565643; x=1773170443; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MU/4TCq7gNDoqnAf39vgqcJ8G6lko1S7lwVYEH1hviA=;
        b=WVB1O00ybyluEGOZwTu8uds/FOe6dGF/bJm/pw9BDXSY7GoagPHKjw59kZfMQL2AE6
         +8XJ/JSvf1q8Wt0rhIKYvqsQrmYJkYMjmfIFHH9SV7thRiUh+0upVymBwukL2PmLQsN7
         rkKD14f7owO8j3q8W+zjTzk0fi5zcvcJcjJ/2bjRKbnkFpeYj1NNSO10fTj78oRWg5Qb
         eWa0fVRHCR1fku34HBVWnt7bh/b5izy/nbPwyVgW+rpq8TFhqZwhkugsyO/ggiT8U63+
         qPiWATQf0RwzwL2guq8kYWI10ZLXkDlwXPfyQ/DQw+FUxWCo21jdEhFt4jcvyF8ySuu8
         VIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772565643; x=1773170443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MU/4TCq7gNDoqnAf39vgqcJ8G6lko1S7lwVYEH1hviA=;
        b=dcNFfug2gr0vJRD63CUilputkgWMP/7esr/LCYq/D2CJtDYw7VDUnREm/Z7VeqNjf8
         HPmb5Ly5uvvnnUmGi82wm1rr5F2F8Dt+Dj6PQkFruceONmW6/EBvte4vKAOSPJ8KioH0
         JLzH+SOYy743wFiLBhIWE+3XZ+sZaIxkKZdGYYDhzA5uhyEmn9B3pL6lqmxi3orvCvNe
         5uFIb6T1xYSy3LTIicqB+Qa44Bnq+2XCXdX6lb3CNsRrktF/RYJqH9Ob+VBMLss/4ezA
         iuaUDdERm7gi1nNKtwUf60fxbkmsBIuSg5JxiXnPbFVNeTM/NleunwTYRhdL33VIdC8W
         RmQQ==
X-Gm-Message-State: AOJu0Yx0oDRVy68FX7MuAzbgDrWbMKQ5Q0MRKAFXgiu1I+83v4ai7Bh2
	d5PGgNq/7+KZKa2IsUc6VI2G+G096AQkd/0iwpVknkUJs9o0s26nrkopdvaKTQ==
X-Gm-Gg: ATEYQzyKKiQ648gndcnvxiqm+WEm/vo49SOt5Oz6Sggh5DL4lONeM12ZrNJcCReqdYZ
	5cDLUAhRkYrPEb3htsfRR3n7sLnGUFBDk6sG2P9OnZK/cGYPanDwr95VKeAe9SRCVcxAlRBInCs
	X3fx6PZHyDhkO0RLyN2iYVLFc+O00hEFS1tQTpORE/s9R2DGTb57cz+hXosByX5OQuM1LOzBvLp
	IQaNjP9xOpKhH2Ojm6FJqSqxI3F7R6TZYND3GL80BYznwC4VZewFaSKJONSfo6XfeZCo6ESN6kC
	2l2h0zuFrsNd91657Qtjhy9tZs1K5/t3whUiKUczqCBy2YDg2VVh7lV9Cb3Lri3U32Tf6H4NhmS
	xlYJkJLEnOFS/ggL4/J0tuvB8pLQ2jfAAzQcjrynAtY3zUF3ak7oM2ORf4r+XovouYfHjV8XnK5
	BWq2GQXIP1DDe96ehCwOMJsl84JaRb3zu/PvYMb9yiQLKWdg==
X-Received: by 2002:a05:6000:40ce:b0:439:c5cf:fc6d with SMTP id ffacd0b85a97d-439c5cffd41mr1432387f8f.4.1772565643265;
        Tue, 03 Mar 2026 11:20:43 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm26573194f8f.6.2026.03.03.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:20:42 -0800 (PST)
Message-ID: <043e6483e7781c51bfa80258b455aacd822cab5d.camel@gmail.com>
Subject: Re: [meta-ti][master][PATCH v2] j784s4: move
 TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
From: Vitor Soares <ivitro@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Vitor Soares <vitor.soares@toradex.com>, Ryan Eatmon <reatmon@ti.com>, 
	Denys Dmytriyenko
	 <denys@konsulko.com>
Date: Tue, 03 Mar 2026 19:20:41 +0000
In-Reply-To: <20260216230422.635024-2-ivitro@gmail.com>
References: <20260216230422.635024-2-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 19:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19639

On Mon, 2026-02-16 at 23:04 +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> TI_CORE_INITRAMFS_KERNEL_MODULES is set in j784s4.inc, causing all
> machines based on the J784S4 SoC to unconditionally build and deploy
> an initramfs. The cdns-pltfrm and ti-j721e-ufs modules are required
> by the EVM to access UFS storage and are not a SoC-level requirement.
>=20
> Moving it to j784s4-evm.conf scopes initramfs creation to the board
> that needs it, allowing other integrators to rely on the empty default
> without explicit overrides.
>=20
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> Changes in v2:
> - Added project + branch specifier to subject line
>=20
> Tested on Toradex Aquila AM69 with bsp-mainline. EVM not tested.
>=20
> =C2=A0meta-ti-bsp/conf/machine/include/j784s4.inc | 3 ---
> =C2=A0meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A02 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-
> bsp/conf/machine/include/j784s4.inc
> index 4dc3a71b4444..f29cd69bf9f5 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -14,6 +14,3 @@ OPTEEMACHINE =3D "k3-j784s4"
> =C2=A0
> =C2=A0MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-=
fw ti-eth-
> fw-j784s4"
> =C2=A0
> -TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-m=
odule-
> ti-j721e-ufs"
> -TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
> -TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-
> bsp/conf/machine/j784s4-evm.conf
> index bf53b07c33f4..333bd24d938a 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -27,3 +27,7 @@ KERNEL_DEVICETREE =3D " \
> =C2=A0"
> =C2=A0
> =C2=A0UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
> +
> +TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-m=
odule-
> ti-j721e-ufs"
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""

Hello,

The recent commit 135dfe3f2620 ("ti-bsp: Make ti-6_18 the default BSP") mak=
ing
the ti-6_18 the default BSP appears to have broken our builds, which is wha=
t
this patch was trying to prevent.

With ti-6_18 now default, all J784s4 based machines are forced into initram=
fs
build through TI_CORE_INITRAMFS_KERNEL_MODULES in j784s4.inc, regardless of
whether they actually need these EVM specific modules.

Our Toradex Aquila AM69/TDA4 SoM doesn't use UFS storage and doens't need
initrafs. Our build now fail because the SoC include forces image levl
integration decisions.

Can this patch be considered, or am I missing something about how to handle=
 this
scenario?

Thanks,
Vitor Soares

