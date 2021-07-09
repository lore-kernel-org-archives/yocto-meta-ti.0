Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web08.8506.1625821280478954138
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jul 2021 02:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=I1H+LxbG;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72]) by mx-outbound45-210.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 09 Jul 2021 09:01:13 +0000
Received: by mail-wm1-f72.google.com with SMTP id n17-20020a05600c4f91b0290209ebf81aabso3754561wmq.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 09 Jul 2021 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pYp72Ie+FZ5FQHtwo8D1ZqHj3VbUso7WUUWh9UpH1sA=;
        b=I1H+LxbGnuCKjhppiZIo2D59h+lz+47FLzZ/QHnnovYB8fLQeAYOeFa9m7xvlVx7SN
         Ln01k3XlE4J1hfMK60ldA27qxne9zCbBVoBjobGc6n9D8bqzpkqaAVtCM+4IP5lwebKz
         V5d33auk4OnUQsyj1QWcf/SziLjkUZ8yTGt7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pYp72Ie+FZ5FQHtwo8D1ZqHj3VbUso7WUUWh9UpH1sA=;
        b=AkAVTFTqEA+KuF6S3HWBrbr05qv8Dqwq7RTc++s3/Gl8Sh5IJ4d7QTYri/l3aSMlbe
         8Y52mulGNDh6AwWbTrYlZePv58cBs8TcO80zNNymKF4Ty9+OxsRHMg+G1Hf50mh2myrc
         9lTV/pVRScEkex57MYvf4CVlHkZkG6nb9aQ8kLok2ARRRBj0KsijPblspAduP+oPxUjr
         Dp9AxIDskVGgrVJd1P0tSNDeoEB8k1CKhbtuZV3VDuI54X0Oz60vyKklipgTr1eSlz8A
         Zi6URJyZDwaPuzfYhETpz4Diy91K3LrL66tJIF1TSdcWwP8fQVFU7JTUV40dKdzx8UdH
         n42g==
X-Gm-Message-State: AOAM533cmXhtOqoUXOTKHMKhbPQYw23yGQo6IftCqc2MV4Vy7wBxJKnC
	qTt42oozp4eosqeQMwi7yvJeLZLPasF8bQY0QeeoJBqnHOgGdcxVBAXPTt1qfrKIiNO7IrhuMDS
	TgofbiVlYd266zKO1EbdHou54pSxEqOh2PJzfmy1GsVB+WxBkcq9Mr/gXxSb52IQSQ7IUKA6jgQ
	Kov6Q=
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr10390565wme.103.1625821272962;
        Fri, 09 Jul 2021 02:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEC/B68VWPF6Gp2/CLzL5QRBTJ4zFFdVg/41dL5eo2hmpEf3mrfpNPFJ69asIu80qB9/13hoB7NdVRkjzNxR0=
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr10390509wme.103.1625821272598;
 Fri, 09 Jul 2021 02:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210702085707.1225-1-sinthu.raja@ti.com> <428ef685-0016-751b-5e76-bbf4e8be7006@ti.com>
In-Reply-To: <428ef685-0016-751b-5e76-bbf4e8be7006@ti.com>
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
Date: Fri, 9 Jul 2021 14:31:01 +0530
Message-ID: <CAEd-yTQeTQri-_o0dXJPu=q7bgZ3SiMQ1ZiHNDx424CLf92XNg@mail.gmail.com>
Subject: Re: [dunfell/master PATCH V2] conf: j7-evm: Add j721e eaik dtb to KERNEL_DEVICETREE
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, Yogesh Siraswar <yogeshs@ti.com>, 
	"Vutla, Lokesh" <lokeshvutla@ti.com>, "Raja, M Sinthu" <sinthu.raja@ti.com>
X-BESS-ID: 1625821273-311730-1923-26757-1
X-BESS-VER: 2019.1_20210708.1510
X-BESS-Apparent-Source-IP: 209.85.128.72
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.233490 [from 
	cloudscan17-224.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 3, 2021 at 12:46 AM Bajjuri, Praneeth <praneeth@ti.com> wrote:
>
>
>
> On 7/2/2021 3:57 AM, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > J721E EdgeAI Kit (EAIK) is a low cost, small form factor board designed
> > for TI=E2=80=99s J721E SoC. TI=E2=80=99s J721E SoC comprises of dual co=
re A72, high
> > performance vision accelerators, video codec accelerators, latest C71x
> > and C66x DSP, high bandwidth real-time IPs for capture and display,
> > GPU, dedicated safety island and security accelerators.
> >
> > J721E EAIK supports the following interfaces:
> > * 4 GB LPDDR4 RAM
> > * x1 Gigabit Ethernet interface
> > * x1 USB 3.0 Type-C port
> > * x3 USB 3.0 Type-A ports
> > * x1 PCIe M.2 E Key
> > * x1 PCIe M.2 M Key
> > * x2 CSI2 Camera interface (RPi and TI Camera connector)
> > * 40-pin Raspberry Pi compatible GPIO header
> >
> > J721e EVM and EAIK uses the unified bootloader. Add j721e eaik dtb
> > for machine=3Dj721e-evm
> >
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
>
> Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
>
> > ---
> > Added Reviewed-by.
> > The U-boot and kernel patches are merged, this patch can be merged
> > once the SRCREV is updated to the latest commit in linux and u-boot
> > recipies.
> > V1 Patch link:
> > https://lists.yoctoproject.org/g/meta-ti/message/13857
> >
> >   conf/machine/j7-evm.conf | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> > index 1b99baeb..3cf0f186 100644
> > --- a/conf/machine/j7-evm.conf
> > +++ b/conf/machine/j7-evm.conf
> > @@ -11,6 +11,7 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
> >
> >   KERNEL_DEVICETREE =3D " \
> >       ti/k3-j721e-common-proc-board.dtb \
> > +    ti/k3-j721e-eaik.dtb \
>
> Yogesh,
>
> Please make sure the kernel commitsha is updated first and then the dtb
> update
>
> Kernel changes has recently been merged:
> Ref:
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=3Dti-li=
nux-5.10.y&id=3D5c52c20f0031b04357eae6044e538e37a8c9054d
>
>
> as long as kernel recipe pointing to atleast the mentioned commit, then
> you can merge the dtb update(this patch)
>
> builds will fail if you pull this patch without the kernel commitsha chan=
ge.
Hi Yogesh,
Any update on this?. Can we merge this patch if the u-boot and linux
recipes are updated.

Regards
Sinthu Raja

>
> >   "
> >
> >   UBOOT_MACHINE =3D "j721e_evm_a72_config"
> >
