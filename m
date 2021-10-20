Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.718.1634751758602746397
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=H8n4debg;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69]) by mx-outbound9-96.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 20 Oct 2021 17:42:36 +0000
Received: by mail-wr1-f69.google.com with SMTP id r16-20020adfb1d0000000b00160bf8972ceso10270750wra.13
        for <meta-ti@lists.yoctoproject.org>; Wed, 20 Oct 2021 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ske6WAXN2igTgeyXXPSQwTOBPD3b3vg0Is2yWo/KzA=;
        b=H8n4debg8dZ1IJuRMbz3bL+Dt5CvUQ1y2/hWQUVtv4FeH8GkyLtAje0m8QY6ZKtZk2
         isJLErKFscBIcm8nIl3nPnnZ171YFBsbQ04s2daiPs8sD+c61ZHLsPpP9aIGj182ifGv
         XWfU/sDAB+A2YCUFp+RbdoWft0sPvq3wLI6WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ske6WAXN2igTgeyXXPSQwTOBPD3b3vg0Is2yWo/KzA=;
        b=oW4wPF7b9cg+JKPsGVTZ9b5FKg4gRKFsNrIfRepHQU7Jnbp8fX+u8zt+Yk4Eqog7R9
         Up1Frc01t6cOivud8+tOr130kgh6jZ5Gw+LmBXIT3jX2rbJ+rvXNz4D7bPkXWn9U/ACQ
         4pW5YS57zRt68+4wZ9gGRgSC0GT10SH6Qex4nSArqsCFHo5T8xXHFC9KrCQYw+6ur51H
         mjtTf6eJsaX5N4CTtpJa5yReraZUgpsssfSsHGrBZGsdmCkk/dAHekmR4BhA8PWW9iOA
         GVwbA57tHmDMa05y/lNYW4jxVM1e4yP7P2Oi7WjrQ1Kl5wC8OJE4pcT96eXa455Fw5av
         9WLg==
X-Gm-Message-State: AOAM530K50c7pBzdNhSZI+WA/He/eVdyvRbmbX94Mqs0EfhaZ/quf1AA
	aQEHGbUGKWcBE+cEtT9CuheJQUiVNkMj6JdgpjodWneTqqac1tryKt0sgZNxvcCOAFIh9LJOBh7
	lhX3dv5Sd5x5x1ICmKEpb9NdpnbCrwwJMVXVuDJZIyFVhBDlOWHftwJiPvp8PaXgU4JMFWzDLIP
	i4eHQ=
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr643915wru.236.1634751756079;
        Wed, 20 Oct 2021 10:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+6+Oz5JzKtLg2evcHh6MuABkLOJEjgt8S9E6X42ZEQXzr/gpkhsFEnXFCYeeI5aPda0B6JrJYNWX56NbLz3E=
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr643864wru.236.1634751755735;
 Wed, 20 Oct 2021 10:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211019082221.4767-1-sinthu.raja@ti.com> <20211019171544.GN10132@denix.org>
In-Reply-To: <20211019171544.GN10132@denix.org>
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
Date: Wed, 20 Oct 2021 23:12:24 +0530
Message-ID: <CAEd-yTQ6f37sp7bpXucQH3s02S=hy_3PEwy8qWYj84X+64i0rw@mail.gmail.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>, 
	Nishanth Menon <nm@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
X-BESS-ID: 1634751756-302400-5371-30716-1
X-BESS-VER: 2019.1_20211019.2112
X-BESS-Apparent-Source-IP: 209.85.221.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235288 [from 
	cloudscan15-181.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset="UTF-8"

Denys,

On Tue, Oct 19, 2021 at 10:45 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Oct 19, 2021 at 01:52:21PM +0530, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
> > so replace the eaik dtb with sk dtb file
> >
> > [1] https://www.ti.com/tool/SK-TDA4VM
> >
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >  conf/machine/j7-evm.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> > index 7cde9f4d..1f47f00c 100644
> > --- a/conf/machine/j7-evm.conf
> > +++ b/conf/machine/j7-evm.conf
> > @@ -13,7 +13,7 @@ KERNEL_DEVICETREE = " \
> >      ti/k3-j721e-common-proc-board.dtb \
> >      ti/k3-j721e-proc-board-tps65917.dtb \
> >      ti/k3-j721e-common-proc-board-infotainment.dtbo \
> > -    ti/k3-j721e-eaik.dtb \
> > +    ti/k3-j721e-sk.dtb \
>
> Was there a corresponding kernel change with the file rename?
>
Yes, The kernel changes are there in the review state and will get merged today.

Regards,
Sinthu Raja.
>
> >  "
> >
> >  UBOOT_MACHINE = "j721e_evm_a72_config"
> > --
> > 2.31.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fdenix.org%2f0x420902729A92C964&c=E,1,C0HrYL1gD9V7bSi-iQbI97NAE43GDeAoLiiW2Wg__UFVPyOqND5brhrXZ0Es0QyCv0jZu9dIaTwvF4dAAFZ_syeUaA-_tEMOMiO2VR4dUN1_0PS4z44,&typo=1
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964



-- 
With Regards
Sinthu Raja
