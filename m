Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.2667.1616184379156673879
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 13:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bnP4fe8u;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id c3so4239775qkc.5
        for <meta-ti@lists.yoctoproject.org>; Fri, 19 Mar 2021 13:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9AGR6tOwJL2odYnQzSSLc5LvSsZScgtbuw0ib2Ij7zc=;
        b=bnP4fe8ugBVd5sBMibeo/sZEme9Ihbabl2FwpVzXP59vqMpRUhP7LGoRnsJzJlW5Ca
         j1dY4UIAFaCFVe6e5S7Qcly1uzMaaNiMJD07Vs+rzXIspFAnOT/M7sMmxlNtAveopsGQ
         bYqFtQUdy5w/+/76/khLZaQvW5x7vt48j2fSLFzQqk54uBtiep/P6h8zev+Jca3B3JRP
         ENrm0a3u+GjrTKvDSq+/mr3c5Ic96c8mv1HpLn/PrRhH8GqqPVtsmZEkRGXh2DqhLEMs
         4M/4y0UCh+TMQlsKhpGBSwZhpQ/B03Al2G2dqtC1LPbIHHRwxq0A+EDtP5uDQJI26AkF
         h1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9AGR6tOwJL2odYnQzSSLc5LvSsZScgtbuw0ib2Ij7zc=;
        b=G5m+PRaXlbTX5+PXIODoZSaXtI9bVek9bRAU1uC3RdLNx2Nhs7toQVae0FmU6IdKdp
         cbJxxkBKiJ4hFLT7Kxx3+NgzWeep95x+IKBcHfQp3W9AUWXj0SOme6i4R3OJT/IUySnv
         QmzNyVC9R28g4VlG58S2Hmb5ey0qHHRCK+sXE7nI4yLQW7zlJEBWy1qu5eHYfcDPTG5p
         ZPiyDwAjcp5wnc7b3a4kYyHcqNzG8J8whr5RthHsznrtDFfm7TG0H1I+gpT9Lt3kNmMW
         jHN5T5sPRNBkrjv6L49EVLjTFyz/isRdl9qXp8SCOEUCrJqwb+4o/F3oJ1fLQIqCd1s9
         GRiA==
X-Gm-Message-State: AOAM533/f8tGqfnVmK/p/UT1uEVu0tgTF1wSs9mXdfQKwGvL4s/cIEFH
	xps8Zcj79ICVLpGRgjZGnYL1ZRsdg6XlvREqvKY=
X-Google-Smtp-Source: ABdhPJx+5jcbRTrwQKS5n386JEqiZVDOLSa10vcblgc7tGmRJgikPp/0TM29a8r95zFNMvRSYfaRifcdnZ6aO9a5byQ=
X-Received: by 2002:a37:a350:: with SMTP id m77mr331593qke.146.1616184377978;
 Fri, 19 Mar 2021 13:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210318061816.1562693-1-raj.khem@gmail.com> <20210319195052.GB18041@denix.org>
In-Reply-To: <20210319195052.GB18041@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 19 Mar 2021 13:05:50 -0700
Message-ID: <CAMKF1sqqU69jQTSniWpSgmdGa9NpZsSdTosBhLVEUwiCwcyVaQ@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] layer.conf: add hardknott to compatible release branches
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 12:50 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Mar 17, 2021 at 11:18:16PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index 2393e61a..6fb214c6 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
> >  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-ti = "6"
> >
> > -LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
> > +LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth hardknott"
>
> This should probably be cleaned to list the correct compatible releases...

perhaps but as a separate patch, I only test master

>
>
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> > --
> > 2.31.0
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
