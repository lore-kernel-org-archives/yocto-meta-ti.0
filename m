Received: from hormel.elettra.eu (hormel.elettra.eu [140.105.206.207])
 by mx.groups.io with SMTP id smtpd.web10.6974.1595486996337757083
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 23:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: elettra.eu, ip: 140.105.206.207, mailfrom: alessio.bogani@elettra.eu)
Received: from hormel.elettra.eu (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id 5C5021C4A14_F193310B
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2020 06:49:52 +0000 (GMT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
	by hormel.elettra.eu (Sophos Email Appliance) with ESMTPSA id CF7B21C1FA0_F19330FF
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2020 06:49:51 +0000 (GMT)
Received: by mail-yb1-f171.google.com with SMTP id 2so2289338ybr.13
        for <meta-ti@lists.yoctoproject.org>; Wed, 22 Jul 2020 23:49:51 -0700 (PDT)
X-Gm-Message-State: AOAM530sZN51WRDH3tgws6GBYaIyI+roKaswTCw6GUeTgl94w/MWrMzl
	wlWX1hYnin+87d+Ui7V4MptulZgzWi9wb7NTtKU=
X-Google-Smtp-Source: ABdhPJz23vWVkWDR3boxYrc25dY/+1dvGAhnXocXMlok5ExxvEBE2uvxQwFC0i1uyqe8kctQz2rqleVFiqpm71ZdR4I=
X-Received: by 2002:a25:6d08:: with SMTP id i8mr2620040ybc.6.1595486990439;
 Wed, 22 Jul 2020 23:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu>
 <20200717203244.GG13182@beryl> <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
 <20200722212440.GC10098@beryl>
In-Reply-To: <20200722212440.GC10098@beryl>
From: "Alessio Igor Bogani" <alessio.bogani@elettra.eu>
Date: Thu, 23 Jul 2020 08:49:14 +0200
X-Gmail-Original-Message-ID: <CAPk1OjEtwvkMrGOFUHRGQgQoZ+HEN59cqtmnf=hrkc60kyP-GA@mail.gmail.com>
Message-ID: <CAPk1OjEtwvkMrGOFUHRGQgQoZ+HEN59cqtmnf=hrkc60kyP-GA@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] pru-icss: Replace hardcoded lib with libdir variable
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
X-SASI-RCODE: 200
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Wed, 22 Jul 2020 at 23:24, Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sat, Jul 18, 2020 at 09:58:05AM +0200, Alessio Igor Bogani wrote:
> > Hi Denys,
> >
> > Thank you for reply.
> >
> > On Fri, 17 Jul 2020 at 22:32, Denys Dmytriyenko <denys@ti.com> wrote:
> > > NAK, libdir is usually /usr/lib
> >
> > Sorry it was my mistake. Are you willing to accept a patch with
> > ${base_libdir} instead?
>
> Any specific reason for this change?
> I'm not against it, but I haven't seen any setups where ${base_libdir} != /lib

Using usrmerge DISTRO_FEATURE /lib become a symlink against /usr/lib.

Thanks!

Ciao,
Alessio
